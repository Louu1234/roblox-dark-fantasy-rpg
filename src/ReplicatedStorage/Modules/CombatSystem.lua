-- COMBAT SYSTEM - ModuleScript
-- Handles player attacks, damage calculation, hit detection
-- Place this in: ReplicatedStorage > Modules > CombatSystem (ModuleScript)

local CombatSystem = {}
CombatSystem.__index = CombatSystem

function CombatSystem.new()
	local self = setmetatable({}, CombatSystem)
	
	self.isAttacking = false
	self.attackCooldown = 0.5
	self.lastAttackTime = 0
	self.attackRange = 10
	self.baseDamage = 15
	
	return self
end

function CombatSystem:CanAttack()
	return (tick() - self.lastAttackTime) >= self.attackCooldown
end

function CombatSystem:PerformAttack(playerData, camera, targetEnemy)
	if not self:CanAttack() then
		return false
	end
	
	self.isAttacking = true
	self.lastAttackTime = tick()
	
	-- Calculate damage
	local damage = self:CalculateDamage(playerData, targetEnemy)
	
	-- Apply damage to target
	if targetEnemy then
		targetEnemy:TakeDamage(damage)
		
		-- Camera shake on hit
		if camera then
			camera.CameraShake(0.1, 0.1)
		end
		
		print("Hit! Damage dealt: " .. damage)
		
		-- Check if target died
		if targetEnemy:IsDead() then
			return "ENEMY_DEAD"
		end
	end
	
	self.isAttacking = false
	return true
end

function CombatSystem:CalculateDamage(playerData, targetEnemy)
	-- Base damage + strength modifier
	local baseDamage = self.baseDamage
	local strengthBonus = (playerData.Strength - 5) * 2
	local variability = math.random(-2, 2)
	
	local totalDamage = baseDamage + strengthBonus + variability
	
	-- Enemy defense reduces damage
	local enemyDefense = (targetEnemy.Vitality - 5) * 0.5
	totalDamage = math.max(1, totalDamage - enemyDefense)
	
	return math.floor(totalDamage)
end

function CombatSystem:DetectHit(camera, maxDistance)
	-- Raycast from camera center
	local rayOrigin = camera.CFrame.Position
	local rayDirection = camera.CFrame.LookVector * maxDistance
	
	local raycastParams = RaycastParams.new()
	raycastParams.FilterType = Enum.RaycastFilterType.Whitelist
	
	local result = workspace:Raycast(rayOrigin, rayDirection, raycastParams)
	
	if result then
		return result.Instance.Parent -- Return the hit entity
	end
	
	return nil
end

return CombatSystem