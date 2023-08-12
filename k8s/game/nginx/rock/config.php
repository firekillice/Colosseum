<?php
	$MONGO = array();
	$CONFIG = array();
	$MONGO["features"]["log_query"] = "on";//log queries
	$MONGO["features"]["theme"] = "default";//theme
	$MONGO["features"]["plugins"] = "on";//plugins
	$MONGO["desc"] = "igoal3-开发测试服";//plugins
	$MONGO["admin"]['username'] = "root";
	$MONGO["admin"]['password'] = "H5gamere40d6bjm#2021";
	$MONGO["reader"]['username'] = "reader";
	$MONGO["reader"]['password'] = "reader";
	$CONFIG["ENVIRONMENT"] = "development";  // production development
	$CONFIG['ACI']["appId"] = "";  // aci对应的appID
	$CONFIG['ACI']["appKey"] = "";  // aci对应的appKey
	$CONFIG["ACI"]["remoteUrl"] = "";  // 数据中心验证地址
	$CONFIG["ACI"]["redirectUrl"] = "";  // 数据中心返回的回调地址
	$i = 0;

	$MONGO["servers"][$i]["mongo_name"] = "动态测试服";
        $MONGO["servers"][$i]["mongo_host"] = "svc-mongodb.default.svc.cluster.local";
        $MONGO["servers"][$i]["mongo_port"] = "27017";
        $MONGO["servers"][$i]["mongo_auth"] = true;
        $MONGO["servers"][$i]["control_users"]["admin"] = "admin";
        $i ++;

?>