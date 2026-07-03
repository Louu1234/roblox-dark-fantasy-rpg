-- ENEMY SYSTEM - ModuleScript
-- Base system for enemies, NPCs, and bosses
-- Place this in: ReplicatedStorage > Modules > EnemySystem (ModuleScript)

local EnemySystem = {}
EnemySystem.__index = EnemySystem

function EnemySystem.new(enemyName, health, mana, level)
	local self = setmetatable({}, EnemySystem)
	
	self.Name = enemyName
	self.Health = health
	self.MaxHealth = health
	self.Mana = mana
	self.MaxMana = mana
	self.Level = level
	
	self.Strength = 5
	self.Vitality = 5
	self.Intelligence = 5
	self.Agility = 5
	self.Endurance = 5
	
	self.Skills = {}
	self.ExperienceReward = level * 10
	self.GoldReward = level * 5
	
	return self
end

function EnemySystem:TakeDamage(damage)
	self.Health = math.max(0, self.Health - damage)
	return self.Health
end

function EnemySystem:IsDead()
	return self.Health <= 0
end

function EnemySystem:GetRewards()
	return {
		experience = self.ExperienceReward,
		gold = self.GoldReward,
	}
end

-- BETRAYER (Boss)
local function createBetrayer()
	local betrayer = EnemySystem.new("The Betrayer", 500, 200, 50)
	betrayer.Strength = 25
	betrayer.Vitality = 20
	betrayer.Intelligence = 20
	betrayer.Agility = 15
	betrayer.Endurance = 25
	betrayer.ExperienceReward = 1000
	betrayer.GoldReward = 0 -- Boss doesn't drop gold
	
	-- Add boss skills
	betrayer.Skills = {
		"GreatSlash",
		"DarkBurst",
		"BetrayalStrike",
	}
	
	return betrayer
end

EnemySystem.Betrayer = createBetrayer

return EnemySystem