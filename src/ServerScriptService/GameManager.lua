-- GAME MANAGER - Script
-- Handles game initialization, player spawning, and core game logic
-- Place this in: ServerScriptService > GameManager (Script)

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

-- Require modules
local Config = require(game.ReplicatedStorage.Modules.Config)
local PlayerData = require(game.ReplicatedStorage.Modules.PlayerData)

-- Store player data
local playerDataStore = {}

-- Handle player joining
Players.PlayerAdded:Connect(function(player)
	print("Player " .. player.Name .. " joined!")
	
	-- Create player data
	local data = PlayerData.new()
	playerDataStore[player.UserId] = data
	
	-- Handle character spawning
	local character = player.Character or player.CharacterAdded:Wait()
	print("Character spawned: " .. character.Name)
	
	-- TODO: Spawn player in Chapter 0 arena
end)

-- Handle player leaving
Players.PlayerRemoving:Connect(function(player)
	print("Player " .. player.Name .. " left!")
	playerDataStore[player.UserId] = nil
end)

print("Game Manager initialized!")