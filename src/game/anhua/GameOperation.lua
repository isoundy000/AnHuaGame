local NetMgr = require("common.NetMgr")
local NetMsgId = require("common.NetMsgId")
local EventMgr = require("common.EventMgr")
local EventType = require("common.EventType")
local Common = require("common.Common")
local Bit = require("common.Bit")
local GameCommon = require("game.anhua.GameCommon")
local GameLogic = require("game.anhua.GameLogic")

local BG_WIGTH = 280
local INNER_WIGTH = 64
local GameOperation = class("GameOperation", function()
	return ccui.Layout:create()
end)

function GameOperation:create(opType, cbOperateCode, cbOperateCard, cbCardIndex, cbSubOperateCode)
	local view = GameOperation.new()
	view:onCreate(opType, cbOperateCode, cbOperateCard, cbCardIndex, cbSubOperateCode)
	local function onEventHandler(eventType)
		if eventType == "enter" then
			view:onEnter()
		elseif eventType == "exit" then
			view:onExit()
		elseif eventType == "cleanup" then
			view:onCleanup()
		end
	end
	view:registerScriptHandler(onEventHandler)
	return view
end

function GameOperation:onEnter()
	self.isFast = false--cc.UserDefault:getInstance():getBoolForKey('HHisFastEat', true)	

	--EventMgr:registListener('HHChangeLayout',self,self.HHChangeLayout)
end

function GameOperation:onExit()
	if self.uiPanel_item ~= nil then
		self.uiPanel_item:release()
		self.uiPanel_item = nil
	end
	if self.Button_operation ~= nil then
		self.Button_operation:release()
		self.Button_operation = nil
	end
	if self.uiListView_list ~= nil then
		self.uiListView_list:release()
		self.uiListView_list = nil
	end
	--EventMgr:unregistListener('HHChangeLayout',self,self.HHChangeLayout)
end

function GameOperation:onCleanup()
	
end

function GameOperation:onCreate(opType, cbOperateCode, cbOperateCard, cbCardIndex, cbSubOperateCode)
	local visibleSize = cc.Director:getInstance():getVisibleSize()
	local csb = cc.CSLoader:createNode("AHOperationLayer.csb")
	self:addChild(csb)
	self.root = csb:getChildByName("Panel_root")
	self.csb = csb
	print("操作提示")
	printInfo(cbOperateCode)
	printInfo(cbOperateCard)
	printInfo(cbCardIndex)
	printInfo(cbSubOperateCode)
	self.cbOperateCode = cbOperateCode
	self.cbOperateCard = cbOperateCard
	self.cbCardIndex = cbCardIndex
	self.cbSubOperateCode = cbSubOperateCode
	self.operateClientData = {}
	
	local uiPanel_operation = ccui.Helper:seekWidgetByName(self.root, "Panel_operation")
	self.Panel_operation = uiPanel_operation
	self.Button_operation = ccui.Helper:seekWidgetByName(self.root, "Button_operation")
	self.Button_operation:retain()
	uiPanel_operation:removeAllChildren()
	GameCommon.IsOfHu =0
	self:initVar()
	if opType == 1 then
		local item = self.Button_operation:clone()
		--item:loadTextures("game/op_wufu.png","game/op_wufu.png","game/op_wufu.png")
		local textureName = "game/op_wufu.png"
		local texture = cc.TextureCache:getInstance():addImage(textureName)
		item:loadTextures(textureName, textureName, textureName)
		item:setContentSize(texture:getContentSizeInPixels())
		item:setPressedActionEnabled(true)
		uiPanel_operation:addChild(item)
		item:addTouchEventListener(function(sender, event)
			if event == ccui.TouchEventType.ended then
				Common:palyButton()
				NetMgr:getGameInstance():sendMsgToSvr(NetMsgId.MDM_GF_GAME, NetMsgId.SUB_C_ADD_BASE, "o", true)
				self:removeFromParent()
			end
		end)
		local item = self.Button_operation:clone()
		-- item:loadTextures("game/op_wufuno.png","game/op_wufuno.png","game/op_wufuno.png")
		local textureName = "game/op_wufuno.png"
		local texture = cc.TextureCache:getInstance():addImage(textureName)
		item:loadTextures(textureName, textureName, textureName)
		item:setContentSize(texture:getContentSizeInPixels())
		item:setPressedActionEnabled(true)
		uiPanel_operation:addChild(item)
		item:addTouchEventListener(function(sender, event)
			if event == ccui.TouchEventType.ended then
				Common:palyButton()
				NetMgr:getGameInstance():sendMsgToSvr(NetMsgId.MDM_GF_GAME, NetMsgId.SUB_C_ADD_BASE, "o", false)
				self:removeFromParent()
			end
		end)
	elseif opType == 2 then
		local item = self.Button_operation:clone()
		--item:loadTextures("game/op_datuo.png","game/op_datuo.png","game/op_datuo.png")
		local textureName = "game/op_datuo.png"
		local texture = cc.TextureCache:getInstance():addImage(textureName)
		item:loadTextures(textureName, textureName, textureName)
		item:setContentSize(texture:getContentSizeInPixels())
		item:setPressedActionEnabled(true)
		uiPanel_operation:addChild(item)
		item:addTouchEventListener(function(sender, event)
			if event == ccui.TouchEventType.ended then
				Common:palyButton()
				NetMgr:getGameInstance():sendMsgToSvr(NetMsgId.MDM_GF_GAME, NetMsgId.SUB_C_ADD_BASE, "o", true)
				self:removeFromParent()
			end
		end)
		local item = self.Button_operation:clone()
		--  item:loadTextures("game/op_datuono.png","game/op_datuono.png","game/op_datuono.png")
		local textureName = "game/op_datuono.png"
		local texture = cc.TextureCache:getInstance():addImage(textureName)
		item:loadTextures(textureName, textureName, textureName)
		item:setContentSize(texture:getContentSizeInPixels())	
		item:setPressedActionEnabled(true)
		uiPanel_operation:addChild(item)
		item:addTouchEventListener(function(sender, event)
			if event == ccui.TouchEventType.ended then
				Common:palyButton()
				NetMgr:getGameInstance():sendMsgToSvr(NetMsgId.MDM_GF_GAME, NetMsgId.SUB_C_ADD_BASE, "o", false)
				self:removeFromParent()
			end
		end)	
	else
		if(Bit:_and(cbOperateCode, GameCommon.ACK_BIHU) ~= 0) then
			GameCommon.IsOfHu = 1
			local item = self.Button_operation:clone()
			item:ignoreContentAdaptWithSize(true)
			item:loadTextures("anhua/ui/hu.png", "anhua/ui/hu.png", "anhua/ui/hu.png")
			item:setPressedActionEnabled(true)
			if GameCommon.tableConfig.wKindID == 39 or GameCommon.tableConfig.wKindID == 16 then	
				self:runAction(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function(sender, event) self:dealHu() item:setVisible(false) end)))	
			end
			uiPanel_operation:addChild(item)
			item:addTouchEventListener(function(sender, event)
				if event == ccui.TouchEventType.ended then
					Common:palyButton()
					self:dealHu()
				end
			end)
			-- ccs.ArmatureDataManager:getInstance():addArmatureFileInfo("game/xuanzhuanxing/xuanzhuanxing.ExportJson")
