-- CHAPTER 0 INTRO SCRIPT - Script
-- Handles Chapter 0 story, player vs Betrayer intro fight
-- Place this in: ServerScriptService > Chapter0Intro (Script)

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local wait_time = 3 -- Delay before intro starts

-- Wait for player
local player = Players:WaitForChild("Player1") -- Adjust to actual player name or use Players:WaitForPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

-- Set player to spawn location
local arena = Workspace:WaitForChild("Chapter0Arena")
local playerSpawn = arena:WaitForChild("PlayerSpawn")
humanoidRootPart.CFrame = playerSpawn.CFrame + Vector3.new(0, 3, 0)

print("Chapter 0 Intro starting...")

-- Dialogue lines
local introDialogue = {
	"You are the Rank 2 Hero. Humanity's last hope...",
	"The demons have nearly conquered our world.",
	"But there is one threat greater than them all...",
	"The Rank 1 Hero. Your ally. Your friend.",
	"But now... a traitor. The Betrayer.",
	"This is your final stand. Prepare yourself.",
}

-- TODO: Trigger dialogue display through RemoteEvent
-- TODO: Spawn Betrayer NPC
-- TODO: Initiate scripted boss fight
-- TODO: Force player defeat
-- TODO: Trigger Regression on death

print("Chapter 0 Intro loaded! Dialogue ready.")