# STEP 5: MONSTER CORPSE & LOOT SYSTEM COMPLETE

## What You're Building
Monster corpse spawning, pickup mechanics, and selling corpses for gold.

## Roblox Studio Setup Instructions

### 1. Create Additional Scripts/Modules

In **ServerScriptService**, create:
- `CorpseSpawnOnDeath` (Script) - Spawns corpse when enemy dies

In **ReplicatedStorage > Modules**, create:
- `CorpseSystem` (ModuleScript) - Corpse creation and management
- `ExtendedShopSystem` (ModuleScript) - Updated shop with corpse selling

In **StarterPlayer > StarterPlayerScripts**, create:
- `CorpsePickupHandler` (LocalScript) - E key pickup mechanic
- `LootManager` (LocalScript) - Shows loot pickup prompts

### 2. Paste Code

**Copy from `/src/` into Roblox:**

1. `src/ServerScriptService/CorpseSpawnOnDeath.lua` → ServerScriptService > CorpseSpawnOnDeath
2. `src/ReplicatedStorage/Modules/CorpseSystem.lua` → ReplicatedStorage > Modules > CorpseSystem
3. `src/ReplicatedStorage/Modules/ExtendedShopSystem.lua` → ReplicatedStorage > Modules > ExtendedShopSystem
4. `src/StarterPlayer/StarterPlayerScripts/CorpsePickupHandler.lua` → StarterPlayer > StarterPlayerScripts > CorpsePickupHandler
5. `src/StarterPlayer/StarterPlayerScripts/LootManager.lua` → StarterPlayer > StarterPlayerScripts > LootManager

### 3. Test
- Press **Play**
- When an enemy dies, a corpse model will spawn at their location
- Walk within 20 studs of corpse to see **"Press E to pickup corpse"** prompt
- Press **E** to pickup corpse (adds to inventory)
- Open menu (Tab) and go to **Shop** tab
- Corpses can be sold for gold:
  - Goblin Corpse: 50 gold
  - Orc Corpse: 75 gold
  - Skeleton Corpse: 60 gold
  - Demon Corpse: 150 gold

## What Works

✅ Corpse spawns on enemy death  
✅ Corpse pickup (E key)  
✅ Corpse inventory tracking  
✅ Loot prompts show within 20 studs  
✅ Sell corpses to shop for gold  
✅ Different corpse values by type  
✅ Corpse disappears after 5 minutes  
✅ Corpse model visualization (semi-transparent pickup part)  

## Known TODOs

⏳ Connect shop sell buttons to actually trigger sale  
⏳ Real-time inventory UI updates when picking up corpses  
⏳ Corpse highlight/glow effect when near  
⏳ Audio feedback on pickup  

## Next Step: Step 6 - Chapter 0 Scripted Fight & Regression
We'll script the Betrayer boss fight, force player defeat, and trigger Regression skill.