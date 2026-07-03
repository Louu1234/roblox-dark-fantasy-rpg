-- LOOT MANAGER - LocalScript
-- Shows pickup prompts and manages loot interactions
-- Place this in: StarterPlayer > StarterPlayerScripts > LootManager (LocalScript)

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local LOOT_RANGE = 20

-- Create loot prompt GUI
local lootGui = Instance.new("ScreenGui")
lootGui.Name = "LootGui"
lootGui.ResetOnSpawn = false
lootGui.Parent = playerGui

local lootPrompt = Instance.new("TextLabel")
lootPrompt.Name = "LootPrompt"
lootPrompt.Size = UDim2.new(0, 200, 0, 40)
lootPrompt.Position = UDim2.new(0.5, -100, 0.5, 50)
lootPrompt.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
lootPrompt.TextColor3 = Color3.fromRGB(0, 255, 0)
lootPrompt.TextSize = 16
lootPrompt.Font = Enum.Font.GothamBold
lootPrompt.Text = "Press E to pickup corpse"
lootPrompt.BorderSizePixel = 2
lootPrompt.BorderColor3 = Color3.fromRGB(0, 255, 0)
lootPrompt.Visible = false
lootPrompt.Parent = lootGui

-- Update loot prompt visibility
RunService.RenderStepped:Connect(function()
	local character = player.Character
	if not character then
		lootPrompt.Visible = false
		return
	end
	
	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	if not humanoidRootPart then
		lootPrompt.Visible = false
		return
	end
	
	-- Check for nearby corpses
	local nearbyCorpse = false
	for _, model in pairs(Workspace:GetChildren()) do
		if model:FindFirstChild("CorpseData") then
			local pickupPart = model:FindFirstChild("PickupPart")
			if pickupPart then
				local distance = (pickupPart.Position - humanoidRootPart.Position).Magnitude
				if distance < LOOT_RANGE then
					nearbyCorpse = true
					break
				end
			end
		end
	end
	
	lootPrompt.Visible = nearbyCorpse
end)

print("Loot Manager loaded! Shows prompts for nearby corpses.")