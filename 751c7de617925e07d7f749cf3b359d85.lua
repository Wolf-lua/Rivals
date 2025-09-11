local CORRECT_KEY = "Q45F-6EE1" -- change la clé ici
local KEY_LINK = "https://rekonise.com/insane-rivals-script-with-aimbot-triggerbot-unlock-all-skins-players-esp-and-more-exploit-hack-kchj1" -- lien pour récupérer la clé
local HUB_URL  = "https://pastefy.app/1UDxha5g/raw"

-- SERVICES
local player = game.Players.LocalPlayer
local sg = game:GetService("StarterGui")

--// UI CREATION
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui") -- plus sûr que CoreGui
gui.Name = "MyBeautifulLoader"

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 180)
frame.Position = UDim2.new(0.5, -150, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

-- Titre
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "🔑 Beautiful Loader"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Parent = frame

-- Zone de saisie
local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0.8, 0, 0, 35)
keyBox.Position = UDim2.new(0.1, 0, 0.35, 0)
keyBox.PlaceholderText = "Enter Key..."
keyBox.Text = ""
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 16
keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
keyBox.Parent = frame
Instance.new("UICorner", keyBox).CornerRadius = UDim.new(0, 8)

-- Bouton Unlock
local unlockBtn = Instance.new("TextButton")
unlockBtn.Size = UDim2.new(0.7, 0, 0, 35)
unlockBtn.Position = UDim2.new(0.15, 0, 0.65, 0)
unlockBtn.Text = "Unlock"
unlockBtn.Font = Enum.Font.GothamBold
unlockBtn.TextSize = 16
unlockBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
unlockBtn.BackgroundColor3 = Color3.fromRGB(60, 120, 60)
unlockBtn.Parent = frame
Instance.new("UICorner", unlockBtn).CornerRadius = UDim.new(0, 8)

-- Bouton Get Key
local getKeyBtn = Instance.new("TextButton")
getKeyBtn.Size = UDim2.new(0.4, 0, 0, 25)
getKeyBtn.Position = UDim2.new(0.3, 0, 0.85, 0)
getKeyBtn.Text = "Get Key"
getKeyBtn.Font = Enum.Font.Gotham
getKeyBtn.TextSize = 14
getKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
getKeyBtn.Parent = frame
Instance.new("UICorner", getKeyBtn).CornerRadius = UDim.new(0, 6)

--// LOGIQUE

-- Copier le lien de la clé
getKeyBtn.MouseButton1Click:Connect(function()
    pcall(function()
        setclipboard(KEY_LINK)
        sg:SetCore("SendNotification", {
            Title = "Copied!";
            Text = "Key link copied to clipboard!";
            Duration = 3
        })
    end)
end)

-- Déverrouiller le hub
unlockBtn.MouseButton1Click:Connect(function()
    if keyBox.Text == CORRECT_KEY then
        pcall(function()
            sg:SetCore("SendNotification", {
                Title = "Success!";
                Text = "Hub unlocked 🎉";
                Duration = 3
            })
        end)
        frame:Destroy()
        pcall(function()
            local hubScript = game:HttpGet(HUB_URL)
            loadstring(hubScript)()
        end)
    else
        keyBox.Text = ""
        keyBox.PlaceholderText = "❌ Wrong Key"
    end
end)
