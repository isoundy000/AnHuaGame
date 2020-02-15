local EventType = {

    --系统
    EVENT_TYPE_DID_ENTER_BACKGROUND = "EVENT_TYPE_DID_ENTER_BACKGROUND",          --进入后台
    EVENT_TYPE_WILL_ENTER_FOREGROUND = "EVENT_TYPE_WILL_ENTER_FOREGROUND",        --恢复游戏
    EVENT_TYPE_NET_RECV_MESSAGE = "EVENT_TYPE_NET_RECV_MESSAGE",                    --消息事件监听
    EVENT_TYPE_NET_DISCONNET = "EVENT_TYPE_NET_DISCONNET",                                                --网络断开消息
    EVENT_TYPE_PHYSICS_KEY = "EVENT_TYPE_PHYSICS_KEY",  --物理返回键
    EVENT_TYPE_RECHARGE_GET_ORDER = "EVENT_TYPE_RECHARGE_GET_ORDER",  --充值获取订单
    EVENT_TYPE_RECHARGE_PAY_RESULT = "EVENT_TYPE_RECHARGE_PAY_RESULT",  --支付结果
    SUB_CL_RECHARGE_RECORD = "SUB_CL_RECHARGE_RECORD",
    EVENT_TYPE_EXTERNAL_START_GAME = "EVENT_TYPE_EXTERNAL_START_GAME",
    EVENT_TYPE_COMMON_LOAD_EXIT = "EVENT_TYPE_COMMON_LOAD_EXIT",
    EVENT_TYPE_ACTIONINVITE_INFO = "EVENT_TYPE_ACTIONINVITE_INFO",
    EVENT_TYPE_ACTIONINVITE_INPUT_CODE = "EVENT_TYPE_ACTIONINVITE_INPUT_CODE",
    EVENT_TYPE_ACTIONINVITE_GET_MONEY = "EVENT_TYPE_ACTIONINVITE_GET_MONEY",
    EVENT_TYPE_SKIN_CHANGE = "EVENT_TYPE_SKIN_CHANGE",
    EVENT_TYPE_SETTINGS_CLUB_PARAMETER = "EVENT_TYPE_SETTINGS_CLUB_PARAMETER",
    EVENT_TYPE_RECHARGE_365 = "EVENT_TYPE_RECHARGE_365",
    EVENT_TYPE_SIGNAL = "EVENT_TYPE_SIGNAL",  --信号
    EVENT_TYPE_ELECTRICITY = "EVENT_TYPE_ELECTRICITY",  --电量
    EVENT_TYPE_NET_CLOSE = "EVENT_TYPE_NET_CLOSE",
    EVENT_TYPE_OPEN_PHOTO_ALBUM = "EVENT_TYPE_OPEN_PHOTO_ALBUM",
    EVENT_TYPE_UPLOAD_ERWEIMA = "EVENT_TYPE_UPLOAD_ERWEIMA",
    EVENT_TYPE_XIAN_LIAO_LOGIN = "EVENT_TYPE_XIAN_LIAO_LOGIN",  --闲聊登陆
    EVENT_TYPE_BIND_PHONE = "EVENT_TYPE_BIND_PHONE",  --闲聊登陆
    --登陆服登陆消息
    EVENT_TYPE_CONNECT_LOGIN_FAILED = "EVENT_TYPE_CONNECT_LOGIN_FAILED",        --连接登陆服失败
    SUB_GP_LOGON_SUCCESS = "SUB_GP_LOGON_SUCCESS",                --登录服登录成功
    SUB_GP_LOGON_FAILURE = "SUB_GP_LOGON_FAILURE",                --登录登录服失败
    EVENT_TYPE_OPERATIONAL_OUT_CARD = "EVENT_TYPE_OPERATIONAL_OUT_CARD",
    EVENT_TYPE_CACEL_MESSAGE_BLOCK = "EVENT_TYPE_CACEL_MESSAGE_BLOCK",
    SUB_S_GAME_START = "SUB_S_GAME_START",

    --逻辑服登陆消息
    EVENT_TYPE_CONNECT_LOGIC_FAILED = "EVENT_TYPE_CONNECT_LOGIC_FAILED",                      --连接逻辑服失败  
    SUB_CL_LOGON_SUCCESS = "SUB_CL_LOGON_SUCCESS",               --登陆逻辑服成功
    SUB_CL_LOGON_ERROR = "SUB_CL_LOGON_ERROR",                 --登陆逻辑服失败
    EVENT_TYPE_FIRST_ENTER_HALL = "EVENT_TYPE_FIRST_ENTER_HALL",        --第一次登陆大厅加载数据

    EVENT_TYPE_WITH_NEW ="EVENT_TYPE_WITH_NEW",                 --大厅好友房刷新
    
    EVENT_TYPE_EMAIL_NEW ="EVENT_TYPE_EMAIL_NEW",               --大厅邮件刷新

    RET_HAVE_UNREAD_MAIL = "RET_HAVE_UNREAD_MAIL",              --返回是否有未读邮件

    --逻辑服大厅消息
    EVENT_TYPE_EXIT_HALL = "EVENT_TYPE_EXIT_HALL",                      --退出游戏
    SUB_CL_GOLDROOM_CONFIG              = "SUB_CL_GOLDROOM_CONFIG",    --房间列表
    SUB_CL_GOLDROOM_CONFIG_END              = "SUB_CL_GOLDROOM_CONFIG_END",    --房间列表
    SUB_CL_USER_LOCK_SERVER         = "SUB_CL_USER_LOCK_SERVER",    --用户锁定房间
    SUB_CL_GAME_SERVER              = "SUB_CL_GAME_SERVER",    --游戏房间结构
    SUB_CL_GAME_SERVER_ERROR        = "SUB_CL_GAME_SERVER_ERROR",    --游戏房间未开启
    SUB_CL_FRIENDROOM_CONFIG        = "SUB_CL_FRIENDROOM_CONFIG",    --好友房配置
    SUB_CL_FRIENDROOM_CONFIG_END    = "SUB_CL_FRIENDROOM_CONFIG_END",   --好友房配置结束
    SUB_GR_USER_ENTER            = "SUB_GR_USER_ENTER",           --创建好友房成功
    SUB_GR_CREATE_TABLE_FAILED             = "SUB_GR_CREATE_TABLE_FAILED",            --创建好友房失败
    SUB_CL_NOTICE_CONFIG            = "SUB_CL_NOTICE_CONFIG",    --公告配置
    SUB_CL_RECHARGE_CONFIG          = "SUB_CL_RECHARGE_CONFIG",    --充值配置
    SUB_CL_SHARE_CONFIG             = "SUB_CL_SHARE_CONFIG",    --分享配置
    SUB_CL_PROP_CONFIG              = "SUB_CL_PROP_CONFIG",    --道具配置
    SUB_GR_JOIN_TABLE_FAILED = "SUB_GR_JOIN_TABLE_FAILED",
    SUB_GR_MATCH_TABLE_ING = "SUB_GR_MATCH_TABLE_ING",
    SUB_GR_MATCH_TABLE_FAILED = "SUB_GR_MATCH_TABLE_FAILED",
    REQ_GR_USER_CONTINUE_CLUB_FAILD = "REQ_GR_USER_CONTINUE_CLUB_FAILD",
    --逻辑服用户消息
    SUB_CL_NOTICE_CONFIG = "SUB_CL_NOTICE_CONFIG",
    SUB_CL_USER_INFO = "SUB_CL_USER_INFO",
    
    UPDATE_SELF_VERIFYCODE = "UPDATE_SELF_VERIFYCODE",                      --下发验证码
    
    --统计
    RET_GET_CLUB_STATISTICS_FINISH = 'RET_GET_CLUB_STATISTICS_FINISH',
    RET_GET_CLUB_STATISTICS = 'RET_GET_CLUB_STATISTICS',
    RET_GET_CLUB_STATISTICS_TOTAL = 'RET_GET_CLUB_STATISTICS_TOTAL',
    --完善资料
    SUB_CL_SET_USER_INFO = "SUB_CL_SET_USER_INFO",                                  --更改个人信息
    INFO_SET_USER_DETAIL = "INFO_SET_USER_DETAIL",                                  --完善资料返回
    REQ_CL_USER_DETAIL = "REQ_CL_USER_DETAIL",                                      --请求用户资料
    SUB_CL_TASK_REWARD = "SUB_CL_TASK_REWARD",
    SUB_CL_USER_DETAIL = "SUB_CL_USER_DETAIL",                                      --获得完善资料
    SUB_CL_SET_USER_DETAIL = "SUB_CL_SET_USER_DETAIL" ,                             --设置用户资料  
    UPDATE_SELF_USER_DETAIL = "UPDATE_SELF_USER_DETAIL" ,                           --刷新用户资料
    
    --福利
    SUB_SC_ACTIVERECORD = "SUB_SC_ACTIVERECORD",
    SUB_SC_ACTIONRESULT = "SUB_SC_ACTIONRESULT",
    --商城
    SUB_CL_MALL_BUYGOODS = "SUB_CL_MALL_BUYGOODS",
    RET_MALL_FIRST_CHARGE_RECORD = "RET_MALL_FIRST_CHARGE_RECORD",
    
    SUB_CL_CHECKINRECORD = "SUB_CL_CHECKINRECORD",
    SUB_CL_CHECKRESULT = "SUB_CL_CHECKRESULT",
    SUB_CL_FLUSHCHECKRECORD = "SUB_CL_FLUSHCHECKRECORD",

    RET_MALL_FIRST_CHARGE_RECORD = "RET_MALL_FIRST_CHARGE_RECORD",
    RET_MALL_EXCHANGE_REDENVELOPE = "RET_MALL_EXCHANGE_REDENVELOPE",

    RET_GET_MALL_LOG = "RET_GET_MALL_LOG",
    RET_GET_MALL_LOG_FINISH = "RET_GET_MALL_LOG_FINISH",

    --邮件
    RET_GET_MAIL_ITEM ="RET_GET_MAIL_ITEM", --领奖
    RET_DEL_MAIL = "RET_DEL_MAIL",          --删除邮件
    RET_READ_MAIL = "RET_READ_MAIL",
    --游戏服登陆消息
    EVENT_TYPE_CONNECT_GAME_FAILED = "EVENT_TYPE_CONNECT_GAME_FAILED",                --连接游戏服失败
    EVENT_TYPE_CONNECT_GAME_SUCCESS = "EVENT_TYPE_CONNECT_GAME_SUCCESS",                --连接游戏服成功
    SUB_GR_LOGON_SUCCESS = "SUB_GR_LOGON_SUCCESS",                --游戏服登陆成功
    SUB_GR_LOGON_ERROR = "SUB_GR_LOGON_ERROR",                  --游戏服登陆错误
    
    --公会
    EVENT_TYPE_TO_VIEW_GUILD = "EVENT_TYPE_TO_VIEW_GUILD",
    RET_GET_CLUB_LIST = "RET_GET_CLUB_LIST",                      --获取公会信息
    RET_GET_GUILD_INFO_BY_GUILDID = "RET_GET_GUILD_INFO_BY_GUILDID",  --查询公会   
    RET_JOIN_GUILD = "RET_JOIN_GUILD",          --加入公会
    RET_SETTINGS_GUILD = "RET_SETTINGS_GUILD",        --更改公会
    RET_UPDATE_GUILD = "RET_UPDATE_GUILD",  --更改公会公告
    RET_GET_GUILD_INFO_BY_USERID ="RET_GET_GUILD_INFO_BY_USERID", --返回根据用户ID查询公会
    --亲友圈
    RET_CL_MAIN_RECORD_TOTAL_SCORE = 'RET_CL_MAIN_RECORD_TOTAL_SCORE',
    RET_GET_CLUB_LIST = "RET_GET_CLUB_LIST",
    RET_GET_CLUB_LIST_FAIL = "RET_GET_CLUB_LIST_FAIL",
    RET_GET_CLUB_MEMBER_EX_FINISH = 'RET_GET_CLUB_MEMBER_EX_FINISH',
    RET_JOIN_CLUB = "RET_JOIN_CLUB",
    RET_QUIT_CLUB = "RET_QUIT_CLUB",
    RET_REMOVE_CLUB_MEMBER = "RET_REMOVE_CLUB_MEMBER",
    RET_GET_CLUB_TABLE = "RET_GET_CLUB_TABLE",
    RET_GET_CLUB_MEMBER = "RET_GET_CLUB_MEMBER",
    RET_GET_CLUB_MEMBER_FINISH = 'RET_GET_CLUB_MEMBER_FINISH',
    RET_SETTINGS_CLUB = "RET_SETTINGS_CLUB",
    RET_CREATE_CLUB = "RET_CREATE_CLUB",
    RET_REMOVE_CLUB = "RET_REMOVE_CLUB",
    RET_GET_CLUB_LIST_BY_USERID = "RET_GET_CLUB_LIST_BY_USERID",
    RET_CLUB_CHECK_LIST = "RET_CLUB_CHECK_LIST",
    RET_CLUB_CHECK_RESULT = "RET_CLUB_CHECK_RESULT",
    RET_GET_CLUB_TABLE = "RET_GET_CLUB_TABLE",
    RET_REFRESH_CLUB = "RET_REFRESH_CLUB",
    RET_ADDED_CLUB = "RET_ADDED_CLUB",
    RET_GET_CLUB_MEMBER_EX = "RET_GET_CLUB_MEMBER_EX",
    RET_ADD_CLUB_MEMBER = "RET_ADD_CLUB_MEMBER",
    RET_GET_CLUB_MEMBER_EX_FAIL = "RET_GET_CLUB_MEMBER_EX_FAIL",
    RET_ADD_CLUB_TABLE = "RET_ADD_CLUB_TABLE",
    RET_UPDATE_CLUB_TABLE = "RET_UPDATE_CLUB_TABLE",
    RET_DEL_CLUB_TABLE = "RET_DEL_CLUB_TABLE",
    RET_UPDATE_CLUB_INFO = "RET_UPDATE_CLUB_INFO",
    RET_DELED_CLUB = "RET_DELED_CLUB",
    RET_DISBAND_CLUB_TABLE = "RET_DISBAND_CLUB_TABLE",
    RET_UPDATE_CLUB_ROOMCARD = "RET_UPDATE_CLUB_ROOMCARD",
    RET_GET_CLUB_APPLICATION_RECORD = "RET_GET_CLUB_APPLICATION_RECORD",
    RET_FIND_CLUB_MEMBER = "RET_FIND_CLUB_MEMBER",
    RET_REFUSE_JOIN_CLUB = "RET_REFUSE_JOIN_CLUB",
    RET_GET_CLUB_OPERATE_RECORD = "RET_GET_CLUB_OPERATE_RECORD",
    RET_GET_CLUB_OPERATE_RECORD_FINISH = "RET_GET_CLUB_OPERATE_RECORD_FINISH",
    RET_REFRESH_CLUB_PLAY = "RET_REFRESH_CLUB_PLAY",
    RET_SETTINGS_CLUB_PLAY = "RET_SETTINGS_CLUB_PLAY",
    RET_UPDATE_CLUB_PLAYER_INFO = "RET_UPDATE_CLUB_PLAYER_INFO",
    RET_SETTINGS_CONFIG = "RET_SETTINGS_CONFIG",
    RET_SETTINGS_PAPTNER = "RET_SETTINGS_PAPTNER",
    RET_PARTNER_EARNINGS = "RET_PARTNER_EARNINGS",
    RET_PARTNER_PAGE_EARNINGS = "RET_PARTNER_PAGE_EARNINGS",
    RET_PARTNER_PAGE_EARNINGS_FINISH = "RET_PARTNER_PAGE_EARNINGS_FINISH",
    RET_CLUB_PLAYER_COUNT = "RET_CLUB_PLAYER_COUNT",
    RET_CLUB_PAGE_PLAYER_COUNT = "RET_CLUB_PAGE_PLAYER_COUNT",
    RET_CLUB_PAGE_PLAYER_COUNT_FINISH = "RET_CLUB_PAGE_PLAYER_COUNT_FINISH",
    RET_CLUB_PLAYER_COUNT_DETAILS = "RET_CLUB_PLAYER_COUNT_DETAILS",
    RET_CLUB_PLAYER_COUNT_DETAILS_FINISH = "RET_CLUB_PLAYER_COUNT_DETAILS_FINISH",
    RET_CLUB_PARTNER_COUNT = "RET_CLUB_PARTNER_COUNT",
    RET_CLUB_PAGE_PARTNER_COUNT = "RET_CLUB_PAGE_PARTNER_COUNT",
    RET_CLUB_PAGE_PARTNER_COUNT_FINISH = "RET_CLUB_PAGE_PARTNER_COUNT_FINISH",
    RET_CLUB_PARTNER_COUNT_DETAILS = "RET_CLUB_PARTNER_COUNT_DETAILS",
    RET_CLUB_PARTNER_COUNT_DETAILS_FINISH = "RET_CLUB_PARTNER_COUNT_DETAILS_FINISH",
    RET_CLUB_GROUP_INVITE = "RET_CLUB_GROUP_INVITE",
    RET_CLUB_GROUP_INVITE_LOG = "RET_CLUB_GROUP_INVITE_LOG",
    RET_CLUB_GROUP_INVITE_REPLY = "RET_CLUB_GROUP_INVITE_REPLY",
    RET_CLUB_MEMBER_INFO = "RET_CLUB_MEMBER_INFO",
    RET_CLUB_MEMBER_INFO_FINISH = "RET_CLUB_MEMBER_INFO_FINISH",
    RET_SETTINGS_CLUB_PLAY_FINISH = "RET_SETTINGS_CLUB_PLAY_FINISH",
    RET_REFRESH_CLUB_PLAY_FINISH = "RET_REFRESH_CLUB_PLAY_FINISH",
    RET_FIND_CLUB_NOT_PARTNER_MEMBER_FINISH = "RET_FIND_CLUB_NOT_PARTNER_MEMBER_FINISH",
    RET_CLUB_ANTI_LIMIT = "RET_CLUB_ANTI_LIMIT",
    RET_CLUB_SETTING_ANTI_LIMIT = "RET_CLUB_SETTING_ANTI_LIMIT",
    RET_CLUB_ANTI_LIST = "RET_CLUB_ANTI_LIST",
    RET_CLUB_ANTI_LIST_FINISH = "RET_CLUB_ANTI_LIST_FINISH",
    RET_CLUB_SETTING_ANTI_MEMBER = "RET_CLUB_SETTING_ANTI_MEMBER",
    RET_CLUB_ANTI_REFRESH_LOG = "RET_CLUB_ANTI_REFRESH_LOG",
    RET_CLUB_ANTI_REFRESH_LOG_FINISH = "RET_CLUB_ANTI_REFRESH_LOG_FINISH",
    RET_MATCH_CLUB_TABLE = "RET_MATCH_CLUB_TABLE",
    RET_CLUB_PLAY_DISTRIBUTION = "RET_CLUB_PLAY_DISTRIBUTION",
    RET_SETTINGS_CLUB_PLAY_DISTRIBUTION = 'RET_SETTINGS_CLUB_PLAY_DISTRIBUTION',
    
    --竞技
    RET_SPORTS_LIST = "RET_SPORTS_LIST",              --返回竞技列表
    RET_SPORTS_LIST_BY_USER_ID = "RET_SPORTS_LIST_BY_USER_ID",                         --返回已参与的竞技列表   
    RET_SPORTS_CREATE = "RET_SPORTS_CREATE",                        --发起比赛结果  
    RET_SPORTS_CONFIG_LIST = "RET_SPORTS_CONFIG_LIST",                     --返回比赛配置 
    RET_SPORTS_STATE = "RET_SPORTS_STATE",                          --返回比赛状态  
    RET_SPORTS_USER_LIST = "RET_SPORTS_USER_LIST",                  --详情
    RET_SPORTS_REWARD_SELF_WINNING = "RET_SPORTS_REWARD_SELF_WINNING", --返回用户比赛结束并且胜利的竞技场  
    RET_SPORTS_REWARD_SELF_JOIN = "RET_SPORTS_REWARD_SELF_JOIN",                       --请求用户比赛结束并且参与的竞技场  
    RET_SPORTS_REWARD_ALL = "RET_SPORTS_REWARD_ALL",                     --返回比赛结束并的竞技场
        
    --公会活动
    SUB_SC_JSONCALLACTIVI = "SUB_SC_JSONCALLACTIVI",          --查询公会活动
    
    --国庆土豪活动
    SUB_SC_TUHAOACTIVI = "SUB_SC_TUHAOACTIVI",          --查询公会活动
   
    --游戏服用户消息

    --游戏服逻辑消息
    GAMEVIEWMSG = "GAMEVIEWMSG",
    HTTPMSG = "HTTPMSG",
    ClientSockEventMsg = "ClientSockEventMsg",
    SUB_GR_USER_CONTINUE_GAME = "SUB_GR_USER_CONTINUE_GAME",
    
    --游戏战绩与回放
    SUB_CL_MAIN_RECORD = "SUB_CL_MAIN_RECORD",                                      --主战绩
    SUB_CL_MAIN_RECORD_FINISH = "SUB_CL_MAIN_RECORD_FINISH",
    RET_CL_MAIN_RECORD_BY_TYPE0 = "RET_CL_MAIN_RECORD_BY_TYPE0",                        --个人普通房战绩(大局)
    RET_CL_MAIN_RECORD_BY_TYPE1 = "RET_CL_MAIN_RECORD_BY_TYPE1",                        --个人或群主亲友圈战绩(大局)
    RET_CL_MAIN_RECORD_BY_TYPE2 = "RET_CL_MAIN_RECORD_BY_TYPE2",                        --个人所在亲友圈战绩(大局)
    RET_CL_MAIN_RECORD_BY_TYPE3 = "RET_CL_MAIN_RECORD_BY_TYPE3",                        --亲友圈战绩(大局)
    SUB_CL_SUB_RECORD = "SUB_CL_SUB_RECORD",                                        --子战绩
    SUB_CL_SUB_RECORD_FINISH = "SUB_CL_SUB_RECORD_FINISH",                          --小局结束
    SUB_CL_SUB_REPLAY = "SUB_CL_SUB_REPLAY",                                        --小局回放
    SUB_CL_SUB_REPLAY_NOTFOUNT = "SUB_CL_SUB_REPLAY_NOTFOUNT",                      --小局回放未找到
    SUB_CL_SUB_SHARE_REPLAY_BASE = "SUB_CL_SUB_SHARE_REPLAY_BASE",                                        --回放桌子信息(分享)
    SUB_CL_SUB_SHARE_REPLAY_DATA = "SUB_CL_SUB_SHARE_REPLAY_DATA",                                        --回放游戏信息(分享)
    SUB_CL_SUB_SHARE_REPLAY_NOTFOUNT = "SUB_CL_SUB_SHARE_REPLAY_NOTFOUNT",                                --回放(分享)未找到 
    REQ_CL_SUB_GET_REPLAY_SHAREID = "REQ_CL_SUB_GET_REPLAY_SHAREID",                                      --请求回放分享ID
    SUB_CL_SUB_GET_REPLAY_BY_SHAREID = "SUB_CL_SUB_GET_REPLAY_BY_SHAREID",                                --用分享ID请求回放
    SUB_CL_SUB_REPLAY_SHAREID = "SUB_CL_SUB_SHARE_REPLAY_NOTFOUNT",                                       --回放分享ID
    SUB_CL_SUB_REPLAY_SHAREID_ERROR = "SUB_CL_SUB_SHARE_REPLAY_NOTFOUNT",                                 --回放分享ID分配失败
    RET_SC_SUB_GET_PROXY_RECORD = "RET_SC_SUB_GET_PROXY_RECORD",        --公会房记录
    RET_SC_SUB_GET_PROXY_TABLE = "RET_SC_SUB_GET_PROXY_TABLE",          --代开房间

    RET_GAMES_USER_POSITION = "RET_GAMES_USER_POSITION",  --距离调整  

    CUS_GAMEENDlAYER_CLIENT = "CUS_GAMEENDlAYER_CLIENT",

    CHECK_TING_CARD_TIPS = "CHECK_TING_CARD_TIPS",

    --新战绩
    RET_GET_GAME_RECORD = "RET_GET_GAME_RECORD",                                        --返回战绩
    RET_GET_GAME_RECORD_FINISH  = "RET_GET_GAME_RECORD_FINISH",                         --返回战绩结束
    RET_LIKE_GAME_RECORD = "RET_LIKE_GAME_RECORD",                                      --返回点赞战绩
    RET_GET_3DAYS_GAME_RECORD = "RET_GET_3DAYS_GAME_RECORD",                            --返回个人三天的战绩总和

    --聊天
    RET_CLUB_CHAT_MSG = 'RET_CLUB_CHAT_MSG',
    RET_CLUB_CHAT_RECORD_FINISH = 'RET_CLUB_CHAT_RECORD_FINISH', --请求聊天记录结束
    RET_CLUB_CHAT_RECORD = 'RET_CLUB_CHAT_RECORD',

    VOICE_SDK_EVENT = 'VOICE_SDK_EVENT',
    RET_CLUB_CHAT_GET_UNREAD_MSG = 'RET_CLUB_CHAT_GET_UNREAD_MSG',

    RET_CLUB_CHAT_GET_UNREAD_MSG_FAIL = 'RET_CLUB_CHAT_GET_UNREAD_MSG_FAIL',

    RET_CLUB_CHAT_RECORD_ZUJU        = 'RET_CLUB_CHAT_RECORD_ZUJU',--组局

    RET_CLUB_CHAT_BACK_RECORD = '',---组局记录
    
    RET_GET_CLUB_ONLINE_MEMBER = "RET_GET_CLUB_ONLINE_MEMBER",
    RET_GET_CLUB_ONLINE_MEMBER_FINISH = "RET_GET_CLUB_ONLINE_MEMBER_FINISH",
    RET_FIND_CLUB_ONLINE_MEMBER = "RET_FIND_CLUB_ONLINE_MEMBER",

    RET_SETTINGS_CLUB_MEMBER = "RET_SETTINGS_CLUB_MEMBER",
    RET_GET_CLUB_PARTNER = "RET_GET_CLUB_PARTNER",
    RET_GET_CLUB_PARTNER_FINISH = "RET_GET_CLUB_PARTNER_FINISH",
    RET_GET_CLUB_NOT_PARTNER_MEMBER = "RET_GET_CLUB_NOT_PARTNER_MEMBER",
    RET_GET_CLUB_NOT_PARTNER_MEMBER_FINISH = "RET_GET_CLUB_NOT_PARTNER_MEMBER_FINISH",
    RET_GET_CLUB_PARTNER_MEMBER = "RET_GET_CLUB_PARTNER_MEMBER",
    RET_GET_CLUB_PARTNER_MEMBER_FINISH = "RET_GET_CLUB_PARTNER_MEMBER_FINISH",
    RET_FIND_CLUB_NOT_PARTNER_MEMBER = "RET_FIND_CLUB_NOT_PARTNER_MEMBER",
    RET_FIND_CLUB_PARTNER_MEMBER = "RET_FIND_CLUB_PARTNER_MEMBER",
    RET_GET_CLUB_MEMBER_FATIGUE_RECORD = "RET_GET_CLUB_MEMBER_FATIGUE_RECORD",
    RET_GET_CLUB_MEMBER_FATIGUE_RECORD_FINISH = "RET_GET_CLUB_MEMBER_FATIGUE_RECORD_FINISH",
    RET_FREE_CLUB_CHANGE_TABLE_NOTICES = "RET_FREE_CLUB_CHANGE_TABLE_NOTICES",

    --统计
    RET_GET_CLUB_STATISTICS_MYSELF = 'RET_GET_CLUB_STATISTICS_MYSELF',
    RET_GET_CLUB_STATISTICS_MEMBER = 'RET_GET_CLUB_STATISTICS_MEMBER',
    RET_GET_CLUB_STATISTICS = 'RET_GET_CLUB_STATISTICS',
    RET_GET_CLUB_STATISTICS_ALL = 'RET_GET_CLUB_STATISTICS_ALL',
    RET_GET_CLUB_STATISTICS_MEMBER_FINISH = 'RET_GET_CLUB_STATISTICS_MEMBER_FINISH',
    RET_GET_CLUB_STATISTICS_FINISH = 'RET_GET_CLUB_STATISTICS_FINISH',
    RET_GET_CLUB_STATISTICS_MYSELF_FINISH = 'RET_GET_CLUB_STATISTICS_MYSELF_FINISH',
    RET_GET_CLUB_FATIGUE_STATISTICS = 'RET_GET_CLUB_FATIGUE_STATISTICS',
    RET_GET_CLUB_FATIGUE_DETAILS = 'RET_GET_CLUB_FATIGUE_DETAILS',

    --自定义事件关闭界面
    CLOSE_RECORDCLUB = 'CLOSE_RECORDCLUB',

    RET_NOTICE_GAME_START = "RET_NOTICE_GAME_START",

    RET_GET_CHAT_CONFIG = 'REQ_GET_CHAT_CONFIG',--聊天配置

    EVENT_TYPE_MINGPAI = 'EVENT_TYPE_MINGPAI',

    USER_LEAVETABLE = 'USER_LEAVETABLE', --用户离开牌桌

    VOICE_START = 'VOICE_START', --
    RET_USER_HOSTED = 'RET_USER_HOSTED',                                --托管(接收)
    REFRESH_CLUB_BG = 'REFRESH_CLUB_BG',
}

return EventType