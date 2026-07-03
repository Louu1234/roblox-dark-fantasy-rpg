-- GAME STATE MANAGER - ModuleScript
-- Manages game state, chapters, and progression
-- Place this in: ReplicatedStorage > Modules > GameStateManager (ModuleScript)

local GameStateManager = {}
GameStateManager.__index = GameStateManager

function GameStateManager.new()
	local self = setmetatable({}, GameStateManager)
	
	self.currentChapter = 0
	self.gameState = "IN_GAME" -- IN_GAME, DIALOGUE, BOSS_FIGHT, DEFEAT, VICTORY, REGRESSION
	self.playerDefeated = false
	self.regressionTriggered = false
	
	return self
end

function GameStateManager:SetGameState(newState)
	self.gameState = newState
	print("Game State: " .. newState)
end

function GameStateManager:GetGameState()
	return self.gameState
end

function GameStateManager:StartChapter(chapterNumber)
	self.currentChapter = chapterNumber
	self:SetGameState("DIALOGUE")
	print("Chapter " .. chapterNumber .. " started!")
end

function GameStateManager:PlayerDefeated()
	self.playerDefeated = true
	self:SetGameState("DEFEAT")
	print("Player defeated!")
end

function GameStateManager:TriggerRegression()
	self.regressionTriggered = true
	self:SetGameState("REGRESSION")
	print("Regression triggered! Resetting to past...")
end

function GameStateManager:ProgressToNextChapter()
	self.currentChapter = self.currentChapter + 1
	self:StartChapter(self.currentChapter)
end

return GameStateManager