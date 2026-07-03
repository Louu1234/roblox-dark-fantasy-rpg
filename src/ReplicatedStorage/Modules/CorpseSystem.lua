-- CORPSE SYSTEM - ModuleScript
-- Handles monster corpse spawning, loot, and pickup
-- Place this in: ReplicatedStorage > Modules > CorpseSystem (ModuleScript)

local CorpseSystem = {}
CorpseSystem.__index = CorpseSystem

function CorpseSystem.new()
	local self = setmetatable({}, CorpseSystem)
	
	-- Corpse values by monster type
	self.corpseValues = {
		["Goblin"] = 50,
		["Orc"] = 75,
		["Skeleton"] = 60,
		["Demon"] = 150,
		["The Betrayer"] = 0, -- Boss doesn't drop gold
	}
	
	return self
end

function CorpseSystem:CreateCorpse(monsterName, position, monsterModel)
	-- Create corpse model
	local corpse = Instance.new("Model")
	corpse.Name = monsterName .. "_Corpse"
	corpse.Parent = workspace
	
	-- Clone the monster body
	local corpseBody = monsterModel:Clone()
	corpseBody.Parent = corpse
	
	-- Position corpse
	if corpseBody:FindFirstChild("HumanoidRootPart") then
		corpseBody.HumanoidRootPart.CFrame = CFrame.new(position)
	end
	
	-- Disable humanoid
	local humanoid = corpseBody:FindFirstChild("Humanoid")
	if humanoid then
		humanoid.Health = 0
	end
	
	-- Add pickup touchable part
	local pickupPart = Instance.new("Part")
	pickupPart.Name = "PickupPart"
	pickupPart.Shape = Enum.PartType.Block
	pickupPart.Size = Vector3.new(3, 3, 3)
	pickupPart.CFrame = CFrame.new(position + Vector3.new(0, 2, 0))
	pickupPart.CanCollide = true
	pickupPart.Transparency = 0.5
	pickupPart.BrickColor = BrickColor.new("Medium stone grey")
	pickupPart.Parent = corpse
	
	-- Store corpse data
	local dataValue = Instance.new("StringValue")
	dataValue.Name = "CorpseData"
	dataValue.Value = monsterName
	dataValue.Parent = corpse
	
	return corpse
end

function CorpseSystem:GetCorpseValue(monsterName)
	return self.corpseValues[monsterName] or 25 -- Default value
end

function CorpseSystem:PickupCorpse(corpse, inventory)
	local corpseData = corpse:FindFirstChild("CorpseData")
	if corpseData then
		local monsterName = corpseData.Value
		inventory:AddCorpse(monsterName, 1)
		corpse:Destroy()
		return true, monsterName
	end
	return false
end

return CorpseSystem