local Players = game:GetService(“Players”)
local UserInputService = game:GetService(“UserInputService”)
local TweenService = game:GetService(“TweenService”)

local player = Players.LocalPlayer
if not player then
return
end

local playerGui = player:FindFirstChildOfClass(“PlayerGui”)
if not playerGui then
return
end

if playerGui:FindFirstChild(“AppleHubPvP”) then
playerGui:FindFirstChild(“AppleHubPvP”):Destroy()
end

local screenGui = Instance.new(“ScreenGui”)
screenGui.Name = “AppleHubPvP”
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

if gethui then
screenGui.Parent = gethui()
elseif syn and syn.protect_gui then
syn.protect_gui(screenGui)
screenGui.Parent = playerGui
else
screenGui.Parent = playerGui
end

local mainFrame = Instance.new(“Frame”)
mainFrame.Name = “MainFrame”
mainFrame.Size = UDim2.new(0, 800, 0, 400)
mainFrame.Position = UDim2.new(0.5, -400, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Parent = screenGui

local corner = Instance.new(“UICorner”)
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

local borderFrame = Instance.new(“Frame”)
borderFrame.Name = “BorderFrame”
borderFrame.Size = UDim2.new(1, 4, 1, 4)
borderFrame.Position = UDim2.new(0, -2, 0, -2)
borderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
borderFrame.BorderSizePixel = 0
borderFrame.ZIndex = 0
borderFrame.Parent = mainFrame

local borderCorner = Instance.new(“UICorner”)
borderCorner.CornerRadius = UDim.new(0, 14)
borderCorner.Parent = borderFrame

local borderGradient = Instance.new(“UIGradient”)
borderGradient.Color = ColorSequence.new{
ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 100, 200)),
ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 150, 255)),
ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 100, 255))
}
borderGradient.Rotation = 45
borderGradient.Parent = borderFrame

mainFrame.ZIndex = 1

local titleBar = Instance.new(“Frame”)
titleBar.Size = UDim2.new(1, 0, 0, 50)
titleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
titleBar.BorderSizePixel = 0
titleBar.ZIndex = 2
titleBar.Parent = mainFrame

local titleCorner = Instance.new(“UICorner”)
titleCorner.CornerRadius = UDim.new(0, 12)
titleCorner.Parent = titleBar

local titleCover = Instance.new(“Frame”)
titleCover.Size = UDim2.new(1, 0, 0, 12)
titleCover.Position = UDim2.new(0, 0, 1, -12)
titleCover.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
titleCover.BorderSizePixel = 0
titleCover.ZIndex = 2
titleCover.Parent = titleBar

