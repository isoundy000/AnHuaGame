--[[
*名称:NewClubSetPercentLayer
*描述:设置分成百分比
*作者:admin
*创建日期:2019-11-07 10:08:57
*修改日期:
]]

local EventMgr          = require("common.EventMgr")
local EventType         = require("common.EventType")
local NetMgr            = require("common.NetMgr")
local NetMsgId          = require("common.NetMsgId")
local StaticData        = require("app.static.StaticData")
local UserData          = require("app.user.UserData")
local Common            = require("common.Common")
local GameConfig        = require("common.GameConfig")

local NewClubSetPercentLayer      = class("NewClubSetPercentLayer", cc.load("mvc").ViewBase)

function NewClubSetPercentLayer:onConfig()
    self.widget         = {
    	{"Image_frame"},
    	{"Image_head"},
    	{"Text_name"},
    	{"Text_id"},
    	{"Text_selfPercent"},
    	{"TextField_percent"},
        {"Text_setPercent"},
        {"Text_tips"},
        {"Button_yes", "onYes"},
    }
end

function NewClubSetPercentLayer:onEnter()
	EventMgr:registListener(EventType.RET_SETTINGS_CLUB_MEMBER ,self,self.RET_SETTINGS_CLUB_MEMBER)
end

function NewClubSetPercentLayer:onExit()
	EventMgr:unregistListener(EventType.RET_SETTINGS_CLUB_MEMBER ,self,self.RET_SETTINGS_CLUB_MEMBER)
end

function NewClubSetPercentLayer:onCreate(param)
	self.data = param[1]
	self.userSelfPartnerData = param[2]
    self.setType = param[3]
    self.cb = param[4]
    Common:registerScriptMask(self.Image_frame, function() 
        self:removeFromParent()
    end)
	Common:requestUserAvatar(self.data.dwUserID, self.data.szLogoInfo, self.Image_head, "img")
    self.Text_name:setString(self.data.szNickName)
    self.Text_id:setString(self.data.dwUserID)

    if self.setType == 1 then
        --设置成员沉迷值
        self.Text_selfPercent:setString('此玩家当前最低刷新分数:' .. self.data.iAntiLimit)
        self.Text_setPercent:setString('设置分数：')
        self.Text_tips:setVisible(false)
    elseif self.setType == 2 then
        --设置俱乐部沉迷值
        self.Text_selfPercent:setString('亲友圈最低刷新分数:' .. self.data.curClubAntiLimit)
        self.Text_setPercent:setString('设置分数：')
        self.Text_tips:setVisible(false)
    else
        --设置成员分成比例
        self.Text_selfPercent:setString('自身比例：' .. self.userSelfPartnerData.dwDistributionRatio .. '%')
        self.TextField_percent:setTextHorizontalAlignment(cc.TEXT_ALIGNMENT_CENTER)
        self.TextField_percent:setString(self.data.dwDistributionRatio)
    end
end

function NewClubSetPercentLayer:onYes()
    if self.setType then
        local num = tonumber(self.TextField_percent:getString())
        if not num or num > 0 then
            require("common.MsgBoxLayer"):create(0,nil,"只能输入小于等于零的整数!")
            return
        end
        if self.cb then
            self.cb(num)
            self:removeFromParent()
        end
    else
        local num = tonumber(self.TextField_percent:getString())
        local lastPer = self.userSelfPartnerData.dwDistributionRatio
        if not (num and num >= 0 and num <= lastPer) then
            require("common.MsgBoxLayer"):create(0,nil,"输入比例不对,请重新输入!")
            return
        end
        UserData.Guild:reqSettingsClubMember(12, self.data.dwClubID, self.data.dwUserID, self.userSelfPartnerData.dwUserID, "", 0, num)
    end
end

function NewClubSetPercentLayer:RET_SETTINGS_CLUB_MEMBER(event)
    local data = event._usedata
    dump(data)
    if data.lRet ~= 0 then
        if data.lRet == 11 then
            require("common.MsgBoxLayer"):create(0, nil, "比例超过最大限!")
        else
            require("common.MsgBoxLayer"):create(0, nil, "设置错误! lRet=" .. data.lRet)
        end
        return
    end

    if data.cbSettingsType == 12 then
    	self:getParent():research()
		self:removeFromParent()
    end
end

return NewClubSetPercentLayer