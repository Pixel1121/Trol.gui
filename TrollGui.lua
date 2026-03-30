-- Cool Kids Style GUI
-- Owner bypass ID
local OWNER_ID = 7273254218
local KEY = "COOLKIDS123"

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")

local gui = Instance.new("ScreenGui")
gui.Name = "CoolKidsHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

----------------------------------------------------
-- NOTIFICATION FUNCTION
----------------------------------------------------

local function notify(text)

    local frame = Instance.new("TextLabel")
    frame.Size = UDim2.new(0,300,0,40)
    frame.Position = UDim2.new(0.5,-150,0.1,0)
    frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
    frame.TextColor3 = Color3.new(1,1,1)
    frame.Font = Enum.Font.GothamBold
    frame.TextSize = 16
    frame.Text = text
    frame.Parent = gui

    Instance.new("UICorner",frame)

    task.wait(2)
    frame:Destroy()

end

----------------------------------------------------
-- MAIN GUI
----------------------------------------------------

local main = Instance.new("Frame")
main.Size = UDim2.new(0,450,0,300)
main.Position = UDim2.new(0.35,0,0.3,0)
main.BackgroundColor3 = Color3.fromRGB(20,20,20)
main.Active = true
main.Draggable = true
main.Visible = false
main.Parent = gui

Instance.new("UICorner",main)

local title = Instance.new("TextLabel")
title.Parent = main
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "Cool Kids Hub"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.new(1,1,1)

----------------------------------------------------
-- BUTTON CREATOR
----------------------------------------------------

local function createButton(name,posY,callback)

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.8,0,0,40)
    btn.Position = UDim2.new(0.1,0,0,posY)
    btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 16
    btn.Text = name
    btn.Parent = main

    Instance.new("UICorner",btn)

    btn.MouseButton1Click:Connect(callback)

end

----------------------------------------------------
-- FUNCTIONS
----------------------------------------------------

createButton("Speed Boost",60,function()

    humanoid.WalkSpeed = 50
    notify("Speed Boost Enabled")

end)

createButton("Jump Boost",110,function()

    humanoid.JumpPower = 100
    notify("Jump Boost Enabled")

end)

createButton("Teleport Up",160,function()

    char:MoveTo(char.PrimaryPart.Position + Vector3.new(0,50,0))
    notify("Teleported")

end)

createButton("Invisible",210,function()

    for _,v in pairs(char:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Transparency = 1
        end
    end

    notify("Invisible Mode")

end)

createButton("Reset Player",260,function()

    humanoid.Health = 0

end)

----------------------------------------------------
-- KEY SYSTEM
----------------------------------------------------

local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(0,300,0,170)
keyFrame.Position = UDim2.new(0.4,0,0.35,0)
keyFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
keyFrame.Parent = gui

Instance.new("UICorner",keyFrame)

local label = Instance.new("TextLabel")
label.Parent = keyFrame
label.Size = UDim2.new(1,0,0,40)
label.BackgroundTransparency = 1
label.Text = "Enter Key"
label.TextColor3 = Color3.new(1,1,1)
label.Font = Enum.Font.GothamBold
label.TextSize = 18

local box = Instance.new("TextBox")
box.Parent = keyFrame
box.Size = UDim2.new(0.8,0,0,40)
box.Position = UDim2.new(0.1,0,0.4,0)
box.PlaceholderText = "Key..."
box.Text = ""

local submit = Instance.new("TextButton")
submit.Parent = keyFrame
submit.Size = UDim2.new(0.8,0,0,40)
submit.Position = UDim2.new(0.1,0,0.7,0)
submit.Text = "Submit"

Instance.new("UICorner",submit)

submit.MouseButton1Click:Connect(function()

    if box.Text == KEY then

        keyFrame.Visible = false
        main.Visible = true
        notify("Access Granted")

    else

        box.Text = "Wrong Key"

    end

end)

----------------------------------------------------
-- OWNER BYPASS
----------------------------------------------------

if player.UserId == OWNER_ID then

    keyFrame.Visible = false
    main.Visible = true
    notify("Owner Access")

end
