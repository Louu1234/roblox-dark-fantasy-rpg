-- CHARACTER SETUP SCRIPT
-- Handles character initialization, humanoid setup
-- Place this in: StarterPlayer > StarterCharacterScripts > CharacterSetup (Script)

local character = script.Parent
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Set humanoid health
humanoid.MaxHealth = 100
humanoid.Health = 100

-- Disable default animations for custom control later
humanoid:WaitForChild("Animator")

print("Character spawned and ready!")