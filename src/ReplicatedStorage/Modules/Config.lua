-- CONFIG MODULE
-- Central configuration for game settings

local Config = {}

-- CAMERA SETTINGS
Config.Camera = {
	Sensitivity = 0.003,
	ShakeIntensity = 0.05,
	ShakeDuration = 0.1,
	FOV = 80,
}

-- PLAYER SETTINGS
Config.Player = {
	StartHealth = 100,
	StartMana = 50,
	StartStamina = 100,
	StartLevel = 1,
	StartExp = 0,
	StartGold = 0,
}

-- STATS SETTINGS
Config.Stats = {
	Strength = 5,
	Vitality = 5,
	Intelligence = 5,
	Agility = 5,
	Endurance = 5,
}

-- CHAPTER SETTINGS
Config.Chapter = {
	StartChapter = 0, -- Starts in Chapter 0 (Tutorial/Betrayer fight)
}

-- INPUT SETTINGS
Config.Input = {
	ToggleCursorKey = Enum.KeyCode.Z,
	NextDialogueKeys = {Enum.KeyCode.Space, Enum.KeyCode.Return},
	SkipDialogueKey = Enum.KeyCode.Escape,
	ForwardKey = Enum.KeyCode.W,
	BackwardKey = Enum.KeyCode.S,
	LeftKey = Enum.KeyCode.A,
	RightKey = Enum.KeyCode.D,
	JumpKey = Enum.KeyCode.Space,
}

return Config