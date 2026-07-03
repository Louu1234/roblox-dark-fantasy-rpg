-- CORPSE PICKUP HANDLER - LocalScript
-- Handles player picking up corpses
-- Place this in: StarterPlayer > StarterPlayerScripts > CorpsePickupHandler (LocalScript)

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

local CorpseSystem = require(game.ReplicatedStorage.Modules.CorpseSystem)
local InventorySystem = require(game.ReplicatedStorage.Modules.InventorySystem)

local corpseSystem = CorpseSystem.new()
local inventory = InventorySystem.new()

-- Detect nearby corpses for pickup
local PICKUP_RANGE = 15
local lastPickupTime = 0
local pickupCooldown = 0.5

local function getNearbyCorpses()
	local character = player.Character
	if not character then return {} end
	
	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	if not humanoidRootPart then return {} end
	
	local nearbyCorpses = {}
	for _, model in pairs(Workspace:GetChildren()) do
		if model:FindFirstChild("CorpseData") then
			local distance = (model:FindFirstChild("PickupPart").Position - humanoidRootPart.Position).Magnitude
			if distance < PICKUP_RANGE then
				table.insert(nearbyCorpses, model)
			end
		end
	end
	
	return nearbyCorpses
end

-- Pickup with E key
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	if input.KeyCode == Enum.KeyCode.E then
		if tick() - lastPickupTime < pickupCooldown then return end
		lastPickupTime = tick()
		
		local nearbyCorpses = getNearbyCorpses()
		if #nearbyCorpses > 0 then
			local corpse = nearbyCorpses[1] -- Pickup closest
			local success, monsterName = corpseSystem:PickupCorpse(corpse, inventory)
			if success then
				print("Picked up: " .. monsterName .. " corpse")
			end
		end
	end
end)

print("Corpse Pickup Handler loaded! Press E near corpses to pickup.")