-- CORPSE SPAWN ON DEATH - Script
-- Spawns corpse when enemy dies, attached to enemy
-- Place this in: ServerScriptService > CorpseSpawnOnDeath (Script)
-- This script should be attached to each enemy or spawned dynamically

local CorpseSystem = require(game.ReplicatedStorage.Modules.CorpseSystem)
local corpseSystem = CorpseSystem.new()

-- Global function to handle enemy death
_G.SpawnCorpse = function(enemy, enemyName, enemyModel)
	if enemy.Health > 0 then return end
	
	-- Get enemy position
	local position = Vector3.new(0, 0, 0)
	if enemyModel:FindFirstChild("HumanoidRootPart") then
		position = enemyModel.HumanoidRootPart.Position
	end
	
	-- Create corpse
	local corpse = corpseSystem:CreateCorpse(enemyName, position, enemyModel)
	
	-- Add disappear timer (corpse lasts 5 minutes)
	game:GetService("Debris"):AddItem(corpse, 300)
	
	print("Corpse spawned: " .. enemyName .. " at " .. tostring(position))
end

print("Corpse Spawn System loaded!")