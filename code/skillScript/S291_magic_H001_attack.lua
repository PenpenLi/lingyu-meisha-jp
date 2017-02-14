S291_magic_H001_attack = 
{
	info_pool = {},

	init = function( effectScript )
		S291_magic_H001_attack.info_pool[effectScript.ID] = { Attacker = 0,Targeter = 0,  AttackType = 0, AttackDataList = {}, AttackIndex = 1 }
	end,

	clean = function( effectScript )
		EffectScriptEnd(S291_magic_H001_attack.info_pool[effectScript.ID].Attacker)
        
		S291_magic_H001_attack.info_pool[effectScript.ID] = nil
	end,

	preLoad = function()
		PreLoadSound("stalk_0101")
		PreLoadSound("skill_0101")
		PreLoadAvatar("S290_1")
		PreLoadAvatar("S290_2")
		PreLoadSound("skill_0101")
	end,

	run = function( effectScript )
		effectScript:RegisterEvent( 0, "ddgfh" )
		effectScript:RegisterEvent( 3, "sdfgdh" )
		effectScript:RegisterEvent( 7, "dsfdghh" )
		effectScript:RegisterEvent( 22, "csh" )
		effectScript:RegisterEvent( 32, "dgfjh" )
	end,

	ddgfh = function( effectScript )
		SetAnimation(S291_magic_H001_attack.info_pool[effectScript.ID].Attacker, AnimationType.skill)
		PlaySound("stalk_0101")
	end,

	sdfgdh = function( effectScript )
			PlaySound("skill_0101")
	end,

	dsfdghh = function( effectScript )
		AttachAvatarPosEffect(false, S291_magic_H001_attack.info_pool[effectScript.ID].Attacker, AvatarPos.root, Vector2(0, 0), 1.2, 100, "S290_1")
	AttachAvatarPosEffect(false, S291_magic_H001_attack.info_pool[effectScript.ID].Attacker, AvatarPos.root, Vector2(0, 0), 1.2, -100, "S290_2")
	end,

	csh = function( effectScript )
			PlaySound("skill_0101")
	end,

	dgfjh = function( effectScript )
			DamageEffect(S291_magic_H001_attack.info_pool[effectScript.ID].Attacker, S291_magic_H001_attack.info_pool[effectScript.ID].Targeter, S291_magic_H001_attack.info_pool[effectScript.ID].AttackType, S291_magic_H001_attack.info_pool[effectScript.ID].AttackDataList, S291_magic_H001_attack.info_pool[effectScript.ID].AttackIndex, effectScript)
	end,

}
