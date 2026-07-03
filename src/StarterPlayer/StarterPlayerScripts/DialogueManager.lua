-- DIALOGUE MANAGER - LocalScript
-- Displays dialogue with Next and Skip buttons
-- Place this in: StarterPlayer > StarterPlayerScripts > DialogueManager (LocalScript)

local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local DialogueSystem = require(game.ReplicatedStorage.Modules.DialogueSystem)
local dialogue = DialogueSystem.new()

-- Create Dialogue UI
local dialogueGui = Instance.new("ScreenGui")
dialogueGui.Name = "DialogueGui"
dialogueGui.ResetOnSpawn = false
dialogueGui.Parent = playerGui

-- Dialogue Box Background
local dialogueBox = Instance.new("Frame")
dialogueBox.Name = "DialogueBox"
dialogueBox.Size = UDim2.new(0, 600, 0, 150)
dialogueBox.Position = UDim2.new(0.5, -300, 1, -170)
dialogueBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
dialogueBox.BorderSizePixel = 2
dialogueBox.BorderColor3 = Color3.fromRGB(200, 150, 50)
dialogueBox.Visible = false
dialogueBox.Parent = dialogueGui

-- Dialogue Text
local dialogueText = Instance.new("TextLabel")
dialogueText.Name = "DialogueText"
dialogueText.Size = UDim2.new(1, -20, 0, 90)
dialogueText.Position = UDim2.new(0, 10, 0, 10)
dialogueText.BackgroundTransparency = 1
dialogueText.TextColor3 = Color3.fromRGB(255, 255, 255)
dialogueText.TextSize = 16
dialogueText.Font = Enum.Font.Gotham
dialogueText.TextWrapped = true
dialogueText.TextXAlignment = Enum.TextXAlignment.Left
dialogueText.TextYAlignment = Enum.TextYAlignment.Top
dialogueText.Parent = dialogueBox

-- Next Button
local nextButton = Instance.new("TextButton")
nextButton.Name = "NextButton"
nextButton.Size = UDim2.new(0, 80, 0, 30)
nextButton.Position = UDim2.new(1, -100, 1, -40)
nextButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
nextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
nextButton.TextSize = 14
nextButton.Font = Enum.Font.GothamBold
nextButton.Text = "Next"
nextButton.BorderSizePixel = 1
nextButton.BorderColor3 = Color3.fromRGB(100, 100, 100)
nextButton.Parent = dialogueBox

-- Skip Button
local skipButton = Instance.new("TextButton")
skipButton.Name = "SkipButton"
skipButton.Size = UDim2.new(0, 80, 0, 30)
skipButton.Position = UDim2.new(1, -190, 1, -40)
skipButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
skipButton.TextColor3 = Color3.fromRGB(255, 255, 255)
skipButton.TextSize = 14
skipButton.Font = Enum.Font.GothamBold
skipButton.Text = "Skip"
skipButton.BorderSizePixel = 1
skipButton.BorderColor3 = Color3.fromRGB(100, 100, 100)
skipButton.Parent = dialogueBox

-- Show dialogue box
local function showDialogueBox(text)
	dialogueBox.Visible = true
	dialogueText.Text = text
end

-- Hide dialogue box
local function hideDialogueBox()
	dialogueBox.Visible = false
end

-- Next button clicked
nextButton.MouseButton1Click:Connect(function()
	local nextText = dialogue:NextDialogue()
	if nextText then
		showDialogueBox(nextText)
	else
		hideDialogueBox()
	end
end)

-- Skip button clicked
skipButton.MouseButton1Click:Connect(function()
	dialogue:SkipDialogue()
	hideDialogueBox()
end)

-- Space/Enter for next
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	if input.KeyCode == Enum.KeyCode.Space or input.KeyCode == Enum.KeyCode.Return then
		if dialogue.isDialogueActive then
			nextButton:TriggerEvent("MouseButton1Click")
		end
	end
	
	-- Escape to skip
	if input.KeyCode == Enum.KeyCode.Escape then
		if dialogue.isDialogueActive then
			skipButton:TriggerEvent("MouseButton1Click")
		end
	end
end)

-- Expose dialogue system
script.Parent.DialogueSystem = dialogue

print("Dialogue Manager loaded!")