--fightConfigPanel.lua
--==============================================================================================
--vip��Ȩ���

FightConfigPanel =
	{
	};

--����
local font;
local fontVip;
local color;

--�ؼ�
local mainDesktop;
local panel;

local animOff;				--�����ر�
local animOn;				--��������
local bulletOff;			--��Ļ�ر�
local bulletOn;				--��Ļ����
local fightProgress;		--�ؿ�������
local bgmVolume;			--Bgm������
local soundVolume;			--��Ч������
local actorImage;			--�������ϵĽ�ɫͷ��
local bossImage;			--��������ߵ�bossͷ��
local panelAnim;
local panelBullet;
local panelInfo;			--˵��ҳ

local jieming;				--����
local zhangming;			--����

local textGuanqia;			--config�ı�
local textTongguan;

local bgmProgress;
local soundProgress;

local animStatus;

local isShowAnimState;

--============================================================================================
--���¿ؼ�״̬

--���¶�������״̬
function FightConfigPanel:UpdateAnimState(flag)

	if flag then
		animOn.Selected = true;
		animOff.Selected = false;
	else
		animOn.Selected = false;
		animOff.Selected = true;
	end
	panelAnim.Background = Converter.String2Brush(flag and FightConfigBrush.On or FightConfigBrush.Off);
end

--���µ�Ļ����״̬
function FightConfigPanel:UpdateBulletState()
	bulletOn.Selected = BulletScreenManager:getEnable();
	bulletOff.Selected = not BulletScreenManager:getEnable();
	panelBullet.Background = Converter.String2Brush(BulletScreenManager:getEnable() and FightConfigBrush.On or FightConfigBrush.Off);
end

--���µ�ǰ�ؿ�����
function FightConfigPanel:UpdateFightProgress()
	fightProgress.CurValue, fightProgress.MaxValue = FightManager:getFightProgress();
end

--���µ�ǰbgm����
function FightConfigPanel:UpdateBgmVolume()
	if SystemPanel.soundFlag then
		local value = SoundManager:getBgmVolume();
		local value = value or 0;
		if value > 1 or value < 0 then
			value = 0;
		end
		bgmVolume.CurValue = value * 100;
		bgmProgress.CurValue = value * 100 ;
	end
end

--���µ�ǰ��Ч����
function FightConfigPanel:UpdateSoundVolume()
	if SystemPanel.soundEffectFlag then
		local value = SoundManager:getEffectVolume();
		local value = value or 0;
		if value > 1 or value < 0 then
			value = 0;
		end
		soundVolume.CurValue = value * 100;
	    soundProgress.CurValue =  value * 100;
	end
end

--��������ͷ���Լ�λ��
function FightConfigPanel:UpdateActorImage()
	actorImage.Image = GetPicture('fight/cf_start_coin.ccz')
	actorImage:SetTranslateX(fightProgress.CurValue / fightProgress.MaxValue * 300);
end

--���������н�������ͷʱ��bossͷ��
function FightConfigPanel:UpdateBossImage()
	bossImage.Image = GetPicture('fight/cf_boss_coin.ccz')
end

--��������
function FightConfigPanel:UpdateZhangMing()
	local bid = FightManager.barrierId;
	if bid > 7000 and bid < 8000 then
		zhangming.Text = resTableManager:GetValue(ResTable.limit_round, tostring(bid), 'name');
	elseif (bid > 1000 and bid < 2000) or (bid > 5000 and bid < 6000) then
		zhangming.Text = resTableManager:GetValue(ResTable.barriers, tostring(bid), 'name');
	elseif bid > 8000 and bid < 9000 then
		zhangming.Text = LANG_expeditionPanel_8;
	elseif bid > 4000 and bid < 5000 then
		zhangming.Text = LANG_dragonTreasurePanel_6;
	else
		zhangming.Text = 'Silence!'
	end

	-- �����淨����
	if FightManager.mFightType == FightType.arena then
		zhangming.Text = LANG_Config_arena;
	elseif FightManager.mFightType == FightType.rank then
		zhangming.Text = LANG_Config_rank;
	elseif FightManager.mFightType == FightType.unionBattle then
		zhangming.Text = LANG_Config_unionBattle;
	elseif FightManager.mFightType == FightType.scuffle then
		zhangming.Text = LANG_Config_scuffle;
	end 
	zhangming.Text = LANG_Config_1;
