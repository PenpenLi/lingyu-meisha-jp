S301_magic_H037_attack = 
{
	info_pool = {},

	init = function( effectScript )
		S301_magic_H037_attack.info_pool[effectScript.ID] = { Attacker = 0,Targeter = 0,  AttackType = 0, AttackDataList = {}, AttackIndex = 1 }
	end,

	clean = function( effectScript )
		EffectScriptEnd(S301_magic_H037_attack.info_pool[effectScript.ID].Attacker)
		S301_magic_H037_attack.info_pool[effectScript.ID] = nil
	end,
	preLoad = function()
		PreLoadSound("horse")
		PreLoadAvatar("S301_1")
	end,

	run = function( effectScript )
		effectScript:RegisterEvent( 0, "a" )
		effectScript:RegisterEvent( 16, "b" )
		effectScript:RegisterEvent( 17, "c" )
	end,

	a = function( effectScript )
		SetAnimation(S301_magic_H037_attack.info_pool[effectScript.ID].Attacker, AnimationType.skill)
		PlaySound("horse")
	end,

	b = function( effectScript )
		end,

	c = function( effectScript )
		AttachAvatarPosEffect(false, S301_magic_H037_attack.info_pool[effectScript.ID].Targeter, AvatarPos.root, Vector2(0, 0), 1, 100, "S301_1")
	CameraShake()
		DamageEffect(S301_magic_H037_attack.info_pool[effectScript.ID].Attacker, S301_magic_H037_attack.info_pool[effectScript.ID].Targeter, S301_magic_H037_attack.info_pool[effectScript.ID].AttackType, S301_magic_H037_attack.info_pool[effectScript.ID].AttackDataList, S301_magic_H037_attack.info_pool[effectScript.ID].AttackIndex, effectScript)
	end,

}
