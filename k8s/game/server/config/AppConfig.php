<?php 

//配置版本号
define('CONFIG_VERSION', 26);

//运行环境
define('ENVIRONMENT', 'development');

//逻辑中的语言类型
define('GAME_LANGUAGE', 'zh-Hans');

//逻辑中的语言类型
define('STATIC_LANG', 'zh-Hans');

//发行版本类别，区分国内，港澳台，日本，韩国，全球
define('PUBLISH_EDITION_CLASS', 'China');

//检查游戏的token
define('CHECK_TOKEN_FLAG', true);

//每个设备最大充值账号数, 小于等于0不限制
define('PAY_MAX_ACCOUNT_NUM_PER_DEVICE', -1);

//日志保留天数
define('LOG_RESERVE_DAYS', 0);

//是否打log开关 - 总开关
define('LOG_NEED_FLAG', false);

//log开关
define('LOG_OPEN_FLAG', false);

//是否将log发送到日志服务器
define('LOG_SEND_FLAG', true);

//是否打印debug日志
define('LOG_DEBUG_FLAG', false);

//是否报送DLog数据
define('DLog_OPEN_FLAG', false);

//背景音乐切换开关 1表示开(播放无版权歌曲)，0表示关（播放有版权歌曲）
define('MUSIC_FLAG', 1);

//付费开关 1表示开，0表示关
define('PAY_FLAG', 1);

//登陆页面是否置灰
define('LOGIN_GREY', array (
  0 => 1585929600,
  1 => 1586016000,
));

//防沉迷健康提醒
define('HEALTH_REMIND', false);

//是否显示新手训练营
define('NOVICE_TRAINING', array (
  'enable' => false,
  'enable_channel' => 
  array (
  ),
  'enable_bichannel' => 
  array (
  ),
));

//是否可以改名
define('VARIOUS_NAME_CHANGE', array (
  'enable' => false,
  'enable_channel' => 
  array (
  ),
  'enable_bichannel' => 
  array (
  ),
));

//客服开关
define('CUSTOMER_SERVICE', array (
  'enable' => true,
  'disable_domain' => 
  array (
  ),
));

//是否允许分享评价
define('OPEN_APPRAISE_GUIDE', false);

//停服提示 - 数组内的sid所在区停
define('STOP_SERVER_SINGLE', array (
));

//是否固定推荐哪一个区
define('CHECK_CONFIRM_SERVER_LIST', false);

//固定推荐区id
define('CONFIRM_SERVER_LIST', 4);

//游戏使用的CDN地址
define('CDN_SERVER_URL', '');

//玩家并发锁
define('PLAYER_LOCK_IS_OPEN', true);

//进程锁开关
define('SERVER_LOCK_IS_OPEN', true);

//是否检查提审版本，一般在正式服配置为true
define('CHANGE_SERVER_FLAG', true);

//提审标识 屏蔽除签到外的其他活动和月卡，只在提审服配置为true
define('IS_VERIFY_FLAG', false);

//游客服标识
define('GUEST_SERVER', false);

//测试账号开关
define('TEST_VERIFY_FLAG', false);

//检查渠道的token,部署的时候要注意，需要时置true,不需要时置false
define('VERIFY_CHANNEL_TOKEN_FLAG', true);

//检查客户端版本
define('CHECK_CLIENT_UPDATE_VERSION', true);

//开启协议序号检查
define('CHECK_PROTOCOL_SEQUENCE', false);

//是否打dlog开关
define('TLOG_OPEN_FLAG', false);

//IOS充值是否开放
define('IOS_PAY_FLAG', false);

//从其他游戏服获取时间
define('REF_SERVER_TIME', '');

//是否使用备份数据库，用于数据查询
$GLOBALS['SLAVE_FLAG'] = false;

//基础配置文件路径
define('BASE_LIB', '/code/gameserver/application/lib/');
define('CONFIG_PATH', BASE_LIB . 'config');
$GLOBALS['SERVER_CONFIG_PATH'] = CONFIG_PATH . '/Server.php';

//锁类型
$GLOBALS['LOCK_PATH'] = '/RedisLock/BaseLock.php';
