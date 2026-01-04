--// GABRIEL HUB
--// Key System
local REQUIRED_KEY = "23022026"

--// Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

--// Variables
local speedValue = 16
local espEnabled = false
local safeMode = false
local espObjects = {}

--// =========================
--// UI - KEY SCREEN
--// =========================
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "GabrielGUI"

local keyFrame = Instance.new("Frame", gui)
keyFrame.Size = UDim2.fromScale(0.35,0.25)
keyFrame.Position = UDim2.fromScale(0.325,0.35)
keyFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
keyFrame.Active = true
keyFrame.Draggable = true

local keyCorner = Instance.new("UICorner", keyFrame)
keyCorner.CornerRadius = UDim.new(0,12)

local keyTitle = Instance.new("TextLabel", keyFrame)
keyTitle.Size = UDim2.new(1,0,0.3,0)
keyTitle.Text = "🔐 GABRIEL KEY"
keyTitle.TextColor3 = Color3.new(1,1,1)
keyTitle.BackgroundTransparency = 1
keyTitle.TextScaled = true

local keyBox = Instance.new("TextBox", keyFrame)
keyBox.Size = UDim2.new(0.8,0,0.25,0)
keyBox.Position = UDim2.new(0.1,0,0.45,0)
keyBox.PlaceholderText = "Escribe la key"
keyBox.Text = ""
keyBox.TextScaled = true
keyBox.BackgroundColor3 = Color3.fromRGB(35,35,35)
keyBox.TextColor3 = Color3.new(1,1,1)

Instance.new("UICorner", keyBox)

local keyButton = Instance.new("TextButton", keyFrame)
keyButton.Size = UDim2.new(0.6,0,0.22,0)
keyButton.Position = UDim2.new(0.2,0,0.75,0)
keyButton.Text = "ENTRAR"
keyButton.TextScaled = true
keyButton.BackgroundColor3 = Color3.fromRGB(80,80,255)
keyButton.TextColor3 = Color3.new(1,1,1)

Instance.new("UICorner", keyButton)

--// =========================
--// MAIN UI
--// =========================
local function createMainUI()
    keyFrame:Destroy()

    local floatBtn = Instance.new("TextButton", gui)
    floatBtn.Size = UDim2.fromScale(0.12,0.12)
    floatBtn.Position = UDim2.fromScale(0.05,0.5)
    floatBtn.Text = "G"
    floatBtn.TextScaled = true
    floatBtn.BackgroundColor3 = Color3.fromRGB(120,120,255)
    floatBtn.TextColor3 = Color3.new(1,1,1)
    floatBtn.Active = true
    floatBtn.Draggable = true
    Instance.new("UICorner", floatBtn).CornerRadius = UDim.new(1,0)

    local menu = Instance.new("Frame", gui)
    menu.Size = UDim2.fromScale(0.45,0.55)
    menu.Position = UDim2.fromScale(0.275,0.22)
    menu.BackgroundColor3 = Color3.fromRGB(18,18,18)
    menu.Visible = false
    menu.Active = true
    menu.Draggable = true
    Instance.new("UICorner", menu).CornerRadius = UDim.new(0,14)

    local title = Instance.new("TextLabel", menu)
    title.Size = UDim2.new(1,0,0.15,0)
    title.Text = "🔥 GABRIEL HUB"
    title.TextScaled = true
    title.TextColor3 = Color3.new(1,1,1)
    title.BackgroundTransparency = 1

    floatBtn.MouseButton1Click:Connect(function()
        menu.Visible = not menu.Visible
    end)

    --// ESP BUTTON
    local espBtn = Instance.new("TextButton", menu)
    espBtn.Size = UDim2.new(0.8,0,0.12,0)
    espBtn.Position = UDim2.new(0.1,0,0.2,0)
    espBtn.Text = "ESP: OFF"
    espBtn.TextScaled = true
    espBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
    espBtn.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", espBtn)

    espBtn.MouseButton1Click:Connect(function()
        espEnabled = not espEnabled
        espBtn.Text = espEnabled and "ESP: ON" or "ESP: OFF"
    end)

    --// SPEED
    local speedLabel = Instance.new("TextLabel", menu)
    speedLabel.Size = UDim2.new(0.8,0,0.1,0)
    speedLabel.Position = UDim2.new(0.1,0,0.35,0)
    speedLabel.Text = "Speed: "..speedValue
    speedLabel.TextScaled = true
    speedLabel.BackgroundTransparency = 1
    speedLabel.TextColor3 = Color3.new(1,1,1)

    local plus = Instance.new("TextButton", menu)
    plus.Size = UDim2.new(0.35,0,0.1,0)
    plus.Position = UDim2.new(0.1,0,0.47,0)
    plus.Text = "+"
    plus.TextScaled = true
    plus.BackgroundColor3 = Color3.fromRGB(80,200,80)
    Instance.new("UICorner", plus)

    local minus = Instance.new("TextButton", menu)
    minus.Size = UDim2.new(0.35,0,0.1,0)
    minus.Position = UDim2.new(0.55,0,0.47,0)
    minus.Text = "-"
    minus.TextScaled = true
    minus.BackgroundColor3 = Color3.fromRGB(200,80,80)
    Instance.new("UICorner", minus)

    plus.MouseButton1Click:Connect(function()
        speedValue = math.clamp(speedValue + 5, 1, 200)
        speedLabel.Text = "Speed: "..speedValue
    end)

    minus.MouseButton1Click:Connect(function()
        speedValue = math.clamp(speedValue - 5, 1, 200)
        speedLabel.Text = "Speed: "..speedValue
    end)

    --// SAFE MODE
    local safeBtn = Instance.new("TextButton", menu)
    safeBtn.Size = UDim2.new(0.8,0,0.12,0)
    safeBtn.Position = UDim2.new(0.1,0,0.62,0)
    safeBtn.Text = "Modo Seguro: OFF"
    safeBtn.TextScaled = true
    safeBtn.BackgroundColor3 = Color3.fromRGB(90,90,90)
    safeBtn.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", safeBtn)

    safeBtn.MouseButton1Click:Connect(function()
        safeMode = not safeMode
        espEnabled = false
        safeBtn.Text = safeMode and "Modo Seguro: ON" or "Modo Seguro: OFF"
        espBtn.Text = "ESP: OFF"
    end)
end

--// KEY CHECK
keyButton.MouseButton1Click:Connect(function()
    if keyBox.Text == REQUIRED_KEY then
        createMainUI()
    else
        keyBox.Text = ""
        keyBox.PlaceholderText = "KEY INCORRECTA"
    end
end)

--// =========================
--// ESP (CUERPO SOLAMENTE)
--// =========================
local function addESP(player)
    if player == LocalPlayer then return end
    player.CharacterAdded:Connect(function(char)
        if not char:FindFirstChild("HumanoidRootPart") then return end
        local box = Instance.new("BoxHandleAdornment")
        box.Adornee = char
        box.Size = Vector3.new(4,6,2)
        box.AlwaysOnTop = true
        box.ZIndex = 5
        box.Transparency = 0.4
        box.Color3 = Color3.fromRGB(255,0,0)
        box.Parent = gui
        espObjects[player] = box
    end)
end

for _,p in pairs(Players:GetPlayers()) do
    addESP(p)
end

Players.PlayerAdded:Connect(addESP)

RunService.RenderStepped:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = speedValue
    end

    for p,box in pairs(espObjects) do
        if box then
            box.Visible = espEnabled and not safeMode
        end
    end
end)

--// =========================
--// INFINITE JUMP
--// =========================
UserInputService.JumpRequest:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)