-- local armature=ccs.Armature:create("xuanzhuanxing")
-- armature:getAnimation():playWithIndex(0)
-- item:addChild(armature)
-- armature:setPosition(armature:getParent():getContentSize().width/2,armature:getParent():getContentSize().height/2)
		else
			if(Bit:_and(cbOperateCode, GameCommon.ACK_CHI) ~= 0) or(Bit:_and(cbOperateCode, GameCommon.ACK_CHI_EX) ~= 0) then
				if Bit:_and(cbOperateCode, GameCommon.ACK_CHI_EX) ~= 0 then
					self.operateClientData.cbOperateCode = GameCommon.ACK_CHI_EX
				else
					self.operateClientData.cbOperateCode = GameCommon.ACK_CHI
				end
				local item = self.Button_operation:clone()
				item:ignoreContentAdaptWithSize(true)
				item:loadTextures("anhua/ui/chi.png", "anhua/ui/chi.png", "anhua/ui/chi.png")
				item:setPressedActionEnabled(true)
				uiPanel_operation:addChild(item)
				item:addTouchEventListener(function(sender, event)
					if event == ccui.TouchEventType.ended then
						Common:palyButton()
						-- if GameCommon.IsOfHu == 1 then 
						-- 	local conform = function()
						-- 		print('------->>>>放弃胡牌')
						-- 		self:dealEat()
						-- 	end
						-- 	local config = {
						-- 		content = '是否放弃胡牌？',
						-- 		button1 = {'确定', conform},
						-- 		button2 = {'取消'}
						-- 	}
						-- 	self:openBox(config)					
						-- else
						-- 	self:dealEat()
						-- end 
						if GameCommon.IsOfHu == 1 then 
							require("common.MsgBoxLayer"):create(1,nil,"是否放弃胡牌？",function()
								self:dealEat()
							end)
						else
							self:dealEat()
						end 
					end
				end)
				
			end
			if Bit:_and(cbOperateCode, GameCommon.ACK_PENG) ~= 0 then
				local item = self.Button_operation:clone()
				item:ignoreContentAdaptWithSize(true)
				item:loadTextures("anhua/ui/peng.png", "anhua/ui/peng.png", "anhua/ui/peng.png")
				item:setPressedActionEnabled(true)
				uiPanel_operation:addChild(item)
				item:addTouchEventListener(function(sender, event)
					if event == ccui.TouchEventType.ended then
						Common:palyButton()
						-- if GameCommon.IsOfHu == 1 then 
						-- 	local conform = function()
						-- 		print('------->>>>放弃胡牌')
						-- 		self:dealPen()
						-- 	end
						-- 	local config = {
						-- 		content = '是否放弃胡牌？',
						-- 		button1 = {'确定', conform},
						-- 		button2 = {'取消'}
						-- 	}
						-- 	self:openBox(config)					
						-- else
						-- 	self:dealPen()
						-- end 
						if GameCommon.IsOfHu == 1 then 
							require("common.MsgBoxLayer"):create(1,nil,"是否放弃胡牌？",function()
								self:dealPen()
							end)
						else
							self:dealPen()
						end 
					end
				end)
			end
			if Bit:_and(cbOperateCode, GameCommon.ACK_CHIHU) ~= 0 then
				GameCommon.IsOfHu = 1
				local item = self.Button_operation:clone()
				item:ignoreContentAdaptWithSize(true)
				item:loadTextures("anhua/ui/hu.png", "anhua/ui/hu.png", "anhua/ui/hu.png")
				item:setPressedActionEnabled(true)
				uiPanel_operation:addChild(item)
				item:addTouchEventListener(function(sender, event)
					if event == ccui.TouchEventType.ended then
						Common:palyButton()
						self:dealHu()
					end
				end)
				if GameCommon.tableConfig.wKindID == 33 or GameCommon.tableConfig.wKindID == 34 or GameCommon.tableConfig.wKindID == 35 or GameCommon.tableConfig.wKindID == 36 or GameCommon.tableConfig.wKindID == 32 or GameCommon.tableConfig.wKindID == 37 or GameCommon.tableConfig.wKindID == 27 or GameCommon.tableConfig.wKindID == 31 then
					if Bit:_and(cbSubOperateCode, 2048) ~= 0 then
						local img = ccui.ImageView:create("zipai/table/end_play_3wcw.png")
						item:addChild(img)
						img:setPosition(img:getParent():getContentSize().width / 2, img:getParent():getContentSize().height)
					elseif Bit:_and(cbSubOperateCode, 1024) ~= 0 then
						local img = ccui.ImageView:create("zipai/table/end_play_3wc.png")
						item:addChild(img)
						img:setPosition(img:getParent():getContentSize().width / 2, img:getParent():getContentSize().height)
					elseif Bit:_and(cbSubOperateCode, 512) ~= 0 then
						local img = ccui.ImageView:create("zipai/table/end_play_wcw.png")
						item:addChild(img)
						img:setPosition(img:getParent():getContentSize().width / 2, img:getParent():getContentSize().height)
					elseif Bit:_and(cbSubOperateCode, 256) ~= 0 then
						local img = ccui.ImageView:create("zipai/table/end_play_wangchuang.png")
						item:addChild(img)
						img:setPosition(img:getParent():getContentSize().width / 2, img:getParent():getContentSize().height)
					elseif Bit:_and(cbSubOperateCode, 128) ~= 0 then
						local img = ccui.ImageView:create("zipai/table/end_play_wangdiaowang.png")
						item:addChild(img)
						img:setPosition(img:getParent():getContentSize().width / 2, img:getParent():getContentSize().height)
					elseif Bit:_and(cbSubOperateCode, 64) ~= 0 then
						local img = ccui.ImageView:create("zipai/table/end_play_wangdiao.png")
						item:addChild(img)
						img:setPosition(img:getParent():getContentSize().width / 2, img:getParent():getContentSize().height)
					else
					end
					if Bit:_and(cbSubOperateCode, 2) ~= 0 then
						local img = ccui.ImageView:create("zipai/table/end_play_honghu.png")
						item:addChild(img)
						img:setPosition(img:getParent():getContentSize().width / 2, img:getParent():getContentSize().height)
					elseif Bit:_and(cbSubOperateCode, 4) ~= 0 then
						local img = ccui.ImageView:create("zipai/table/end_play_dianhu.png")
						item:addChild(img)
						img:setPosition(img:getParent():getContentSize().width / 2, img:getParent():getContentSize().height)
					elseif Bit:_and(cbSubOperateCode, 8) ~= 0 then
						local img = ccui.ImageView:create("zipai/table/end_play_hongzhuandian.png")
						item:addChild(img)
						img:setPosition(img:getParent():getContentSize().width / 2, img:getParent():getContentSize().height)
					elseif Bit:_and(cbSubOperateCode, 16) ~= 0 then
						local img = ccui.ImageView:create("zipai/table/end_play_hongzhuanhei.png")
						item:addChild(img)
						img:setPosition(img:getParent():getContentSize().width / 2, img:getParent():getContentSize().height)
					elseif Bit:_and(cbSubOperateCode, 32) ~= 0 then
						local img = ccui.ImageView:create("zipai/table/end_play_heihu.png")
						item:addChild(img)
						img:setPosition(img:getParent():getContentSize().width / 2, img:getParent():getContentSize().height)
					else
					end
					local tableTemp = item:getChildren()
					for key, var in pairs(tableTemp) do
						var:setPosition(var:getParent():getContentSize().width / 2, var:getParent():getContentSize().height +(key - 1) * 33)
					end
					
				end
				-- ccs.ArmatureDataManager:getInstance():addArmatureFileInfo("game/xuanzhuanxing/xuanzhuanxing.ExportJson")
				-- local armature=ccs.Armature:create("xuanzhuanxing")
				-- armature:getAnimation():playWithIndex(0)
				-- item:addChild(armature)
				-- armature:setPosition(armature:getParent():getContentSize().width/2,armature:getParent():getContentSize().height/2)
			end
			if Bit:_and(cbOperateCode, GameCommon.ACK_WD) ~= 0 then
				if GameCommon.tableConfig.wKindID == 33 or GameCommon.tableConfig.wKindID == 34 or GameCommon.tableConfig.wKindID == 35 or GameCommon.tableConfig.wKindID == 36 or GameCommon.tableConfig.wKindID == 32 or GameCommon.tableConfig.wKindID == 37 or GameCommon.tableConfig.wKindID == 27 or GameCommon.tableConfig.wKindID == 31 then
					if Bit:_and(cbSubOperateCode, 4) ~= 0 then
						--4王 三王闯
						local item = self.Button_operation:clone()
						item:loadTextures("game/op_wangzha.png", "game/op_wangzha.png", "game/op_wangzha.png")
						item:setPressedActionEnabled(true)
						uiPanel_operation:addChild(item)
						item:addTouchEventListener(function(sender, event)
							if event == ccui.TouchEventType.ended then
								Common:palyButton()
								self:deal3Wc()
							end
						end)
						-- ccs.ArmatureDataManager:getInstance():addArmatureFileInfo("game/xuanzhuanxing/xuanzhuanxing.ExportJson")
						-- local armature=ccs.Armature:create("xuanzhuanxing")
						-- armature:getAnimation():playWithIndex(0)
						-- item:addChild(armature)
						-- armature:setPosition(armature:getParent():getContentSize().width/2,armature:getParent():getContentSize().height/2)
					end
					if Bit:_and(cbSubOperateCode, 2) ~= 0 then
						--4王 王闯
						local item = self.Button_operation:clone()
						item:loadTextures("game/op_wangchuang.png", "game/op_wangchuang.png", "game/op_wangchuang.png")
						item:setPressedActionEnabled(true)
						uiPanel_operation:addChild(item)
						item:addTouchEventListener(function(sender, event)
							if event == ccui.TouchEventType.ended then
								Common:palyButton()
								self:dealWc()
							end
						end)
						-- ccs.ArmatureDataManager:getInstance():addArmatureFileInfo("game/xuanzhuanxing/xuanzhuanxing.ExportJson")
						-- local armature=ccs.Armature:create("xuanzhuanxing")
						-- armature:getAnimation():playWithIndex(0)
						-- item:addChild(armature)
						-- armature:setPosition(armature:getParent():getContentSize().width/2,armature:getParent():getContentSize().height/2)
					end
					if Bit:_and(cbSubOperateCode, 1) ~= 0 then
						--4王 王钓
						local item = self.Button_operation:clone()
						item:loadTextures("game/op_wangdiao.png", "game/op_wangdiao.png", "game/op_wangdiao.png")
						item:setPressedActionEnabled(true)
						uiPanel_operation:addChild(item)
						item:addTouchEventListener(function(sender, event)
							if event == ccui.TouchEventType.ended then
								Common:palyButton()
								self:dealWd()
							end
						end)
						-- ccs.ArmatureDataManager:getInstance():addArmatureFileInfo("game/xuanzhuanxing/xuanzhuanxing.ExportJson")
						-- local armature=ccs.Armature:create("xuanzhuanxing")
						-- armature:getAnimation():playWithIndex(0)
						-- item:addChild(armature)
						-- armature:setPosition(armature:getParent():getContentSize().width/2,armature:getParent():getContentSize().height/2)
					end
				else
					local item = self.Button_operation:clone()
					item:loadTextures("game/op_wangdiao.png", "game/op_wangdiao.png", "game/op_wangdiao.png")
					item:setPressedActionEnabled(true)
					uiPanel_operation:addChild(item)
					item:addTouchEventListener(function(sender, event)
						if event == ccui.TouchEventType.ended then
							Common:palyButton()
							self:dealWd()
						end
					end)
					-- ccs.ArmatureDataManager:getInstance():addArmatureFileInfo("game/xuanzhuanxing/xuanzhuanxing.ExportJson")
					-- local armature=ccs.Armature:create("xuanzhuanxing")
					-- armature:getAnimation():playWithIndex(0)
					-- item:addChild(armature)
					-- armature:setPosition(armature:getParent():getContentSize().width/2,armature:getParent():getContentSize().height/2)
				end
			end
			if Bit:_and(cbOperateCode, GameCommon.ACK_WC) ~= 0 then
				local item = self.Button_operation:clone()
				item:loadTextures("game/op_wangchuang.png", "game/op_wangchuang.png", "game/op_wangchuang.png")
				item:setPressedActionEnabled(true)
				uiPanel_operation:addChild(item)
				item:addTouchEventListener(function(sender, event)
					if event == ccui.TouchEventType.ended then
						Common:palyButton()
						self:dealWc()
					end
				end)
				-- ccs.ArmatureDataManager:getInstance():addArmatureFileInfo("game/xuanzhuanxing/xuanzhuanxing.ExportJson")
				-- local armature=ccs.Armature:create("xuanzhuanxing")
				-- armature:getAnimation():playWithIndex(0)
				-- item:addChild(armature)
				-- armature:setPosition(armature:getParent():getContentSize().width/2,armature:getParent():getContentSize().height/2)
			end
			
			if Bit:_and(cbOperateCode, GameCommon.ACK_PAO) ~= 0 then
				--跑牌提示
				local item = self.Button_operation:clone()
				item:loadTextures("game/op_pao.png", "game/op_pao.png", "game/op_pao.png")
				item:setPressedActionEnabled(true)				
				uiPanel_operation:addChild(item)
				item:addTouchEventListener(function(sender, event)
					if event == ccui.TouchEventType.ended then
						Common:palyButton()
						-- if GameCommon.IsOfHu == 1 then 
						-- 	local conform = function()
						-- 		print('------->>>>放弃胡牌')
						-- 		self:dealGuo()
						-- 	end
						-- 	local config = {
						-- 		content = '是否放弃胡牌？',
						-- 		button1 = {'确定', conform},
						-- 		button2 = {'取消'}
						-- 	}
						-- 	self:openBox(config)					
						-- else
						-- 	self:dealGuo()
						-- end 
						if GameCommon.IsOfHu == 1 then 
							require("common.MsgBoxLayer"):create(1,nil,"是否放弃胡牌？",function()
								self:dealGuo()
							end)
						else
							self:dealGuo()
						end 
					end
				end)
			end
			if cbOperateCode ~= GameCommon.ACK_PAO then
				local item = self.Button_operation:clone()
				item:ignoreContentAdaptWithSize(true)
				item:loadTextures("anhua/ui/guo.png", "anhua/ui/guo.png", "anhua/ui/guo.png")
				item:setPressedActionEnabled(true)				
				uiPanel_operation:addChild(item)
				item:addTouchEventListener(function(sender, event)
					if event == ccui.TouchEventType.ended then
						Common:palyButton()
						-- if GameCommon.IsOfHu == 1 then 
						-- 	local conform = function()
						-- 		print('------->>>>放弃胡牌')
						-- 		self:dealGuo()
						-- 	end
						-- 	local config = {
						-- 		content = '是否放弃胡牌？',
						-- 		button1 = {'确定', conform},
						-- 		button2 = {'取消'}
						-- 	}
						-- 	self:openBox(config)					
						-- else
						-- 	self:dealGuo()
						-- end 

						if GameCommon.IsOfHu == 1 then 
							require("common.MsgBoxLayer"):create(1,nil,"是否放弃胡牌？",function()
								self:dealGuo()
							end)
						else
							self:dealGuo()
						end 
					end
				end)
			end
		end
	end
	
	self.layout = cc.UserDefault:getInstance():getIntegerForKey('HHlayout',0)
	self.isLeft = self.layout ~= 1

	self:changeLayout()
