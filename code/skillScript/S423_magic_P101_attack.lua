S423_magic_P101_attack = 
{
	info_pool = {},

	init = function( effectScript )
		S423_magic_P101_attack.info_pool[effectScript.ID] = { Attacker = 0,Targeter = 0,  AttackType = 0, AttackDataList = {}, AttackIndex = 1 }
	end,

	clean = function( effectScript )
		EffectScriptEnd(S423_magic_P101_attack.info_pool[effectScript.ID].Attacker)
        
		S423_magic_P101_attack.info_pool[effectScript.ID] = nil
	end,

	preLoad = function()
		PreLoadAvatar("S422_1")
		PreLoadAvatar("S422_2")
	end,

	run = function( effectScript )
		effectScript:RegisterEvent( 0, "ssdfdg" )
		effectScript:RegisterEvent( 13, "fdgh" )
		effectScript:RegisterEvent( 40, "sdfdg" )
		effectScript:RegisterEvent( 49, "dsggggggggggg" )
		effectScript:RegisterEvent( 71, "sfdg" )
		effectScript:RegisterEvent( 72, "sdgfg" )
		effectScript:RegisterEvent( 77, "fdhgfh" )
	end,

	ssdfdg = function( effectScript )
		SetAnimation(S423_magic_P101_attack.info_pool[effectScript.ID].Attacker, AnimationType.skill2)
	end,

	fdgh = function( effectScript )
		AttachAvatarPosEffect(false, S423_magic_P101_attack.info_pool[effectScript.ID].Attacker, AvatarPos.root, Vector2(0, 50), 1.5, 100, "S422_1")
	end,

	sdfdg = function( effectScript )
		AttachAvatarPosEffect(false, S423_magic_P101_attack.info_pool[effectScript.ID].Targeter, AvatarPos.root, Vector2(0, 0), 2, 100, "S422_2")
	end,

	dsggggggggggg = function( effectScript )
			DamageEffect(S423_magic_P101_attack.info_pool[effectScript.ID].Attacker, S423_magic_P101_attack.info_pool[effectScript.ID].Targeter, S423_magic_P101_attack.info_pool[effectScript.ID].AttackType, S423_magic_P101_attack.info_pool[effectScript.ID].AttackDataList, S423_magic_P101_attack.info_pool[effectScript.ID].AttackIndex, effectScript)
	end,

	sfdg = function( effectScript )
		CameraShake()
	end,

	sdgfg = function( effectScript )
			DamageEffect(S423_magic_P101_attack.info_pool[effectScript.ID].Attacker, S423_magic_P101_attack.info_pool[effectScript.ID].Targeter, S423_magic_P101_attack.info_pool[effectScript.ID].AttackType, S423_magic_P101_attack.info_pool[effectScript.ID].AttackDataList, S423_magic_P101_attack.info_pool[effectScript.ID].AttackIndex, effectScript)
	end,

	fdhgfh = function( effectScript )
			DamageEffect(S423_magic_P101_attack.info_pool[effectScript.ID].Attacker, S423_magic_P101_attack.info_pool[effectScript.ID].Targeter, S423_magic_P101_attack.info_pool[effectScript.ID].AttackType, S423_magic_P101_attack.info_pool[effectScript.ID].AttackDataList, S423_magic_P101_attack.info_pool[effectScript.ID].AttackIndex, effectScript)
	end,

}
