local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()


local Window = Rayfield:CreateWindow({
   Name = "Astros Hub | Rivals 🔫",
   LoadingTitle = "🔫 Astro hub 💥",
   LoadingSubtitle = "by a261",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, 
      FileName = "astrohub"
   },
   Discord = {
      Enabled = true,
      Invite = "qxJGZzySGa", 
      RememberJoins = false 
   },
   KeySystem = false, 
   KeySettings = {
      Title = "Key | Astro Hub",
      Subtitle = "Key System",
      Note = "Get Key from a261",
      FileName = "astrohubkey", 
      SaveKey = false, 
      GrabKeyFromSite = false, 
      Key = {"astroisthebest"} 
   }
})

local MainTab = Window:CreateTab("🏠 Home", nil) 
local MainSection = MainTab:CreateSection("Main")

local AimTab = Window:CreateTab("🔫 Aimbot", nil) 
local AimbotSection = AimTab:CreateSection("Aimbot")

local EspTab = Window:CreateTab("👁️ ESP", nil) 
local AimbotSection = EspTab:CreateSection("ESP")

Rayfield:Notify({
   Title = "You executed the script",
   Content = "Astro HUB",
   Duration = 5,
   Image = 13047715178,
   Actions = { 
      Ignore = {
         Name = "Okay!",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})

local Button = MainTab:CreateButton({
   Name = "Infinite Jump Toggle",
   Callback = function()
       
_G.infinjump = not _G.infinjump

if _G.infinJumpStarted == nil then
	_G.infinJumpStarted = true
	
	game.StarterGui:SetCore("SendNotification", {Title="Astro Hub"; Text="Infinite Jump Activated!"; Duration=5;})

	local plr = game:GetService('Players').LocalPlayer
	local m = plr:GetMouse()
	m.KeyDown:connect(function(k)
		if _G.infinjump then
			if k:byte() == 32 then
			humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
			humanoid:ChangeState('Jumping')
			wait()
			humanoid:ChangeState('Seated')
			end
		end
	end)
end
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "WalkSpeed Slider",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "sliderws",
   Callback = function(Value)
        local players = game:GetService("Players");
        players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "JumpPower Slider",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "sliderjp",
   Callback = function(Value)
   local players = game:GetService("Players");
        players.LocalPlayer.Character.Humanoid.UseJumpPower = true
        players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
   end,
})

local Button = MainTab:CreateButton({
   Name = "Aimbot and ESP",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
   end,
})

local Input = MainTab:CreateInput({
   Name = "Walkspeed",
   PlaceholderText = "1-500",
   RemoveTextAfterFocusLost = true,
   Callback = function(Text)
        local players = game:GetService("Players");
        players.LocalPlayer.Character.Humanoid.WalkSpeed = (Text)
   end,
})

local espEnabled = false
local espScript = nil

local Button = MainTab:CreateButton({
    Name = "ESP Toggle",
    Callback = function()
        if espEnabled then
            if espScript then
                espScript:Remove()
                espScript = nil
            end
            espEnabled = false
        else
            espScript = loadstring(game:HttpGet("https://pastebin.com/raw/s7viVmDR"))()
            espEnabled = true
            Rayfield:Notify({
   Title = "ESP",
   Content = "Toggle esp using Q",
   Duration = 6.5,
   Image = 4483362458,
})			
        end
    end,
})

local Button = MainTab:CreateButton({
   Name = "Triggerbot",
   Callback = function()
			Rayfield:Notify({
   Title = "Triggerbot",
   Content = "Toggle Triggerbot using E",
   Duration = 6.5,
   Image = 4483362458,
})
       _G.triggerbot = false

       local player = game:GetService("Players").LocalPlayer
       local mouse = player:GetMouse()

       local Clicked = false
       local UserInputService = game:GetService("UserInputService")

       local function toggleTriggerbot()
           _G.triggerbot = not _G.triggerbot
           Rayfield:Notify({
               Title = "Triggerbot Status",
               Content = "Triggerbot is now " .. (_G.triggerbot and "ON" or "OFF"),
               Duration = 6.5,
               Image = 4483362458,
           })
       end

       UserInputService.InputBegan:Connect(function(Input, GameProcessedEvent)
           if GameProcessedEvent then
               return
           end

           if Input.KeyCode == Enum.KeyCode.E then
               toggleTriggerbot()
           end
       end)

       game:GetService("RunService").RenderStepped:Connect(function()
           if (mouse.Target and 
               (mouse.Target.Parent:FindFirstChildOfClass("Humanoid") or mouse.Target.Parent.Parent:FindFirstChildOfClass("Humanoid")) 
               and _G.triggerbot 
               and mouse.Target.Parent.Name ~= player.Name) 
           then
               local humanoid = mouse.Target.Parent:FindFirstChildOfClass("Humanoid") or mouse.Target.Parent.Parent:FindFirstChildOfClass("Humanoid")
               
               if humanoid.Health >= 1 then
                   local name = mouse.Target.Parent.Name
                   mouse1press()
                   Clicked = false
               end
           elseif _G.triggerbot and not Clicked then
               mouse1release()
           elseif not _G.triggerbot and 
               (mouse.Target.Parent:FindFirstChildOfClass("Humanoid") or mouse.Target.Parent.Parent:FindFirstChildOfClass("Humanoid")) 
           then
               Clicked = true
           end
       end)
   end,
})

local flying = false
local speed = 50
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local camera = workspace.CurrentCamera
local bodyGyro, bodyVelocity
local userInputService = game:GetService("UserInputService")
local connection

local moveDirection = Vector3.new(0, 0, 0)

local Button = MainTab:CreateButton({
   Name = "Toggle Flying",
   Callback = function()
       local function startFlying()
           if not flying then
               flying = true

               bodyGyro = Instance.new("BodyGyro")
               bodyGyro.MaxTorque = Vector3.new(400000, 400000, 400000)
               bodyGyro.CFrame = humanoidRootPart.CFrame
               bodyGyro.Parent = humanoidRootPart

               bodyVelocity = Instance.new("BodyVelocity")
               bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)
               bodyVelocity.Velocity = Vector3.new(0, 0, 0)
               bodyVelocity.Parent = humanoidRootPart

               Rayfield:Notify({
                   Title = "Flying Enabled",
                   Content = "You are now flying!",
                   Duration = 4,
                   Image = 4483362458,
               })

               connection = game:GetService("RunService").RenderStepped:Connect(function()
                   moveDirection = Vector3.new(0, 0, 0)

                   if userInputService:IsKeyDown(Enum.KeyCode.W) then
                       moveDirection = moveDirection + camera.CFrame.LookVector
                   end
                   if userInputService:IsKeyDown(Enum.KeyCode.S) then
                       moveDirection = moveDirection - camera.CFrame.LookVector
                   end
                   if userInputService:IsKeyDown(Enum.KeyCode.A) then
                       moveDirection = moveDirection - camera.CFrame.RightVector
                   end
                   if userInputService:IsKeyDown(Enum.KeyCode.D) then
                       moveDirection = moveDirection + camera.CFrame.RightVector
                   end

                   if userInputService:IsKeyDown(Enum.KeyCode.Space) then
                       moveDirection = moveDirection + Vector3.new(0, 1, 0)
                   elseif userInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                       moveDirection = moveDirection - Vector3.new(0, 1, 0)
                   end

                   if moveDirection.Magnitude > 0 then
                       bodyVelocity.Velocity = moveDirection.Unit * speed
                   else
                       bodyVelocity.Velocity = Vector3.zero
                   end
               end)
           end
       end

       local function stopFlying()
           if flying then
               flying = false

               if connection then
                   connection:Disconnect()
                   connection = nil
               end

               if bodyGyro then
                   bodyGyro:Destroy()
                   bodyGyro = nil
               end
               if bodyVelocity then
                   bodyVelocity:Destroy()
                   bodyVelocity = nil
               end

               Rayfield:Notify({
                   Title = "Flying Disabled",
                   Content = "You are no longer flying.",
                   Duration = 4,
                   Image = 4483362458,
               })
           end
       end

       if flying then
           stopFlying()
       else
           startFlying()
       end
   end,
})




local AimbotModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-V3/main/src/Aimbot.lua"))()
AimbotModule()
local aimbot = ExunysDeveloperAimbot
aimbot.Settings.Enabled = false
aimbot.Settings.WallCheck = false
aimbot.Settings.Sensitivity = 1
aimbot.Settings.TeamCheck = false
LockPart = "Head"
aimbot.Settings.LockMode = 2



local ESPLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Exunys-ESP/main/src/ESP.lua"))()
ExunysDeveloperESP()
-- ESPLibrary and getgenv().ExunysDeveloperESP is equivalent.
local espm = ExunysDeveloperESP
espm.Settings.Enabled = false


local Toggle = AimTab:CreateToggle({
    Name = "Aimbot",
    CurrentValue = false,
    Flag = "AimbotToggle",
    Callback = function(Value)
        -- Enable or disable the aimbot based on the toggle value
        if Value then
            -- Enable the aimbot
            aimbot.Settings.Enabled = true
            Rayfield:Notify({
                Title = "Aimbot Enabled",
                Content = "Aimbot has been activated!",
                Duration = 6.5,
                Image = 4483362458,
            })
        else
            -- Disable the aimbot
            aimbot.Settings.Enabled = false
            Rayfield:Notify({
                Title = "Aimbot Disabled",
                Content = "Aimbot has been deactivated.",
                Duration = 6.5,
                Image = 4483362458,
            })
        end
    end,
})


local SensitivitySlider = AimTab:CreateSlider({
    Name = "Sensitivity",
    Range = {0, 10},
    Increment = 0.1,
    Suffix = "Bananas",
    CurrentValue = 1,
    Flag = "Slider6", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
    aimbot.Settings.Sensitivity = Value
    end
 })

 

 local RadiusSlider = AimTab:CreateSlider({
    Name = "Radius (May Break The aimbot)",
    Range = {60, 300},
    Increment = 1,
    Suffix = nil,
    CurrentValue = 90,
    Flag = "Slider7", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
    aimbot.FOVSettings.Radius = Value
    end
 })

 local Toggle = EspTab:CreateToggle({
    Name = "Esp",
    CurrentValue = false,
    Flag = "EspToggle",
    Callback = function(Value)
        -- Enable or disable the aimbot based on the toggle value
        if Value then
            -- Enable the aimbot
            espm.Settings.Enabled = true
            Rayfield:Notify({
                Title = "ESP Enabled",
                Content = "ESP has been activated!",
                Duration = 6.5,
                Image = 4483362458,
            })
        else
            -- Disable the aimbot
            espm.Settings.Enabled = false
            Rayfield:Notify({
                Title = "ESP Disabled",
                Content = "ESP has been deactivated.",
                Duration = 6.5,
                Image = 4483362458,
            })
        end
    end,
})



Window.ModifyTheme('Amethyst')
