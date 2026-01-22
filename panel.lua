local Players = game:GetService(“Players”)
local RunService = game:GetService(“RunService”)
local TweenService = game:GetService(“TweenService”)
local UserInputService = game:GetService(“UserInputService”)
local player = Players.LocalPlayer

– ================= SPEED BOOSTER VARIABLES =================
local targetSpeed = 28.5
local fastBoostSpeed = 60
local speedEnabled = false
local fastBoostEnabled = false
local speedConnection

local function enableSpeedBypass()
if speedConnection then speedConnection:Disconnect() end

```
speedConnection = RunService.Stepped:Connect(function()
    if not speedEnabled and not fastBoostEnabled then return end
    
    local character = player.Character
    if not character then return end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    
    if humanoid and rootPart then
        local state = humanoid:GetState()
        if state ~= Enum.HumanoidStateType.Seated and state ~= Enum.HumanoidStateType.Dead then
            local moveDirection = humanoid.MoveDirection
            if moveDirection.Magnitude > 0 then
                local currentSpeed = fastBoostEnabled and fastBoostSpeed or targetSpeed
                rootPart.Velocity = Vector3.new(
                    moveDirection.X * currentSpeed,
                    rootPart.Velocity.Y,
                    moveDirection.Z * currentSpeed
                )
            end
        end
    end
end)
```

end

local function disableSpeedBypass()
if speedConnection then
speedConnection:Disconnect()
speedConnection = nil
end
end

player.CharacterAdded:Connect(function()
if speedEnabled or fastBoostEnabled then
task.wait(0.5)
enableSpeedBypass()
end
end)

– ================= ScreenGui =================
local gui = Instance.new(“ScreenGui”)
gui.Name = “AppleHubPvPUI”
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild(“PlayerGui”)

– ================= MAIN PANEL =================
local mainPanel = Instance.new(“Frame”)
mainPanel.Name = “MainPanel”
mainPanel.Size = UDim2.new(0, 600, 0, 500)
mainPanel.Position = UDim2.new(0.5, -300, 0.5, -250)
mainPanel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
mainPanel.BackgroundTransparency = 0.05
mainPanel.BorderSizePixel = 0
mainPanel.ZIndex = 10
mainPanel.Parent = gui

local panelCorner = Instance.new(“UICorner”)
panelCorner.CornerRadius = UDim.new(0, 12)
panelCorner.Parent = mainPanel

local panelStroke = Instance.new(“UIStroke”)
panelStroke.Thickness = 2.5
panelStroke.Color = Color3.fromRGB(255, 0, 0)
panelStroke.Parent = mainPanel

local panelGrad = Instance.new(“UIGradient”)
panelGrad.Parent = panelStroke
panelGrad.Color = ColorSequence.new{
ColorSequenceKeypoint.new(0, Color3.fromRGB(0,0,0)),
ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255,0,0)),
ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0,0,0)),
ColorSequenceKeypoint.new(0.8, Color3.fromRGB(255,0,0)),
ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))
}

local panelGlow = Instance.new(“UIStroke”)
panelGlow.Thickness = 10
panelGlow.Color = Color3.fromRGB(255, 60, 60)
panelGlow.Transparency = 0.65
panelGlow.Parent = mainPanel

RunService.RenderStepped:Connect(function()
panelGrad.Rotation = (tick()*100)%360
end)

– ================= TITLE BAR =================
local titleBar = Instance.new(“Frame”)
titleBar.Size = UDim2.new(1, 0, 0, 45)
titleBar.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
titleBar.BackgroundTransparency = 0.3
titleBar.BorderSizePixel = 0
titleBar.ZIndex = 11
titleBar.Parent = mainPanel

local titleCorner = Instance.new(“UICorner”)
titleCorner.CornerRadius = UDim.new(0, 12)
titleCorner.Parent = titleBar

local titleLabel = Instance.new(“TextLabel”)
titleLabel.Size = UDim2.new(1, -40, 1, 0)
titleLabel.Position = UDim2.new(0, 15, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = “Apple Hub | PvP | discord.gg/applehub”
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 16
titleLabel.TextColor3 = Color3.fromRGB(200, 100, 150)
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.TextScaled = false
titleLabel.ZIndex = 12
titleLabel.Parent = titleBar

local titleGrad = Instance.new(“UIGradient”)
titleGrad.Parent = titleLabel
titleGrad.Color = ColorSequence.new{
ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 100)),
ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 100, 200)),
ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 100))
}

– Close Button
local closeBtn = Instance.new(“TextButton”)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 7)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = “X”
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 20
closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
closeBtn.ZIndex = 12
closeBtn.Parent = titleBar

