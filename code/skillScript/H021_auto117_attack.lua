H021_auto117_attack = 
{
	info_pool = {},

	init = function( effectScript )
		H021_auto117_attack.info_pool[effectScript.ID] = { Attacker = 0, AttackType = 0, AttackDataList = {}, AttackIndex = 1 }
	end,

	clean = function( effectScript )
		EffectScriptEnd(H021_auto117_attack.info_pool[effectScript.ID].Attacker)
        
		H021_auto117_attack.info_pool[effectScript.ID] = nil
	end,

	preLoad = function()
	end,

	run = function( effectScript )
		effectScript:RegisterEvent( 0, "adsf" )
	end,

	adsf = function( effectScript )
		SetAnimation(H021_auto117_attack.info_pool[effectScript.ID].Attacker, AnimationType.f_idle)
	end,

}
