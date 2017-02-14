M064_normal_attack = 
{
  info_pool = {},

  init = function( effectScript )
    M064_normal_attack.info_pool[effectScript.ID] = { Attacker = 0, Targeter = 0,   AttackType = 0, AttackDataList = {} }
  end,

  clean = function( effectScript )
    M064_normal_attack.info_pool[effectScript.ID] = nil
  end,

  run = function( effectScript )
    effectScript:RegisterEvent( 0, "sdfb" )
    effectScript:RegisterEvent( 11, "be" )
    effectScript:RegisterEvent( 13, "rth" )
  end,

  sdfb = function( effectScript )
    SetAnimation(M064_normal_attack.info_pool[effectScript.ID].Attacker, AnimationType.attack)
  end,

  be = function( effectScript )
    AttachAvatarPosEffect(false, M064_normal_attack.info_pool[effectScript.ID].Attacker, AvatarPos.root, Vector2(0, 0), 1, 100, "米诺陶诺斯_普攻特效")
  end,

  rth = function( effectScript )
    DamageEffect(M064_normal_attack.info_pool[effectScript.ID].Attacker, M064_normal_attack.info_pool[effectScript.ID].Targeter, M064_normal_attack.info_pool[effectScript.ID].AttackType, M064_normal_attack.info_pool[effectScript.ID].AttackDataList)
  end,

}
