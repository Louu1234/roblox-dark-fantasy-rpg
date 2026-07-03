-- COMBAT HANDLER - LocalScript
-- Handles player attack input and client-side attack logic
-- Place this in: StarterPlayer > StarterPlayerScripts > CombatHandler (LocalScript)

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local mouse = player:GetMouse()
local camera = workspace.CurrentCamera

local CombatSystem = require(game.ReplicatedStorage.Modules.CombatSystem)
local PlayerData = require(game.ReplicatedStorage.Modules.PlayerData)

local combat = CombatSystem.new()
local playerData = PlayerData.new()

-- Handle mouse click for attack
mouse.Button1Down:Connect(function()
	if combat:CanAttack() then
		print("Basic Attack!")
		-- TODO: Send attack to server
		-- TODO: Play attack animation
		-- TODO: Hit detection
	end
end)

print("Combat Handler loaded!")