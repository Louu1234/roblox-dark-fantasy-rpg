-- BETRAYER NPC - Model Building Script
-- Creates the Betrayer boss model in the arena
-- Place this in: ServerScriptService > BetrayerModelBuilder (Script)

local Workspace = game:GetService("Workspace")

local arena = Workspace:WaitForChild("Chapter0Arena")
local betrayerSpawn = arena:WaitForChild("BetrayerSpawn")

-- Create Betrayer Model
local betrayer = Instance.new("Model")
betrayer.Name = "Betrayer"
betrayer.Parent = arena

-- BODY
local body = Instance.new("Part")
body.Name = "Body"
body.Shape = Enum.PartType.Block
body.Size = Vector3.new(2, 3, 1)
body.CFrame = betrayerSpawn.CFrame + Vector3.new(0, 2, 0)
body.Material = Enum.Material.SmoothPlastic
body.BrickColor = BrickColor.new("Dark red")
body.CanCollide = true
body.Parent = betrayer

-- HEAD
local head = Instance.new("Part")
head.Name = "Head"
head.Shape = Enum.PartType.Ball
head.Size = Vector3.new(1.5, 1.5, 1.5)
head.CFrame = body.CFrame + Vector3.new(0, 2, 0)
head.Material = Enum.Material.SmoothPlastic
head.BrickColor = BrickColor.new("Dark red")
head.CanCollide = true
head.Parent = betrayer

-- LEFT ARM
local leftArm = Instance.new("Part")
leftArm.Name = "LeftArm"
leftArm.Shape = Enum.PartType.Block
leftArm.Size = Vector3.new(1, 2.5, 1)
leftArm.CFrame = body.CFrame + Vector3.new(-1.5, 1, 0)
leftArm.Material = Enum.Material.SmoothPlastic
leftArm.BrickColor = BrickColor.new("Dark red")
leftArm.CanCollide = true
leftArm.Parent = betrayer

-- RIGHT ARM (Weapon/Blade)
local rightArm = Instance.new("Part")
rightArm.Name = "RightArm"
rightArm.Shape = Enum.PartType.Block
rightArm.Size = Vector3.new(1, 2.5, 1)
rightArm.CFrame = body.CFrame + Vector3.new(1.5, 1, 0)
rightArm.Material = Enum.Material.SmoothPlastic
rightArm.BrickColor = BrickColor.new("Dark red")
rightArm.CanCollide = true
rightArm.Parent = betrayer

-- BLADE (on right arm)
local blade = Instance.new("Part")
blade.Name = "Blade"
blade.Shape = Enum.PartType.Block
blade.Size = Vector3.new(0.3, 3, 0.1)
blade.CFrame = rightArm.CFrame + Vector3.new(0.5, -1.5, 0)
blade.Material = Enum.Material.Neon
blade.BrickColor = BrickColor.new("Bright red")
blade.CanCollide = true
blade.Parent = betrayer

-- HUMANOID for the boss
local humanoid = Instance.new("Humanoid")
humanoid.Parent = betrayer
humanoid.MaxHealth = 500
humanoid.Health = 500

-- ROOT PART (for positioning)
local rootPart = Instance.new("Part")
rootPart.Name = "HumanoidRootPart"
rootPart.Shape = Enum.PartType.Block
rootPart.Size = Vector3.new(2, 2, 1)
rootPart.CFrame = body.CFrame
rootPart.Transparency = 1
rootPart.CanCollide = false
rootPart.Parent = betrayer

-- Weld parts together
local function weldParts(part0, part1)
	local weld = Instance.new("WeldConstraint")
	weld.Part0 = part0
	weld.Part1 = part1
	weld.Parent = part0
end

weldParts(rootPart, body)
weldParts(body, head)
weldParts(body, leftArm)
weldParts(body, rightArm)
weldParts(rightArm, blade)

print("Betrayer NPC spawned!")
print("Betrayer Health: " .. humanoid.Health)