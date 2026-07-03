-- STAT POINT DISTRIBUTOR - ModuleScript
-- Handles distributing stat points when leveling up
-- Place this in: ReplicatedStorage > Modules > StatDistributor (ModuleScript)

local StatDistributor = {}
StatDistributor.__index = StatDistributor

function StatDistributor.new()
	local self = setmetatable({}, StatDistributor)
	return self
end

function StatDistributor:DistributePoints(playerData, stat, amount)
	if not playerData.AvailableStatPoints or playerData.AvailableStatPoints < amount then
		return false, "Not enough stat points"
	end
	
	if stat == "Strength" then
		playerData.Strength = playerData.Strength + amount
	elseif stat == "Vitality" then
		playerData.Vitality = playerData.Vitality + amount
		playerData.MaxHealth = 100 + (playerData.Vitality - 5) * 5
	elseif stat == "Intelligence" then
		playerData.Intelligence = playerData.Intelligence + amount
		playerData.MaxMana = 50 + (playerData.Intelligence - 5) * 5
	elseif stat == "Agility" then
		playerData.Agility = playerData.Agility + amount
	elseif stat == "Endurance" then
		playerData.Endurance = playerData.Endurance + amount
		playerData.MaxStamina = 100 + (playerData.Endurance - 5) * 5
	else
		return false, "Unknown stat"
	end
	
	playerData.AvailableStatPoints = playerData.AvailableStatPoints - amount
	return true, stat .. " increased by " .. amount
end

return StatDistributor