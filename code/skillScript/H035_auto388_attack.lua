H035_auto388_attack = 
{
	info_pool = {},

	init = function( effectScript )
		H035_auto388_attack.info_pool[effectScript.ID] = { Attacker = 0,Targeter = 0,  AttackType = 0, AttackDataList = {}, AttackIndex = 1 }
	end,

	clean = function( effectScript )
		EffectScriptEnd(H035_auto388_attack.info_pool[effectScript.ID].Attacker)
        
		H035_auto388_attack.info_pool[effectScript.ID] = nil
	end,

	preLoad = function()
	end,

	run = function( effectScript )
		effectScript:RegisterEvent( 0, "hgjkk" )
		effectScript:RegisterEvent( 9, "gfjkkk" )
	end,

	hgjkk = function( effectScript )
		SetAnimation(H035_auto388_attack.info_pool[effectScript.ID].Attacker, AnimationType.f_idle)
	end,

	gfjkkk = function( effectScript )
			DamageEffect(H035_auto388_attack.info_pool[effectScript.ID].Attacker, H035_auto388_attack.info_pool[effectScript.ID].Targeter, H035_auto388_attack.info_pool[effectScript.ID].AttackType, H035_auto388_attack.info_pool[effectScript.ID].AttackDataList, H035_auto388_attack.info_pool[effectScript.ID].AttackIndex, effectScript)
	end,

}
