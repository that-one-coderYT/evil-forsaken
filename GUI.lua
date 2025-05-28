local Players = game:GetService("Players")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Test",
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
	for _, survivor in pairs(Survivors) do
		  if survivor:getAttribute("Username") == player.Name then
			local speed = survivor:WaitForChild("SpeedMultipliers")
			 if speed:WaitForChild("SpeedStatus") then
          			speed:WaitForChild("SpeedStatus").Value = Values
			else
				local SpeedStatus = Instance.new("NumberValue")
			SpeedStatus.Name = "SpeedStatus"
			SpeedStatus.Value = Values
			SpeedStatus.Parent = speed 
			end
			
		  end
		

   end
   end
})
