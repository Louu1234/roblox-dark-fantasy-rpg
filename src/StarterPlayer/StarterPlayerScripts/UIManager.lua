-- UI MANAGER - LocalScript
-- Manages HUD, menus, and UI interactions
-- Place this in: StarterPlayer > StarterPlayerScripts > UIManager (LocalScript)

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create HUD ScreenGui
local hud = Instance.new("ScreenGui")
hud.Name = "HUD"
hud.ResetOnSpawn = false
hud.Parent = playerGui

-- HEALTH BAR
local healthBarBg = Instance.new("Frame")
healthBarBg.Name = "HealthBarBg"
healthBarBg.Size = UDim2.new(0, 200, 0, 20)
healthBarBg.Position = UDim2.new(0, 10, 0, 10)
healthBarBg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
healthBarBg.BorderSizePixel = 2
healthBarBg.BorderColor3 = Color3.fromRGB(0, 0, 0)
healthBarBg.Parent = hud

local healthBar = Instance.new("Frame")
healthBar.Name = "HealthBar"
healthBar.Size = UDim2.new(1, 0, 1, 0)
healthBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
healthBar.BorderSizePixel = 0
healthBar.Parent = healthBarBg

local healthText = Instance.new("TextLabel")
healthText.Name = "HealthText"
healthText.Size = UDim2.new(1, 0, 1, 0)
healthText.BackgroundTransparency = 1
healthText.TextColor3 = Color3.fromRGB(255, 255, 255)
healthText.TextSize = 14
healthText.Font = Enum.Font.GothamBold
healthText.Text = "HP: 100/100"
healthText.Parent = healthBarBg

-- CROSSHAIR
local crosshair = Instance.new("Frame")
crosshair.Name = "Crosshair"
crosshair.Size = UDim2.new(0, 10, 0, 10)
crosshair.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
crosshair.BorderSizePixel = 0
crosshair.Parent = hud

-- Position crosshair at center
local viewportSize = playerGui.AbsoluteSize
crosshair.AnchorPoint = Vector2.new(0.5, 0.5)
crosshair.Position = UDim2.new(0.5, 0, 0.5, 0)

-- LEVEL DISPLAY
local levelText = Instance.new("TextLabel")
levelText.Name = "LevelText"
levelText.Size = UDim2.new(0, 150, 0, 20)
levelText.Position = UDim2.new(0, 10, 0, 40)
levelText.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
levelText.TextColor3 = Color3.fromRGB(255, 255, 255)
levelText.TextSize = 16
levelText.Font = Enum.Font.GothamBold
levelText.Text = "Level: 1"
levelText.BorderSizePixel = 1
levelText.BorderColor3 = Color3.fromRGB(100, 100, 100)
levelText.Parent = hud

-- GOLD DISPLAY
local goldText = Instance.new("TextLabel")
goldText.Name = "GoldText"
goldText.Size = UDim2.new(0, 150, 0, 20)
goldText.Position = UDim2.new(0, 10, 0, 70)
goldText.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
goldText.TextColor3 = Color3.fromRGB(255, 215, 0)
goldText.TextSize = 16
goldText.Font = Enum.Font.GothamBold
goldText.Text = "Gold: 0"
goldText.BorderSizePixel = 1
goldText.BorderColor3 = Color3.fromRGB(100, 100, 100)
goldText.Parent = hud

print("UI Manager loaded! HUD created.")