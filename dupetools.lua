--UI setup
local plrUI = game:GetService("Players").LocalPlayer.PlayerGui

local base = Instance.new("ScreenGui",plrUI)
local bframe = Instance.new("Frame",base)
bframe.Size = UDim2.new(0.2,0,0.2,0)
bframe.Position = UDim2.new(0.5, 0, 0.5, 0)
bframe.BackgroundColor3 = Color3.new(0.239216, 0.239216, 0.239216)
bframe.BorderSizePixel = 0
local dragging = false
local dragStart = nil
local startPos = nil
local UIS = game:GetService("UserInputService")

bframe.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = bframe.Position
	end
end)

bframe.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		bframe.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

UIS.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)
local txtl = Instance.new('TextLabel',bframe)
txtl.Size = UDim2.new(1,0,0.2)
txtl.BackgroundColor3 = Color3.new(0.388235, 0.388235, 0.388235)
txtl.Text = "Dupe any items eqquipped! rev:1"
txtl.BorderSizePixel = 0
local btn = Instance.new("TextButton",bframe)
btn.Size = UDim2.new(1,0,0.2,0)
btn.BackgroundTransparency = 0.5
btn.BackgroundColor3 = Color3.new(1,1,1)
btn.Position = UDim2.new(0,0,0.7,0)
btn.Text = 'Dupe'
btn.BorderSizePixel = 0
local unloadbtn = Instance.new("TextButton",bframe)
unloadbtn.Size = UDim2.new(1,0,0.1,0)
unloadbtn.BackgroundColor3 = Color3.new(1,0,0)
unloadbtn.Text = 'Unload'
unloadbtn.Position = UDim2.new(0,0,0.9)
unloadbtn.BorderSizePixel = 0

-- Scripts
local backpack = game:GetService("Players").LocalPlayer.Backpack

btn.MouseButton1Up:Connect(function()
	local tools = backpack:GetChildren()
	local toolInSlot1 = nil
	game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid")
	local character = game:GetService("Players").LocalPlayer.Character
	
	-- Loop through all tools in the character (equipped tools)
	for _, tool in ipairs(character:GetChildren()) do
		if tool:IsA("Tool") and tool.Parent == character then
			toolInSlot1 = tool
			break
		end
	end
	local toolClone = toolInSlot1:Clone()
	toolClone.CanBeDropped = true
	toolClone.Parent = backpack
end)

unloadbtn.MouseButton1Up:Connect(function()
	base:Destroy()
end)
