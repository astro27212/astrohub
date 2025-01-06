
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()


local Window = Rayfield:CreateWindow({
   Name = "Astros Hub | Rivals 🔫",
   LoadingTitle = "🔫 Astro hub 💥",
   LoadingSubtitle = "by a261",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "astrohub"
   },
   Discord = {
      Enabled = true,
      Invite = "qxJGZzySGa", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = false -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Key | Astro Hub",
      Subtitle = "Key System",
      Note = "Get Key from a261",
      FileName = "astrohubkey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"astroisthebest"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("🏠 Home", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "You executed the script",
   Content = "Astro HUB",
   Duration = 5,
   Image = 13047715178,
   Actions = { -- Notification Buttons
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
       --Toggles the infinite jump between on or off on every script run
_G.infinjump = not _G.infinjump

if _G.infinJumpStarted == nil then
	--Ensures this only runs once to save resources
	_G.infinJumpStarted = true
	
	--Notifies readiness
	game.StarterGui:SetCore("SendNotification", {Title="Astro Hub"; Text="Infinite Jump Activated!"; Duration=5;})

	--The actual infinite jump
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
   Flag = "sliderws", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
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
   Flag = "sliderjp", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
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
            -- Unload ESP (remove drawings)
            if espScript then
                espScript:Remove()
                espScript = nil
            end
            espEnabled = false
        else
            -- Load ESP
            espScript = loadstring(game:HttpGet("https://pastebin.com/raw/s7viVmDR"))()
            espEnabled = true
        end
    end,
})




local Button = MainTab:CreateButton({
   Name = "Triggerbot",
   Callback = function()
       -- Instructions: To enable the triggerbot, press E, to change the keybind go down to instruction 2.

       -- // Variables \ --

       _G.triggerbot = false

       local player = game:GetService("Players").LocalPlayer
       local mouse = player:GetMouse()

       local Clicked = false
       local UserInputService = game:GetService("UserInputService")

       -- Function to toggle triggerbot and display notification
       local function toggleTriggerbot()
           _G.triggerbot = not _G.triggerbot
           Rayfield:Notify({
               Title = "Triggerbot Status",
               Content = "Triggerbot is now " .. (_G.triggerbot and "ON" or "OFF"),
               Duration = 6.5, -- Notification lasts for 6.5 seconds
               Image = 4483362458, -- Change this to an appropriate image ID if needed
           })
       end

       -- // Side Scripts \ --

       UserInputService.InputBegan:Connect(function(Input, GameProcessedEvent)
           if GameProcessedEvent then
               return
           end

           if Input.KeyCode == Enum.KeyCode.E then
               toggleTriggerbot()
           end
       end)

       -- // Main Scripts \ --

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
local speed = 50 -- Flying speed
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local camera = workspace.CurrentCamera
local bodyGyro, bodyVelocity
local userInputService = game:GetService("UserInputService")
local connection

-- Variable to hold current velocity and direction
local moveDirection = Vector3.new(0, 0, 0)

local Button = MainTab:CreateButton({
   Name = "Toggle Flying",
   Callback = function()
       -- Function to start flying
       local function startFlying()
           if not flying then
               flying = true

               -- Create BodyGyro and BodyVelocity
               bodyGyro = Instance.new("BodyGyro")
               bodyGyro.MaxTorque = Vector3.new(400000, 400000, 400000)
               bodyGyro.CFrame = humanoidRootPart.CFrame
               bodyGyro.Parent = humanoidRootPart

               bodyVelocity = Instance.new("BodyVelocity")
               bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)
               bodyVelocity.Velocity = Vector3.new(0, 0, 0) -- Initially no velocity
               bodyVelocity.Parent = humanoidRootPart

               -- Notify that flying is enabled
               Rayfield:Notify({
                   Title = "Flying Enabled",
                   Content = "You are now flying!",
                   Duration = 4,
                   Image = 4483362458, -- Use the default image or change to your preferred one
               })

               -- Connection to update flight movement
               connection = game:GetService("RunService").RenderStepped:Connect(function()
                   -- Listen for movement input (WASD or arrow keys)
                   moveDirection = Vector3.new(0, 0, 0)

                   if userInputService:IsKeyDown(Enum.KeyCode.W) then
                       moveDirection = moveDirection + camera.CFrame.LookVector -- Move forward in camera direction
                   end
                   if userInputService:IsKeyDown(Enum.KeyCode.S) then
                       moveDirection = moveDirection - camera.CFrame.LookVector -- Move backward in camera direction
                   end
                   if userInputService:IsKeyDown(Enum.KeyCode.A) then
                       moveDirection = moveDirection - camera.CFrame.RightVector -- Move left
                   end
                   if userInputService:IsKeyDown(Enum.KeyCode.D) then
                       moveDirection = moveDirection + camera.CFrame.RightVector -- Move right
                   end

                   -- Add movement for vertical direction
                   if userInputService:IsKeyDown(Enum.KeyCode.Space) then
                       moveDirection = moveDirection + Vector3.new(0, 1, 0) -- Move up
                   elseif userInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                       moveDirection = moveDirection - Vector3.new(0, 1, 0) -- Move down
                   end

                   -- Apply movement direction to BodyVelocity
                   if moveDirection.Magnitude > 0 then
                       bodyVelocity.Velocity = moveDirection.Unit * speed
                   else
                       bodyVelocity.Velocity = Vector3.zero
                   end
               end)
           end
       end

       -- Function to stop flying
       local function stopFlying()
           if flying then
               flying = false

               -- Disconnect the RenderStepped connection
               if connection then
                   connection:Disconnect()
                   connection = nil
               end

               -- Remove BodyGyro and BodyVelocity
               if bodyGyro then
                   bodyGyro:Destroy()
                   bodyGyro = nil
               end
               if bodyVelocity then
                   bodyVelocity:Destroy()
                   bodyVelocity = nil
               end

               -- Notify that flying is disabled
               Rayfield:Notify({
                   Title = "Flying Disabled",
                   Content = "You are no longer flying.",
                   Duration = 4,
                   Image = 4483362458, -- Use the default image or change to your preferred one
               })
           end
       end

       -- Toggle flying on and off
       if flying then
           stopFlying()
       else
           startFlying()
       end
   end,
})







