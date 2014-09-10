concommand.Add("grammarcheck",function()
	local option  = ""
	local self = vgui.Create("DFrame")
	self:SetSize(400,500)
	self:Center()
	self:ShowCloseButton(false)
	self:SetTitle("Grammar check.")
	self:MakePopup()

	LocalPlayer():Freeze(true)
	local directions = vgui.Create("DLabel",self)
	directions:SetText("Hello, and thank you for taking an interest in our server.")
	directions:SetPos(70,30)
	directions:SizeToContents()

	local directions2 = vgui.Create("DLabel",self)
	directions2:SetText("Please take this quick test to determine if you should play on our server.	")
	directions2:SetPos(30,45)
	directions2:SizeToContents()

	local there = vgui.Create("DImage", self)
	there:SetSize(250,90)
	there:SetPos(75,70)
	there:SetImage("grammar/there")
	
	local theyre = vgui.Create("DImage", self)
	theyre:SetSize(250,90)
	theyre:SetPos(75,170)
	theyre:SetImage("grammar/their")
	
	local their = vgui.Create("DImage", self)
	their:SetSize(250,90)
	their:SetPos(75,270)
	their:SetImage("grammar/theyre")
	
	local Qs = {}
	Qs[1] = {"You, go over %s" , "You, go over there" , "You, go over _______."}
	Qs[2] = {"It's over %s" , "It's over there" , "It's over _______."}
	Qs[3] = {"Look over %s" , "Look over there" , "Look over _______."}
	Qs[4] = {"Wow, %s weird" , "Wow, they're weird" , "Wow, _______ weird."}	
	Qs[5] = {"It's %s's, give it back" , "It's their's, give it back" , "It's _______'s, give it back."}	
	
	local randomques = Qs[math.random(1,#Qs)]
	
	local ques = vgui.Create("DLabel",self)
	ques:SetText("  \""..randomques[3]..".\"  ")
	ques:SetPos(145,370)
	ques:SizeToContents()
	
	local quesd = vgui.Create("DLabel",self)
	quesd:SetText("Fix the sentence shown above with one of the words below.")
	quesd:SetPos(50,385)
	quesd:SizeToContents()
	
	CheckThere = vgui.Create( "DCheckBoxLabel", self )
	CheckThere:SetPos( 160,400 )
	CheckThere:SetText( "There" )
	CheckThere:SetValue( 0 )
	CheckThere:SizeToContents() -- Make its size to the contents. Duh?
	
	CheckThere.OnChange = function () -- This is DoClick
		if CheckThere:GetChecked() then
			option = "there"
			CheckTheyre:SetChecked(0)
			CheckTheir:SetChecked(0)
			CheckTheyre:SetValue(0)
			CheckTheir:SetValue(0)
		end
	end
	
	CheckTheir = vgui.Create( "DCheckBoxLabel", self )
	CheckTheir:SetPos( 160,415 )
	CheckTheir:SetText( "Their" )
	CheckTheir:SetValue( 0 )
	CheckTheir:SizeToContents() -- Make its size to the contents. Duh?
	
	CheckTheir.OnChange = function () -- This is DoClick
		if CheckTheir:GetChecked() then
			option = "their"
			CheckTheyre:SetChecked(0)
			CheckThere:SetChecked(0)
			CheckTheyre:SetValue(0)
			CheckThere:SetValue(0)
		end
	end
	
	CheckTheyre = vgui.Create( "DCheckBoxLabel", self )
	CheckTheyre:SetPos( 160,430 )
	CheckTheyre:SetText( "They're" )
	CheckTheyre:SetValue( 0 )
	CheckTheyre:SizeToContents() -- Make its size to the contents. Duh?
	
	CheckTheyre.OnChange = function () -- This is DoClick
		if CheckTheyre:GetChecked() then 
			option = "they're"
			CheckThere:SetChecked(0)
			CheckTheir:SetChecked(0)
			CheckThere:SetValue(0)
			CheckTheir:SetValue(0)
		end
	end
	
	local button = vgui.Create("DButton",self)
	button:SetPos(130,460)
	button:SetSize(150,25)
	button:SetText("Let me in!")
	button.DoClick = function( button )
		if Format(randomques[1],option) == randomques[2] then
			self:Close()
			LocalPlayer():ConCommand("_grammartest_good")
			LocalPlayer():Freeze(false)	
		end
		if Format(randomques[1],option) != randomques[2] then
			self:Close()
			LocalPlayer():Freeze(false)
			LocalPlayer():ConCommand("_grammartest_fail")
			timer.Simple(0.5,function() LocalPlayer():ConCommand("disconnect") end)
		end
	end
end)