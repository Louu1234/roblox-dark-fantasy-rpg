-- PLAYER DATA MODULE
-- Tracks and manages player stats, inventory, skills, etc.

local PlayerData = {}
PlayerData.__index = PlayerData

function PlayerData.new()
	local self = setmetatable({}, PlayerData)
	
	-- STATS
	self.Health = 100
	self.MaxHealth = 100
	self.Mana = 50
	self.MaxMana = 50
	self.Stamina = 100
	self.MaxStamina = 100
	
	-- PROGRESSION
	self.Level = 1
	self.Experience = 0
	self.ExperienceForNextLevel = 100
	self.Gold = 0
	
	-- STAT POINTS
	self.Strength = 5
	self.Vitality = 5
	self.Intelligence = 5
	self.Agility = 5
	self.Endurance = 5
	self.AvailableStatPoints = 0
	
	-- SKILLS
	self.Skills = {} -- Acquired skills
	self.EquippedSkills = {nil, nil, nil, nil} -- Max 4 equipped skills
	self.SkillStealUnlocked = true -- Can always steal skills
	
	-- SPECIAL SKILLS
	self.RegressionUsed = false -- Regression one-time use
	
	-- INVENTORY
	self.Inventory = {} -- {item_name, quantity}
	self.CorpseCount = 0 -- Monster corpses
	
	-- CHAPTER
	self.CurrentChapter = 0
	
	return self
end

function PlayerData:AddExperience(amount)
	self.Experience = self.Experience + amount
	if self.Experience >= self.ExperienceForNextLevel then
		self:LevelUp()
	end
end

function PlayerData:LevelUp()
	self.Level = self.Level + 1
	self.Experience = 0
	self.ExperienceForNextLevel = math.floor(self.ExperienceForNextLevel * 1.1)
	self.AvailableStatPoints = self.AvailableStatPoints + 5
	print("Level Up! Now level " .. self.Level)
end

function PlayerData:AddGold(amount)
	self.Gold = self.Gold + amount
end

function PlayerData:AddSkill(skillName, skillData)
	self.Skills[skillName] = skillData
end

function PlayerData:EquipSkill(skillName, slotIndex)
	if slotIndex >= 1 and slotIndex <= 4 then
		self.EquippedSkills[slotIndex] = skillName
	end
end

return PlayerData