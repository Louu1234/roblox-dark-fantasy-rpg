# STEP 1: FOUNDATION SETUP

## What You're Building
A working first-person camera system with smooth mouse look, player movement, and basic HUD.

## Roblox Studio Setup Instructions

### 1. Create Folder Structure
In **ServerScriptService**, create:
- `GameManager` (Script)

In **ReplicatedStorage**, create:
- `Modules` (Folder)
  - `Config` (ModuleScript)
  - `PlayerData` (ModuleScript)
  - `RemoteEvents` (Folder)

In **StarterPlayer > StarterCharacterScripts**, create:
- `CharacterSetup` (Script)

In **StarterPlayer > StarterPlayerScripts**, create:
- `CameraController` (LocalScript)
- `InputHandler` (LocalScript)
- `UIManager` (LocalScript)

### 2. Paste Code

**Copy and paste each file from `/src/` into the corresponding Roblox location:**

1. `src/ReplicatedStorage/Modules/Config.lua` → ReplicatedStorage > Modules > Config
2. `src/ReplicatedStorage/Modules/PlayerData.lua` → ReplicatedStorage > Modules > PlayerData
3. `src/StarterPlayer/StarterCharacterScripts/CharacterSetup.lua` → StarterPlayer > StarterCharacterScripts > CharacterSetup
4. `src/StarterPlayer/StarterPlayerScripts/CameraController.lua` → StarterPlayer > StarterPlayerScripts > CameraController
5. `src/StarterPlayer/StarterPlayerScripts/InputHandler.lua` → StarterPlayer > StarterPlayerScripts > InputHandler
6. `src/StarterPlayer/StarterPlayerScripts/UIManager.lua` → StarterPlayer > StarterPlayerScripts > UIManager
7. `src/ServerScriptService/GameManager.lua` → ServerScriptService > GameManager

### 3. Test
- Press **Play** in Roblox Studio
- You should see:
  - A white crosshair in center of screen
  - Green health bar (HP: 100/100)
  - Level and Gold displays
  - Smooth mouse look (move mouse to rotate camera)
  - WASD movement
  - Press Z to toggle mouse cursor

## What Works
✅ First-person camera with mouse look  
✅ Smooth camera movement  
✅ Player movement (WASD)  
✅ Basic HUD (Health, Level, Gold)  
✅ Crosshair  
✅ Mouse cursor toggle (Z key)  

## Next Step: Step 2 - Chapter 0 Arena
We'll create the Chapter 0 cave arena where the player fights the Betrayer.