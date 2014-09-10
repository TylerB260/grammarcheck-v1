resource.AddFile("materials/grammar/there.vtf")
resource.AddFile("materials/grammar/theyre.vtf")
resource.AddFile("materials/grammar/their.vtf")
resource.AddFile("materials/grammar/there.vmt")
resource.AddFile("materials/grammar/theyre.vmt")
resource.AddFile("materials/grammar/their.vmt")

resource.AddFile("sound/pointblankrp/grammar.mp3")

AddCSLuaFile("autorun/client/cl_grammarcheck.lua")

function grammarcheck( ply )
	if tonumber(ply:GetPData("taken_grammar_test",0)) == 0.00 then 
		ply:ConCommand( "grammarcheck" )
	end
end

hook.Add( "PlayerInitialSpawn", "grammarcheck", grammarcheck )

concommand.Add("_grammartest_good",function(ply , com ,args)
	ply:SetPData("taken_grammar_test",1)
	if not ply.NoMorePrint then
		ply.NoMorePrint = true
		BroadcastLua([[chat.AddText( Entity(]]..ply:EntIndex()..[[), Color( 230, 230, 230 ), " has passed the ", Color( 255, 200, 0 ), "Grammar Test" )]])
	end
end)

concommand.Add("_grammartest_fail",function(ply , com ,args)
	if not ply.NoMorePrint then
		ply.NoMorePrint = true
		BroadcastLua([[chat.AddText( Entity(]]..ply:EntIndex()..[[), Color( 230, 230, 230 ), " has failed the ", Color( 255, 200, 0 ), "Grammar Test" )]])
		BroadcastLua([[surface.PlaySound("pointblankrp/grammar.mp3")]])
	end
end)
