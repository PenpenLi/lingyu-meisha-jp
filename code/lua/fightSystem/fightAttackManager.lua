--fightAttackManager.lua
--====================================================================
--攻击管理者
FightAttackManager =
	{
		attackList = {};				--攻击列表
		globalAttackID = 0;				--全局攻击id
	};

--分配攻击id
function FightAttackManager:allocAttackID()
	self.globalAttackID = self.globalAttackID + 1;
	return self.globalAttackID;
end

--清除所有攻击类
function FightAttackManager:Clear()
	self.attackList = {};
end

--重置攻击id
function FightAttackManager:ResetAttackID()
	self.globalAttackID = 0;
end

--获取攻击类
function FightAttackManager:GetAttackClass(attackid)
	return self.attackList[attackid];
end

--创建攻击
function FightAttackManager:CreateAttack(attacker, targeterList, fighterSkill)
	local attackID = self:allocAttackID();
	local fightAttack = FightAttackClass.new(attackID, attacker, targeterList, fighterSkill);
	self.attackList[attackID] = fightAttack;
	return fightAttack, targeterList;
end	

--删除攻击
function FightAttackManager:DestroyAttack(attackClass)	
	local attackID = attackClass:GetID();
	if self.attackList[attackID] ~= nil then
		if self.attackList[attackID]:IsEffectScriptDestroy() then
			--如果技能脚本已经被销毁，则销毁attackClass
			self.attackList[attackID] = nil;
		else
			--如果技能脚本没有被销毁，则设置技能脚本回调时销毁
			self.attackList[attackID]:SetNeedDestroy(true);
		end
	end
end

function FightAttackManager:InterruptAttack(attackID)
	for _, attack in pairs(self.attackList) do
		if attack:GetAttacker().id == attackID then
      Debug.print("FightAttackManager:InterruptAttack " .. tostring(attackID));
			attack:Interrupt();
		end
	end
end
