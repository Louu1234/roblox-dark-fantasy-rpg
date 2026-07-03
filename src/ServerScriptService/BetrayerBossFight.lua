-- BETRAYER BOSS FIGHT - Script
-- Scripted boss fight with Betrayer, forces player defeat
-- Place this in: ServerScriptService > BetrayerBossFight (Script)

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local GameStateManager = require(game.ReplicatedStorage.Modules.GameStateManager)
local RegressionSystem = require(game.ReplicatedStorage.Modules.RegressionSystem)

local gameState = GameStateManager.new()
local regression = RegressionSystem.new()

-- Wait for player and arena
local player = Players:WaitForChild("Player1") -- Adjust to actual player name
local arena = Workspace:WaitForChild("Chapter0Arena")
local betrayer = arena:WaitForChild("Betrayer", 10)

if not betrayer then
	print("ERROR: Betrayer not found!")
	return
end

local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

print("Chapter 0 Boss Fight initialized!")

-- Wait for fight to start (after intro dialogue)
wait(5)

gameState:SetGameState("BOSS_FIGHT")
print("BOSS FIGHT START!")

-- Simulate fight for 15 seconds
wait(15)

-- Player loses (scripted defeat)
print("Player defeated by Betrayer!")
gameState:PlayerDefeated()

-- Kill player
humanoid.Health = 0

-- Wait for death
wait(2)

-- Trigger Regression
print("Activating Regression...")
gameState:TriggerRegression()

-- Reset player stats (would call RegressionSystem:TriggerRegression)
-- Reset position to Chapter 1
local chapter1Spawn = Workspace:FindFirstChild("Chapter1Spawn")
if chapter1Spawn then
	character:MoveTo(chapter1Spawn.Position)
end

print("Player regression complete. Moving to Chapter 1...")