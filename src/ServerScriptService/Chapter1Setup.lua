-- CHAPTER 1 SETUP - Script
-- Sets up Chapter 1 arena (where player wakes after regression)
-- Place this in: ServerScriptService > Chapter1Setup (Script)

local Workspace = game:GetService("Workspace")

-- Create Chapter 1 arena folder
local chapter1Arena = Instance.new("Folder")
chapter1Arena.Name = "Chapter1Arena"
chapter1Arena.Parent = Workspace

-- FLOOR
local floor = Instance.new("Part")
floor.Name = "Floor"
floor.Shape = Enum.PartType.Block
floor.Size = Vector3.new(100, 1, 100)
floor.CFrame = CFrame.new(0, -5, 0)
floor.Material = Enum.Material.Grass
floor.BrickColor = BrickColor.new("Dark green")
floor.CanCollide = true
floor.Parent = chapter1Arena

-- SPAWN POINT
local spawnPart = Instance.new("Part")
spawnPart.Name = "Chapter1Spawn"
spawnPart.Shape = Enum.PartType.Block
spawnPart.Size = Vector3.new(5, 1, 5)
spawnPart.CFrame = CFrame.new(0, 0, 0)
spawnPart.Material = Enum.Material.Grass
spawnPart.BrickColor = BrickColor.new("Dark green")
spawnPart.CanCollide = false
spawnPart.Transparency = 0.5
spawnPart.Parent = chapter1Arena

-- LIGHTING (bright, outdoor)
local lighting = game:GetService("Lighting")
lighting.Ambient = Color3.fromRGB(200, 200, 200)
lighting.OutdoorAmbient = Color3.fromRGB(200, 200, 200)

print("Chapter 1 Arena created!")