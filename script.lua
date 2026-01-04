-- TEST GUI SIMPLE (SI ESTO SALE, TODO FUNCIONA)

local gui = Instance.new("ScreenGui")
gui.Name = "TestGUI"
gui.ResetOnSpawn = false
gui.Parent = gethui and gethui() or game.CoreGui

local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.fromScale(0.3, 0.3)
frame.Position = UDim2.fromScale(0.35, 0.35)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.Active = true
frame.Draggable = true

local text = Instance.new("TextLabel")
text.Parent = frame
text.Size = UDim2.fromScale(1,1)
text.Text = "SI VES ESTO, FUNCIONA 🔥"
text.TextScaled = true
text.TextColor3 = Color3.new(1,1,1)
text.BackgroundTransparency = 1
