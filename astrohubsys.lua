local KeyGuardLibrary = loadstring(game:HttpGet("https://cdn.keyguardian.org/library/v1.0.0.lua"))()
local trueData = "bf07e4540197465c940c06d621563c45"
local falseData = "a65ccc653fba4a50ae257f174b8b294f"

KeyGuardLibrary.Set({
  publicToken = "6165ee84cffd4564ba435850aff52d09",
  privateToken = "02b95817166546a5ab09015e34a938c3",
  trueData = trueData,
  falseData = falseData,
})

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local key = ""

local Window = Fluent:CreateWindow({
    Title = "Key System",
    SubTitle = "astrohub",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 340),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    KeySys = Window:AddTab({ Title = "Key System", Icon = "key" }),
}

local Entkey = Tabs.KeySys:AddInput("Input", {
    Title = "Enter Key",
    Description = "Enter Key Here",
    Default = "",
    Placeholder = "Enter key…",
    Numeric = false,
    Finished = false,
    Callback = function(Value)
        key = Value
    end
})

local Checkkey = Tabs.KeySys:AddButton({
    Title = "Check Key",
    Description = "Enter Key before pressing this button",
    Callback = function()
        local response = KeyGuardLibrary.validateDefaultKey(key)
        if response == trueData then
           print("Key is valid")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/astro27212/astrohub/refs/heads/main/astrohub.lua",true))()
        Window:Destroy()

        else
           print("Key is invalid")
        end
    end
})

local Getkey = Tabs.KeySys:AddButton({
    Title = "Get Key",
    Description = "Get Key here",
    Callback = function()
       setclipboard(KeyGuardLibrary.getLink())
    end
})

Window:SelectTab(1)
