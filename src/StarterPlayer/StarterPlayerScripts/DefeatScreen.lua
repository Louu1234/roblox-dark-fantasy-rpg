-- DEFEAT SCREEN - LocalScript
-- Shows defeat/game over screen
-- Place this in: StarterPlayer > StarterPlayerScripts > DefeatScreen (LocalScript)

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create Defeat Screen GUI
local defeatGui = Instance.new("ScreenGui")
defeatGui.Name = "DefeatGui"
defeatGui.ResetOnSpawn = false
defeatGui.Visible = false
defeatGui.Parent = playerGui

-- Background
local bgFrame = Instance.new("Frame")
bgFrame.Name = "Background"
bgFrame.Size = UDim2.new(1, 0, 1, 0)
bgFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bgFrame.BackgroundTransparency = 0.5
bgFrame.Parent = defeatGui

-- Defeat Panel
local defeatPanel = Instance.new("Frame")
defeatPanel.Name = "DefeatPanel"
defeatPanel.Size = UDim2.new(0, 400, 0, 200)
defeatPanel.Position = UDim2.new(0.5, -200, 0.5, -100)
defeatPanel.BackgroundColor3 = Color3.fromRGB(50, 20, 20)
defeatPanel.BorderSizePixel = 3
defeatPanel.BorderColor3 = Color3.fromRGB(200, 50, 50)
defeatPanel.Parent = defeatGui

-- Title
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.Position = UDim2.new(0, 0, 0, 10)
titleLabel.BackgroundTransparency = 1
titleLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
titleLabel.TextSize = 40
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Text = "DEFEATED"
titleLabel.Parent = defeatPanel

-- Message
local messageLabel = Instance.new("TextLabel")
messageLabel.Name = "Message"
messageLabel.Size = UDim2.new(1, -20, 0, 80)
messageLabel.Position = UDim2.new(0, 10, 0, 60)
messageLabel.BackgroundTransparency = 1
messageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
messageLabel.TextSize = 18
messageLabel.Font = Enum.Font.Gotham
messageLabel.Text = "You have been defeated...\nBut the past awaits."
messageLabel.TextWrapped = true
messageLabel.Parent = defeatPanel

-- Continue Button
local continueButton = Instance.new("TextButton")
continueButton.Name = "ContinueButton"
continueButton.Size = UDim2.new(0, 100, 0, 35)
continueButton.Position = UDim2.new(0.5, -50, 1, -40)
continueButton.BackgroundColor3 = Color3.fromRGB(100, 50, 50)
ncontinueButton.TextColor3 = Color3.fromRGB(255, 255, 255)
continueButton.TextSize = 16
continueButton.Font = Enum.Font.GothamBold
continueButton.Text = "Continue"
continueButton.BorderSizePixel = 2
continueButton.BorderColor3 = Color3.fromRGB(200, 100, 100)
continueButton.Parent = defeatPanel

continueButton.MouseButton1Click:Connect(function()
	defeatGui.Visible = false
	print("Continuing to Chapter 1...")
end)

-- Function to show defeat screen
local function showDefeatScreen()
	wait(2) -- Wait after death
	defeatGui.Visible = true
end

-- Monitor player health
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

humanoid.Died:Connect(function()
	showDefeatScreen()
end)

print("Defeat Screen loaded!")