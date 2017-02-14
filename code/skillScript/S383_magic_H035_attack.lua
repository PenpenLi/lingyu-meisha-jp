S383_magic_H035_attack = 
{
	info_pool = {},

	init = function( effectScript )
		S383_magic_H035_attack.info_pool[effectScript.ID] = { Attacker = 0,Targeter = 0,  AttackType = 0, AttackDataList = {}, AttackIndex = 1 }
	end,

	clean = function( effectScript )
		EffectScriptEnd(S383_magic_H035_attack.info_pool[effectScript.ID].Attacker)
        
		S383_magic_H035_attack.info_pool[effectScript.ID] = nil
	end,

	preLoad = function()
		PreLoadSound("stalk_03501")
		PreLoadAvatar("H035_xuli_2")
		PreLoadSound("skill_03501")
		PreLoadAvatar("S712_1")
		PreLoadAvatar("S712_2")
		PreLoadSound("attack_03502")
		PreLoadSound("attack_03502")
	end,

	run = function( effectScript )
		effectScript:RegisterEvent( 0, "dgh" )
		effectScript:RegisterEvent( 9, "sfgdh" )
		effectScript:RegisterEvent( 31, "dsgdh" )
		effectScript:RegisterEvent( 33, "sdfsdg" )
		effectScript:RegisterEvent( 35, "dfgh" )
		effectScript:RegisterEvent( 38, "gdfj" )
	end,

	dgh = function( effectScript )
		SetAnimation(S383_magic_H035_attack.info_pool[effectScript.ID].Attacker, AnimationType.skill2)
		PlaySound("stalk_03501")
	end,

	sfgdh = function( effectScript )
		AttachAvatarPosEffect(false, S383_magic_H035_attack.info_pool[effectScript.ID].Attacker, AvatarPos.root, Vector2(50, 60), 1.2, 100, "H035_xuli_2")
		PlaySound("skill_03501")
	end,

	dsgdh = function( effectScript )
		AttachAvatarPosEffect(false, S383_magic_H035_attack.info_pool[effectScript.ID].Attacker, AvatarPos.root, Vector2(50, 50), 1.2, 100, "S712_1")
	end,

	sdfsdg = function( effectScript )
		AttachAvatarPosEffect(false, S383_magic_H035_attack.info_pool[effectScript.ID].Targeter, AvatarPos.body, Vector2(0, 0), 1, 100, "S712_2")
		PlaySound("attack_03502")
	end,

	dfgh = function( effectScript )
		end,

	gdfj = function( effectScript )
			DamageEffect(S383_magic_H035_attack.info_pool[effectScript.ID].Attacker, S383_magic_H035_attack.info_pool[effectScript.ID].Targeter, S383_magic_H035_attack.info_pool[effectScript.ID].AttackType, S383_magic_H035_attack.info_pool[effectScript.ID].AttackDataList, S383_magic_H035_attack.info_pool[effectScript.ID].AttackIndex, effectScript)
		PlaySound("attack_03502")
	end,

}