S570_magic_M001_attack = 
{
	info_pool = {},

	init = function( effectScript )
		S570_magic_M001_attack.info_pool[effectScript.ID] = { Attacker = 0,Targeter = 0,  AttackType = 0, AttackDataList = {}, AttackIndex = 1 }
	end,

	clean = function( effectScript )
		EffectScriptEnd(S570_magic_M001_attack.info_pool[effectScript.ID].Attacker)
        
		S570_magic_M001_attack.info_pool[effectScript.ID] = nil
	end,

	preLoad = function()
		PreLoadAvatar("S200")
	end,

	run = function( effectScript )
		effectScript:RegisterEvent( 0, "sf" )
		effectScript:RegisterEvent( 27, "d" )
		effectScript:RegisterEvent( 29, "fd" )
	end,

	sf = function( effectScript )
		SetAnimation(S570_magic_M001_attack.info_pool[effectScript.ID].Attacker, AnimationType.attack)
	end,

	d = function( effectScript )
		AttachAvatarPosEffect(false, S570_magic_M001_attack.info_pool[effectScript.ID].Targeter, AvatarPos.root, Vector2(0, -10), 2, 100, "S200")
	end,

	fd = function( effectScript )
			DamageEffect(S570_magic_M001_attack.info_pool[effectScript.ID].Attacker, S570_magic_M001_attack.info_pool[effectScript.ID].Targeter, S570_magic_M001_attack.info_pool[effectScript.ID].AttackType, S570_magic_M001_attack.info_pool[effectScript.ID].AttackDataList, S570_magic_M001_attack.info_pool[effectScript.ID].AttackIndex, effectScript)
	end,

}
