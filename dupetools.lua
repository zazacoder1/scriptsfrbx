--UI setup
local plrUI = game:GetService("Players").LocalPlayer.PlayerGui

local base = Instance.new("ScreenGui",plrUI)
local bframe = Instance.new("Frame",base)
bframe.Size = UDim2.new(0.2,0,0.2,0)
bframe.Position = UDim2.new(0.5, 0, 0.5, 0)
local c1 = Instance.new("UICorner",bframe)
c1.CornerRadius = UDim.new(0,20)
local txtl = Instance.new('TextLabel',bframe)
Instance.new("UICorner",txtl).CornerRadius = UDim.new(0,20)
txtl.Size = UDim2.new(0.7,0,0.3)
txtl.BackgroundTransparency = 1
txtl.Text = "Dupe any items on slot 1!"
txtl.Position = UDim2.new(0.15,0,0,0)
local btn = Instance.new("TextButton",bframe)
btn.Size = UDim2.new(0.7,0,0.4,0)
btn.BackgroundTransparency = 0.5
btn.BackgroundColor3 = Color3.new(1,1,1)
btn.Position = UDim2.new(0.1,0,0.6,0)
Instance.new("UICorner",btn).CornerRadius = UDim.new(0,20)
local unloadbtn = Instance.new("TextButton",bframe)
unloadbtn.Size = UDim2.new(0.15,0,0.07,0)
unloadbtn.BackgroundColor3 = Color3.new(1,0,0)
unloadbtn.Text = 'Unload'
unloadbtn.Position = UDim2.new(0,0,0.4)


-- Scripts
local backpack = game:GetService("Players").LocalPlayer.Backpack

btn.MouseButton1Up:Connect(function()
	local tools = backpack:GetChildren()
	if tools[1] and tools[1]:IsA("Tool") then
		local toolClone = tools[1]:Clone()
		toolClone.Parent = backpack
	end
end)

unloadbtn.MouseButton1Up:Connect(function()
	base:Destroy()
end)