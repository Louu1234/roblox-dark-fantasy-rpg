# Roblox Dark Fantasy RPG - Studio Setup Guide

## Project Structure

```
StarterPlayer
├── StarterCharacterScripts
│   └── CharacterSetup (Script)
├── StarterPlayerScripts
│   ├── CameraController (LocalScript)
│   ├── InputHandler (LocalScript)
│   └── UIManager (LocalScript)
├── StarterGui
│   └── HUD (ScreenGui)
│       ├── HealthBar (Frame)
│       ├── Crosshair (Frame)
│       └── DialogueBox (Frame)

ServerScriptService
├── GameManager (Script)

ReplicatedStorage
├── Modules
│   ├── Config (ModuleScript)
│   ├── PlayerData (ModuleScript)
│   └── SkillManager (ModuleScript)
├── RemoteEvents
│   ├── CombatEvents (RemoteEvent)
│   └── DialogueEvents (RemoteEvent)

Workspace
├── Chapter0Arena (Folder)
│   ├── Arena (Model)
│   └── BetrayerSpawner (Spawner)
```

## Installation Steps

1. Create all folders as shown above
2. Place scripts in their respective locations
3. Configure ReplicatedStorage modules
4. Set up UI in StarterGui
5. Test in-game with Play button

## Next: Step 1 - Foundation (Player & Camera)
