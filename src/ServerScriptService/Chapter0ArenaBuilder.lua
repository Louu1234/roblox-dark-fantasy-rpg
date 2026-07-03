-- CHAPTER 0 ARENA BUILDER - Script
-- Creates the cave arena with warm orange fire-lit atmosphere
-- Place this in: ServerScriptService > Chapter0ArenaBuilder (Script)

local Workspace = game:GetService("Workspace")

-- Create arena folder
local arena = Instance.new("Folder")
arena.Name = "Chapter0Arena"
arena.Parent = Workspace

-- FLOOR
local floor = Instance.new("Part")
floor.Name = "CaveFloor"
floor.Shape = Enum.PartType.Block
floor.Size = Vector3.new(100, 1, 100)
floor.CFrame = CFrame.new(0, 0, 0)
floor.Material = Enum.Material.Rock
floor.BrickColor = BrickColor.new("Dark stone grey")
floor.CanCollide = true
floor.Parent = arena

-- BACK WALL
local backWall = Instance.new("Part")
backWall.Name = "BackWall"
backWall.Shape = Enum.PartType.Block
backWall.Size = Vector3.new(100, 40, 5)
backWall.CFrame = CFrame.new(0, 20, -50)
backWall.Material = Enum.Material.Rock
backWall.BrickColor = BrickColor.new("Dark stone grey")
backWall.CanCollide = true
backWall.Parent = arena

-- LEFT WALL
local leftWall = Instance.new("Part")
leftWall.Name = "LeftWall"
leftWall.Shape = Enum.PartType.Block
leftWall.Size = Vector3.new(5, 40, 100)
leftWall.CFrame = CFrame.new(-50, 20, 0)
leftWall.Material = Enum.Material.Rock
leftWall.BrickColor = BrickColor.new("Dark stone grey")
leftWall.CanCollide = true
leftWall.Parent = arena

-- RIGHT WALL
local rightWall = Instance.new("Part")
rightWall.Name = "RightWall"
rightWall.Shape = Enum.PartType.Block
rightWall.Size = Vector3.new(5, 40, 100)
rightWall.CFrame = CFrame.new(50, 20, 0)
rightWall.Material = Enum.Material.Rock
rightWall.BrickColor = BrickColor.new("Dark stone grey")
rightWall.CanCollide = true
rightWall.Parent = arena

-- CEILING
local ceiling = Instance.new("Part")
ceiling.Name = "CaveCeiling"
ceiling.Shape = Enum.PartType.Block
ceiling.Size = Vector3.new(100, 2, 100)
ceiling.CFrame = CFrame.new(0, 40, 0)
ceiling.Material = Enum.Material.Rock
ceiling.BrickColor = BrickColor.new("Dark stone grey")
ceiling.CanCollide = true
ceiling.Parent = arena

-- TORCH FIRE LIGHT 1 (Left side)
local light1 = Instance.new("Part")
light1.Name = "TorchFire1"
light1.Shape = Enum.PartType.Block
light1.Size = Vector3.new(1, 1, 1)
light1.CFrame = CFrame.new(-30, 25, -40)
light1.Material = Enum.Material.Neon
light1.BrickColor = BrickColor.new("Bright orange")
light1.CanCollide = false
light1.Parent = arena

local pointLight1 = Instance.new("PointLight")
pointLight1.Color = Color3.fromRGB(255, 150, 50)
pointLight1.Brightness = 3
pointLight1.Range = 40
pointLight1.Parent = light1

-- TORCH FIRE LIGHT 2 (Right side)
local light2 = Instance.new("Part")
light2.Name = "TorchFire2"
light2.Shape = Enum.PartType.Block
light2.Size = Vector3.new(1, 1, 1)
light2.CFrame = CFrame.new(30, 25, -40)
light2.Material = Enum.Material.Neon
light2.BrickColor = BrickColor.new("Bright orange")
light2.CanCollide = false
light2.Parent = arena

local pointLight2 = Instance.new("PointLight")
pointLight2.Color = Color3.fromRGB(255, 150, 50)
pointLight2.Brightness = 3
pointLight2.Range = 40
pointLight2.Parent = light2

-- TORCH FIRE LIGHT 3 (Center back)
local light3 = Instance.new("Part")
light3.Name = "TorchFire3"
light3.Shape = Enum.PartType.Block
light3.Size = Vector3.new(1, 1, 1)
light3.CFrame = CFrame.new(0, 30, -45)
light3.Material = Enum.Material.Neon
light3.BrickColor = BrickColor.new("Bright orange")
light3.CanCollide = false
light3.Parent = arena

local pointLight3 = Instance.new("PointLight")
pointLight3.Color = Color3.fromRGB(255, 150, 50)
pointLight3.Brightness = 4
pointLight3.Range = 50
pointLight3.Parent = light3

-- SET LIGHTING
local lighting = game:GetService("Lighting")
lighting.Ambient = Color3.fromRGB(100, 70, 40) -- Warm orange tint
lighting.OutdoorAmbient = Color3.fromRGB(100, 70, 40)

-- PLAYER SPAWN LOCATION
local playerSpawnPart = Instance.new("Part")
playerSpawnPart.Name = "PlayerSpawn"
playerSpawnPart.Shape = Enum.PartType.Block
playerSpawnPart.Size = Vector3.new(5, 1, 5)
playerSpawnPart.CFrame = CFrame.new(0, 1, 20)
playerSpawnPart.Material = Enum.Material.Rock
playerSpawnPart.BrickColor = BrickColor.new("Dark stone grey")
playerSpawnPart.CanCollide = false
playerSpawnPart.Transparency = 0.5
playerSpawnPart.Parent = arena

-- BETRAYER SPAWN LOCATION
local betrayerSpawnPart = Instance.new("Part")
betrayerSpawnPart.Name = "BetrayerSpawn"
betrayerSpawnPart.Shape = Enum.PartType.Block
betrayerSpawnPart.Size = Vector3.new(5, 1, 5)
betrayerSpawnPart.CFrame = CFrame.new(0, 1, -30)
betrayerSpawnPart.Material = Enum.Material.Rock
betrayerSpawnPart.BrickColor = BrickColor.new("Dark stone grey")
betrayerSpawnPart.CanCollide = false
betrayerSpawnPart.Transparency = 0.5
betrayerSpawnPart.Parent = arena

print("Chapter 0 Arena created!")
print("Player spawn at: " .. tostring(playerSpawnPart.Position))
print("Betrayer spawn at: " .. tostring(betrayerSpawnPart.Position))