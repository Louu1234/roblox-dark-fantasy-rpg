-- RPG MENU SYSTEM - LocalScript
-- Full RPG menu with Inventory, Skills, Stats, Shop tabs
-- Place this in: StarterPlayer > StarterPlayerScripts > RPGMenuSystem (LocalScript)

local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local PlayerData = require(game.ReplicatedStorage.Modules.PlayerData)
local playerData = PlayerData.new()

-- Create Main Menu GUI
local menuGui = Instance.new("ScreenGui")
menuGui.Name = "RPGMenu"
menuGui.ResetOnSpawn = false
menuGui.Visible = false
menuGui.Parent = playerGui

-- Background
local bgFrame = Instance.new("Frame")
bgFrame.Name = "Background"
bgFrame.Size = UDim2.new(1, 0, 1, 0)
bgFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bgFrame.BackgroundTransparency = 0.7
bgFrame.Parent = menuGui

-- Main Menu Panel
local menuPanel = Instance.new("Frame")
menuPanel.Name = "MenuPanel"
menuPanel.Size = UDim2.new(0, 800, 0, 600)
menuPanel.Position = UDim2.new(0.5, -400, 0.5, -300)
menuPanel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
menuPanel.BorderSizePixel = 2
menuPanel.BorderColor3 = Color3.fromRGB(200, 150, 50)
menuPanel.Parent = menuGui

-- TABS
local tabContainer = Instance.new("Frame")
tabContainer.Name = "TabContainer"
tabContainer.Size = UDim2.new(0, 150, 0, 600)
tabContainer.Position = UDim2.new(0, 0, 0, 0)
tabContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
tabContainer.BorderSizePixel = 0
tabContainer.Parent = menuPanel

-- Content Area
local contentArea = Instance.new("Frame")
contentArea.Name = "ContentArea"
contentArea.Size = UDim2.new(1, -150, 1, 0)
contentArea.Position = UDim2.new(0, 150, 0, 0)
contentArea.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
contentArea.BorderSizePixel = 0
contentArea.Parent = menuPanel

-- TAB BUTTONS
local tabs = {}
local tabNames = {"Inventory", "Skills", "Stats", "Shop"}

for i, tabName in ipairs(tabNames) do
	local tabButton = Instance.new("TextButton")
	tabButton.Name = tabName .. "Tab"
	tabButton.Size = UDim2.new(1, 0, 0, 40)
	tabButton.Position = UDim2.new(0, 0, 0, (i-1) * 45)
	tabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	tabButton.TextColor3 = Color3.fromRGB(200, 150, 50)
	tabButton.TextSize = 14
	tabButton.Font = Enum.Font.GothamBold
	tabButton.Text = tabName
	tabButton.BorderSizePixel = 1
	tabButton.BorderColor3 = Color3.fromRGB(100, 100, 100)
	tabButton.Parent = tabContainer
	
	tabs[tabName] = {
		button = tabButton,
		content = nil,
	}
end

-- CREATE TAB CONTENT FRAMES
for _, tabName in ipairs(tabNames) do
	local contentFrame = Instance.new("Frame")
	contentFrame.Name = tabName .. "Content"
	contentFrame.Size = UDim2.new(1, 0, 1, 0)
	contentFrame.BackgroundTransparency = 1
	contentFrame.Visible = false
	contentFrame.Parent = contentArea
	
	tabs[tabName].content = contentFrame
	
	-- Add scroll frame for content
	local scrollFrame = Instance.new("ScrollingFrame")
	scrollFrame.Name = "ScrollFrame"
	scrollFrame.Size = UDim2.new(1, 0, 1, 0)
	scrollFrame.BackgroundTransparency = 1
	scrollFrame.BorderSizePixel = 0
	scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	scrollFrame.Parent = contentFrame
end

