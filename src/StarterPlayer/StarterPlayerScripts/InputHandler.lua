-- INPUT HANDLER - LocalScript
-- Handles player input for movement, skills, UI, and dialogue
-- Place this in: StarterPlayer > StarterPlayerScripts > InputHandler (LocalScript)

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

-- INPUT STATE
local movementDirection = Vector3.new(0, 0, 0)
local moveSpeed = 16

-- KEYBINDS
local FORWARD_KEY = Enum.KeyCode.W
local BACKWARD_KEY = Enum.KeyCode.S
local LEFT_KEY = Enum.KeyCode.A
local RIGHT_KEY = Enum.KeyCode.D
local JUMP_KEY = Enum.KeyCode.Space

-- Track key states
local keysPressed = {}

-- Input began
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	keysPressed[input.KeyCode] = true
end)

-- Input ended
UserInputService.InputEnded:Connect(function(input, gameProcessed)
	keysPressed[input.KeyCode] = false
end)

-- Movement loop
RunService.RenderStepped:Connect(function()
	if not humanoidRootPart then return end
	
	-- Calculate movement direction
	local direction = Vector3.new(0, 0, 0)
	
	if keysPressed[FORWARD_KEY] then
		direction = direction + (humanoidRootPart.CFrame.LookVector * Vector3.new(1, 0, 1)).Unit
	end
	if keysPressed[BACKWARD_KEY] then
		direction = direction - (humanoidRootPart.CFrame.LookVector * Vector3.new(1, 0, 1)).Unit
	end
	if keysPressed[LEFT_KEY] then
		direction = direction - humanoidRootPart.CFrame.RightVector
	end
	if keysPressed[RIGHT_KEY] then
		direction = direction + humanoidRootPart.CFrame.RightVector
	end
	
	-- Normalize and apply movement
	if direction.Magnitude > 0 then
		direction = direction.Unit
	end
	
	humanoid:Move(direction)
	
	-- Jump
	if keysPressed[JUMP_KEY] then
		humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)

print("Input Handler loaded!")