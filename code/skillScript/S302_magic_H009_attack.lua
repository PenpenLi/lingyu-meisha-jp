S302_magic_H009_attack = 
{
	info_pool = {},

	init = function( effectScript )
		S302_magic_H009_attack.info_pool[effectScript.ID] = { Attacker = 0,Targeter = 0,  AttackType = 0, AttackDataList = {}, AttackIndex = 1 }
	end,

	clean = function( effectScript )
		EffectScriptEnd(S302_magic_H009_attack.info_pool[effectScript.ID].Attacker)
        
		S302_magic_H009_attack.info_pool[effectScript.ID] = nil
	end,

	preLoad = function()
		PreLoadSound("atalk_0901")
		PreLoadAvatar("S302_4")
		PreLoadAvatar("S302_1")
		PreLoadAvatar("S302_2")
		PreLoadAvatar("S302_3")
	end,

	run = function( effectScript )
		effectScript:RegisterEvent( 0, "b" )
		effectScript:RegisterEvent( 5, "adsfdg" )
		effectScript:RegisterEvent( 8, "sdggfh" )
		effectScript:RegisterEvent( 11, "fsdgh" )
		effectScript:RegisterEvent( 35, "dgfdh" )
		effectScript:RegisterEvent( 36, "rfeh" )
		effectScript:RegisterEvent( 37, "dfhgj" )
		effectScript:RegisterEvent( 38, "asfdsgfdgh" )
		effectScript:RegisterEvent( 40, "adsfdgaf" )
	end,

	b = function( effectScript )
		SetAnimation(S302_magic_H009_attack.info_pool[effectScript.ID].Attacker, AnimationType.skill2)
		PlaySound("atalk_0901")
	end,

	adsfdg = function( effectScript )
		AttachAvatarPosEffect(false, S302_magic_H009_attack.info_pool[effectScript.ID].Attacker, AvatarPos.root, Vector2(0, 0), 1, -100, "S302_4")
	end,

	sdggfh = function( effectScript )
		AttachAvatarPosEffect(false, S302_magic_H009_attack.info_pool[effectScript.ID].Attacker, AvatarPos.root, Vector2(10, 70), 1, 100, "S302_1")
	end,

	fsdgh = function( effectScript )
	end,

	dgfdh = function( effectScript )
	end,

	rfeh = function( effectScript )
	end,

	dfhgj = function( effectScript )
		AttachAvatarPosEffect(false, S302_magic_H009_attack.info_pool[effectScript.ID].Attacker, AvatarPos.root, Vector2(120, 70), 2.5, 100, "S302_2")
	end,

	asfdsgfdgh = function( effectScript )
		AttachAvatarPosEffect(false, S302_magic_H009_attack.info_pool[effectScript.ID].Targeter, AvatarPos.body, Vector2(0, 0), -3, 100, "S302_3")
	end,

	adsfdgaf = function( effectScript )
			DamageEffect(S302_magic_H009_attack.info_pool[effectScript.ID].Attacker, S302_magic_H009_attack.info_pool[effectScript.ID].Targeter, S302_magic_H009_attack.info_pool[effectScript.ID].AttackType, S302_magic_H009_attack.info_pool[effectScript.ID].AttackDataList, S302_magic_H009_attack.info_pool[effectScript.ID].AttackIndex, effectScript)
	end,

}
