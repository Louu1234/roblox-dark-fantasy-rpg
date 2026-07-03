-- SKILL STEAL SYSTEM - ModuleScript
-- Handles the core Skill Steal mechanic
-- Place this in: ReplicatedStorage > Modules > SkillStealSystem (ModuleScript)

local SkillStealSystem = {}
SkillStealSystem.__index = SkillStealSystem

function SkillStealSystem.new()
	local self = setmetatable({}, SkillStealSystem)
	
	self.stolenSkills = {}
	self.stealChance = 0.5 -- 50% chance to steal a skill
	
	return self
end

function SkillStealSystem:StealSkill(enemy, playerData)
	-- Check if enemy has skills to steal
	if not enemy.Skills or #enemy.Skills == 0 then
		return false
	end
	
	-- Roll for steal chance
	local roll = math.random()
	if roll > self.stealChance then
		return false
	end
	
	-- Pick random skill from enemy
	local stolenSkill = enemy.Skills[math.random(1, #enemy.Skills)]
	
	-- Add to player
	if stolenSkill then
		playerData:AddSkill(stolenSkill, {
			name = stolenSkill,
			source = enemy.Name,
			level = 1,
		})
		print("Skill Stolen: " .. stolenSkill .. " from " .. enemy.Name)
		return true, stolenSkill
	end
	
	return false
end

function SkillStealSystem:GetStolenSkills()
	return self.stolenSkills
end

return SkillStealSystem