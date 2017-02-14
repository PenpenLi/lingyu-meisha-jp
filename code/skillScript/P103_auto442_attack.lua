P103_auto442_attack = 
{
	info_pool = {},

	init = function( effectScript )
		P103_auto442_attack.info_pool[effectScript.ID] = { Attacker = 0, AttackType = 0, AttackDataList = {}, AttackIndex = 1 }
	end,

	clean = function( effectScript )
		EffectScriptEnd(P103_auto442_attack.info_pool[effectScript.ID].Attacker)
        
		P103_auto442_attack.info_pool[effectScript.ID] = nil
	end,

	preLoad = function()
	end,

	run = function( effectScript )
		effectScript:RegisterEvent( 0, "scdsgf" )
	end,

	scdsgf = function( effectScript )
		SetAnimation(P103_auto442_attack.info_pool[effectScript.ID].Attacker, AnimationType.f_idle)
	end,

}