local titleLabel = Instance.new(“TextLabel”)
titleLabel.Size = UDim2.new(1, -100, 1, 0)
titleLabel.Position = UDim2.new(0, 20, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = “Apple Hub PvP | discord.gg/applehub”
titleLabel.TextColor3 = Color3.fromRGB(100, 180, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 20
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.ZIndex = 3
titleLabel.Parent = titleBar

local closeButton = Instance.new(“TextButton”)
closeButton.Size = UDim2.new(0, 40, 0, 40)
closeButton.Position = UDim2.new(1, -50, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
closeButton.Text = “X”
closeButton.TextColor3 = Color3.fromRGB(255, 80, 80)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 18
closeButton.ZIndex = 3
closeButton.Parent = titleBar

local closeCorner = Instance.new(“UICorner”)
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeButton

closeButton.MouseButton1Click:Connect(function()
screenGui:Destroy()
end)

local contentFrame = Instance.new(“Frame”)
contentFrame.Size = UDim2.new(1, -40, 1, -70)
contentFrame.Position = UDim2.new(0, 20, 0, 60)
contentFrame.BackgroundTransparency = 1
contentFrame.ZIndex = 2
contentFrame.Parent = mainFrame

local function createToggle(name, position, defaultState)
local toggleFrame = Instance.new(“Frame”)
toggleFrame.Size = UDim2.new(0, 360, 0, 50)
toggleFrame.Position = position
toggleFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
toggleFrame.BorderSizePixel = 0
toggleFrame.ZIndex = 3
toggleFrame.Parent = contentFrame

```
local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 8)
toggleCorner.Parent = toggleFrame

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, -70, 1, 0)
label.Position = UDim2.new(0, 15, 0, 0)
label.BackgroundTransparency = 1
label.Text = name
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.Font = Enum.Font.Gotham
label.TextSize = 14
label.TextXAlignment = Enum.TextXAlignment.Left
label.ZIndex = 4
label.Parent = toggleFrame

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 50, 0, 30)
toggleButton.Position = UDim2.new(1, -60, 0.5, -15)
toggleButton.BackgroundColor3 = defaultState and Color3.fromRGB(255, 200, 50) or Color3.fromRGB(60, 60, 70)
toggleButton.Text = ""
toggleButton.ZIndex = 4
toggleButton.Parent = toggleFrame

local toggleCorner2 = Instance.new("UICorner")
toggleCorner2.CornerRadius = UDim.new(1, 0)
toggleCorner2.Parent = toggleButton

local indicator = Instance.new("Frame")
indicator.Size = UDim2.new(0, 24, 0, 24)
indicator.Position = defaultState and UDim2.new(1, -27, 0.5, -12) or UDim2.new(0, 3, 0.5, -12)
indicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
indicator.BorderSizePixel = 0
indicator.ZIndex = 5
indicator.Parent = toggleButton

local indicatorCorner = Instance.new("UICorner")
indicatorCorner.CornerRadius = UDim.new(1, 0)
indicatorCorner.Parent = indicator

local state = defaultState

toggleButton.MouseButton1Click:Connect(function()
    state = not state
    toggleButton.BackgroundColor3 = state and Color3.fromRGB(255, 200, 50) or Color3.fromRGB(60, 60, 70)
    
    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local goal = {Position = state and UDim2.new(1, -27, 0.5, -12) or UDim2.new(0, 3, 0.5, -12)}
    local tween = TweenService:Create(indicator, tweenInfo, goal)
    tween:Play()
end)

return toggleFrame
```

end

local function createButton(name, position)
local button = Instance.new(“TextButton”)
button.Size = UDim2.new(0, 360, 0, 50)
button.Position = position
button.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
button.BorderColor3 = Color3.fromRGB(255, 200, 50)
button.BorderSizePixel = 2
button.Text = name
button.TextColor3 = Color3.fromRGB(255, 200, 50)
button.Font = Enum.Font.GothamBold
button.TextSize = 14
button.ZIndex = 3
button.Parent = contentFrame

```
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 8)
buttonCorner.Parent = button

return button
```

end

createToggle(“BOOSTER”, UDim2.new(0, 0, 0, 0), false)
createToggle(“ANTI RAGDOLL”, UDim2.new(0, 0, 0, 60), false)
createToggle(“HITBOX EXPANDER”, UDim2.new(0, 0, 0, 120), false)
createToggle(“HIT WHILE STEALING”, UDim2.new(0, 0, 0, 180), false)

createToggle(“AUTO FIRE LASER CAPE”, UDim2.new(0, 400, 0, 0), false)
createToggle(“PAINTBALL WHILE STEALING”, UDim2.new(0, 400, 0, 60), false)
createToggle(“AUTO STEAL”, UDim2.new(0, 400, 0, 120), true)

createButton(“TELEPORT 1”, UDim2.new(0, 0, 0, 250))
createButton(“TELEPORT 2”, UDim2.new(0, 0, 0, 310))

local dragging = false
local dragInput
local dragStart
local startPos

local function update(input)
local delta = input.Position - dragStart
mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

titleBar.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
dragging = true
dragStart = input.Position
startPos = mainFrame.Position

```
    input.Changed:Connect(function()
        if input.UserInputState == Enum.UserInputState.End then
            dragging = false
        end
    end)
end
```

end)

titleBar.InputChanged:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
dragInput = input
end
end)

UserInputService.InputChanged:Connect(function(input)
if input == dragInput and dragging then
update(input)
end
end)

wait(0.5)
game:GetService(“StarterGui”):SetCore(“SendNotification”, {
Title = “Apple Hub PvP”;
Text = “Loaded successfully!”;
Duration = 3;
})
