--UI setup
local plrUI = game:GetService("Players").LocalPlayer.PlayerGui
-- MainUi
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
local infr = false
local mv = false

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
txtl.Size = UDim2.new(0.9,0,0.2)
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
local morebtn = Instance.new('ImageButton',bframe)
morebtn.Size = UDim2.new(0.2,0,0.2,0)
Instance.new("UIAspectRatioConstraint",morebtn)
morebtn.Image = 'rbxassetid://1921781866'
morebtn.BackgroundColor3 = Color3.new(0.301961, 0.301961, 0.301961)
morebtn.BorderSizePixel = 0
morebtn.Position = UDim2.new(0.9,0,0,0)
Instance.new('UICorner',morebtn).CornerRadius = UDim.new(0,20)
-- AdditionalUi

local aframe = Instance.new('Frame',bframe)
aframe.Size = UDim2.new(0.7,0,1,0)
aframe.BackgroundColor3 = Color3.new(0.223529, 0.223529, 0.223529)
aframe.BorderSizePixel = 0
aframe.ZIndex = -1
local atxt = Instance.new('TextLabel',aframe)
atxt.Size = UDim2.new(1,0,0.2)
atxt.BackgroundColor3 = Color3.new(0.388235, 0.388235, 0.388235)
atxt.Text = "Additional Scripts"
atxt.BorderSizePixel = 0
atxt.ZIndex = -1
local scrframe = Instance.new('ScrollingFrame',aframe)
scrframe.ZIndex = -1
scrframe.Size = UDim2.new(1,0,0.8)
scrframe.Position = UDim2.new(0,0,0.2)
scrframe.BackgroundColor3 = Color3.new(0.282353, 0.282353, 0.282353)
scrframe.BorderSizePixel = 0
local uigrid = Instance.new('UIGridLayout',scrframe)
uigrid.CellSize = UDim2.new(1,0,0.1)

local style = {
	-1,
	UDim2.new(1,0,0.1),
	Color3.new(0.458824, 0.458824, 0.458824),
	0
}
local scripts = {
	{'doesn work awe','https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'},
	{'doesn work awe', 'https://raw.githubusercontent.com/AlterX404/DarkDEX-V5/refs/heads/main/DarkDEX-V5'}
}

for i,v in pairs(scripts) do
	local scb = Instance.new('TextButton',scrframe)
	scb.ZIndex = style[1]
	scb.Size = style[2]
	scb.BackgroundColor3 = style[3]
	scb.BorderSizePixel = style[4]
	scb.Text = v[1]
end



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
	print(toolClone)
end)

unloadbtn.MouseButton1Up:Connect(function()
	base:Destroy()
end)

morebtn.MouseButton1Up:Connect(function()
	local tws =  game:GetService("TweenService")
	local addtf = tws:Create(aframe,TweenInfo.new(3,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Position = UDim2.new(1,0,0,0)})
	local addtb = tws:Create(aframe,TweenInfo.new(3,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Position = UDim2.new(0,0,0,0)})
	
	local mbtnrf = tws:Create(morebtn,TweenInfo.new(3,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Rotation = 180})
	local mbtnrb = tws:Create(morebtn,TweenInfo.new(3,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Rotation = 0})
	
	if infr == false then
		addtf:Play()
		mbtnrf:Play()
		
		mv = true
		addtf.Completed:Wait()
		mv = false
		infr = true
	else
		addtb:Play()
		mbtnrb:Play()
		
		mv = true
		addtb.Completed:Wait()
		mv = false
		infr = false
	end
end)


