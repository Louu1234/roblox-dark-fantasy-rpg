-- INVENTORY SYSTEM - ModuleScript
-- Manages player inventory, items, and equipment
-- Place this in: ReplicatedStorage > Modules > InventorySystem (ModuleScript)

local InventorySystem = {}
InventorySystem.__index = InventorySystem

function InventorySystem.new()
	local self = setmetatable({}, InventorySystem)
	
	self.items = {}
	self.consumables = {}
	self.equipment = {}
	self.materials = {}
	self.corpses = {}
	
	return self
end

function InventorySystem:AddItem(itemName, quantity, itemType)
	itemType = itemType or "items"
	
	if itemType == "consumable" then
		self.consumables[itemName] = (self.consumables[itemName] or 0) + quantity
	elseif itemType == "equipment" then
		self.equipment[itemName] = (self.equipment[itemName] or 0) + quantity
	elseif itemType == "material" then
		self.materials[itemName] = (self.materials[itemName] or 0) + quantity
	elseif itemType == "corpse" then
		self.corpses[itemName] = (self.corpses[itemName] or 0) + quantity
	else
		self.items[itemName] = (self.items[itemName] or 0) + quantity
	end
end

function InventorySystem:RemoveItem(itemName, quantity, itemType)
	itemType = itemType or "items"
	
	local inventory = self.items
	if itemType == "consumable" then
		inventory = self.consumables
	elseif itemType == "equipment" then
		inventory = self.equipment
	elseif itemType == "material" then
		inventory = self.materials
	elseif itemType == "corpse" then
		inventory = self.corpses
	end
	
	if inventory[itemName] and inventory[itemName] >= quantity then
		inventory[itemName] = inventory[itemName] - quantity
		if inventory[itemName] == 0 then
			inventory[itemName] = nil
		end
		return true
	end
	return false
end

function InventorySystem:GetAllItems()
	return {
		items = self.items,
		consumables = self.consumables,
		equipment = self.equipment,
		materials = self.materials,
		corpses = self.corpses,
	}
end

function InventorySystem:AddCorpse(monsterName, value)
	self.corpses[monsterName] = (self.corpses[monsterName] or 0) + 1
end

function InventorySystem:SellCorpse(monsterName, quantity, playerData)
	if self:RemoveItem(monsterName, quantity, "corpse") then
		local value = quantity * 50 -- Default corpse value
		playerData:AddGold(value)
		return true
	end
	return false
end

return InventorySystem