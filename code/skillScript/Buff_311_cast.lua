Buff_311_cast = 
{
	info_pool = {},

	init = function( effectScript )
		Buff_311_cast.info_pool[effectScript.ID] = { Targeter = 0 }
	end,

	clean = function( effectScript )
		EffectScriptEnd(Buff_311_cast.info_pool[effectScript.ID].Attacker)
        
		Buff_311_cast.info_pool[effectScript.ID] = nil
	end,

	preLoad = function()
		PreLoadAvatar("e311")
	end,

	run = function( effectScript )
		effectScript:RegisterEvent( 0, "fdfg" )
	end,

	fdfg = function( effectScript )
			AttachBuffEffect( false, Buff_311_cast.info_pool[effectScript.ID].Targeter, AvatarPos.root, Vector2(0, 0), 1.2, 100, "e311",  effectScript)
	end,

}
