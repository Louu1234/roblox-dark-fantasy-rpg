-- EXTENDED SHOP SYSTEM - ModuleScript
-- Updated shop system with corpse selling
-- Place this in: ReplicatedStorage > Modules > ExtendedShopSystem (ModuleScript)
-- Or update the existing ShopSystem.lua with this

local ExtendedShopSystem = {}
ExtendedShopSystem.__index = ExtendedShopSystem

function ExtendedShopSystem.new()
	local self = setmetatable({}, ExtendedShopSystem)
	
	-- Shop inventory
	self.shopItems = {
		{name = "Health Potion", price = 20, type = "consumable", effect = "heal"},
		{name = "Mana Potion", price = 15, type = "consumable", effect = "mana"},
		{name = "Stamina Potion", price = 15, type = "consumable", effect = "stamina"},
		{name = "Antidote", price = 30, type = "consumable", effect = "cure"},
	}
	
	-- Corpse values
	self.corpseValues = {
		["Goblin"] = 50,
		["Orc"] = 75,
		["Skeleton"] = 60,
		["Demon"] = 150,
	}
	
	return self
end

function ExtendedShopSystem:GetShopItems()
	return self.shopItems
end

function ExtendedShopSystem:BuyItem(itemName, quantity, playerData, inventory)
	-- Find item in shop
	local item = nil
	for _, shopItem in ipairs(self.shopItems) do
		if shopItem.name == itemName then
			item = shopItem
			break
		end
	end
	
	if not item then
		return false, "Item not found in shop"
	end
	
	local totalCost = item.price * quantity
	
	-- Check if player has enough gold
	if playerData.Gold < totalCost then
		return false, "Not enough gold"
	end
	
	-- Deduct gold and add item
	playerData.Gold = playerData.Gold - totalCost
	inventory:AddItem(itemName, quantity, item.type)
	
	return true, "Purchased " .. quantity .. "x " .. itemName
end

function ExtendedShopSystem:SellCorpse(corpseType, quantity, playerData, inventory)
	local value = self.corpseValues[corpseType] or 25
	
	if inventory:RemoveItem(corpseType, quantity, "corpse") then
		local totalValue = value * quantity
		playerData:AddGold(totalValue)
		return true, "Sold " .. quantity .. "x " .. corpseType .. " for " .. totalValue .. " gold"
	end
	
	return false, "Not enough " .. corpseType
end

return ExtendedShopSystem