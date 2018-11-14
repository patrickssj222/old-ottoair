<?php 
require('config.php');
date_default_timezone_set('UTC');
exec('mysqldump -u '.DB_USERNAME.' -p'.DB_PASSWORD.' '.DB_DATABASE.' > svdcctv'.date('Ymd-His').'.sql');
?>