end

-- function GameOperation:openBox(params)
-- 	local path = self:requireClass('CDNoticeBox')
-- 	local box = require("app.MyApp"):create(params):createGame(path)
-- 	self:addChild(box)
-- end
-- local APPNAME = 'anhua'
-- function GameOperation:requireClass(name)
-- 	local path = string.format("game.%s.%s", APPNAME, name)
-- 	return path
-- end

--==============================--
--desc: 重写吃表现
--time:2018-07-16 03:36:52
--@args:fu xing
--==============================--
function GameOperation:initVar(...)
	self.image_template = ccui.Helper:seekWidgetByName(self.root, "image_template")
	self.button_template = ccui.Helper:seekWidgetByName(self.root, "button_template")
	self.Panel_image_root = ccui.Helper:seekWidgetByName(self.root, "Panel_image_root")
	self.posY = self.Panel_image_root:getPosition()
	self.clickRoot = nil
end

function GameOperation:dealEat()
	if self.isFast then --开启快速吃牌
		self:fastEat(self.cbCardIndex)
	else
		if not self.clickRoot then
			self.clickRoot = self:createChild(self.cbCardIndex, nil,self.isLeft,1)
		end
	end
end


function GameOperation:fastEat(chidCardTable)
	local cardTab = clone(chidCardTable)
	
	local childCount, pChildInfo1 = GameLogic:GetActionChiCard(cardTab, self.cbOperateCard)
	
	if childCount == 1 then --有child 可生成
		local data = {}
		data.cardIndex = {}
		for j = 1, 3 do
			local card = GameCommon:GetCardHand(pChildInfo1[1].cbCardData[1] [j], true)
			if card then
				data.cardIndex[j] = pChildInfo1[1].cbCardData[1] [j]
				data.cbChiKind = pChildInfo1[1].cbChiKind	
			end
		end
		local cbCardTable = clone(cardTab)
		for i = 1, 3 do
			local idx = GameLogic:SwitchToCardIndex(data.cardIndex[i])
			cbCardTable[idx] = cbCardTable[idx] - 1
		end
		local childCount, pChildInfo1 = GameLogic:GetActionChiCard(cbCardTable, self.cbOperateCard)
		if childCount <= 0 then --快速吃牌
			if GameCommon.tableConfig.wKindID == 33 or GameCommon.tableConfig.wKindID == 34 or GameCommon.tableConfig.wKindID == 35 or GameCommon.tableConfig.wKindID == 36 or GameCommon.tableConfig.wKindID == 32 or GameCommon.tableConfig.wKindID == 37 or GameCommon.tableConfig.wKindID == 27 or GameCommon.tableConfig.wKindID == 31 then
				NetMgr:getGameInstance():sendMsgToSvr(NetMsgId.MDM_GF_GAME, NetMsgId.SUB_C_OPERATE_CARD, "bwwbb", data.cbChiKind, self.operateClientData.cbOperateCode, 0, 0, 0)
			else
				NetMgr:getGameInstance():sendMsgToSvr(NetMsgId.MDM_GF_GAME, NetMsgId.SUB_C_OPERATE_CARD, "bwbb", data.cbChiKind, self.operateClientData.cbOperateCode, 0, 0)
			end
            self:removeFromParent()
            return
		end
    end
    
	if not self.clickRoot then
		self.clickRoot = self:createChild(self.cbCardIndex, nil,true,1)
	end
