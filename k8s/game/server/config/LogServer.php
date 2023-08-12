<?php 

return array (
  'kafka' => 
  array (
    'brokers' => '192.168.1.101:12092',
    'topic' => 'log',
  ),
  'redis' => 
  array (
    'topic' => 'log',
  ),
  'file' => 
  array (
    'path' => '/data/var/log/game.log',
  ),
  'TLog' => 
  array (
    'udp' => '127.0.0.1::4455',
  ),
  'DLog' => 
  array (
    'topic' => 'dlog',
  ),
);