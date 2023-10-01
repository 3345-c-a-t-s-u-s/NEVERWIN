```lua
local NEVERWIN = loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/NEVERWIN/main/source.lua"))()

local Window = NEVERWIN:AddWindow("NEVERWIN","MAKE BY CAT_SUS")

Window:AddTabLabel('Tab Section')

local Tab = Window:AddTab('Tab Name')

local SectionLeft = Tab:AddSection('Example',"left")

local SectionRight = Tab:AddSection('Section',"right")

SectionRight:AddLabel('WHO CARE')
SectionLeft:AddLabel('Label')

SectionLeft:AddButton("Button",function()
	print("button callback")
end)

SectionLeft:AddSlider('Slider',1,100,4,function(val)
	print('slider ',val)
end)

SectionLeft:AddToggle('Toggle',false,function(val)
	print('toggle',val)
end)

SectionLeft:AddDropdown('Dropdpwn',{1,2,3},2,function(val)
	print('dropdown',val)
end)
```
