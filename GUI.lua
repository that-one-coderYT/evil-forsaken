local Players = game:GetService("Players")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Evil Forsaken",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "by Sirius",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

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


local Tab = Window:CreateTab("Player", 4483362458) -- Title, Image

local Section = Tab:CreateSection("Player")



local Slider = Tab:CreateSlider({
   Name = "WalkSpeed",
   Range = {1, 3},
   Increment = 0.5,
   Suffix = "WalkSpeed",
   CurrentValue = 1,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Values)
	local player = Players.LocalPlayer
    local Survivors = workspace:WaitForChild("Players"):WaitForChild("Survivors"):GetChildren()
	for _, Survivors in pairs(Survivors) do
		  if Survivors:getAttribute("Username") == player.Name then
			local speed = Survivors:WaitForChild("SpeedMultipliers")
			 speed:WaitForChild("Sprinting").Value = Values
		 
		  end
		  end
		

   end
   
})


local Tab = Window:CreateTab("Visual", 4483362458) -- Title, Image

local Toggle = Tab:CreateToggle({
   Name = "ESP",
   CurrentValue = false,
   Flag = "Toggle1", 
   Callback = function(Value)
   if Value then
     local player = Players.LocalPlayer
    local Survivors = workspace:WaitForChild("Players"):WaitForChild("Survivors"):GetChildren()
    local Killers = workspace:WaitForChild("Players"):WaitForChild("Killers"):GetChildren()
	for _, Survivor in pairs(Survivors) do
    if Survivor:GetAttribute("Username") == player.Name then
        local espbox = Instance.new("Highlight")
        espbox.Name = "ESP " .. Survivor.Name
        espbox.Parent = Survivor
        espbox.FillColor = Color3.fromRGB(0, 255, 0)
        espbox.OutlineTransparency = 1

        local BillboardGui = Instance.new("BillboardGui")
         BillboardGui.Parent = Survivor
        BillboardGui.Name = "BillboardGui"
        BillboardGui.AlwaysOnTop = true
        BillboardGui.Size = UDim2.new(0, 200, 0, 50)
        BillboardGui.ExtentsOffset = Vector3.new(0, 1, 0)

        local TextLabel = Instance.new("TextLabel")
         TextLabel.Parent = BillboardGui
        TextLabel.Name = "TextLabel"
        TextLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        TextLabel.Size = UDim2.new(0, 200, 0, 50)
        TextLabel.TextScaled = true
        TextLabel.BackgroundTransparency = 1
        TextLabel.Text = Survivor.Name
    end
      
   end
   for _, Killer in pairs(Killers) do
    if Killer:GetAttribute("Username") == player.Name then
        local espbox = Instance.new("Highlight")
        espbox.Name = "ESP " .. Killer.Name
        espbox.Parent = Killer
        espbox.FillColor = Color3.fromRGB(255, 0, 0)
        espbox.OutlineTransparency = 1

        local BillboardGui = Instance.new("BillboardGui")
         BillboardGui.Parent = Killer
        BillboardGui.Name = "BillboardGui"
        BillboardGui.AlwaysOnTop = true
        BillboardGui.Size = UDim2.new(0, 200, 0, 50)
        BillboardGui.ExtentsOffset = Vector3.new(0, 1, 0)

        local TextLabel = Instance.new("TextLabel")
         TextLabel.Parent = BillboardGui
        TextLabel.Name = "TextLabel"
        TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        TextLabel.Size = UDim2.new(0, 200, 0, 50)
        TextLabel.TextScaled = true
        TextLabel.BackgroundTransparency = 1
        TextLabel.Text = Killer.Name
    end
      
   end
else
    local player = Players.LocalPlayer
    local Survivors = workspace:WaitForChild("Players"):WaitForChild("Survivors"):GetChildren()
     local Killers = workspace:WaitForChild("Players"):WaitForChild("Killers"):GetChildren()
    for _, Survivor in pairs(Survivors) do
        if Survivor:FindFirstChild("ESP " .. Survivor.Name) then
            Survivor:FindFirstChild("ESP " .. Survivor.Name):Destroy()
        end
        if Survivor:FindFirstChild("BillboardGui") then
            Survivor:FindFirstChild("BillboardGui"):Destroy()
        end
    end

     for _, Killer in pairs(Killers) do
        if Killer:FindFirstChild("ESP " .. Killer.Name) then
            Killer:FindFirstChild("ESP " .. Killer.Name):Destroy()
        end
        if Killer:FindFirstChild("BillboardGui") then
            Killer:FindFirstChild("BillboardGui"):Destroy()
        end
    end
   end
   end
})
