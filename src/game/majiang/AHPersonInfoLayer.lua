--[[
*名称:AHPersonInfoLayer
*描述:个人信息
*作者:[]
*创建日期:2018-07-11 09:07:55
*修改日期:
]]

local EventMgr              = require("common.EventMgr")
local EventType             = require("common.EventType")
local NetMgr                = require("common.NetMgr")
local NetMsgId              = require("common.NetMsgId")
local StaticData            = require("app.static.StaticData")
local UserData              = require("app.user.UserData")
local Common                = require("common.Common")
local Default               = require("common.Default")
local GameConfig            = require("common.GameConfig")
local Log                   = require("common.Log")
local GameCommon            = require("game.majiang.GameCommon") 


local AHPersonInfoLayer     = class("AHPersonInfoLayer", cc.load("mvc").ViewBase)

function AHPersonInfoLayer:onConfig()
    self.widget             = {
        {"Image_bg"},
        {"Image_avatar"},
        {"Text_name"},
        {"Text_id"},
        {'Panel_mask','onClose'}
    }
end

function AHPersonInfoLayer:onEnter()
end

function AHPersonInfoLayer:onExit()
end

function AHPersonInfoLayer:onCreate(param)
    local data = param[1]
    self.tableObj = param[2]
    self:refreshUI(data)
end

function AHPersonInfoLayer:onClose()
    self:removeFromParent()
end


------------------------------------------------------------------------
--                            game logic                              --
------------------------------------------------------------------------
function AHPersonInfoLayer:refreshUI(data)
    if type(data) ~= 'table' then
        printError('AHPersonInfoLayer:refreshUI data error')
        return
    end
    
    local playInfo = self:getPlayerInfoByUserID(data.dwUserID)
    
    if not playInfo then
        return
    end

    Common:requestUserAvatar(data.dwUserID,playInfo.szPto,self.Image_avatar,"img")
    self.Text_name:setString(playInfo.szNickName)
    self.Text_id:setString('ID:' .. data.dwUserID)
    self:setFaceActions(data)
end

function AHPersonInfoLayer:getPlayerInfoByUserID(dwUserID)
    for i,v in pairs(GameCommon.player or {}) do
        if v.dwUserID == dwUserID then
            return v
        end
    end
end
function AHPersonInfoLayer:addListener(btn, callback)
	btn:addTouchEventListener(function(sender, event)
		if event == ccui.TouchEventType.ended then
			Common:palyButton()
			if callback then
				callback(sender)
			end
		end
	end)
end

function AHPersonInfoLayer:setFaceActions(data)
    
    for i=1,7 do
        local item = self.Image_bg:getChildByName(i)
        self:addListener(item,function()
            --- 房
            local targetChair = nil           
            for key,info in pairs(GameCommon.player or {}) do
                if info.dwUserID ~= 0 and info.dwUserID == data.dwUserID then
                    targetChair = info.wChairID
                   break
                end
            end

            if targetChair then
                print('-->>>>send',NetMsgId.MDM_GF_GAME, NetMsgId.SUB_GF_USER_EFFECTS)
                 NetMgr:getGameInstance():sendMsgToSvr(NetMsgId.MDM_GF_GAME, NetMsgId.SUB_GF_USER_EFFECTS, "www", i, GameCommon:getRoleChairID(),targetChair)
            end
            
            self:removeFromParent()
        end)
    end



    -- for i,v in ipairs(AnimCnf) do
    --     local item = faceArr[i]
    --     if not item then
    --         item = faceArr[1]:clone()
    --         self.ListView_face:pushBackCustomItem(item)
    --     end
    --     item:setVisible(true)
    --     local Image_faceIcon = ccui.Helper:seekWidgetByName(item,'Image_faceIcon')
    --     Image_faceIcon:loadTexture(v[1] .. '.png')

    --     Image_faceIcon:ignoreContentAdaptWithSize(true)

    --     item:setPressedActionEnabled(true)
    --     item:addClickEventListener(function()
    --         --- 房
    --         local targetChair = nil           
    --         for key,info in pairs(GameCommon.player or {}) do
    --             if info.dwUserID ~= 0 and info.dwUserID == data.dwUserID then
    --                 targetChair = info.wChairID
    --                break
    --             end
    --         end
    --         local count = 0
    --         for k,v in pairs(GameCommon.player or {}) do
    --             count = count + 1
    --         end
            

    --         if count == 1 then
    --             require("common.MsgBoxLayer"):create(0,nil,"暂时无法发送")
    --             self:removeFromParent()
    --             return
    --         end
    --         if targetChair then
    --              NetMgr:getGameInstance():sendMsgToSvr(NetMsgId.MDM_GF_GAME, NetMsgId.SUB_GF_USER_EFFECTS, "www", i, GameCommon:getRoleChairID(),targetChair)
    --         end
            
    --         self:removeFromParent()
    --     end)
    -- end
end

------------------------------------------------------------------------
--                            server rvc                              --
------------------------------------------------------------------------

return AHPersonInfoLayer