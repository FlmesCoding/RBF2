local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Rainbow Friends 2 🌈",
   LoadingTitle = "Nexus 🌟",
   LoadingSubtitle = "by flames0502",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = Nexus, -- Create a custom folder for your hub/game
      FileName = "Nexus Hub"
   },
   Discord = {
      Enabled = true,
      Invite = "wQgvgNYXyQ", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = false -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Nexus 🌟 - Key 🔐",
      Subtitle = "Key System",
      Note = "Key is in the discord server https://discord.gg/wQgvgNYXyQ",
      FileNamwwwe = "NexusKey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"https://pastebin.com/raw/PJrSYDYz"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local LocalPlayer = Window:CreateTab("LocalPlayer", nil) -- Title, Image

local Section = LocalPlayer:CreateSection("Player Modifications")

local Slider = LocalPlayer:CreateSlider({
   Name = "Walkspeed",
   Range = {0, 250},
   Increment = 1,
   Suffix = "%",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   local character = game.Players.LocalPlayer.Character
       if character then
           local humanoid = character:FindFirstChildOfClass("Humanoid")
           if humanoid then
               humanoid.WalkSpeed = Value
           end
       end
   end,
})

local Slider = LocalPlayer:CreateSlider({
   Name = "Jump Power",
   Range = {0, 250},
   Increment = 1,
   Suffix = "%",
   CurrentValue = 50,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   local character = game.Players.LocalPlayer.Character
       if character then
           local humanoid = character:FindFirstChildOfClass("Humanoid")
           if humanoid then
               humanoid.JumpPower = Value
           end
       end
   end,
})

local Slider = LocalPlayer:CreateSlider({
   Name = "Gravity",
   Range = {0, 500},
   Increment = 1,
   Suffix = "%",
   CurrentValue = 196.2,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   game.Workspace.Gravity = Value
   end,
})

local infiniteJumpEnabled = false

local Toggle = LocalPlayer:CreateToggle({
   Name = "Inf Jump",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        infiniteJumpEnabled = Value
   end,
})

game:GetService("UserInputService").JumpRequest:Connect(function()
	if infiniteJumpEnabled then
		local player = game.Players.LocalPlayer
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
	end
end)

local Visuals = Window:CreateTab("Visuals", nil) -- Title, Image

local Section = Visuals:CreateSection("Monsters ESP")

-- assuming Visuals is your module which has CreateToggle function
local Toggle = Visuals:CreateToggle({
   Name = "Blue",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
       local monster = game:GetService("Workspace").Monsters.Blue
        handleToggle(monster, Value, "Blue")
   end,
})


local GreenToggle = Visuals:CreateToggle({
    Name = "Green",
    CurrentValue = false,
    Flag = "ToggleGreen",
    Callback = function(Value)
        local monster = game:GetService("Workspace").Monsters.Green
        handleToggle(monster, Value, "Green")
    end,
})

local PurpleToggle = Visuals:CreateToggle({
    Name = "Purple",
    CurrentValue = false,
    Flag = "TogglePurple",
    Callback = function(Value)
        local monster = game:GetService("Workspace").Monsters.Purple
        handleToggle(monster, Value, "Purple")
    end,
})

local BirdToggle = Visuals:CreateToggle({
    Name = "Bird",
    CurrentValue = false,
    Flag = "ToggleBird",
    Callback = function(Value)
        local monster = game:GetService("Workspace").Monsters.Bird
        handleToggle(monster, Value, "Bird")
    end,
})

-- Function that handles toggling display for monsters
function handleToggle(monster, Value, text)
    if not monster:FindFirstChild("DisplayName") then
        local textLabel = Instance.new("BillboardGui")
        textLabel.Name = "DisplayName"
        textLabel.AlwaysOnTop = true
        textLabel.Size = UDim2.new(0, 200, 0, 50)  -- Make the BillboardGui larger
        textLabel.ExtentsOffset = Vector3.new(0, 2, 0) -- Increase the offset to match the larger size

        local textPart = Instance.new("TextLabel")
        textPart.Size = UDim2.new(1, 0, 1, 0)
        textPart.Text = text
        textPart.TextColor3 = Color3.new(1, 1, 1)  -- Make the text white
        textPart.BackgroundTransparency = 1
        textPart.Parent = textLabel

        textLabel.Parent = monster
    end

    monster.DisplayName.Enabled = Value
end

local Toggle = Visuals:CreateToggle({
   Name = "Cyan",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   local monster = game:GetService("Workspace").Monsters.Cyan
        handleToggle(monster, Value, "Cyan")
   end,
})

local Section = Visuals:CreateSection("Item's")

local LightBulbToggle = Visuals:CreateToggle({
    Name = "Light Bulbs",
    CurrentValue = false,
    Flag = "ToggleLightBulbs",
    Callback = function(Value)
        local allModels = game:GetService("Workspace"):GetDescendants()
        for _, model in pairs(allModels) do
            if model.Name == "LightBulb" and model:IsA("Model") then
                handleToggle(model, Value, "Light Bulb")
            end
        end
    end,
})

-- Function that handles toggling display for models
function handleToggle(model, Value, text)
    if not model:FindFirstChild("DisplayName") then
        local textLabel = Instance.new("BillboardGui")
        textLabel.Name = "DisplayName"
        textLabel.AlwaysOnTop = true
        textLabel.Size = UDim2.new(0, 200, 0, 50)  -- Make the BillboardGui larger
        textLabel.ExtentsOffset = Vector3.new(0, 2, 0) -- Increase the offset to match the larger size

        local textPart = Instance.new("TextLabel")
        textPart.Size = UDim2.new(1, 0, 1, 0)
        textPart.Text = text
        textPart.TextColor3 = Color3.new(1, 1, 1)  -- Make the text white
        textPart.BackgroundTransparency = 1
        textPart.Parent = textLabel

        textLabel.Parent = model
    end

    model.DisplayName.Enabled = Value
end


local GasCanisterToggle = Visuals:CreateToggle({
    Name = "Gas Canisters",
    CurrentValue = false,
    Flag = "ToggleGasCanisters",
    Callback = function(Value)
        local allModels = game:GetService("Workspace"):GetDescendants()
        for _, model in pairs(allModels) do
            if model.Name == "GasCanister" and model:IsA("Model") then
                handleToggle(model, Value, "Gas Canister")
            end
        end
    end,
})

local LookyToggle = Visuals:CreateToggle({
    Name = "Lookies",
    CurrentValue = false,
    Flag = "ToggleLookies",
    Callback = function(Value)
        local allModels = game:GetService("Workspace"):GetDescendants()
        for _, model in pairs(allModels) do
            if model.Name == "Looky" and model:IsA("Model") then
                handleToggle(model, Value, "Looky")
            end
        end
    end,
})

local Toggle = Visuals:CreateToggle({
   Name = "Sugar Packs",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   -- The function that takes place when the toggle is pressed
   -- The variable (Value) is a boolean on whether the toggle is true or false
   end,
})

local Section = Visuals:CreateSection("ESP Settings")


local ESPColor = Color3.fromRGB(255, 255, 255)

local ColorPicker = Visuals:CreateColorPicker({
    Name = "ESP Color",
    Color = ESPColor,
    Flag = "ColorPicker1",
    Callback = function(Value)
        ESPColor = Value
        -- Iterate over all ESPs and update their color
        local allModels = game:GetService("Workspace"):GetDescendants()
        for _, model in pairs(allModels) do
            if model:FindFirstChild("DisplayName") then
                model.DisplayName.TextLabel.TextColor3 = ESPColor
            end
        end
    end
})

local Extra = Window:CreateTab("Extra", nil) -- Title, Image

local Section = Extra:CreateSection("Auto")

local Button = Extra:CreateButton({
   Name = "AutoCollect Items",
   Callback = function()
   -- Get the player's character
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local maxTeleports = 10
local teleportedCount = 0

while teleportedCount < maxTeleports do
    local foundLightBulb = false

    -- Teleport the player character to LightBulb objects
    for _, lightBulb in ipairs(workspace:GetChildren()) do
        if lightBulb.Name == "LightBulb" then
            local handle = lightBulb:FindFirstChild("Handle")
            if handle then
                character.HumanoidRootPart.CFrame = handle.CFrame
                handle:Destroy()
                teleportedCount = teleportedCount + 1
                if teleportedCount >= maxTeleports then
                    break
                end
                wait(0.5) -- Delay between each teleportation (adjust as needed)
                foundLightBulb = true
                break
            end
        end
    end

    -- Teleport the player character to GasCanister objects if LightBulb not found
    if not foundLightBulb then
        for _, gasCanister in ipairs(workspace:GetChildren()) do
            if gasCanister.Name == "GasCanister" then
                local handle = gasCanister:FindFirstChild("Handle")
                if handle then
                    character.HumanoidRootPart.CFrame = handle.CFrame
                    handle:Destroy()
                    teleportedCount = teleportedCount + 1
                    if teleportedCount >= maxTeleports then
                        break
                    end
                    wait(0.5) -- Delay between each teleportation (adjust as needed)
                    break
                end
            end
        end
    end

    wait(1) -- Delay between each iteration of the loop (adjust as needed)
end

   end,
})

local Button = Extra:CreateButton({
   Name = "Teleport To Deposit Area",
   Callback = function()
   -- Get the player's character
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Teleport the player character to the specified location
local destination = game:GetService("Workspace").Map_C2.Hitboxes:GetChildren()[68]
if destination then
    character.HumanoidRootPart.CFrame = destination.CFrame
end

   end,
})