-- INVENTORY TAB
local function setupInventoryTab()
	local inventoryContent = tabs["Inventory"].content
	local scrollFrame = inventoryContent:FindFirstChild("ScrollFrame")
	
	local titleLabel = Instance.new("TextLabel")
	titleLabel.Name = "Title"
	titleLabel.Size = UDim2.new(1, 0, 0, 30)
	titleLabel.Position = UDim2.new(0, 10, 0, 10)
	titleLabel.BackgroundTransparency = 1
	titleLabel.TextColor3 = Color3.fromRGB(200, 150, 50)
	titleLabel.TextSize = 20
	titleLabel.Font = Enum.Font.GothamBold
	titleLabel.Text = "Inventory"
	titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	titleLabel.Parent = inventoryContent
	
	-- Items List
	local itemsList = Instance.new("TextLabel")
	itemsList.Name = "ItemsList"
	itemsList.Size = UDim2.new(1, -20, 1, -50)
	itemsList.Position = UDim2.new(0, 10, 0, 40)
	itemsList.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	itemsList.TextColor3 = Color3.fromRGB(255, 255, 255)
	itemsList.TextSize = 14
	itemsList.Font = Enum.Font.Gotham
	itemsList.Text = "No items yet"
	itemsList.TextXAlignment = Enum.TextXAlignment.Left
	itemsList.TextYAlignment = Enum.TextYAlignment.Top
	itemsList.TextWrapped = true
	itemsList.BorderSizePixel = 1
	itemsList.BorderColor3 = Color3.fromRGB(100, 100, 100)
	itemsList.Parent = inventoryContent
end

-- SKILLS TAB
local function setupSkillsTab()
	local skillsContent = tabs["Skills"].content
	local scrollFrame = skillsContent:FindFirstChild("ScrollFrame")
	
	local titleLabel = Instance.new("TextLabel")
	titleLabel.Name = "Title"
	titleLabel.Size = UDim2.new(1, 0, 0, 30)
	titleLabel.Position = UDim2.new(0, 10, 0, 10)
	titleLabel.BackgroundTransparency = 1
	titleLabel.TextColor3 = Color3.fromRGB(200, 150, 50)
	titleLabel.TextSize = 20
	titleLabel.Font = Enum.Font.GothamBold
	titleLabel.Text = "Skills (Equip up to 4)"
	titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	titleLabel.Parent = skillsContent
	
	-- Equipped Skills Display
	local equippedLabel = Instance.new("TextLabel")
	equippedLabel.Name = "EquippedLabel"
	equippedLabel.Size = UDim2.new(1, -20, 0, 20)
	equippedLabel.Position = UDim2.new(0, 10, 0, 40)
	equippedLabel.BackgroundTransparency = 1
	equippedLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
	equippedLabel.TextSize = 14
	equippedLabel.Font = Enum.Font.GothamBold
	equippedLabel.Text = "Equipped: Skill Steal (Slot 1)"
	equippedLabel.TextXAlignment = Enum.TextXAlignment.Left
	equippedLabel.Parent = skillsContent
end

-- STATS TAB
local function setupStatsTab()
	local statsContent = tabs["Stats"].content
	
	local titleLabel = Instance.new("TextLabel")
	titleLabel.Name = "Title"
	titleLabel.Size = UDim2.new(1, 0, 0, 30)
	titleLabel.Position = UDim2.new(0, 10, 0, 10)
	titleLabel.BackgroundTransparency = 1
	titleLabel.TextColor3 = Color3.fromRGB(200, 150, 50)
	titleLabel.TextSize = 20
	titleLabel.Font = Enum.Font.GothamBold
	titleLabel.Text = "Stats"
	titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	titleLabel.Parent = statsContent
	
	-- Available Points
	local pointsLabel = Instance.new("TextLabel")
	pointsLabel.Name = "PointsLabel"
	pointsLabel.Size = UDim2.new(1, -20, 0, 20)
	pointsLabel.Position = UDim2.new(0, 10, 0, 40)
	pointsLabel.BackgroundTransparency = 1
	pointsLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
	pointsLabel.TextSize = 14
	pointsLabel.Font = Enum.Font.GothamBold
	pointsLabel.Text = "Available Points: " .. playerData.AvailableStatPoints
	pointsLabel.TextXAlignment = Enum.TextXAlignment.Left
	pointsLabel.Parent = statsContent
	
	-- Stats List
	local statsList = Instance.new("TextLabel")
	statsList.Name = "StatsList"
	statsList.Size = UDim2.new(1, -20, 1, -70)
	statsList.Position = UDim2.new(0, 10, 0, 60)
	statsList.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	statsList.TextColor3 = Color3.fromRGB(255, 255, 255)
	statsList.TextSize = 14
	statsList.Font = Enum.Font.Gotham
	statsList.Text = "Strength: " .. playerData.Strength .. "\nVitality: " .. playerData.Vitality .. "\nIntelligence: " .. playerData.Intelligence .. "\nAgility: " .. playerData.Agility .. "\nEndurance: " .. playerData.Endurance
	statsList.TextXAlignment = Enum.TextXAlignment.Left
	statsList.TextYAlignment = Enum.TextYAlignment.Top
	statsList.TextWrapped = true
	statsList.BorderSizePixel = 1
	statsList.BorderColor3 = Color3.fromRGB(100, 100, 100)
	statsList.Parent = statsContent
