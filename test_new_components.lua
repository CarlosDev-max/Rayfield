-- Test file for new Rayfield components
-- This file tests the new components: ProgressBar, RadioButtonGroup, CheckboxGroup, InternalTabs

debugX = true

-- Load the local Rayfield source instead of the remote one
local Rayfield = loadstring(readfile("source.lua"))()

local Window = Rayfield:CreateWindow({
   Name = "New Components Test",
   Icon = 0,
   LoadingTitle = "Testing New Components",
   LoadingSubtitle = "by CarlosDev-max",
   Theme = "Default",
   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true,
   ConfigurationSaving = {
      Enabled = false,
   },
})

local Tab = Window:CreateTab("Test Components", 4483362458)

local Section = Tab:CreateSection("Progress Bar Test")

local ProgressBar = Tab:CreateProgressBar({
   Name = "Test Progress",
   Value = 0.0,
   Callback = function(Value)
      print("Progress: " .. tostring(Value))
   end,
})

-- Test progress animation
task.spawn(function()
   for i = 0, 10 do
      task.wait(0.3)
      ProgressBar:Set(i / 10)
   end
   print("Progress bar test completed!")
end)

local Section2 = Tab:CreateSection("Radio Button Group Test")

local RadioButtonGroup = Tab:CreateRadioButtonGroup({
   Name = "Test Radio Buttons",
   Options = {"Option A", "Option B", "Option C"},
   CurrentOption = "Option A",
   Callback = function(SelectedOption)
      print("Radio selected: " .. SelectedOption)
   end,
})

local Section3 = Tab:CreateSection("Checkbox Group Test")

local CheckboxGroup = Tab:CreateCheckboxGroup({
   Name = "Test Checkboxes",
   Options = {"Check 1", "Check 2", "Check 3"},
   CurrentOptions = {"Check 1"},
   Callback = function(SelectedOptions)
      print("Checkboxes selected: " .. table.concat(SelectedOptions, ", "))
   end,
})

local Section4 = Tab:CreateSection("Internal Tabs Test")

local InternalTabs = Tab:CreateInternalTabs({
   Name = "Test Internal Tabs",
   Tabs = {"Tab 1", "Tab 2", "Tab 3"},
   CurrentTab = "Tab 1",
   Callback = function(SelectedTab)
      print("Internal tab selected: " .. SelectedTab)
   end,
})

print("All new components loaded successfully!")
print("Test file completed - check the Rayfield window for visual components")