end

function GameOperation:getNextChildPosX(isLeft)
	local childs = self.Panel_image_root:getChildren()
    if #childs == 1 then
		return 0
	end
	local X = 0
    local de = 20 --间隔
    local ex = 1
    if isLeft then
        ex = -1
	end
	for i, v in ipairs(childs) do
        local size = v:getContentSize()
        if i == 1 or i == #childs then
            X = X + size.width / 2
        else
            X = X + size.width
        end
	end

	return (X + de * (#childs-1) ) * ex 
end


--创建一个子节点 operateTag --操作标识 1，吃 2 比
function GameOperation:createChild(chidCardTable, front,isLeft,operateTag)
	
	local cardTab = clone(chidCardTable)
	operateTag = operateTag or 1
	local childCount, pChildInfo1 = GameLogic:GetActionChiCard(cardTab, self.cbOperateCard)
	local image_root = nil
	if childCount > 0 then --有child 可生成
		image_root = self.image_template:clone()
		image_root.next = nil
		image_root.front = front
		local item_list = image_root:getChildByName('ListView_panel')

        local bgSize = cc.size(childCount *65 + (childCount - 1) * 14, 240.00)
        local rootSize = cc.size(bgSize.width + 10 , 240.00)
		item_list:refreshView()
		item_list:setContentSize(bgSize)
		image_root:setContentSize(rootSize)
		self.Panel_image_root:addChild(image_root)
		local pos = self:getNextChildPosX(isLeft)
		image_root:setPosition(pos, 0)
		item_list:setPosition(rootSize.width / 2,rootSize.height/2-50)
		--添加button
		for i = 1, childCount do
			local button = self.button_template:clone()
			local list_btn = button:getChildByName('ListView_card')
            item_list:pushBackCustomItem(button)
			local imageTag = button:getChildByName('Image_Tag')
			if operateTag == 1 then --吃
				imageTag:loadTexture('anhua/table/chi-chi.png')
			elseif operateTag == 2 then 
				imageTag:loadTexture('anhua/table/chi-bi.png')
			end
			button.cardIndex = {}
			--放入卡牌
			for j = 1, 3 do
				local card = GameCommon:GetCardHand(pChildInfo1[i].cbCardData[1] [j], true)
				if card then
					list_btn:pushBackCustomItem(card)
					card:setScale(1.3)
					button.cardIndex[j] = pChildInfo1[i].cbCardData[1] [j]
					button.cbChiKind = pChildInfo1[i].cbChiKind	
				end
			end
			button:setPressedActionEnabled(false)
			button:addTouchEventListener(function(sender, event)
				if event == ccui.TouchEventType.ended then
					local cbCardTable = clone(cardTab)
					for i = 1, 3 do
						local idx = GameLogic:SwitchToCardIndex(sender.cardIndex[i])
						cbCardTable[idx] = cbCardTable[idx] - 1
					end
					image_root.cbChiKind = sender.cbChiKind --数据
					local childCount, pChildInfo1 = GameLogic:GetActionChiCard(cbCardTable, self.cbOperateCard)
					if childCount > 0 then
                        
						local root = image_root.next
                        while root do
                            local next = root
                            root = root.next
							next:removeFromParent()
							next = nil
                        end
						
						local childs = item_list:getChildren()
						local path = 'anhua/ui/'
						for i,v in ipairs(childs) do
							if v == sender then
								v:loadTextures(path .. "chipai-select.png", path .. "chipai-select.png", path .. "chipai-select.png")
							else
								v:loadTextures(path .. "chipai-unselect.png", path .. "chipai-unselect.png",path .. "chipai-unselect.png")
							end
						end
						
						local child = self:createChild(cbCardTable, image_root,isLeft,2)
					
						child.next = nil
						image_root.next = child
						child.front = image_root
					else
						local cbKind = {}
						local root = self.clickRoot
						while root do
							table.insert( cbKind, root.cbChiKind )
							root = root.next
						end

						
						if GameCommon.tableConfig.wKindID == 33 or GameCommon.tableConfig.wKindID == 34 or GameCommon.tableConfig.wKindID == 35 or GameCommon.tableConfig.wKindID == 36 or GameCommon.tableConfig.wKindID == 32 or GameCommon.tableConfig.wKindID == 37 or GameCommon.tableConfig.wKindID == 27 or GameCommon.tableConfig.wKindID == 31 then
							NetMgr:getGameInstance():sendMsgToSvr(NetMsgId.MDM_GF_GAME, NetMsgId.SUB_C_OPERATE_CARD, "bwwbb", cbKind[1] or 0, self.operateClientData.cbOperateCode, 0, cbKind[2] or 0, cbKind[3] or 0)
						else
							NetMgr:getGameInstance():sendMsgToSvr(NetMsgId.MDM_GF_GAME, NetMsgId.SUB_C_OPERATE_CARD, "bwbb", cbKind[1] or 0, self.operateClientData.cbOperateCode, cbKind[2] or 0, cbKind[3] or 0)
						end
						self:removeFromParent()
					end
				end
			end)
		end
		return image_root
	end
end

function GameOperation:dealPen()
	--发送消息
	if GameCommon.tableConfig.wKindID == 33 or GameCommon.tableConfig.wKindID == 34 or GameCommon.tableConfig.wKindID == 35 or GameCommon.tableConfig.wKindID == 36 or GameCommon.tableConfig.wKindID == 32 or GameCommon.tableConfig.wKindID == 37 or GameCommon.tableConfig.wKindID == 27 or GameCommon.tableConfig.wKindID == 31 then
		NetMgr:getGameInstance():sendMsgToSvr(NetMsgId.MDM_GF_GAME, NetMsgId.SUB_C_OPERATE_CARD, "bwwbb", 0, 128, 0, 0, 0)
	else
		NetMgr:getGameInstance():sendMsgToSvr(NetMsgId.MDM_GF_GAME, NetMsgId.SUB_C_OPERATE_CARD, "bwbb", 0, 128, 0, 0)
	end
	
	self:removeFromParent()
end

function GameOperation:dealHu()
	--发送消息
	if GameCommon.tableConfig.wKindID == 33 or GameCommon.tableConfig.wKindID == 34 or GameCommon.tableConfig.wKindID == 35 or GameCommon.tableConfig.wKindID == 36 or GameCommon.tableConfig.wKindID == 32 or GameCommon.tableConfig.wKindID == 37 or GameCommon.tableConfig.wKindID == 27 or GameCommon.tableConfig.wKindID == 31 then
		NetMgr:getGameInstance():sendMsgToSvr(NetMsgId.MDM_GF_GAME, NetMsgId.SUB_C_OPERATE_CARD, "bwwbb", 0, 256, 0, 0, 0)
	else
		NetMgr:getGameInstance():sendMsgToSvr(NetMsgId.MDM_GF_GAME, NetMsgId.SUB_C_OPERATE_CARD, "bwbb", 0, 256, 0, 0)
	end
	
	self:removeFromParent()
end

function GameOperation:dealGuo()
	--发送消息
	if GameCommon.tableConfig.wKindID == 33 or GameCommon.tableConfig.wKindID == 34 or GameCommon.tableConfig.wKindID == 35 or GameCommon.tableConfig.wKindID == 36 or GameCommon.tableConfig.wKindID == 32 or GameCommon.tableConfig.wKindID == 37 or GameCommon.tableConfig.wKindID == 27 or GameCommon.tableConfig.wKindID == 31 then
		NetMgr:getGameInstance():sendMsgToSvr(NetMsgId.MDM_GF_GAME, NetMsgId.SUB_C_OPERATE_CARD, "bwwbb", self.cbOperateCard, 0, 0, 0, 0)
	else
		NetMgr:getGameInstance():sendMsgToSvr(NetMsgId.MDM_GF_GAME, NetMsgId.SUB_C_OPERATE_CARD, "bwbb", self.cbOperateCard, 0, 0, 0)
	end
	
	self:removeFromParent()
end

function GameOperation:dealWd()
	--发送消息
	if GameCommon.tableConfig.wKindID == 33 or GameCommon.tableConfig.wKindID == 34 or GameCommon.tableConfig.wKindID == 35 or GameCommon.tableConfig.wKindID == 36 or GameCommon.tableConfig.wKindID == 32 or GameCommon.tableConfig.wKindID == 37 or GameCommon.tableConfig.wKindID == 27 or GameCommon.tableConfig.wKindID == 31 then
		NetMgr:getGameInstance():sendMsgToSvr(NetMsgId.MDM_GF_GAME, NetMsgId.SUB_C_OPERATE_CARD, "bwwbb", 0, 8, 1, 0, 0)
	else
		NetMgr:getGameInstance():sendMsgToSvr(NetMsgId.MDM_GF_GAME, NetMsgId.SUB_C_OPERATE_CARD, "bwbb", 0, 8, 0, 0)
	end
	
	self:removeFromParent()
end

function GameOperation:dealWc()
	--发送消息
	if GameCommon.tableConfig.wKindID == 33 or GameCommon.tableConfig.wKindID == 34 or GameCommon.tableConfig.wKindID == 35 or GameCommon.tableConfig.wKindID == 36 or GameCommon.tableConfig.wKindID == 32 or GameCommon.tableConfig.wKindID == 37 or GameCommon.tableConfig.wKindID == 27 or GameCommon.tableConfig.wKindID == 31 then
		NetMgr:getGameInstance():sendMsgToSvr(NetMsgId.MDM_GF_GAME, NetMsgId.SUB_C_OPERATE_CARD, "bwwbb", 0, 8, 2, 0, 0)
	else
		NetMgr:getGameInstance():sendMsgToSvr(NetMsgId.MDM_GF_GAME, NetMsgId.SUB_C_OPERATE_CARD, "bwbb", 0, 16, 0, 0)
	end
	
	self:removeFromParent()
end
function GameOperation:deal3Wc()
	--发送消息
	if GameCommon.tableConfig.wKindID == 33 or GameCommon.tableConfig.wKindID == 34 or GameCommon.tableConfig.wKindID == 35 or GameCommon.tableConfig.wKindID == 36 or GameCommon.tableConfig.wKindID == 32 or GameCommon.tableConfig.wKindID == 37 or GameCommon.tableConfig.wKindID == 27 or GameCommon.tableConfig.wKindID == 31 then
		NetMgr:getGameInstance():sendMsgToSvr(NetMsgId.MDM_GF_GAME, NetMsgId.SUB_C_OPERATE_CARD, "bwwbb", 0, 8, 4, 0, 0)
	else
		
	end
	
	self:removeFromParent()
end

function GameOperation:changeLayout( ... )
	local uiPanel_operation = ccui.Helper:seekWidgetByName(self.root, "Panel_operation")
	local visibleSize = cc.Director:getInstance():getVisibleSize()
	if self.layout == 0 then --居右
		local x = visibleSize.width - 200
		local y = visibleSize.height - 180
		if self.Panel_image_root then
			self.Panel_image_root:setPosition(x,y)
		end
		
		local items = uiPanel_operation:getChildren()
		local interval = 100
		local width = items[1]:getContentSize().width
		for i = #items, 1, - 1 do
			if items[i] then
				if i == 2 then
					interval = interval * 0.5
				end
				local idx = #items - i + 1
				local posX = uiPanel_operation:getContentSize().width -(idx - 1) *(width + interval) - 125
				items[i]:setPosition(posX, uiPanel_operation:getContentSize().height / 2)
			end
		end
		uiPanel_operation:setPosition(visibleSize.width * 0.5, visibleSize.height * 0.5)
	else
		local x = visibleSize.width - 640
		local y = visibleSize.height - 180
		if self.Panel_image_root then
			self.Panel_image_root:setPosition(x,y)
		end

		local items = uiPanel_operation:getChildren()
		local interval = 50
		local width = items[1]:getContentSize().width
		local beganPos =(uiPanel_operation:getContentSize().width - #items * width -(#items - 1) * interval) / 2 + width / 2
		for key, var in pairs(items) do
			var:setPosition(beganPos +(key - 1) *(width + interval), uiPanel_operation:getContentSize().height / 2)
		end
	end
end

function GameOperation:HHChangeLayout( ... )
	self:changeLayout()
end

return GameOperation