closeBtn.MouseButton1Click:Connect(function()
TweenService:Create(mainPanel, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
Size = UDim2.new(0, 0, 0, 0)
}):Play()
task.wait(0.3)
mainPanel.Visible = false
end)

– ================= CONTENT AREA =================
local contentArea = Instance.new(“Frame”)
contentArea.Size = UDim2.new(1, -20, 1, -65)
contentArea.Position = UDim2.new(0, 10, 0, 55)
contentArea.BackgroundTransparency = 1
contentArea.ZIndex = 11
contentArea.Parent = mainPanel

– ================= SPEED BOOSTER SECTION =================
local speedSection = Instance.new(“Frame”)
speedSection.Size = UDim2.new(1, 0, 0, 200)
speedSection.Position = UDim2.new(0, 0, 0, 0)
speedSection.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
speedSection.BorderSizePixel = 0
speedSection.ZIndex = 12
speedSection.Parent = contentArea

local speedSectionCorner = Instance.new(“UICorner”)
speedSectionCorner.CornerRadius = UDim.new(0, 8)
speedSectionCorner.Parent = speedSection

local speedSectionStroke = Instance.new(“UIStroke”)
speedSectionStroke.Thickness = 1
speedSectionStroke.Color = Color3.fromRGB(255, 60, 60)
speedSectionStroke.Parent = speedSection

– Speed Booster Title
local speedTitle = Instance.new(“TextLabel”)
speedTitle.Size = UDim2.new(1, -20, 0, 30)
speedTitle.Position = UDim2.new(0, 10, 0, 10)
speedTitle.BackgroundTransparency = 1
speedTitle.Text = “🍎 Speed Booster”
speedTitle.Font = Enum.Font.GothamBold
speedTitle.TextSize = 16
speedTitle.TextColor3 = Color3.fromRGB(255, 60, 60)
speedTitle.TextXAlignment = Enum.TextXAlignment.Left
speedTitle.ZIndex = 13
speedTitle.Parent = speedSection

– Speed Toggle
local speedToggleLabel = Instance.new(“TextLabel”)
speedToggleLabel.Size = UDim2.new(1, -20, 0, 25)
speedToggleLabel.Position = UDim2.new(0, 10, 0, 50)
speedToggleLabel.BackgroundTransparency = 1
speedToggleLabel.Text = “Speed Booster”
speedToggleLabel.Font = Enum.Font.GothamBold
speedToggleLabel.TextSize = 14
speedToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
speedToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
speedToggleLabel.ZIndex = 13
speedToggleLabel.Parent = speedSection

local toggleSwitch = Instance.new(“Frame”)
toggleSwitch.Size = UDim2.new(0, 50, 0, 25)
toggleSwitch.Position = UDim2.new(1, -60, 0, 0)
toggleSwitch.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
toggleSwitch.BorderSizePixel = 0
toggleSwitch.ZIndex = 13
toggleSwitch.Parent = speedToggleLabel

local toggleCorner = Instance.new(“UICorner”)
toggleCorner.CornerRadius = UDim.new(0, 12)
toggleCorner.Parent = toggleSwitch

local toggleButton = Instance.new(“Frame”)
toggleButton.Size = UDim2.new(0, 21, 0, 21)
toggleButton.Position = UDim2.new(0, 2, 0.5, -10.5)
toggleButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
toggleButton.BorderSizePixel = 0
toggleButton.ZIndex = 14
toggleButton.Parent = toggleSwitch

local toggleButtonCorner = Instance.new(“UICorner”)
toggleButtonCorner.CornerRadius = UDim.new(1, 0)
toggleButtonCorner.Parent = toggleButton

– Fast Boost Toggle
local fastBoostLabel = Instance.new(“TextLabel”)
fastBoostLabel.Size = UDim2.new(1, -20, 0, 25)
fastBoostLabel.Position = UDim2.new(0, 10, 0, 85)
fastBoostLabel.BackgroundTransparency = 1
fastBoostLabel.Text = “Fast Boost”
fastBoostLabel.Font = Enum.Font.GothamBold
fastBoostLabel.TextSize = 14
fastBoostLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
fastBoostLabel.TextXAlignment = Enum.TextXAlignment.Left
fastBoostLabel.ZIndex = 13
fastBoostLabel.Parent = speedSection

local fastToggleSwitch = Instance.new(“Frame”)
fastToggleSwitch.Size = UDim2.new(0, 50, 0, 25)
fastToggleSwitch.Position = UDim2.new(1, -60, 0, 0)
fastToggleSwitch.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
fastToggleSwitch.BorderSizePixel = 0
fastToggleSwitch.ZIndex = 13
fastToggleSwitch.Parent = fastBoostLabel

local fastToggleCorner = Instance.new(“UICorner”)
fastToggleCorner.CornerRadius = UDim.new(0, 12)
fastToggleCorner.Parent = fastToggleSwitch

