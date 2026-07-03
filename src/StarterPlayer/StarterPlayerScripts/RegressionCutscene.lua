-- REGRESSION CUTSCENE - LocalScript
-- Shows regression cutscene when player resets to past
-- Place this in: StarterPlayer > StarterPlayerScripts > RegressionCutscene (LocalScript)

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create Regression Cutscene GUI
local regressionGui = Instance.new("ScreenGui")
regressionGui.Name = "RegressionGui"
regressionGui.ResetOnSpawn = false
regressionGui.Visible = false
regressionGui.Parent = playerGui

-- Background
local bgFrame = Instance.new("Frame")
bgFrame.Name = "Background"
bgFrame.Size = UDim2.new(1, 0, 1, 0)
bgFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bgFrame.BackgroundTransparency = 0
bgFrame.Parent = regressionGui

-- Title
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.Position = UDim2.new(0, 0, 0.5, -60)
titleLabel.BackgroundTransparency = 1
titleLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
titleLabel.TextSize = 50
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Text = "REGRESSION"
titleLabel.Parent = regressionGui

-- Message
local messageLabel = Instance.new("TextLabel")
messageLabel.Name = "Message"
messageLabel.Size = UDim2.new(0.8, 0, 0.3, 0)
messageLabel.Position = UDim2.new(0.1, 0, 0.5, 0)
messageLabel.BackgroundTransparency = 1
messageLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
messageLabel.TextSize = 24
messageLabel.Font = Enum.Font.Gotham
messageLabel.Text = "You have been sent back to the past...\nYou retain only your Skill Steal ability.\nChapter 1 begins."
messageLabel.TextWrapped = true
messageLabel.Parent = regressionGui

-- Function to show regression cutscene
local function showRegressionCutscene()
	regressionGui.Visible = true
	
	-- Fade out after 5 seconds
	wait(5)
	
	local startTime = tick()
	local fadeDuration = 2
	
	while tick() - startTime < fadeDuration do
		local progress = (tick() - startTime) / fadeDuration
		bgFrame.BackgroundTransparency = progress
		wait(0.016)
	end
	
	regressionGui.Visible = false
end

-- Listen for regression event (would be triggered from server)
-- For now, you can test with:
-- showRegressionCutscene()

print("Regression Cutscene loaded!")