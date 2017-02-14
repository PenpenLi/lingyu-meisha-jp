S590_magic_H017_attack = 
{
	info_pool = {},

	init = function( effectScript )
		S590_magic_H017_attack.info_pool[effectScript.ID] = { Attacker = 0,Targeter = 0,  AttackType = 0, AttackDataList = {}, AttackIndex = 1 }
	end,

	clean = function( effectScript )
		EffectScriptEnd(S590_magic_H017_attack.info_pool[effectScript.ID].Attacker)
        
		S590_magic_H017_attack.info_pool[effectScript.ID] = nil
	end,

	preLoad = function()
		PreLoadSound("atalk_01702")
		PreLoadSound("s0172")
		PreLoadAvatar("S210_2")
		PreLoadAvatar("S210_1")
	end,

	run = function( effectScript )
		effectScript:RegisterEvent( 0, "s" )
		effectScript:RegisterEvent( 2, "fds" )
		effectScript:RegisterEvent( 22, "d" )
		effectScript:RegisterEvent( 23, "fsdg" )
		effectScript:RegisterEvent( 24, "f" )
	end,

	s = function( effectScript )
		SetAnimation(S590_magic_H017_attack.info_pool[effectScript.ID].Attacker, AnimationType.skill2)
		PlaySound("atalk_01702")
		PlaySound("s0172")
	end,

	fds = function( effectScript )
		AttachAvatarPosEffect(false, S590_magic_H017_attack.info_pool[effectScript.ID].Attacker, AvatarPos.root, Vector2(75, 100), 2.5, 100, "S210_2")
	end,

	d = function( effectScript )
		AttachAvatarPosEffect(false, S590_magic_H017_attack.info_pool[effectScript.ID].Attacker, AvatarPos.root, Vector2(250, 70), 1.5, 100, "S210_1")
	end,

	fsdg = function( effectScript )
		if S590_magic_H017_attack.info_pool[effectScript.ID].Effect1 then DetachEffect(S590_magic_H017_attack.info_pool[effectScript.ID].Effect1);S590_magic_H017_attack.info_pool[effectScript.ID].Effect1 = nil; end
	end,

	f = function( effectScript )
			DamageEffect(S590_magic_H017_attack.info_pool[effectScript.ID].Attacker, S590_magic_H017_attack.info_pool[effectScript.ID].Targeter, S590_magic_H017_attack.info_pool[effectScript.ID].AttackType, S590_magic_H017_attack.info_pool[effectScript.ID].AttackDataList, S590_magic_H017_attack.info_pool[effectScript.ID].AttackIndex, effectScript)
	end,

}