local fastToggleButton = Instance.new(“Frame”)
fastToggleButton.Size = UDim2.new(0, 21, 0, 21)
fastToggleButton.Position = UDim2.new(0, 2, 0.5, -10.5)
fastToggleButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
fastToggleButton.BorderSizePixel = 0
fastToggleButton.ZIndex = 14
fastToggleButton.Parent = fastToggleSwitch

local fastToggleButtonCorner = Instance.new(“UICorner”)
fastToggleButtonCorner.CornerRadius = UDim.new(1, 0)
fastToggleButtonCorner.Parent = fastToggleButton

– Speed Input
local speedInputLabel = Instance.new(“TextLabel”)
speedInputLabel.Size = UDim2.new(1, -20, 0, 20)
speedInputLabel.Position = UDim2.new(0, 10, 0, 120)
speedInputLabel.BackgroundTransparency = 1
speedInputLabel.Text = “Speed Value”
speedInputLabel.Font = Enum.Font.GothamBold
speedInputLabel.TextSize = 13
speedInputLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
speedInputLabel.TextXAlignment = Enum.TextXAlignment.Left
speedInputLabel.ZIndex = 13
speedInputLabel.Parent = speedSection

local speedInput = Instance.new(“TextBox”)
speedInput.Size = UDim2.new(1, -20, 0, 30)
speedInput.Position = UDim2.new(0, 10, 0, 145)
speedInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
speedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
speedInput.PlaceholderText = tostring(targetSpeed)
speedInput.Text = tostring(targetSpeed)
speedInput.Font = Enum.Font.GothamBold
speedInput.TextSize = 12
speedInput.BorderSizePixel = 0
speedInput.ZIndex = 13
speedInput.Parent = speedSection

local speedInputCorner = Instance.new(“UICorner”)
speedInputCorner.CornerRadius = UDim.new(0, 7)
speedInputCorner.Parent = speedInput

local speedInputStroke = Instance.new(“UIStroke”)
speedInputStroke.Thickness = 1
speedInputStroke.Color = Color3.fromRGB(255, 60, 60)
speedInputStroke.Parent = speedInput

speedInput.FocusLost:Connect(function(enterPressed)
if enterPressed then
local newSpeed = tonumber(speedInput.Text)
if newSpeed and newSpeed > 0 and newSpeed <= 200 then
targetSpeed = newSpeed
speedInput.PlaceholderText = tostring(targetSpeed)
else
speedInput.Text = tostring(targetSpeed)
end
end
end)

– ================= TOGGLE FUNCTIONS =================
local function updateToggle()
if speedEnabled then
TweenService:Create(toggleSwitch, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0, 200, 0)}):Play()
TweenService:Create(toggleButton, TweenInfo.new(0.3), {Position = UDim2.new(0, 27, 0.5, -10.5)}):Play()
enableSpeedBypass()
else
TweenService:Create(toggleSwitch, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
TweenService:Create(toggleButton, TweenInfo.new(0.3), {Position = UDim2.new(0, 2, 0.5, -10.5)}):Play()
if not fastBoostEnabled then
disableSpeedBypass()
end
end
end

local function updateFastBoostToggle()
if fastBoostEnabled then
TweenService:Create(fastToggleSwitch, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(255, 140, 0)}):Play()
TweenService:Create(fastToggleButton, TweenInfo.new(0.3), {Position = UDim2.new(0, 27, 0.5, -10.5)}):Play()
enableSpeedBypass()
else
TweenService:Create(fastToggleSwitch, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
TweenService:Create(fastToggleButton, TweenInfo.new(0.3), {Position = UDim2.new(0, 2, 0.5, -10.5)}):Play()
if not speedEnabled then
disableSpeedBypass()
end
end
end

toggleSwitch.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
speedEnabled = not speedEnabled
if speedEnabled and fastBoostEnabled then
fastBoostEnabled = false
updateFastBoostToggle()
end
updateToggle()
end
end)

fastToggleSwitch.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
fastBoostEnabled = not fastBoostEnabled
if fastBoostEnabled and speedEnabled then
speedEnabled = false
updateToggle()
end
updateFastBoostToggle()
end
end)

– ================= DRAG FUNCTIONALITY =================
local dragging = false
local dragStart = nil
local startPos = nil

titleBar.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
dragging = true
dragStart = input.Position
startPos = mainPanel.Position
end
end)

titleBar.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
dragging = false
end
end)

UserInputService.InputChanged:Connect(function(input)
if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
local delta = input.Position - dragStart
mainPanel.Position = UDim2.new(
startPos.X.Scale,
startPos.X.Offset + delta.X,
startPos.Y.Scale,
startPos.Y.Offset + delta.Y
)
end
end)