end

-- SHOP TAB
local function setupShopTab()
	local shopContent = tabs["Shop"].content
	
	local titleLabel = Instance.new("TextLabel")
	titleLabel.Name = "Title"
	titleLabel.Size = UDim2.new(1, 0, 0, 30)
	titleLabel.Position = UDim2.new(0, 10, 0, 10)
	titleLabel.BackgroundTransparency = 1
	titleLabel.TextColor3 = Color3.fromRGB(200, 150, 50)
	titleLabel.TextSize = 20
	titleLabel.Font = Enum.Font.GothamBold
	titleLabel.Text = "Shop"
	titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	titleLabel.Parent = shopContent
	
	-- Gold Display
	local goldLabel = Instance.new("TextLabel")
	goldLabel.Name = "GoldLabel"
	goldLabel.Size = UDim2.new(1, -20, 0, 20)
	goldLabel.Position = UDim2.new(0, 10, 0, 40)
	goldLabel.BackgroundTransparency = 1
	goldLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
	goldLabel.TextSize = 14
	goldLabel.Font = Enum.Font.GothamBold
	goldLabel.Text = "Gold: " .. playerData.Gold
	goldLabel.TextXAlignment = Enum.TextXAlignment.Left
	goldLabel.Parent = shopContent
	
	-- Items for Sale
	local itemsList = Instance.new("TextLabel")
	itemsList.Name = "ItemsList"
	itemsList.Size = UDim2.new(1, -20, 1, -70)
	itemsList.Position = UDim2.new(0, 10, 0, 60)
	itemsList.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	itemsList.TextColor3 = Color3.fromRGB(255, 255, 255)
	itemsList.TextSize = 14
	itemsList.Font = Enum.Font.Gotham
	itemsList.Text = "Health Potion - 20 Gold\nMana Potion - 15 Gold\nStamina Potion - 15 Gold\nSell Monster Corpse - 50 Gold"
	itemsList.TextXAlignment = Enum.TextXAlignment.Left
	itemsList.TextYAlignment = Enum.TextYAlignment.Top
	itemsList.TextWrapped = true
	itemsList.BorderSizePixel = 1
	itemsList.BorderColor3 = Color3.fromRGB(100, 100, 100)
	itemsList.Parent = shopContent
end

-- Setup all tabs
setupInventoryTab()
setupSkillsTab()
setupStatsTab()
setupShopTab()

-- Tab switching
local currentTab = "Inventory"
local function switchTab(tabName)
	if currentTab then
		tabs[currentTab].content.Visible = false
		tabs[currentTab].button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	end
	
	currentTab = tabName
	tabs[tabName].content.Visible = true
	tabs[tabName].button.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
end

-- Default tab
switchTab("Inventory")

-- Tab button connections
for tabName, tabData in pairs(tabs) do
	tabData.button.MouseButton1Click:Connect(function()
		switchTab(tabName)
	end)
end

-- Toggle menu with Tab key
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	if input.KeyCode == Enum.KeyCode.Tab then
		menuGui.Visible = not menuGui.Visible
	end
end)

print("RPG Menu System loaded! Press Tab to toggle.")