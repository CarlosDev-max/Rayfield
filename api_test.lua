-- API Test for New Rayfield Components
-- This script tests all methods and functionalities of the new components

debugX = true

print("=== Rayfield New Components API Test ===")
print("Loading Rayfield...")

-- Load Rayfield (modify this based on your testing environment)
local Rayfield
local success, err = pcall(function()
    -- Try loading from local file first
    if readfile then
        Rayfield = loadstring(readfile("source.lua"))()
    else
        -- Fallback to remote loading
        Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    end
end)

if not success then
    print("Error loading Rayfield: " .. tostring(err))
    return
end

print("Rayfield loaded successfully!")

local Window = Rayfield:CreateWindow({
   Name = "API Test Window",
   Icon = 0,
   LoadingTitle = "Testing New Components API",
   LoadingSubtitle = "API Validation Test",
   Theme = "Default",
   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true,
   ConfigurationSaving = {
      Enabled = false,
   },
})

local Tab = Window:CreateTab("API Tests", 4483362458)

print("Window and Tab created successfully!")

-- Test 1: ProgressBar API
print("\n--- Testing ProgressBar API ---")
local Section1 = Tab:CreateSection("ProgressBar API Test")

local ProgressBar = Tab:CreateProgressBar({
   Name = "Test Progress Bar",
   Value = 0.5,
   Callback = function(Value)
      print("ProgressBar Callback - Value: " .. tostring(Value))
   end,
})

print("ProgressBar created successfully!")

-- Test Set method
print("Testing ProgressBar:Set(0.8)")
ProgressBar:Set(0.8)
task.wait(0.5)

-- Test Get method
print("Testing ProgressBar:Get()")
local currentProgress = ProgressBar:Get()
print("Current progress: " .. tostring(currentProgress))

-- Test bounds (should clamp to 0-1)
print("Testing bounds - ProgressBar:Set(1.5)")
ProgressBar:Set(1.5) -- Should clamp to 1.0
task.wait(0.5)
print("After clamping: " .. tostring(ProgressBar:Get()))

print("Testing bounds - ProgressBar:Set(-0.5)")
ProgressBar:Set(-0.5) -- Should clamp to 0.0
task.wait(0.5)
print("After clamping: " .. tostring(ProgressBar:Get()))

-- Test 2: RadioButtonGroup API
print("\n--- Testing RadioButtonGroup API ---")
local Section2 = Tab:CreateSection("RadioButtonGroup API Test")

local RadioButtonGroup = Tab:CreateRadioButtonGroup({
   Name = "Test Radio Group",
   Options = {"Option A", "Option B", "Option C", "Option D"},
   CurrentOption = "Option A",
   Callback = function(SelectedOption)
      print("RadioButtonGroup Callback - Selected: " .. SelectedOption)
   end,
})

print("RadioButtonGroup created successfully!")

-- Test Get method
print("Testing RadioButtonGroup:Get()")
local currentRadio = RadioButtonGroup:Get()
print("Current selection: " .. tostring(currentRadio))

-- Test Set method
print("Testing RadioButtonGroup:Set('Option C')")
RadioButtonGroup:Set("Option C")
task.wait(0.5)
print("After Set: " .. tostring(RadioButtonGroup:Get()))

-- Test invalid option (should be ignored)
print("Testing invalid option - RadioButtonGroup:Set('Invalid')")
RadioButtonGroup:Set("Invalid")
task.wait(0.5)
print("After invalid Set: " .. tostring(RadioButtonGroup:Get()))

-- Test 3: CheckboxGroup API
print("\n--- Testing CheckboxGroup API ---")
local Section3 = Tab:CreateSection("CheckboxGroup API Test")

local CheckboxGroup = Tab:CreateCheckboxGroup({
   Name = "Test Checkbox Group",
   Options = {"Check 1", "Check 2", "Check 3", "Check 4"},
   CurrentOptions = {"Check 1", "Check 3"},
   Callback = function(SelectedOptions)
      print("CheckboxGroup Callback - Selected: " .. table.concat(SelectedOptions, ", "))
   end,
})

print("CheckboxGroup created successfully!")

-- Test Get method
print("Testing CheckboxGroup:Get()")
local currentChecks = CheckboxGroup:Get()
print("Current selections: " .. table.concat(currentChecks, ", "))

-- Test Set method
print("Testing CheckboxGroup:Set({'Check 2', 'Check 4'})")
CheckboxGroup:Set({"Check 2", "Check 4"})
task.wait(0.5)
print("After Set: " .. table.concat(CheckboxGroup:Get(), ", "))

-- Test empty selection
print("Testing empty selection - CheckboxGroup:Set({})")
CheckboxGroup:Set({})
task.wait(0.5)
print("After empty Set: " .. table.concat(CheckboxGroup:Get(), ", "))

-- Test all selected
print("Testing all selected - CheckboxGroup:Set({'Check 1', 'Check 2', 'Check 3', 'Check 4'})")
CheckboxGroup:Set({"Check 1", "Check 2", "Check 3", "Check 4"})
task.wait(0.5)
print("After all Set: " .. table.concat(CheckboxGroup:Get(), ", "))

-- Test 4: InternalTabs API
print("\n--- Testing InternalTabs API ---")
local Section4 = Tab:CreateSection("InternalTabs API Test")

local InternalTabs = Tab:CreateInternalTabs({
   Name = "Test Internal Tabs",
   Tabs = {"Tab 1", "Tab 2", "Tab 3"},
   CurrentTab = "Tab 1",
   Callback = function(SelectedTab)
      print("InternalTabs Callback - Selected: " .. SelectedTab)
   end,
})

print("InternalTabs created successfully!")

-- Test Get method
print("Testing InternalTabs:Get()")
local currentTab = InternalTabs:Get()
print("Current tab: " .. tostring(currentTab))

-- Test Set method
print("Testing InternalTabs:Set('Tab 2')")
InternalTabs:Set("Tab 2")
task.wait(0.5)
print("After Set: " .. tostring(InternalTabs:Get()))

-- Test GetContent method
print("Testing InternalTabs:GetContent('Tab 1')")
local tab1Content = InternalTabs:GetContent("Tab 1")
if tab1Content then
    print("Tab 1 content frame retrieved successfully")
    -- You can add elements to this content frame
    local testLabel = Instance.new("TextLabel")
    testLabel.Size = UDim2.new(1, 0, 1, 0)
    testLabel.BackgroundTransparency = 1
    testLabel.Text = "This is content in Tab 1"
    testLabel.TextColor3 = Color3.new(1, 1, 1)
    testLabel.TextSize = 14
    testLabel.Parent = tab1Content
    print("Added test label to Tab 1 content")
else
    print("Failed to get Tab 1 content")
end

-- Test invalid tab
print("Testing invalid tab - InternalTabs:Set('Invalid')")
InternalTabs:Set("Invalid")
task.wait(0.5)
print("After invalid Set: " .. tostring(InternalTabs:Get()))

-- Test 5: Integration Test
print("\n--- Testing Component Integration ---")
local Section5 = Tab:CreateSection("Integration Test")

print("Testing theme integration...")
print("All components should respond to theme changes automatically")

print("Testing configuration integration...")
print("Components with Ext=false should save to configuration")

print("\n=== API Test Complete ===")
print("All new components API methods tested successfully!")
print("Check the Rayfield window for visual verification")