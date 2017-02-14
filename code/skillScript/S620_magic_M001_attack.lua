S620_magic_M001_attack = 
{
	info_pool = {},

	init = function( effectScript )
		S620_magic_M001_attack.info_pool[effectScript.ID] = { Attacker = 0,Targeter = 0,  AttackType = 0, AttackDataList = {}, AttackIndex = 1 }
	end,

	clean = function( effectScript )
		EffectScriptEnd(S620_magic_M001_attack.info_pool[effectScript.ID].Attacker)
        
		S620_magic_M001_attack.info_pool[effectScript.ID] = nil
	end,

	preLoad = function()
		PreLoadAvatar("S202_1")
	end,

	run = function( effectScript )
		effectScript:RegisterEvent( 0, "sfd" )
		effectScript:RegisterEvent( 27, "fdsgfdg" )
		effectScript:RegisterEvent( 30, "fg" )
	end,

	sfd = function( effectScript )
		SetAnimation(S620_magic_M001_attack.info_pool[effectScript.ID].Attacker, AnimationType.attack)
	end,

	fdsgfdg = function( effectScript )
		AttachAvatarPosEffect(false, S620_magic_M001_attack.info_pool[effectScript.ID].Targeter, AvatarPos.body, Vector2(0, 0), -2, 100, "S202_1")
	end,

	fg = function( effectScript )
			DamageEffect(S620_magic_M001_attack.info_pool[effectScript.ID].Attacker, S620_magic_M001_attack.info_pool[effectScript.ID].Targeter, S620_magic_M001_attack.info_pool[effectScript.ID].AttackType, S620_magic_M001_attack.info_pool[effectScript.ID].AttackDataList, S620_magic_M001_attack.info_pool[effectScript.ID].AttackIndex, effectScript)
	end,

}
