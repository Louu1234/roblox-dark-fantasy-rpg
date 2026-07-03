-- DAMAGE DISPLAY - LocalScript
-- Shows floating damage numbers when enemies take damage
-- Place this in: StarterPlayer > StarterPlayerScripts > DamageDisplay (LocalScript)

local Players = game:GetService("Players")
local Debris = game:GetService("Debris")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Damage indicator GUI
local function showDamage(position, amount, isHealing)
	local damageLabel = Instance.new("TextLabel")
	damageLabel.Name = "DamageNumber"
	damageLabel.Size = UDim2.new(0, 60, 0, 30)
	damageLabel.Position = UDim2.new(0, position.X, 0, position.Y)
	damageLabel.BackgroundTransparency = 1
	damageLabel.TextScaled = true
	damageLabel.Font = Enum.Font.GothamBold
	damageLabel.Text = tostring(amount)
	damageLabel.TextColor3 = isHealing and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 100, 100)
	damageLabel.Parent = playerGui
	
	-- Animate up and fade out
	local startTime = tick()
	local duration = 1
	
	while tick() - startTime < duration do
		local progress = (tick() - startTime) / duration
		damageLabel.Position = damageLabel.Position + UDim2.new(0, 0, 0, -1)
		damageLabel.TextTransparency = progress
		wait(0.016)
	end
	
	Debris:AddItem(damageLabel, 0)
end

print("Damage Display system loaded!")