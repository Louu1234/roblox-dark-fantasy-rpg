-- CAMERA CONTROLLER - LocalScript
-- Handles smooth first-person camera, mouse look, and camera shake
-- Place this in: StarterPlayer > StarterPlayerScripts > CameraController (LocalScript)

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local camera = workspace.CurrentCamera

-- CONFIG
local SENSITIVITY = 0.003
local SHAKE_INTENSITY = 0.05
local SHAKE_DURATION = 0.1
local FOV = 80

-- CAMERA STATE
local cameraX = 0
local cameraY = 0
local shakeAmount = 0
local isMouseLocked = true

-- Set initial camera properties
camera.FieldOfView = FOV
camera.CFrame = humanoidRootPart.CFrame + humanoidRootPart.CFrame.LookVector * 0

-- Lock mouse to center on start
local function lockMouse()
	mouse.Icon = ""
	isMouseLocked = true
end

local function unlockMouse()
	isMouseLocked = false
end

-- Handle Z key toggle for cursor visibility
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	if input.KeyCode == Enum.KeyCode.Z then
		if isMouseLocked then
			unlockMouse()
			mouse.Icon = "rbxasset://textures/Cursors/MouseLockedCursor.png"
			userInputService:MouseBehavior = Enum.MouseBehavior.Default
		else
			lockMouse()
			UserInputService:MouseBehavior = Enum.MouseBehavior.LockCenter
		end
	end
end)

-- Handle mouse movement for camera rotation
mouse.Move:Connect(function()
	if not isMouseLocked then return end
	
	local delta = mouse.Hit.Position - mouse.Origin.Position
	cameraX = cameraX + (mouse.X - (camera.ViewportSize.X / 2)) * SENSITIVITY
	cameraY = math.clamp(cameraY + (mouse.Y - (camera.ViewportSize.Y / 2)) * SENSITIVITY, -math.pi/2, math.pi/2)
end)

-- Apply camera shake
local function cameraShake(intensity, duration)
	shakeAmount = intensity
	local startTime = tick()
	
	while tick() - startTime < duration do
		local progress = (tick() - startTime) / duration
		shakeAmount = intensity * (1 - progress)
		wait(0.01)
	end
	shakeAmount = 0
end

-- Main camera update loop
RunService.RenderStepped:Connect(function()
	if not character or not humanoidRootPart then return end
	
	-- Calculate camera rotation
	local rotation = CFrame.Angles(cameraY, cameraX, 0)
	local shakeOffset = Vector3.new(
		math.random(-100, 100) / 1000 * shakeAmount,
		math.random(-100, 100) / 1000 * shakeAmount,
		math.random(-100, 100) / 1000 * shakeAmount
	)
	
	-- Set camera position and rotation
	camera.CFrame = humanoidRootPart.CFrame * rotation * CFrame.new(0, 1.5, 0) + shakeOffset
	
	-- Rotate humanoid root part to match camera
	humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position) * rotation
end)

-- Expose camera shake function globally
script.Parent.CameraShake = cameraShake

print("Camera Controller loaded!")