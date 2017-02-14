S411_magic_P05_attack = 
{
	info_pool = {},

	init = function( effectScript )
		S411_magic_P05_attack.info_pool[effectScript.ID] = { Attacker = 0,Targeter = 0,  AttackType = 0, AttackDataList = {}, AttackIndex = 1 }
	end,

	clean = function( effectScript )
		EffectScriptEnd(S411_magic_P05_attack.info_pool[effectScript.ID].Attacker)
		S411_magic_P05_attack.info_pool[effectScript.ID] = nil
	end,
	preLoad = function()
		PreLoadSound("manskill2")
		PreLoadAvatar("S411")
		PreLoadSound("lieyannutao")
	end,

	run = function( effectScript )
		effectScript:RegisterEvent( 1, "aa" )
		effectScript:RegisterEvent( 5, "ff" )
		effectScript:RegisterEvent( 26, "asd" )
		effectScript:RegisterEvent( 28, "asdsd" )
		effectScript:RegisterEvent( 30, "ffr" )
		effectScript:RegisterEvent( 33, "sd" )
		effectScript:RegisterEvent( 35, "dffg" )
		effectScript:RegisterEvent( 39, "gh" )
		effectScript:RegisterEvent( 42, "sde" )
	end,

	aa = function( effectScript )
		SetAnimation(S411_magic_P05_attack.info_pool[effectScript.ID].Attacker, AnimationType.skill)
	end,

	ff = function( effectScript )
			PlaySound("manskill2")
	end,

	asd = function( effectScript )
		AttachAvatarPosEffect(false, S411_magic_P05_attack.info_pool[effectScript.ID].Targeter, AvatarPos.root, Vector2(0, 0), 1, 100, "S411")
		PlaySound("lieyannutao")
	CameraShake()
	end,

	asdsd = function( effectScript )
			DamageEffect(S411_magic_P05_attack.info_pool[effectScript.ID].Attacker, S411_magic_P05_attack.info_pool[effectScript.ID].Targeter, S411_magic_P05_attack.info_pool[effectScript.ID].AttackType, S411_magic_P05_attack.info_pool[effectScript.ID].AttackDataList, S411_magic_P05_attack.info_pool[effectScript.ID].AttackIndex, effectScript)
	end,

	ffr = function( effectScript )
		CameraShake()
	end,

	sd = function( effectScript )
		CameraShake()
	end,

	dffg = function( effectScript )
		CameraShake()
	end,

	gh = function( effectScript )
		CameraShake()
	end,

	sde = function( effectScript )
		CameraShake()
	end,

}