end

--���½���
function FightConfigPanel:UpdateJieMing()
	jieming.Text = tostring(soundVolume.CurValue)
end

--�����ı�
function FightConfigPanel:UpdateText()
	--[[if textGuanqia.Text == "" then
		textGuanqia.Text = "111111111111"
	end]]

	if textTongguan.Text == "" then
		textTongguan.Text = "���������ߵ����յ�ˮ���ԵĶ�Ա���߿����buff�ļ��ܴ�ȫ��ظ���ҽ��ְҵ"
	end
end

--============================================================================================
--��ʼ��
function FightConfigPanel:InitPanel(desktop)

	--������ʼ��
	font = uiSystem:FindFont('huakang_20');
	--fontVip = uiSystem:FindFont('vipFont');
	color = QuadColor(Color(248, 220, 159, 255));
	animStatus = true;

	--�����ʼ��
	mainDesktop = desktop;
	panel = Panel(desktop:GetLogicChild('fightConfigPanel'));
	panel.Visibility = Visibility.Hidden;
	panel.ZOrder = PanelZOrder.fightConfig;

	--�ؼ���ʼ��
	animOff = panel:GetLogicChild('animPanel'):GetLogicChild('animOff');
	animOff:SubscribeScriptedEvent('RadioButton::SelectedEvent', 'FightConfigPanel:OnAnimOff');
	animOn = panel:GetLogicChild('animPanel'):GetLogicChild('animOn');
	animOn:SubscribeScriptedEvent('RadioButton::SelectedEvent', 'FightConfigPanel:OnAnimOn');
	bulletOff = panel:GetLogicChild('bulletPanel'):GetLogicChild('bulletOff');
	bulletOff:SubscribeScriptedEvent('RadioButton::SelectedEvent', 'FightConfigPanel:OnBulletOff');
	bulletOn = panel:GetLogicChild('bulletPanel'):GetLogicChild('bulletOn');
	bulletOn:SubscribeScriptedEvent('RadioButton::SelectedEvent', 'FightConfigPanel:OnBulletOn');

	panelAnim = panel:GetLogicChild('animPanel');
	panelBullet = panel:GetLogicChild('bulletPanel');
	--fightProgress = panel:GetLogicChild('fightProgress');
	--actorImage = panel:GetLogicChild('actorImage');
	--bossImage = panel:GetLogicChild('bossImage');
	--jieming = panel:GetLogicChild('jieming');
	zhangming = panel:GetLogicChild('title');
	--textGuanqia = panel:GetLogicChild('guanqiajianjie');
	--textTongguan = panel:GetLogicChild('tongguangongneng');
	bgmProgress = panel:GetLogicChild('bgmProgressBar');
	bgmVolume = panel:GetLogicChild('bgmVolume');
	soundProgress = panel:GetLogicChild('soundProgressBar');
	soundVolume = panel:GetLogicChild('soundVolume');

	isShowAnimState = true;
end

--����
function FightConfigPanel:Destroy()
end

--��ʾ
function FightConfigPanel:Show()
	panel.Visibility = Visibility.Visible;
	self:UpdateAnimState(isShowAnimState);
	self:UpdateBulletState();
	--self:UpdateFightProgress();
	self:UpdateBgmVolume();
	self:UpdateSoundVolume();
	--self:UpdateActorImage();
	--self:UpdateBossImage();
	self:UpdateZhangMing();
	--self:UpdateJieMing();
	--self:UpdateText();
end

--����
function FightConfigPanel:Hide()
	panel.Visibility = Visibility.Hidden;
end

--============================================================================================


