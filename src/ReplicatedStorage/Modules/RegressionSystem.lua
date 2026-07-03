-- REGRESSION SYSTEM - ModuleScript
-- Handles the one-time Regression skill (reset to past)
-- Place this in: ReplicatedStorage > Modules > RegressionSystem (ModuleScript)

local RegressionSystem = {}
RegressionSystem.__index = RegressionSystem

function RegressionSystem.new()
	local self = setmetatable({}, RegressionSystem)
	
	self.hasRegression = true
	self.regressionUsed = false
	
	return self
end

function RegressionSystem:CanUseRegression()
	return self.hasRegression and not self.regressionUsed
end

function RegressionSystem:TriggerRegression(playerData)
	if not self:CanUseRegression() then
		return false
	end
	
	-- Reset player to Level 1
	self.regressionUsed = true
	
	-- Keep only Skill Steal
	local stealSkill = nil
	for skillName, skillData in pairs(playerData.Skills) do
		if skillName == "Skill Steal" then
			stealSkill = skillData
		end
	end
	
	-- Clear all skills except Skill Steal
	playerData.Skills = {}
	if stealSkill then
		playerData.Skills["Skill Steal"] = stealSkill
	end
	
	-- Reset stats
	playerData.Level = 1
	playerData.Experience = 0
	playerData.ExperienceForNextLevel = 100
	playerData.Health = playerData.MaxHealth
	playerData.Mana = playerData.MaxMana
	playerData.Stamina = playerData.MaxStamina
	playerData.AvailableStatPoints = 0
	playerData.Gold = 0
	
	-- Reset stat distribution
	playerData.Strength = 5
	playerData.Vitality = 5
	playerData.Intelligence = 5
	playerData.Agility = 5
	playerData.Endurance = 5
	
	-- Move to Chapter 1
	playerData.CurrentChapter = 1
	
	print("Regression activated! Player reset to past.")
	return true
end

return RegressionSystem