-- SHOP SYSTEM - ModuleScript
-- Handles buying and selling items in the shop
-- Place this in: ReplicatedStorage > Modules > ShopSystem (ModuleScript)

local ShopSystem = {}
ShopSystem.__index = ShopSystem

function ShopSystem.new()
	local self = setmetatable({}, ShopSystem)
	
	-- Shop inventory
	self.shopItems = {
		{name = "Health Potion", price = 20, type = "consumable", effect = "heal"},
		{name = "Mana Potion", price = 15, type = "consumable", effect = "mana"},
		{name = "Stamina Potion", price = 15, type = "consumable", effect = "stamina"},
		{name = "Antidote", price = 30, type = "consumable", effect = "cure"},
	}
	
	return self
end

function ShopSystem:GetShopItems()
	return self.shopItems
end

function ShopSystem:BuyItem(itemName, quantity, playerData, inventory)
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

function ShopSystem:SellItem(itemName, quantity, playerData, inventory)
	-- Calculate sell price (usually half of buy price)
	local item = nil
	for _, shopItem in ipairs(self.shopItems) do
		if shopItem.name == itemName then
			item = shopItem
			break
		end
	end
	
	if not item then
		return false, "Item not found"
	end
	
	if inventory:RemoveItem(itemName, quantity, item.type) then
		local sellPrice = math.floor(item.price * quantity * 0.5)
		playerData:AddGold(sellPrice)
		return true, "Sold " .. quantity .. "x " .. itemName .. " for " .. sellPrice .. " gold"
	end
	
	return false, "Not enough " .. itemName
end

return ShopSystem