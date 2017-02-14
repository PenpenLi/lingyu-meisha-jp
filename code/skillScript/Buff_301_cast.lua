Buff_301_cast = 
{
	info_pool = {},

	init = function( effectScript )
		Buff_301_cast.info_pool[effectScript.ID] = { Targeter = 0 }
	end,

	clean = function( effectScript )
		EffectScriptEnd(Buff_301_cast.info_pool[effectScript.ID].Attacker)
        
		Buff_301_cast.info_pool[effectScript.ID] = nil
	end,

	preLoad = function()
		PreLoadAvatar("e301")
	end,

	run = function( effectScript )
		effectScript:RegisterEvent( 0, "asfdf" )
	end,

	asfdf = function( effectScript )
			AttachBuffEffect( false, Buff_301_cast.info_pool[effectScript.ID].Targeter, AvatarPos.root, Vector2(0, 20), 1.2, 100, "e301",  effectScript)
	end,

}
