local NEVERWIN = {}
local LocalPlayer = game:GetService('Players').LocalPlayer;
local Mouse = LocalPlayer:GetMouse();
local InputService = game:GetService('UserInputService');
local TextService = game:GetService('TextService');
local TweenService = game:GetService('TweenService');
local CoreGui = game:FindFirstChild('CoreGui') or LocalPlayer.PlayerGui;

local ProtectGui = protectgui or (syn and syn.protect_gui) or (function() end);

local function cretate_button(asd)
	local button=Instance.new('TextButton')
	button.Size=UDim2.new(1,0,1,0)
	button.BackgroundTransparency=1
	button.TextTransparency=1
	button.Text=""
	button.Parent=asd
	button.ZIndex=9999999
	return button
end

local function scrolling_connect(scrollframe:ScrollingFrame)
	local UIListLayout:UIListLayout = scrollframe:WaitForChild('UIListLayout',9999999)
	scrollframe.CanvasSize=UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y)

	UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
		scrollframe.CanvasSize=UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y)
	end)
end

function NEVERWIN:AddWindow(WindowNameString,Title_str,cinfisize)
	local WindowFunctinos={}
	local ToggleUI=false
	local ooldsize=cinfisize or UDim2.new(0.200000003, 200, 0.200000003, 175)
	local Tabs={}
	local ScreenGui = Instance.new("ScreenGui")
	local Window = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Outline = Instance.new("Frame")
	local Outline_2 = Instance.new("Frame")
	local Blackground = Instance.new("Frame")
	local Outline_3 = Instance.new("Frame")
	local Profile = Instance.new("Frame")
	local ImageProfile = Instance.new("ImageLabel")
	local UICorner_2 = Instance.new("UICorner")
	local ProfileName = Instance.new("TextLabel")
	local WindowName = Instance.new("TextLabel")
	local TabButtons = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local Title
	local Movebar = Instance.new("Frame")
	local oldpocloe=nil
	local function get_window_loadpos()
		return UDim2.new(0.5,0,0.5,0)
	end

	if Title_str then
		Title = Instance.new("TextLabel")

		Title.Name = "Title"
		Title.Parent = Window
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1.000
		Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title.BorderSizePixel = 0
		Title.Position = UDim2.new(0.239, 0, -0.064, 0)
		Title.Size = UDim2.new(0.665544629, 0, 0.0604198128, 0)
		Title.ZIndex = 4
		Title.Font = Enum.Font.SourceSansBold
		Title.Text = Title_str or"BLADE BALL"
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextScaled = true
		Title.TextSize = 14.000
		Title.TextStrokeColor3 = Color3.fromRGB(25, 90, 128)
		Title.TextStrokeTransparency = 0.560
		Title.TextTransparency = 0.170
		Title.TextWrapped = true
		Title.TextXAlignment = Enum.TextXAlignment.Left

		TweenService:Create(Title,TweenInfo.new(.76,Enum.EasingStyle.Quint),{Position=UDim2.new(0.23886615, 0, 0.0406281464, 0)}):Play()


	end

	local close_buton = Instance.new("ImageLabel")

	local toggle_valu = true

	local function ui_toggleong(val)

		for i,v in ipairs(Tabs) do
			pcall(function()
				v[3](val)
			end)
		end

		if val then

			Movebar.Size=UDim2.new(1,0,0.1,0)
			Movebar.Position=UDim2.new(0,0,0,0)
			TweenService:Create(Window,TweenInfo.new(0.5),{BackgroundTransparency=0.1,Size=ooldsize,Position=get_window_loadpos()}):Play()
			TweenService:Create(TabButtons,TweenInfo.new(1.3,Enum.EasingStyle.Quint),{Position=UDim2.new(0.004, 0,0.129, 0)}):Play()
			TweenService:Create(WindowName,TweenInfo.new(.85,Enum.EasingStyle.Quint),{Position=UDim2.new(0.009, 0,0.019, 0),Size=UDim2.new(0.193292543, 0, 0.110772289, 0)}):Play()
			TweenService:Create(Outline,TweenInfo.new(3,Enum.EasingStyle.Quint),{BackgroundTransparency=0}):Play()
			TweenService:Create(Outline_2,TweenInfo.new(3,Enum.EasingStyle.Quint),{BackgroundTransparency=0}):Play()
			TweenService:Create(Outline_3,TweenInfo.new(3,Enum.EasingStyle.Quint),{BackgroundTransparency=0}):Play()
			TweenService:Create(ImageProfile,TweenInfo.new(1.5,Enum.EasingStyle.Quint),{ImageTransparency=0}):Play()
			TweenService:Create(ProfileName,TweenInfo.new(1.9,Enum.EasingStyle.Quint),{TextTransparency=0}):Play()
			TweenService:Create(Blackground,TweenInfo.new(1,Enum.EasingStyle.Quint),{BackgroundTransparency=0}):Play()
			if Title then
				TweenService:Create(Title,TweenInfo.new(.76,Enum.EasingStyle.Quint),{Position=UDim2.new(0.23886615, 0, 0.0406281464, 0)}):Play()

			end

			TweenService:Create(close_buton,TweenInfo.new(1.5),{Position=UDim2.new(0.940999985, 0, 0.0410000011, 0)}):Play()
		else
			if Title then
				TweenService:Create(Title,TweenInfo.new(.76,Enum.EasingStyle.Quint),{Position=UDim2.new(0.239, 0, -0.064, 0)}):Play()

			end

			Movebar.Size=UDim2.new(1.1,0,1.1,0)
			Movebar.Position=UDim2.new(0,0,-0.1,0)

			TweenService:Create(Window,TweenInfo.new(0.5),{BackgroundTransparency=0.1,Size=UDim2.new(0.1,0,0.1,0),Position=(oldpocloe or Window.Position)}):Play()
			TweenService:Create(TabButtons,TweenInfo.new(1.3,Enum.EasingStyle.Quint),{Position=UDim2.new(-.2, 0, 0.129449874, 0)}):Play()
			TweenService:Create(WindowName,TweenInfo.new(.85,Enum.EasingStyle.Quint),{Position=UDim2.new(0.05, 0,0.1, 0),Size=UDim2.new(0.9,0,0.7,0)}):Play()
			TweenService:Create(Outline,TweenInfo.new(1,Enum.EasingStyle.Quint),{BackgroundTransparency=1}):Play()
			TweenService:Create(Outline_2,TweenInfo.new(1,Enum.EasingStyle.Quint),{BackgroundTransparency=1}):Play()
			TweenService:Create(Outline_3,TweenInfo.new(1,Enum.EasingStyle.Quint),{BackgroundTransparency=1}):Play()
			TweenService:Create(ImageProfile,TweenInfo.new(.6,Enum.EasingStyle.Quint),{ImageTransparency=1}):Play()
			TweenService:Create(ProfileName,TweenInfo.new(.5,Enum.EasingStyle.Quint),{TextTransparency=1}):Play()
			TweenService:Create(Blackground,TweenInfo.new(1,Enum.EasingStyle.Quint),{BackgroundTransparency=1}):Play()

			TweenService:Create(close_buton,TweenInfo.new(0.4),{Position=UDim2.new(1,1,-1,1)}):Play()


		end
	end

	close_buton.Name = "close_buton"
	close_buton.Parent = Window
	close_buton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	close_buton.BackgroundTransparency = 1.000
	close_buton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	close_buton.BorderSizePixel = 0
	close_buton.Position = UDim2.new(0.940999985, 0, 0.0410000011, 0)
	close_buton.Size = UDim2.new(0.0500000007, 0, 0.0500000007, 0)
	close_buton.SizeConstraint = Enum.SizeConstraint.RelativeYY
	close_buton.ZIndex = 4
	close_buton.Image = "rbxassetid://10002398990"
	close_buton.ImageTransparency=1

	TweenService:Create(close_buton,TweenInfo.new(1),{ImageTransparency=0}):Play()

	cretate_button(close_buton).MouseButton1Click:Connect(function()
		toggle_valu=not toggle_valu
		ui_toggleong(toggle_valu)
	end)

	cretate_button(WindowName).MouseButton1Click:Connect(function()
		if not toggle_valu then
			oldpocloe=Window.Position
			toggle_valu=not toggle_valu
			ui_toggleong(toggle_valu)
		end
	end)

	ScreenGui.Parent = CoreGui
	ScreenGui.ResetOnSpawn = false
	ScreenGui.IgnoreGuiInset = true
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
	ProtectGui(ScreenGui)

	Window.Name = "Window"
	Window.Parent = ScreenGui
	Window.AnchorPoint = Vector2.new(0.5, 0.5)
	Window.BackgroundColor3 = Color3.fromRGB(4, 12, 49)
	Window.BackgroundTransparency = 0.100
	Window.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Window.BorderSizePixel = 0
	Window.Position = UDim2.new(0.5, 0, 0.5, 0)
	Window.Size = UDim2.new(0, 0, 0, 0)
	Window.Active=true
	Window.ClipsDescendants=true
	Window.BackgroundTransparency=1
	UICorner.CornerRadius = UDim.new(0, 5)
	UICorner.Parent = Window

	Outline.Name = "Outline"
	Outline.Parent = Window
	Outline.BackgroundColor3 = Color3.fromRGB(12, 36, 64)
	Outline.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Outline.BorderSizePixel = 0
	Outline.Position = UDim2.new(0.211745456, 0, 0.129820809, 0)
	Outline.Size = UDim2.new(0.787999988, 0, 0, 2)
	Outline.ZIndex = 4
	Outline.BackgroundTransparency=1
	Outline_2.Name = "Outline"
	Outline_2.Parent = Window
	Outline_2.AnchorPoint = Vector2.new(0, 0.5)
	Outline_2.BackgroundColor3 = Color3.fromRGB(12, 36, 64)
	Outline_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Outline_2.BorderSizePixel = 0
	Outline_2.Position = UDim2.new(0.210999995, 0, 0.5, 0)
	Outline_2.Size = UDim2.new(0, 2, 1, 0)
	Outline_2.ZIndex = 4
	Outline_2.BackgroundTransparency=1
	Blackground.Name = "Blackground"
	Blackground.Parent = Window
	Blackground.BackgroundColor3 = Color3.fromRGB(7, 10, 19)
	Blackground.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Blackground.BorderSizePixel = 0
	Blackground.Position = UDim2.new(0.211745515, 0, 0, 0)
	Blackground.Size = UDim2.new(0.787999988, 0, 1.00000012, 0)
	Blackground.ZIndex = 2
	Blackground.BackgroundTransparency=1
	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0, 7)
	UICorner.Parent = Blackground
	Outline_3.Name = "Outline"
	Outline_3.Parent = Window
	Outline_3.BackgroundColor3 = Color3.fromRGB(12, 36, 64)
	Outline_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Outline_3.BorderSizePixel = 0
	Outline_3.Position = UDim2.new(-0.00133972871, 0, 0.891557455, 0)
	Outline_3.Size = UDim2.new(0.215000004, 0, 0, 2)
	Outline_3.ZIndex = 4
	Outline_3.BackgroundTransparency=1
	Profile.Name = "Profile"
	Profile.Parent = Window
	Profile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Profile.BackgroundTransparency = 1.000
	Profile.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Profile.BorderSizePixel = 0
	Profile.Position = UDim2.new(0.00180183584, 0, 0.893806398, 0)
	Profile.Size = UDim2.new(0.209943637, 0, 0.106193647, 0)

	ImageProfile.Name = "ImageProfile"
	ImageProfile.Parent = Profile
	ImageProfile.AnchorPoint = Vector2.new(0, 0.5)
	ImageProfile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageProfile.BackgroundTransparency = 1.000
	ImageProfile.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ImageProfile.BorderSizePixel = 0
	ImageProfile.Position = UDim2.new(0.0410000011, 0, 0.5, 0)
	ImageProfile.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
	ImageProfile.SizeConstraint = Enum.SizeConstraint.RelativeYY
	ImageProfile.Image = game:GetService('Players'):GetUserThumbnailAsync(LocalPlayer.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size150x150)
	ImageProfile.ImageTransparency=1
	UICorner_2.CornerRadius = UDim.new(0.5, 0)
	UICorner_2.Parent = ImageProfile

	ProfileName.Name = "ProfileName"
	ProfileName.Parent = Profile
	ProfileName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ProfileName.BackgroundTransparency = 1.000
	ProfileName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ProfileName.BorderSizePixel = 0
	ProfileName.Position = UDim2.new(0.424550563, 0, 0.247608379, 0)
	ProfileName.Size = UDim2.new(0.530813158, 0, 0.49999997, 0)
	ProfileName.Font = Enum.Font.SourceSansSemibold
	ProfileName.Text = LocalPlayer.DisplayName or "LEVERWIN"
	ProfileName.TextColor3 = Color3.fromRGB(255, 255, 255)
	ProfileName.TextScaled = true
	ProfileName.TextSize = 14.000
	ProfileName.TextWrapped = true
	ProfileName.TextXAlignment = Enum.TextXAlignment.Left
	ProfileName.TextTransparency=1

	WindowName.Name = "WindowName"
	WindowName.Parent = Window
	WindowName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	WindowName.BackgroundTransparency = 1.000
	WindowName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	WindowName.BorderSizePixel = 0
	WindowName.Position = UDim2.new(0.0090818312, 0, -.5, 0)
	WindowName.Size = UDim2.new(0.193292543, 0, 0.110772289, 0)
	WindowName.ZIndex = 4
	WindowName.Font = Enum.Font.SourceSansBold
	WindowName.Text = WindowNameString or "LEVERWIN"
	WindowName.TextColor3 = Color3.fromRGB(255, 255, 255)
	WindowName.TextScaled = true
	WindowName.TextSize = 14.000
	WindowName.TextStrokeColor3 = Color3.fromRGB(25, 90, 128)
	WindowName.TextStrokeTransparency = 0.000
	WindowName.TextWrapped = true

	TabButtons.Name = "TabButtons"
	TabButtons.Parent = Window
	TabButtons.Active = true
	TabButtons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabButtons.BackgroundTransparency = 1.000
	TabButtons.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabButtons.BorderSizePixel = 0
	TabButtons.Position = UDim2.new(-.2, 0, 0.129449874, 0)
	TabButtons.Size = UDim2.new(0.200000003, 0, 0.744255602, 0)
	TabButtons.ZIndex = 3
	TabButtons.ScrollBarThickness = 1

	UIListLayout.Parent = TabButtons
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 2)

	scrolling_connect(TabButtons)

	function WindowFunctinos:AddTabLabel(NAME)
		local TabLabel = Instance.new("TextLabel")
		local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

		TabLabel.Name = "TabLabel"
		TabLabel.Parent = TabButtons
		TabLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabLabel.BackgroundTransparency = 1.000
		TabLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabLabel.BorderSizePixel = 0
		TabLabel.Size = UDim2.new(0.850000024, 0, 0.5, 0)
		TabLabel.Font = Enum.Font.SourceSansBold
		TabLabel.Text = NAME or "Tab Label"
		TabLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabLabel.TextScaled = true
		TabLabel.TextSize = 14.000
		TabLabel.TextTransparency = 0.800
		TabLabel.TextWrapped = true
		TabLabel.TextXAlignment = Enum.TextXAlignment.Left

		UIAspectRatioConstraint.Parent = TabLabel
		UIAspectRatioConstraint.AspectRatio = 8.000
		UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

		local llr={}

		function llr:Text(a)
			TabLabel.Text = a or "Tab Label"
		end

		return llr
	end

	function WindowFunctinos:AddTab(TAB_NAME,icon)
		local TabAssets={}

		local TabButton = Instance.new("Frame")
		local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
		local UICorner = Instance.new("UICorner")
		local lin = Instance.new("ImageLabel")
		local UICorner_2 = Instance.new("UICorner")
		local TextLabel = Instance.new("TextLabel")

		TabButton.Name = "TabButton"
		TabButton.Parent = TabButtons
		TabButton.BackgroundColor3 = Color3.fromRGB(1, 66, 106)
		TabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabButton.BorderSizePixel = 0
		TabButton.Size = UDim2.new(0.925000012, 0, 0.5, 0)
		TabButton.ZIndex = 3

		UIAspectRatioConstraint.Parent = TabButton
		UIAspectRatioConstraint.AspectRatio = 4.500
		UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

		UICorner.CornerRadius = UDim.new(0, 3)
		UICorner.Parent = TabButton

		lin.Name = "lin"
		lin.Parent = TabButton
		lin.AnchorPoint = Vector2.new(0, 0.5)
		lin.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		lin.BackgroundTransparency = 1.000
		lin.BorderColor3 = Color3.fromRGB(0, 0, 0)
		lin.BorderSizePixel = 0
		lin.Position = UDim2.new(0.0330967419, 0, 0.5, 0)
		lin.Size = UDim2.new(0.699999988, 0, 0.699999988, 0)
		lin.SizeConstraint = Enum.SizeConstraint.RelativeYY
		lin.ZIndex = 4
		lin.Image = icon or "http://www.roblox.com/asset/?id=10088146939"
		lin.ImageColor3 = Color3.fromRGB(21, 191, 253)
		lin.ScaleType = Enum.ScaleType.Fit

		UICorner_2.CornerRadius = UDim.new(0, 5)
		UICorner_2.Parent = lin

		TextLabel.Parent = TabButton
		TextLabel.AnchorPoint = Vector2.new(0, 0.5)
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.BorderSizePixel = 0
		TextLabel.Position = UDim2.new(0.26699999, 0, 0.5, 0)
		TextLabel.Size = UDim2.new(0.73299998, 0, 0.600000024, 0)
		TextLabel.ZIndex = 5
		TextLabel.Font = Enum.Font.SourceSansBold
		TextLabel.Text = TAB_NAME or "Legitbot"
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextScaled = true
		TextLabel.TextSize = 14.000
		TextLabel.TextWrapped = true
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left

		local Tab = Instance.new("Frame")
		local Left = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")
		local Right = Instance.new("ScrollingFrame")
		local UIListLayout_2 = Instance.new("UIListLayout")

		Tab.Name = "Tab"
		Tab.Parent = Window
		Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Tab.BackgroundTransparency = 1.000
		Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Tab.BorderSizePixel = 0
		Tab.Position = UDim2.new(0.998, 0, 0.153999999, 0)
		Tab.Size = UDim2.new(0.745000005, 0, 0.819000006, 0)
		Tab.ZIndex = 5

		Left.Name = "Left"
		Left.Parent = Tab
		Left.Active = true
		Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Left.BackgroundTransparency = 1.000
		Left.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Left.BorderSizePixel = 0
		Left.Position = UDim2.new(0, 0, 1.75896901e-07, 0)
		Left.Size = UDim2.new(0.485404283, 0, 0.979999959, 0)
		Left.ZIndex = 5
		Left.ScrollBarThickness = 1
		Left.ScrollBarImageColor3=Color3.fromRGB(18, 55, 97)
		UIListLayout.Parent = Left
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 2)

		Right.Name = "Right"
		Right.Parent = Tab
		Right.Active = true
		Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Right.BackgroundTransparency = 1.000
		Right.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Right.BorderSizePixel = 0
		Right.Position = UDim2.new(0.506338239, 0, 1.75896901e-07, 0)
		Right.Size = UDim2.new(0.492659718, 0, 0.980000019, 0)
		Right.ZIndex = 5
		Right.ScrollBarThickness = 1
		Right.ScrollBarImageColor3=Color3.fromRGB(18, 55, 97)

		UIListLayout_2.Parent = Right
		UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.Padding = UDim.new(0, 2)

		TweenService:Create(Tab,TweenInfo.new(1,Enum.EasingStyle.Quint),{Position=UDim2.new(0.238000005, 0, 0.153999999, 0)}):Play()

		scrolling_connect(Right)
		scrolling_connect(Left)

		local function tabcallback(va)
			if va then
				TweenService:Create(TabButton,TweenInfo.new(0.1),{BackgroundTransparency=0}):Play()
				Tab.Visible=true
			else
				TweenService:Create(TabButton,TweenInfo.new(0.1),{BackgroundTransparency=1}):Play()
				Tab.Visible=false
			end
		end

		local function tab_toggle(val)
			if val then

				TweenService:Create(Tab,TweenInfo.new(.9,Enum.EasingStyle.Quint),{Position=UDim2.new(0.238000005, 0, 0.153999999, 0)}):Play()

			else
				TweenService:Create(Tab,TweenInfo.new(.4,Enum.EasingStyle.Quint),{Position=UDim2.new(0.998, 0, 0.153999999, 0)}):Play()

			end
		end

		if #Tabs==0 then
			tabcallback(true)
		else
			tabcallback(false)
		end

		table.insert(Tabs,{Tab,tabcallback,tab_toggle})

		cretate_button(TabButton).MouseButton1Click:Connect(function()
			for i,v in ipairs(Tabs) do
				if v[1]==Tab then
					v[2](true)
				else
					v[2](false)
				end
			end
		end)

		function TabAssets:AddSection(SectionNameString,int)
			int=int or 'left'

			local sectionasaste={}
			int=tostring(int):lower()

			local prosate=(int=="left"and Left)or(int=="right"and Right)

			local Section = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local UIListLayout = Instance.new("UIListLayout")
			local Top = Instance.new("Frame")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local Title = Instance.new("TextLabel")
			local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
			local Outline = Instance.new("Frame")
			local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
			local Main = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")

			Tab:GetPropertyChangedSignal('Position'):Connect(function()
				if Tab.Position ~= UDim2.new(0.998, 0, 0.153999999, 0) then
					Section.Visible=true
				else
					Section.Visible=false
				end
			end)

			Section.Name = "Section"
			Section.Parent = prosate
			Section.BackgroundColor3 = Color3.fromRGB(0, 15, 30)
			Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Section.BorderSizePixel = 0
			Section.Position = UDim2.new(0.0200000703, 0, 0, 0)
			Section.Size = UDim2.new(0.959999979, 0, 0, 0)
			Section.ZIndex = 7
			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = Section

			UIListLayout.Parent = Section
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 1)

			Top.Name = "Top"
			Top.Parent = Section
			Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Top.BorderSizePixel = 0
			Top.Size = UDim2.new(1, 0, 0.5, 0)

			UIAspectRatioConstraint.Parent = Top
			UIAspectRatioConstraint.AspectRatio = 45.000
			UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

			Title.Name = "Title"
			Title.Parent = Section
			Title.AnchorPoint = Vector2.new(0.5, 0)
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Title.BorderSizePixel = 0
			Title.Position = UDim2.new(0.5, 0, 0.0320000015, 0)
			Title.Size = UDim2.new(0.949999988, 0, 0.5, 0)
			Title.ZIndex = 7
			Title.Font = Enum.Font.SourceSansBold
			Title.Text = SectionNameString or "Main"
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextScaled = true
			Title.TextSize = 14.000
			Title.TextWrapped = true
			Title.TextXAlignment = Enum.TextXAlignment.Left

			UIAspectRatioConstraint_2.Parent = Title
			UIAspectRatioConstraint_2.AspectRatio = 10.000
			UIAspectRatioConstraint_2.AspectType = Enum.AspectType.ScaleWithParentSize

			Outline.Name = "Outline"
			Outline.Parent = Section
			Outline.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Outline.BackgroundTransparency = 1.000
			Outline.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Outline.BorderSizePixel = 0
			Outline.Size = UDim2.new(0.99000001, 0, 0.5, 0)
			Outline.ZIndex = 9

			UIAspectRatioConstraint_3.Parent = Outline
			UIAspectRatioConstraint_3.AspectRatio = 15.000
			UIAspectRatioConstraint_3.AspectType = Enum.AspectType.ScaleWithParentSize

			Main.Name = "Main"
			Main.Parent = Outline
			Main.AnchorPoint = Vector2.new(0.5, 0.5)
			Main.BackgroundColor3 = Color3.fromRGB(9, 39, 49)
			Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Main.BorderSizePixel = 0
			Main.Position = UDim2.new(0.5, 0, 0.5, 0)
			Main.Size = UDim2.new(0.949999988, 0, 0.25, 0)
			Main.ZIndex = 15

			UICorner_2.CornerRadius = UDim.new(1, 0)
			UICorner_2.Parent = Main

			local function UpdateSize()

				local a=0

				for i,v:Frame in ipairs(Section:GetChildren()) do
					if v:isA('TextLabel')or v:isA('Frame') then
						if v.AbsoluteSize.Y > 0 then
							a=a+v.AbsoluteSize.Y-1
						else
							a=a+v.Size.Y.Offset-1
						end
					end
				end

				TweenService:Create(Section,TweenInfo.new(0.5),{Size=UDim2.new(0.959999979, 0, 0, 25+a)}):Play()
			end

			UpdateSize()

			Window:GetPropertyChangedSignal('Size'):Connect(function()
				task.wait()
				UpdateSize()
			end)
			
			Section.InputBegan:Connect(UpdateSize)
			
			function sectionasaste:AddLabel(LabelName)
				local Label = Instance.new("TextLabel")
				local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

				Label.Name = "Label"
				Label.Parent = Section
				Label.AnchorPoint = Vector2.new(0.5, 0)
				Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Label.BackgroundTransparency = 1.000
				Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Label.BorderSizePixel = 0
				Label.Position = UDim2.new(0.5, 0, 0.0320000015, 0)
				Label.Size = UDim2.new(0.899999976, 0, 0.5, 0)
				Label.ZIndex = 7
				Label.Font = Enum.Font.SourceSansBold
				Label.TextColor3 = Color3.fromRGB(255, 255, 255)
				Label.TextScaled = true
				Label.TextSize = 14.000
				Label.TextStrokeColor3 = Color3.fromRGB(25, 90, 128)
				Label.TextTransparency = 1
				Label.TextWrapped = true
				Label.TextXAlignment = Enum.TextXAlignment.Left
				Label.Text=LabelName or ""

				TweenService:Create(Label,TweenInfo.new(0.3),{TextTransparency = 0.300}):Play()
				UIAspectRatioConstraint.Parent = Label
				UIAspectRatioConstraint.AspectRatio = 10.000
				UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

				UpdateSize()

				local func={}

				function func:Text(a)
					Label.Text=tostring(a)
				end

				return func

			end

			function sectionasaste:AddToggle(ToggleName,Default,callback)
				Default=Default or false
				callback=callback or function ()

				end

				local Toggle = Instance.new("Frame")
				local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
				local Title = Instance.new("TextLabel")
				local Frame = Instance.new("Frame")
				local Icon = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local UICorner_2 = Instance.new("UICorner")

				Toggle.Name = "Toggle"
				Toggle.Parent = Section
				Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Toggle.BackgroundTransparency = 1.000
				Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Toggle.BorderSizePixel = 0
				Toggle.Size = UDim2.new(0.899999976, 0, 0.5, 0)
				Toggle.ZIndex = 12

				UIAspectRatioConstraint.Parent = Toggle
				UIAspectRatioConstraint.AspectRatio = 10.000
				UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

				Title.Name = "Title"
				Title.Parent = Toggle
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title.BorderSizePixel = 0
				Title.Size = UDim2.new(0.7704705, 0, 1, 0)
				Title.ZIndex = 7
				Title.Font = Enum.Font.SourceSansBold
				Title.Text = ToggleName or"Toggle"
				Title.TextColor3 = Color3.fromRGB(255, 255, 255)
				Title.TextScaled = true
				Title.TextSize = 14.000
				Title.TextStrokeColor3 = Color3.fromRGB(25, 90, 128)
				Title.TextWrapped = true
				Title.TextXAlignment = Enum.TextXAlignment.Left

				Frame.Parent = Toggle
				Frame.AnchorPoint = Vector2.new(1, 0.5)
				Frame.BackgroundColor3 = Color3.fromRGB(5, 31, 58)
				Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame.BorderSizePixel = 0
				Frame.Position = UDim2.new(0.980000019, 0, 0.5, 0)
				Frame.Size = UDim2.new(0.200000003, 0, 0.850000024, 0)
				Frame.ZIndex = 7

				Icon.Name = "Icon"
				Icon.Parent = Frame
				Icon.AnchorPoint = Vector2.new(0.5, 0.5)
				Icon.BackgroundColor3 = Color3.fromRGB(0, 195, 240)
				Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Icon.BorderSizePixel = 0
				Icon.Position = UDim2.new(0.75, 0, 0.5, 0)
				Icon.Size = UDim2.new(1, 0, 1, 0)
				Icon.SizeConstraint = Enum.SizeConstraint.RelativeYY
				Icon.ZIndex = 7

				UICorner.CornerRadius = UDim.new(3, 0)
				UICorner.Parent = Icon

				UICorner_2.CornerRadius = UDim.new(3, 0)
				UICorner_2.Parent = Frame

				local function toggle__(val)
					UpdateSize()
					if val then
						TweenService:Create(Icon,TweenInfo.new(0.1),{Position=UDim2.new(0.75,0,0.5,0),BackgroundColor3=Color3.fromRGB( 4,186, 252)}):Play()
						TweenService:Create(Frame,TweenInfo.new(0.1),{BackgroundColor3=Color3.fromRGB(3, 6, 23)}):Play()
						TweenService:Create(Title,TweenInfo.new(0.1),{TextTransparency=0}):Play()
					else
						TweenService:Create(Title,TweenInfo.new(0.1),{TextTransparency=0.3}):Play()
						TweenService:Create(Icon,TweenInfo.new(0.1),{Position=UDim2.new(0.25,0,0.5,0),BackgroundColor3=Color3.fromRGB(85, 112, 123,4)}):Play()
						TweenService:Create(Frame,TweenInfo.new(0.1),{BackgroundColor3=Color3.fromRGB(0, 30, 71)}):Play()
					end
				end

				toggle__(Default)

				cretate_button(Toggle).MouseButton1Click:Connect(function()
					Default=not Default
					toggle__(Default)
					callback(Default)
				end)

				UpdateSize()

				local func={}

				function func:Value(a)
					Default=a
					toggle__(Default)
					callback(a)
				end

				function func:Text(a)
					Title.Text=tostring(a)
				end

				return func
			end

			function sectionasaste:AddSlider(SliderNameString,Min,Max,Default,callback)
				Min=Min or 1
				Max=Max or 100
				Default=Default or Min
				callback=callback or function()

				end

				local Slider = Instance.new("Frame")
				local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
				local Title = Instance.new("TextLabel")
				local Main = Instance.new("Frame")
				local Icon = Instance.new("Frame")
				local Move_Icon = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local ValueText = Instance.new("TextLabel")
				local UIStroke = Instance.new("UIStroke")
				local UICorner_2 = Instance.new("UICorner")

				Slider.Name = "Slider"
				Slider.Parent = Section
				Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Slider.BackgroundTransparency = 1.000
				Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Slider.BorderSizePixel = 0
				Slider.Size = UDim2.new(0.899999976, 0, 0.5, 0)
				Slider.ZIndex = 12

				UIAspectRatioConstraint.Parent = Slider
				UIAspectRatioConstraint.AspectRatio = 10.000
				UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

				Title.Name = "Title"
				Title.Parent = Slider
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title.BorderSizePixel = 0
				Title.Size = UDim2.new(0.492410779, 0, 1, 0)
				Title.ZIndex = 7
				Title.Font = Enum.Font.SourceSansBold
				Title.Text = SliderNameString or"Slider"
				Title.TextColor3 = Color3.fromRGB(255, 255, 255)
				Title.TextScaled = true
				Title.TextSize = 14.000
				Title.TextStrokeColor3 = Color3.fromRGB(25, 90, 128)
				Title.TextWrapped = true
				Title.TextXAlignment = Enum.TextXAlignment.Left
				Title.TextTransparency=.3
				Main.Name = "Main"
				Main.Parent = Slider
				Main.AnchorPoint = Vector2.new(0, 0.5)
				Main.BackgroundColor3 = Color3.fromRGB(7, 27, 54)
				Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Main.BorderSizePixel = 0
				Main.ClipsDescendants = true
				Main.Position = UDim2.new(0.49000001, 0, 0.5, 0)
				Main.Size = UDim2.new(0.378852516, 0, 0.149999991, 0)
				Main.ZIndex = 9

				Icon.Name = "Icon"
				Icon.Parent = Main
				Icon.BackgroundColor3 = Color3.fromRGB(61, 152, 255)
				Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Icon.BorderSizePixel = 0
				Icon.Size = UDim2.new(0.05, 0, 1, 0)
				Icon.ZIndex = 10

				Move_Icon.Name = "Move_Icon"
				Move_Icon.Parent = Icon
				Move_Icon.AnchorPoint = Vector2.new(1, 0.5)
				Move_Icon.BackgroundColor3 = Color3.fromRGB(61, 152, 255)
				Move_Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Move_Icon.BorderSizePixel = 0
				Move_Icon.Position = UDim2.new(1, 0, 0.5, 0)
				Move_Icon.Rotation = 1.000
				Move_Icon.Size = UDim2.new(4, 0, 4, 0)
				Move_Icon.SizeConstraint = Enum.SizeConstraint.RelativeYY
				Move_Icon.ZIndex = 10

				UICorner.CornerRadius = UDim.new(1, 0)
				UICorner.Parent = Move_Icon

				ValueText.Name = "ValueText"
				ValueText.Parent = Slider
				ValueText.AnchorPoint = Vector2.new(1, 0.5)
				ValueText.BackgroundColor3 = Color3.fromRGB(3, 6, 25)
				ValueText.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ValueText.BorderSizePixel = 0
				ValueText.Position = UDim2.new(1, 0, 0.5, 0)
				ValueText.Size = UDim2.new(0.100000001, 0, 0.5, 0)
				ValueText.ZIndex = 9
				ValueText.Font = Enum.Font.SourceSansSemibold
				ValueText.Text = "0"
				ValueText.TextColor3 = Color3.fromRGB(255, 255, 255)
				ValueText.TextScaled = true
				ValueText.TextSize = 14.000
				ValueText.TextWrapped = true
				ValueText.TextXAlignment = Enum.TextXAlignment.Left

				UIStroke.Color = Color3.fromRGB(5, 18, 34)
				UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				UIStroke.Parent = ValueText

				UICorner_2.CornerRadius = UDim.new(0, 5)
				UICorner_2.Parent = ValueText

				ValueText.Text = tostring(Default)
				Icon.Size=UDim2.fromScale((Default/Max),1)

				local touching = Instance.new("Frame")

				touching.Name = "touching"
				touching.Parent = Slider
				touching.AnchorPoint = Vector2.new(0.5, 0.5)
				touching.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				touching.BorderColor3 = Color3.fromRGB(0, 0, 0)
				touching.BorderSizePixel = 0
				touching.Position = UDim2.new(0.679796576, 0, 0.5, 0)
				touching.Size = UDim2.new(0.374771446, 0, 1, 0)
				touching.ZIndex = 11
				touching.BackgroundTransparency=1
				local danger = false

				local function update(Input)
					local SizeScale = math.clamp((((Input.Position.X) - Main.AbsolutePosition.X) / Main.AbsoluteSize.X), 0, 1)
					local Valuea = math.floor(((Max - Min) * SizeScale) + Min)
					local Size = UDim2.fromScale(math.clamp(SizeScale+0.075,0,1), 1)
					ValueText.Text = tostring(Valuea)
					TweenService:Create(Icon,TweenInfo.new(0.1),{Size = Size}):Play()
					callback(Valuea)
				end

				touching.InputBegan:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
						danger = true
						update(Input)
						TweenService:Create(Title,TweenInfo.new(0.1),{TextTransparency=0}):Play()
					end
				end)

				touching.InputEnded:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
						danger = false
						TweenService:Create(Title,TweenInfo.new(0.1),{TextTransparency=0.3}):Play()
					end
				end)

				InputService.InputChanged:Connect(function(Input)
					if danger then
						if (Input.UserInputType==Enum.UserInputType.MouseMovement or Input.UserInputType==Enum.UserInputType.Touch)  then
							update(Input)
						end
					end
				end)

				local func={}

				function func:Value(s)
					ValueText.Text = tostring(s)
					Icon.Size=UDim2.fromScale((s/Max),1)

					callback(s)
				end

				function func:Text(t)
					Title.Text=tostring(t)
				end

				UpdateSize()
				return func
			end

			function sectionasaste:AddDropdown(DropdownNameString,data,default,callback)
				data=data or {}
				default=default or data[1]
				callback=callback or function()

				end

				local choose=default
				local Dropdown = Instance.new("Frame")
				local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
				local Title = Instance.new("TextLabel")
				local __BOX__ = Instance.new("Frame")
				local UIStroke = Instance.new("UIStroke")
				local ValueText = Instance.new("TextLabel")
				local DotText = Instance.new("TextLabel")
				local ListBox = Instance.new("Frame")
				local UIStroke_2 = Instance.new("UIStroke")
				local UIListLayout = Instance.new("UIListLayout")

				Dropdown.Name = "Dropdown"
				Dropdown.Parent = Section
				Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Dropdown.BackgroundTransparency = 1.000
				Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Dropdown.BorderSizePixel = 0
				Dropdown.Size = UDim2.new(0.899999976, 0, 0.5, 0)
				Dropdown.ZIndex = 12

				UIAspectRatioConstraint.Parent = Dropdown
				UIAspectRatioConstraint.AspectRatio = 10.000
				UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

				Title.Name = "Title"
				Title.Parent = Dropdown
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title.BorderSizePixel = 0
				Title.Size = UDim2.new(0.619426191, 0, 1, 0)
				Title.ZIndex = 7
				Title.Font = Enum.Font.SourceSansBold
				Title.Text = DropdownNameString or"Dropdown"
				Title.TextColor3 = Color3.fromRGB(255, 255, 255)
				Title.TextScaled = true
				Title.TextSize = 14.000
				Title.TextStrokeColor3 = Color3.fromRGB(25, 90, 128)
				Title.TextWrapped = true
				Title.TextXAlignment = Enum.TextXAlignment.Left

				__BOX__.Name = "__BOX__"
				__BOX__.Parent = Dropdown
				__BOX__.AnchorPoint = Vector2.new(0, 0.5)
				__BOX__.BackgroundColor3 = Color3.fromRGB(0, 7, 20)
				__BOX__.BorderColor3 = Color3.fromRGB(0, 0, 0)
				__BOX__.BorderSizePixel = 0
				__BOX__.Position = UDim2.new(0.679426134, 0, 0.49999994, 0)
				__BOX__.Size = UDim2.new(0.338999987, 0, 0.649999976, 0)
				__BOX__.ZIndex = 10

				UIStroke.Color = Color3.fromRGB(5, 18, 34)
				UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				UIStroke.Parent = __BOX__

				ValueText.Name = "ValueText"
				ValueText.Parent = __BOX__
				ValueText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ValueText.BackgroundTransparency = 1.000
				ValueText.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ValueText.BorderSizePixel = 0
				ValueText.Size = UDim2.new(0.808259666, 0, 1, 0)
				ValueText.ZIndex = 11
				ValueText.Font = Enum.Font.SourceSansBold
				ValueText.Text = tostring(default) or ""
				ValueText.TextColor3 = Color3.fromRGB(255, 255, 255)
				ValueText.TextScaled = true
				ValueText.TextSize = 14.000
				ValueText.TextWrapped = true
				ValueText.TextXAlignment = Enum.TextXAlignment.Left

				DotText.Name = "DotText"
				DotText.Parent = __BOX__
				DotText.AnchorPoint = Vector2.new(1, 0)
				DotText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DotText.BackgroundTransparency = 1.000
				DotText.BorderColor3 = Color3.fromRGB(0, 0, 0)
				DotText.BorderSizePixel = 0
				DotText.Position = UDim2.new(1, 0, 0, 0)
				DotText.Rotation = -90.000
				DotText.Size = UDim2.new(1, 0, 1, 0)
				DotText.SizeConstraint = Enum.SizeConstraint.RelativeYY
				DotText.ZIndex = 11
				DotText.Font = Enum.Font.SourceSansBold
				DotText.Text = "<"
				DotText.TextColor3 = Color3.fromRGB(255, 255, 255)
				DotText.TextScaled = true
				DotText.TextSize = 14.000
				DotText.TextWrapped = true

				ListBox.Name = "ListBox"
				ListBox.Parent = Dropdown
				ListBox.BackgroundColor3 = Color3.fromRGB(2, 5, 22)
				ListBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ListBox.BorderSizePixel = 0
				ListBox.Position = UDim2.new(0.67900008, 0, 0.979412436, 0)
				ListBox.Size = UDim2.new(0.338999987, 0, 0, 0)
				ListBox.Visible = false
				ListBox.ZIndex = 10

				UIStroke_2.Color = Color3.fromRGB(5, 18, 34)
				UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				UIStroke_2.Parent = ListBox

				UIListLayout.Parent = ListBox
				UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.Padding = UDim.new(0, 1)

				local function get_list_size()
					local a=0

					for i,v:TextButton in ipairs(ListBox:GetChildren()) do
						if v:isA('TextButton') then
							a=a + 8.29
						end
					end

					return a + 8
				end

				ListBox:GetPropertyChangedSignal('Size'):Connect(function()
					if ListBox.Size~=UDim2.new(0.339,0,0) then
						ListBox.Visible=true
					else
						ListBox.Visible=false
					end
				end)

				local function dropdnw_toggle(val)
					if val then
						TweenService:Create(DotText,TweenInfo.new(0.15),{Rotation=90}):Play()
						TweenService:Create(Title,TweenInfo.new(0.4),{TextTransparency=0}):Play()

						TweenService:Create(ListBox,TweenInfo.new(0.1),{Size=UDim2.new(0.339,0,0,get_list_size())}):Play()
					else
						TweenService:Create(DotText,TweenInfo.new(0.15),{Rotation=-90}):Play()
						TweenService:Create(Title,TweenInfo.new(0.4),{TextTransparency=.3}):Play()

						TweenService:Create(ListBox,TweenInfo.new(0.1),{Size=UDim2.new(0.339,0,0)}):Play()
					end
				end

				local ttg=false

				dropdnw_toggle(ttg)

				cretate_button(__BOX__).MouseButton1Click:Connect(function()
					ttg=not ttg
					dropdnw_toggle(ttg)
					UpdateSize()
				end)

				UpdateSize()

				local function newbutton()
					local ButtonFB = Instance.new("TextButton",ListBox)
					local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

					ButtonFB.Name = "Button"
					ButtonFB.Parent = ListBox
					ButtonFB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ButtonFB.BackgroundTransparency = 1.000
					ButtonFB.BorderColor3 = Color3.fromRGB(0, 0, 0)
					ButtonFB.BorderSizePixel = 0
					ButtonFB.Size = UDim2.new(0.980000019, 0, 0, 50)
					ButtonFB.ZIndex = 11
					ButtonFB.Font = Enum.Font.SourceSansBold
					ButtonFB.TextColor3 = Color3.fromRGB(255, 255, 255)
					ButtonFB.TextScaled = true
					ButtonFB.TextSize = 14.000
					ButtonFB.TextWrapped = true
					ButtonFB.TextTransparency=.3

					ButtonFB.MouseEnter:Connect(function()
						TweenService:Create(ButtonFB,TweenInfo.new(0.1),{TextTransparency=0}):Play()
					end)

					ButtonFB.MouseLeave:Connect(function()
						TweenService:Create(ButtonFB,TweenInfo.new(0.1),{TextTransparency=0.3}):Play()
					end)

					UIAspectRatioConstraint.Parent = ButtonFB
					UIAspectRatioConstraint.AspectRatio = 5.000
					UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

					return ButtonFB
				end

				local function maindb()
					for i,v:TextButton in ipairs(ListBox:GetChildren()) do
						if v:isA('TextButton') then
							v:Destroy()
						end
					end

					for i,v in ipairs(data) do
						local button=newbutton()
						button.Text=tostring(v)
						button.MouseButton1Click:Connect(function()
							ValueText.Text=tostring(v)
							callback(v)
						end)

					end

					if ListBox.Visible then
						TweenService:Create(ListBox,TweenInfo.new(0.1),{Size=UDim2.new(0.339,0,0,get_list_size())}):Play()
					end
				end

				maindb()

				local func={}

				function func:Refresh(new)
					data=new or data
					maindb()
				end

				UpdateSize()

				function func:Text(a)
					Title.Text=tostring(a)
				end

				function func:Get()
					return choose
				end
				return func
			end

			function sectionasaste:AddButton(ButtonNamestr,callback)
				callback=callback or function()

				end


				local Button = Instance.new("TextLabel")
				local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
				local UIStroke = Instance.new("UIStroke")
				local UICorner = Instance.new("UICorner")

				Button.Name = "Button"
				Button.Parent = Section
				Button.AnchorPoint = Vector2.new(0.5, 0)
				Button.BackgroundColor3 = Color3.fromRGB(2, 5, 22)
				Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Button.BorderSizePixel = 0
				Button.Position = UDim2.new(0.5, 0, 0.0320000015, 0)
				Button.Size = UDim2.new(0.899999976, 0, 0.5, 0)
				Button.ZIndex = 7
				Button.Font = Enum.Font.SourceSansBold
				Button.Text = ButtonNamestr or"Button"
				Button.TextColor3 = Color3.fromRGB(255, 255, 255)
				Button.TextScaled = true
				Button.TextSize = 14.000
				Button.TextStrokeColor3 = Color3.fromRGB(25, 90, 128)
				Button.TextWrapped = true

				UIAspectRatioConstraint.Parent = Button
				UIAspectRatioConstraint.AspectRatio = 10.000
				UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

				UIStroke.Color = Color3.fromRGB(5, 18, 34)
				UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				UIStroke.Parent = Button

				UICorner.CornerRadius = UDim.new(0, 2)
				UICorner.Parent = Button

				local as = cretate_button(Button)
				as.ZIndex=7
				as.MouseButton1Click:Connect(function()
					callback()
				end)

				as.MouseEnter:Connect(function()
					TweenService:Create(Button,TweenInfo.new(0.2),{TextTransparency=0}):Play()
				end)

				as.MouseLeave:Connect(function()
					TweenService:Create(Button,TweenInfo.new(0.2),{TextTransparency=.3}):Play()
				end)
				TweenService:Create(Button,TweenInfo.new(0.2),{TextTransparency=.3}):Play()

				UpdateSize()

				local func={}

				function func:Text(a)
					Title.Text=tostring(a)
				end

				function func:Fire()
					callback()
				end

				return func
			end

			UpdateSize()

			return sectionasaste
		end

		return TabAssets
	end

	Movebar.Name = "Movebar"
	Movebar.Parent = Window
	Movebar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Movebar.BackgroundTransparency = 1.000
	Movebar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Movebar.BorderSizePixel = 0
	Movebar.Size = UDim2.new(1, 0, 0.100000001, 0)
	Movebar.ZIndex = 222

	local dragToggle = nil
	local dragSpeed = 0.1
	local dragStart = nil
	local startPos = nil

	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(Window, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end

	Movebar.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = Window.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	InputService.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)

	TweenService:Create(Window,TweenInfo.new(0.55),{BackgroundTransparency=0.1,Size=ooldsize}):Play()
	TweenService:Create(TabButtons,TweenInfo.new(1.3,Enum.EasingStyle.Quint),{Position=UDim2.new(0.004, 0,0.129, 0)}):Play()
	TweenService:Create(WindowName,TweenInfo.new(.85,Enum.EasingStyle.Quint),{Position=UDim2.new(0.009, 0,0.019, 0)}):Play()
	TweenService:Create(Outline,TweenInfo.new(3,Enum.EasingStyle.Quint),{BackgroundTransparency=0}):Play()
	TweenService:Create(Outline_2,TweenInfo.new(3,Enum.EasingStyle.Quint),{BackgroundTransparency=0}):Play()
	TweenService:Create(Outline_3,TweenInfo.new(3,Enum.EasingStyle.Quint),{BackgroundTransparency=0}):Play()
	TweenService:Create(ImageProfile,TweenInfo.new(1.5,Enum.EasingStyle.Quint),{ImageTransparency=0}):Play()
	TweenService:Create(ProfileName,TweenInfo.new(1.9,Enum.EasingStyle.Quint),{TextTransparency=0}):Play()
	TweenService:Create(Blackground,TweenInfo.new(1,Enum.EasingStyle.Quint),{BackgroundTransparency=0}):Play()

	return WindowFunctinos