--ˢ����ȡ��ť״̬
--[[
function VipPanel:RefreshVipRewardButton()

	local firstPos = -1;		--��һ��������ȡ��λ��
	local endPos = -1;		--���һ������ȡ��λ��
	for i = 1, 12 do
		local panel = listView:GetLogicChild(i-1):GetLogicChild(0);
		local get = panel:GetLogicChild('get');

		if ActorManager.user_data.reward.vip_reward[i] == 0 then
			--������
			get.Enable = false;
			get.Text = LANG_vipPanel_2;
		elseif ActorManager.user_data.reward.vip_reward[i] == -1 then
			--����ȡ
			get.Enable = false;
			get.Text = LANG_vipPanel_3;

			endPos = i;		--��¼����ȡλ��
		elseif ActorManager.user_data.reward.vip_reward[i] == 1 then
			--����ȡ
			get.Enable = true;
			get.Text = LANG_vipPanel_4;

			if firstPos == -1 then
				firstPos = i;	--��¼��һ������ȡ��λ��
			end
		end
	end

	local pos = 0;
	if firstPos ~= -1 then
		pos = firstPos - 1;
	elseif endPos ~= -1 then
		pos = endPos;
	else
		pos = math.max(0, ActorManager.user_data.viplevel - 1);
	end

	listView:SetActivePageIndexImmediate(pos);

end
]]


--==============================================================================================
--�¼�
--�ض���
function FightConfigPanel:OnAnimOff()
	isShowAnimState = false;
	panelAnim.Background = Converter.String2Brush(FightConfigBrush.Off);
	animStatus = false;
end

--������
function FightConfigPanel:OnAnimOn()
	isShowAnimState = true;
	panelAnim.Background = Converter.String2Brush(FightConfigBrush.On);
	animStatus = true;
end

--�ص�Ļ
function FightConfigPanel:OnBulletOff()
	panelBullet.Background = Converter.String2Brush(FightConfigBrush.Off);

	BulletScreenManager:setEnable(false)
end

--����Ļ
function FightConfigPanel:OnBulletOn()
	panelBullet.Background = Converter.String2Brush(FightConfigBrush.On);
	BulletScreenManager:setEnable(true)
end

--�޸�bgm������
function FightConfigPanel:OnChangeBgmVolume()
	if SystemPanel.soundFlag then
		SoundManager:setBgmVolume(bgmVolume.CurValue/100);
	end
    bgmProgress.CurValue = bgmVolume.CurValue;
end

--�޸���Ч����
function FightConfigPanel:OnChangeEffectVolume()
	if SystemPanel.soundEffectFlag then
		SoundManager:setEffectVolume(soundVolume.CurValue/100);
	end
	soundProgress.CurValue =  soundVolume.CurValue;
end

--������Ϸ
function FightConfigPanel:onContinue()
	SceneRenderStep:Continue();
	FightManager:ResumeAction();
	FightManager:ResumeEffectScript();
	FightUIManager:resumeTime();
	self:Hide();
end

--�˳���Ϸ
function FightConfigPanel:onClose()
	appFramework.TimeScale = Configuration.FightTimeScaleList[1];
	-- �����淨����
	if FightManager.mFightType == FightType.arena or
		FightManager.mFightType == FightType.rank or
		FightManager.mFightType == FightType.unionBattle or
		FightManager.mFightType == FightType.scuffle then
		self:onContinue();
		FightManager:setAllLeftRoleDie();
		return;
	end 

    SceneRenderStep:Continue();
    --FightManager:ResumeAction();
    effectScriptManager:DestroyAllEffectScript();
    FightUIManager:resumeTime();
    self:Hide();
    SoundManager:StopFightSound();
    FightOverUIManager:realTryAgain();
    --	FightOverUIManager:realReturnToPveBarrier();

    if platformSDK.m_System ~= 'Win32' then
        os.remove(appFramework:GetCachePath() .. 'debug.txt');
    end

end


--��ȡ����״̬
function FightConfigPanel:getAnimStatus()
	return animStatus;
end
