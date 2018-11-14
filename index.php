<?php

// Config
define('DIR_APPLICATION',   realpath(__DIR__) . '/');
define('DIR_SYSTEM',        realpath(__DIR__) . '/../system/');
define('DIR_UPLOAD', 		realpath(__DIR__) . '/../storage/upload/dashboard/');
define('DIR_TEMP', 			realpath(__DIR__) . '/../storage/temp/dashboard/');
define('HTTP_SERVER',       'https://ottoair.ca/dashboard/');
define('HTTP_FRONT',        'https://ottoair.ca/');
// define('HTTP_SERVER',       'http://localhost/ottorepo/dashboard/');
// define('HTTP_FRONT',        'http://localhost/ottorepo/');
// define('HTTP_SERVER',       'https://staging.ottoair.ca/dashboard/');
// define('HTTP_FRONT',        'https://staging.ottoair.ca/');

if (empty($_GET['path'])) {
	$_GET['path'] = 'home';
}

require_once(DIR_SYSTEM . 'constants.php');
require_once(DIR_SYSTEM . 'functions.php');
require_once(DIR_SYSTEM . 'dashboard_controller.php');
require_once(DIR_SYSTEM . 'router.php');


Router::dispatch();