end

function NEVERWIN:KeySystem(Mame,Link,func_check_key)
	func_check_key=func_check_key or function()
		return true
	end
	
	Link=Link or ""
	
	local Key = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local TitleMain = Instance.new("TextLabel")
	local PasteKey = Instance.new("TextBox")
	local UICorner_2 = Instance.new("UICorner")
	local GetKey = Instance.new("TextButton")
	local UICorner_3 = Instance.new("UICorner")
	local Title = Instance.new("TextLabel")
	local UIStroke = Instance.new("UIStroke")
	local Submit = Instance.new("TextButton")
	local UICorner_4 = Instance.new("UICorner")
	local Title_2 = Instance.new("TextLabel")
	local UIStroke_2 = Instance.new("UIStroke")

	Key.Name = "Key"
	Key.Parent = CoreGui
	Key.ResetOnSpawn = false
	Key.ZIndexBehavior=Enum.ZIndexBehavior.Global
	Key.IgnoreGuiInset=true
	
	Frame.Parent = Key
	Frame.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame.BackgroundColor3 = Color3.fromRGB(7, 10, 19)
	Frame.BackgroundTransparency = 0.100
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
	Frame.Size = UDim2.new(0, 0, 0, 0)
	
	TweenService:Create(Frame,TweenInfo.new(1.5,Enum.EasingStyle.Quint),{Size=UDim2.new(0.25, 0, 0.200000003, 0)}):Play()
	
	UICorner.CornerRadius = UDim.new(0, 5)
	UICorner.Parent = Frame

	TitleMain.Name = "TitleMain"
	TitleMain.Parent = Frame
	TitleMain.AnchorPoint = Vector2.new(0.5, 0)
	TitleMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TitleMain.BackgroundTransparency = 1.000
	TitleMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TitleMain.BorderSizePixel = 0
	TitleMain.Position = UDim2.new(0.5, 0, 0.039371375, 0)
	TitleMain.Size = UDim2.new(0.949999988, 0, 0.200000003, 0)
	TitleMain.Font = Enum.Font.Unknown
	TitleMain.Text = Mame or "Key System"
	TitleMain.TextColor3 = Color3.fromRGB(255, 255, 255)
	TitleMain.TextScaled = true
	TitleMain.TextSize = 14.000
	TitleMain.TextStrokeColor3 = Color3.fromRGB(25, 90, 128)
	TitleMain.TextStrokeTransparency = 0.000
	TitleMain.TextWrapped = true

	PasteKey.Name = "PasteKey"
	PasteKey.Parent = Frame
	PasteKey.AnchorPoint = Vector2.new(0.5, 0)
	PasteKey.BackgroundColor3 = Color3.fromRGB(7, 10, 19)
	PasteKey.BackgroundTransparency = 0.100
	PasteKey.BorderColor3 = Color3.fromRGB(0, 0, 0)
	PasteKey.BorderSizePixel = 0
	PasteKey.Position = UDim2.new(0.5, 0, 0.328000009, 0)
	PasteKey.Size = UDim2.new(0.949999988, 0, 0.150475562, 0)
	PasteKey.ClearTextOnFocus = false
	PasteKey.Font = Enum.Font.Unknown
	PasteKey.PlaceholderText = "Input"
	PasteKey.Text = ""
	PasteKey.TextColor3 = Color3.fromRGB(255, 255, 255)
	PasteKey.TextScaled = true
	PasteKey.TextSize = 14.000
	PasteKey.TextWrapped = true
	PasteKey.TextXAlignment = Enum.TextXAlignment.Left

	UICorner_2.CornerRadius = UDim.new(0, 2)
	UICorner_2.Parent = PasteKey

	GetKey.Name = "GetKey"
	GetKey.Parent = Frame
	GetKey.BackgroundColor3 = Color3.fromRGB(0, 15, 30)
	GetKey.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GetKey.BorderSizePixel = 0
	GetKey.Position = UDim2.new(0.0244897958, 0, 0.611413062, 0)
	GetKey.Size = UDim2.new(0.449999988, 0, 0.327377737, 0)
	GetKey.ZIndex = 4
	GetKey.Font = Enum.Font.SourceSansBold
	GetKey.Text = "Get Key"
	GetKey.TextColor3 = Color3.fromRGB(255, 255, 255)
	GetKey.TextScaled = true
	GetKey.TextSize = 14.000
	GetKey.TextTransparency = 1.000
	GetKey.TextWrapped = true

	UICorner_3.CornerRadius = UDim.new(0, 5)
	UICorner_3.Parent = GetKey

	Title.Name = "Title"
	Title.Parent = GetKey
	Title.AnchorPoint = Vector2.new(0.5, 0.5)
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0.5, 0, 0.5, 0)
	Title.Size = UDim2.new(0.949999988, 0, 0.5, 0)
	Title.ZIndex = 1000
	Title.Font = Enum.Font.Unknown
	Title.Text = "Get Key"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextScaled = true
	Title.TextSize = 14.000
	Title.TextWrapped = true

	UIStroke.Color = Color3.fromRGB(0, 34, 68)
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke.Parent = GetKey

	Submit.Name = "Submit"
	Submit.Parent = Frame
	Submit.BackgroundColor3 = Color3.fromRGB(0, 15, 30)
	Submit.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Submit.BorderSizePixel = 0
	Submit.Position = UDim2.new(0.522448957, 0, 0.611413062, 0)
	Submit.Size = UDim2.new(0.449999988, 0, 0.327377737, 0)
	Submit.ZIndex = 4
	Submit.Font = Enum.Font.SourceSansBold
	Submit.Text = "Get Key"
	Submit.TextColor3 = Color3.fromRGB(255, 255, 255)
	Submit.TextScaled = true
	Submit.TextSize = 14.000
	Submit.TextTransparency = 1.000
	Submit.TextWrapped = true

	UICorner_4.CornerRadius = UDim.new(0, 5)
	UICorner_4.Parent = Submit

	Title_2.Name = "Title"
	Title_2.Parent = Submit
	Title_2.AnchorPoint = Vector2.new(0.5, 0.5)
	Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title_2.BackgroundTransparency = 1.000
	Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title_2.BorderSizePixel = 0
	Title_2.Position = UDim2.new(0.5, 0, 0.5, 0)
	Title_2.Size = UDim2.new(0.949999988, 0, 0.5, 0)
	Title_2.ZIndex = 1000
	Title_2.Font = Enum.Font.Unknown
	Title_2.Text = "Submit"
	Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title_2.TextScaled = true
	Title_2.TextSize = 14.000
	Title_2.TextWrapped = true

	UIStroke_2.Color = Color3.fromRGB(0, 34, 68)
	UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke_2.Parent = Submit
	local call = function()

	end
	GetKey.MouseButton1Click:Connect(function()
		pcall(function()
			setclipboard(tostring(Link))
		end)

		pcall(function()
			toclipboard(tostring(Link))
		end)
	end)
	
	local asd=false
	Submit.MouseButton1Click:Connect(function()
		if asd then
			return
		end
		
		asd=true
		if func_check_key(PasteKey.Text) then
			TweenService:Create(Frame,TweenInfo.new(1.4,Enum.EasingStyle.Quint),{Size=UDim2.new(0.25,0,0,0)}):Play()
			TweenService:Create(Title,TweenInfo.new(0.55,Enum.EasingStyle.Quint),{TextTransparency=1}):Play()
			TweenService:Create(Title_2,TweenInfo.new(0.55,Enum.EasingStyle.Quint),{TextTransparency=1}):Play()
			TweenService:Create(TitleMain,TweenInfo.new(0.55,Enum.EasingStyle.Quint),{TextTransparency=1,TextStrokeTransparency=1}):Play()
			TweenService:Create(PasteKey,TweenInfo.new(0.55,Enum.EasingStyle.Quint),{TextTransparency=1,BackgroundTransparency=1}):Play()
			task.spawn(function()
				task.wait(1.4)
				TweenService:Create(Frame,TweenInfo.new(0.5,Enum.EasingStyle.Quint),{Size=UDim2.new(0,0,0,0)}):Play()
				
				task.wait(0.1)
				
				TweenService:Create(Frame,TweenInfo.new(0.5,Enum.EasingStyle.Quint),{Position=UDim2.new(0,0,1.5,0)}):Play()
				
				task.wait(0.5)
				
				Key:Destroy()
			end)
			
			call()
			return
		end
		
		asd=false
	end)
	
	local functiona={}
	
	function functiona:Correct(calla)
		call=calla or function()
			
		end
	end
	
	return functiona
end

return NEVERWIN
