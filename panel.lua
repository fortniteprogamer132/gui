– Roblox Game GUI Script
local player = game.Players.LocalPlayer
local screenGui = Instance.new(“ScreenGui”)
screenGui.Name = “GameMenuGui”
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild(“PlayerGui”)

– Main Frame
local mainFrame = Instance.new(“Frame”)
mainFrame.Size = UDim2.new(0, 600, 0, 450)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -225)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.fromRGB(200, 0, 0)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

– Title Bar
local titleBar = Instance.new(“Frame”)
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
titleBar.BorderSizePixel = 1
titleBar.BorderColor3 = Color3.fromRGB(200, 0, 0)
titleBar.Parent = mainFrame

local titleLabel = Instance.new(“TextLabel”)
titleLabel.Size = UDim2.new(1, -50, 1, 0)
titleLabel.Position = UDim2.new(0, 10, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = “AMBITIOUS PVP | PS 99 | PING: 62ms”
titleLabel.TextColor3 = Color3.fromRGB(200, 0, 0)
titleLabel.TextSize = 18
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Parent = titleBar

– Close Button
local closeButton = Instance.new(“TextButton”)
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
closeButton.Text = “X”
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 20
closeButton.Font = Enum.Font.GothamBold
closeButton.Parent = titleBar

closeButton.MouseButton1Click:Connect(function()
screenGui:Destroy()
end)

– Left Panel (Movement Settings)
local leftPanel = Instance.new(“ScrollingFrame”)
leftPanel.Size = UDim2.new(0.48, 0, 1, -50)
leftPanel.Position = UDim2.new(0, 10, 0, 45)
leftPanel.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
leftPanel.BorderSizePixel = 1
leftPanel.BorderColor3 = Color3.fromRGB(200, 0, 0)
leftPanel.ScrollBarThickness = 6
leftPanel.Parent = mainFrame

– Right Panel (Other Settings)
local rightPanel = Instance.new(“ScrollingFrame”)
rightPanel.Size = UDim2.new(0.48, 0, 1, -50)
rightPanel.Position = UDim2.new(0.52, 0, 0, 45)
rightPanel.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
rightPanel.BorderSizePixel = 1
rightPanel.BorderColor3 = Color3.fromRGB(200, 0, 0)
rightPanel.ScrollBarThickness = 6
rightPanel.Parent = mainFrame

– Function to create toggle button
local function createToggle(parent, text, position, callback)
local toggleFrame = Instance.new(“Frame”)
toggleFrame.Size = UDim2.new(1, -10, 0, 35)
toggleFrame.Position = UDim2.new(0, 5, 0, position)
toggleFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
toggleFrame.BorderSizePixel = 1
toggleFrame.BorderColor3 = Color3.fromRGB(200, 0, 0)
toggleFrame.Parent = parent

```
local label = Instance.new("TextLabel")
label.Size = UDim2.new(0.7, 0, 1, 0)
label.Position = UDim2.new(0, 5, 0, 0)
label.BackgroundTransparency = 1
label.Text = text
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.TextSize = 14
label.TextXAlignment = Enum.TextXAlignment.Left
label.Font = Enum.Font.Gotham
label.Parent = toggleFrame

local toggle = Instance.new("TextButton")
toggle.Size = UDim2.new(0, 45, 0, 20)
toggle.Position = UDim2.new(1, -50, 0.5, -10)
toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
toggle.BorderSizePixel = 1
toggle.BorderColor3 = Color3.fromRGB(200, 0, 0)
toggle.Text = ""
toggle.Parent = toggleFrame

local knob = Instance.new("Frame")
knob.Size = UDim2.new(0, 18, 0, 18)
knob.Position = UDim2.new(0, 1, 0.5, -9)
knob.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
knob.BorderSizePixel = 0
knob.Parent = toggle

local isOn = false
toggle.MouseButton1Click:Connect(function()
    isOn = not isOn
    if isOn then
        knob.Position = UDim2.new(1, -19, 0.5, -9)
        knob.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        toggle.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
    else
        knob.Position = UDim2.new(0, 1, 0.5, -9)
        knob.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
        toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
    end
    if callback then callback(isOn) end
end)

return toggleFrame
```

end

– Function to create slider
local function createSlider(parent, text, position, minVal, maxVal, callback)
local sliderFrame = Instance.new(“Frame”)
sliderFrame.Size = UDim2.new(1, -10, 0, 45)
sliderFrame.Position = UDim2.new(0, 5, 0, position)
sliderFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
sliderFrame.BorderSizePixel = 1
sliderFrame.BorderColor3 = Color3.fromRGB(200, 0, 0)
sliderFrame.Parent = parent

```
local label = Instance.new("TextLabel")
label.Size = UDim2.new(0.7, 0, 0, 20)
label.Position = UDim2.new(0, 5, 0, 2)
label.BackgroundTransparency = 1
label.Text = text
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.TextSize = 14
label.TextXAlignment = Enum.TextXAlignment.Left
label.Font = Enum.Font.Gotham
label.Parent = sliderFrame

local valueLabel = Instance.new("TextLabel")
valueLabel.Size = UDim2.new(0.3, 0, 0, 20)
valueLabel.Position = UDim2.new(0.7, 0, 0, 2)
valueLabel.BackgroundTransparency = 1
valueLabel.Text = tostring(minVal)
valueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
valueLabel.TextSize = 14
valueLabel.TextXAlignment = Enum.TextXAlignment.Right
valueLabel.Font = Enum.Font.Gotham
valueLabel.Parent = sliderFrame

local sliderBar = Instance.new("Frame")
sliderBar.Size = UDim2.new(1, -10, 0, 4)
sliderBar.Position = UDim2.new(0, 5, 0, 28)
sliderBar.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
sliderBar.BorderSizePixel = 0
sliderBar.Parent = sliderFrame

local sliderKnob = Instance.new("Frame")
sliderKnob.Size = UDim2.new(0, 12, 0, 12)
sliderKnob.Position = UDim2.new(0, -6, 0.5, -6)
sliderKnob.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
sliderKnob.BorderSizePixel = 0
sliderKnob.Parent = sliderBar

return sliderFrame
```

end

– Function to create button
local function createButton(parent, text, position, callback)
local button = Instance.new(“TextButton”)
button.Size = UDim2.new(1, -10, 0, 35)
button.Position = UDim2.new(0, 5, 0, position)
button.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
button.BorderSizePixel = 1
button.BorderColor3 = Color3.fromRGB(255, 0, 0)
button.Text = text
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.TextSize = 16
button.Font = Enum.Font.GothamBold
button.Parent = parent

```
button.MouseButton1Click:Connect(function()
    if callback then callback() end
end)

return button
```

end

– Left Panel Content
createButton(leftPanel, “DESYNC”, 5, function() print(“Desync activated”) end)
createSlider(leftPanel, “SPEED BOOST”, 45, 0, 200)
createSlider(leftPanel, “BOOSTER”, 95, 0, 100)
createSlider(leftPanel, “Airwurl”, 145, 0, 50)
createSlider(leftPanel, “Jump Flare”, 195, 0, 50)
createSlider(leftPanel, “Shift”, 245, 0, 50)
createToggle(leftPanel, “HELICOPTER”, 295, function(state) print(“Helicopter:”, state) end)
createToggle(leftPanel, “UNIWALK”, 335, function(state) print(“Uniwalk:”, state) end)

– Right Panel Content
createToggle(rightPanel, “AUTO STEAL”, 5, function(state) print(“Auto Steal:”, state) end)
createToggle(rightPanel, “BAT FUCKER”, 45, function(state) print(“Bat Fucker:”, state) end)
createToggle(rightPanel, “ANTI RAGDOLL”, 85, function(state) print(“Anti Ragdoll:”, state) end)
createToggle(rightPanel, “TRANSPARENT BASES”, 125, function(state) print(“Transparent Bases:”, state) end)
createToggle(rightPanel, “OPTIMIZER”, 165, function(state) print(“Optimizer:”, state) end)

– Adjust canvas sizes
leftPanel.CanvasSize = UDim2.new(0, 0, 0, 380)
rightPanel.CanvasSize = UDim2.new(0, 0, 0, 380)

print(“Game Menu GUI Loaded!”)
