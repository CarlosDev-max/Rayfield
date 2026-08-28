debugX = true

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Rayfield Example Window",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "by Sirius",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Tab Example", 4483362458) -- Title, Image

local Section = Tab:CreateSection("Section Example")

local Button = Tab:CreateButton({
   Name = "Button Example",
   Callback = function()
   -- The function that takes place when the button is pressed
   end,
})

-- New Components Examples

-- Progress Bar Example
local Section2 = Tab:CreateSection("New Components")

local ProgressBar = Tab:CreateProgressBar({
   Name = "Loading Progress",
   Value = 0.3, -- Initial value (0-1)
   Callback = function(Value)
      print("Progress changed to: " .. tostring(Value))
   end,
})

-- Simulate progress
task.spawn(function()
   for i = 0, 10 do
      task.wait(0.5)
      ProgressBar:Set(i / 10)
   end
end)

-- Radio Button Group Example
local RadioButtonGroup = Tab:CreateRadioButtonGroup({
   Name = "Select Difficulty",
   Options = {"Easy", "Medium", "Hard", "Expert"},
   CurrentOption = "Medium",
   Callback = function(SelectedOption)
      print("Selected difficulty: " .. SelectedOption)
   end,
})

-- Checkbox Group Example
local CheckboxGroup = Tab:CreateCheckboxGroup({
   Name = "Select Features",
   Options = {"Auto Farm", "Auto Collect", "Speed Hack", "Jump Hack"},
   CurrentOptions = {"Auto Farm"},
   Callback = function(SelectedOptions)
      print("Selected features: " .. table.concat(SelectedOptions, ", "))
   end,
})

-- Internal Tabs Example
local InternalTabs = Tab:CreateInternalTabs({
   Name = "Settings Categories",
   Tabs = {"General", "Advanced", "Experimental"},
   CurrentTab = "General",
   Callback = function(SelectedTab)
      print("Switched to tab: " .. SelectedTab)
   end,
})

Rayfield:LoadConfiguration()
