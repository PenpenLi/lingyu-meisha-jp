--pveSweepPanel.lua

--========================================================================
--����pve�һ�����

PveSweepPanel =
	{
	};
	
	
--����
local curBarrierId		= 0;		--ѡ�����Ĺؿ�id
local maxCount			= 1;		--���һ�����
local hangUpResult 		= {};		--�һ����
local hangUpTimer 		= 0;		--�һ���ʱ��
local hangUpCount		= 0;		--�һ�����

--�ؼ�
local mainDesktop;
local panelBg;
local btnAgain;
local btnClose;
local chapterName;
local rewardPanel;
local teamList = {};
local dropList = {};
local panel;
local starList;
	
--��ʼ��
function PveSweepPanel:InitPanel(desktop)
	--������ʼ��
	curBarrierId		= 0;		--ѡ�����Ĺؿ�id
	hangUpResult 		= {};		--�һ����	
	autoBattleType = AutoBattleType.normal;

	--�ؼ���ʼ��
	mainDesktop 		= desktop;
	panel				= Panel(desktop:GetLogicChild('win_pve2'):GetLogicChild('center'));
	panel:IncRefCount();
	panel.Visibility = Visibility.Hidden;	
	panel.ZOrder = PanelZOrder.saodang;
	
	--����ɾ͸���
	starList = {};
	starList.setNum = function(num)
		for i=1, 4 do
			if i <= num then
				panel:GetLogicChild('starPanel'):GetLogicChild('star' .. i).Visibility = Visibility.Visible;
			else
				panel:GetLogicChild('starPanel'):GetLogicChild('star' .. i).Visibility = Visibility.Hidden;
			end
		end
	end

	--��ȡ����ͽ�Ǯ
	
	--��ȡ��Ʒ
	
	--����״̬
	
	--��ť
	panel:GetLogicChild('btn_sure'):SubscribeScriptedEvent('Button::ClickEvent', 'PveSweepPanel:onSureClick');
	panel:GetLogicChild('btn_reChallenge'):SubscribeScriptedEvent('Button::ClickEvent', 'PveSweepPanel:onReChanllenge');
end

--����
function PveSweepPanel:Destroy()
	panel:DecRefCount();
	panel = nil;
end

--��ʾ
function PveSweepPanel:Show()
	
	--��ʾ�ؿ���
	if autoBattleType == AutoBattleType.normal then
		chapterName.Text = resTableManager:GetValue(ResTable.barriers, tostring(curBarrierId), 'name');	
	elseif autoBattleType == AutoBattleType.miku then
		chapterName.Text = resTableManager:GetValue(ResTable.miku, tostring(curBarrierId), 'name');
	else
		chapterName.Text = LANG_pveAutoBattlePanel_1;
	end
	
end

function PveSweepPanel:Hide()
	panel.Visibility = Visibility.Hidden;
end

--����һ�����
function PveSweepPanel:onEnterHangUpPanel(barrierId)
	autoBattleType = AutoBattleType.normal;
	curBarrierId = barrierId;
	self:onHangUp();
end

--�һ�
function PveSweepPanel:onHangUp()
	if autoBattleType == AutoBattleType.miku then
		--�Կ߹һ�����
		local msg = {};
		msg.resid = curBarrierId;
		msg.killed = self:GetAutoBattleKillMonster(curBarrierId);
		Network:Send(NetworkCmdType.req_cave_pass, msg);
	elseif autoBattleType == AutoBattleType.normal then
		--����������͹һ�����
		local msg = {};
		msg.resid = curBarrierId;
		msg.count = 1;
		msg.killed = self:GetAutoBattleKillMonster(curBarrierId);
		Network:Send(NetworkCmdType.req_round_pass_new, msg);
	end
end

--��ȡ�ؿ�����id�͸���
function PveSweepPanel:GetAutoBattleKillMonster(barrierId)
	local monsterData;
	local bossData;
	local killedList = {};
	
	if autoBattleType == AutoBattleType.normal then
		monsterData = resTableManager:GetValue(ResTable.barriers, tostring(barrierId), {'initial_monster', 'monster'});
		bossData = resTableManager:GetValue(ResTable.barriers, tostring(barrierId), {'initial_boss', 'boss'});
	elseif autoBattleType == AutoBattleType.miku then
		monsterData = resTableManager:GetValue(ResTable.miku, tostring(barrierId), {'initial_monster', 'monster'});
		bossData = resTableManager:GetValue(ResTable.miku, tostring(barrierId), {'initial_boss', 'boss'});
	end

	for _,dataItem in pairs(monsterData) do
		if dataItem ~= nil then
			for _,item in ipairs(dataItem) do
				if killedList[item[1]] == nil then
					killedList[item[1]] = 1;
				else
					killedList[item[1]] = killedList[item[1]] + 1;
				end
			end
		end
	end
	
	for _,dataItem in pairs(bossData) do
		if dataItem ~= nil then
			if killedList[dataItem[1]] == nil then
				killedList[dataItem[1]] = 1;
			else
				killedList[dataItem[1]] = killedList[dataItem[1]] + 1;
			end	
		end
	end
	
	local list = {};
	for resid,num in pairs(killedList) do
		table.insert(list, {resid = tonumber(resid), num = num});
	end
	
	return list;
end

--�һ�����
function PveSweepPanel:onHangUpCallBack(msg)
	if (0 == #msg.results) then
		return;
	end

	hangUpResult = msg.results;									--����һ����
	--Debug.print_var_dump("msg:")
	--Debug.print_var_dump(msg)
end

--========================================================================
--�¼�

--���ȷ�ϰ�ť
function PveSweepPanel:onSureClick()
	self:Hide();
end

--����ٴ�ɨ����ť
function PveSweepPanel:onReChanllenge()
end
