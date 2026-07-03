-- DIALOGUE SYSTEM - ModuleScript
-- Manages dialogue flow with Next and Skip buttons
-- Place this in: ReplicatedStorage > Modules > DialogueSystem (ModuleScript)

local DialogueSystem = {}
DialogueSystem.__index = DialogueSystem

function DialogueSystem.new()
	local self = setmetatable({}, DialogueSystem)
	
	self.isDialogueActive = false
	self.currentDialogueIndex = 0
	self.dialogueQueue = {}
	
	return self
end

function DialogueSystem:SetDialogue(dialogueTable)
	self.dialogueQueue = dialogueTable or {}
	self.currentDialogueIndex = 0
	self.isDialogueActive = true
end

function DialogueSystem:NextDialogue()
	if not self.isDialogueActive then return end
	
	self.currentDialogueIndex = self.currentDialogueIndex + 1
	
	if self.currentDialogueIndex > #self.dialogueQueue then
		self:EndDialogue()
	end
	
	return self.dialogueQueue[self.currentDialogueIndex]
end

function DialogueSystem:SkipDialogue()
	self:EndDialogue()
end

function DialogueSystem:EndDialogue()
	self.isDialogueActive = false
	self.currentDialogueIndex = 0
	self.dialogueQueue = {}
end

function DialogueSystem:GetCurrentDialogue()
	return self.dialogueQueue[self.currentDialogueIndex]
end

return DialogueSystem