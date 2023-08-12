<?php
$_ServerHost = require __DIR__ . '/ServerHost.php';
$_ServerList = require __DIR__ . '/ServerList.php';
$_CrossServerList = require __DIR__ . '/CrossServerList.php';
$_AllServerList = require __DIR__ . '/AllServerList.php';
$_ServerHost['list'] = $_ServerList;
$_ServerHost['cross'] = $_CrossServerList;
$_ServerHost['all'] = $_AllServerList;
$_MasterServer = array();
$_MasterServer['database'] = $_ServerHost;
return $_MasterServer;