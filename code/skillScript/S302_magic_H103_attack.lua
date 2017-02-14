S302_magic_H103_attack = 
{
	info_pool = {},

	init = function( effectScript )
		S302_magic_H103_attack.info_pool[effectScript.ID] = { Attacker = 0,Targeter = 0,  AttackType = 0, AttackDataList = {}, AttackIndex = 1 }
	end,

	clean = function( effectScript )
		EffectScriptEnd(S302_magic_H103_attack.info_pool[effectScript.ID].Attacker)
		S302_magic_H103_attack.info_pool[effectScript.ID] = nil
	end,
	preLoad = function()
		PreLoadAvatar("S302")
	end,

	run = function( effectScript )
		effectScript:RegisterEvent( 0, "a" )
		effectScript:RegisterEvent( 19, "d" )
		effectScript:RegisterEvent( 23, "f" )
		effectScript:RegisterEvent( 26, "w" )
	end,

	a = function( effectScript )
		SetAnimation(S302_magic_H103_attack.info_pool[effectScript.ID].Attacker, AnimationType.skill)
	end,

	d = function( effectScript )
		end,

	f = function( effectScript )
		AttachAvatarPosEffect(false, S302_magic_H103_attack.info_pool[effectScript.ID].Targeter, AvatarPos.body, Vector2(0, 30), 1, 100, "S302")
	end,

	w = function( effectScript )
			DamageEffect(S302_magic_H103_attack.info_pool[effectScript.ID].Attacker, S302_magic_H103_attack.info_pool[effectScript.ID].Targeter, S302_magic_H103_attack.info_pool[effectScript.ID].AttackType, S302_magic_H103_attack.info_pool[effectScript.ID].AttackDataList, S302_magic_H103_attack.info_pool[effectScript.ID].AttackIndex, effectScript)
	CameraShake()
	end,

}
