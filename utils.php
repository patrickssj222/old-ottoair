<?php

$adminName = 'admin';

define("DB_PREFIX", "otto3_");

// Takes a list of variables. Return true iff any is not set/empty
function hasEmpty($lst) {
	foreach ($lst as $elm) {
		if (!isset($elm) || empty($elm))
			return true;
	}
	return false;
}

// Set up the database connection and start session
function configSession() {
	// include("config.php");
	if (!isset($db)) {
		define('DB_SERVER', '198.57.247.243');
		define('DB_USERNAME', 'ottoaird_dev');
		define('DB_PASSWORD', 'otto1221');
		define('DB_DATABASE', 'ottoaird_db1');
    // define('DB_SERVER', '127.0.0.1');
    // define('DB_USERNAME', 'root');
		// define('DB_PASSWORD', '');
		// define('DB_DATABASE', 'ottoco_db1');
		global $db;
		$db = mysqli_connect(DB_SERVER,DB_USERNAME,DB_PASSWORD,DB_DATABASE) or die ("Cannot connect to database");
	}
	if (session_status() == PHP_SESSION_NONE) {
	    session_start();
	}
}

// Check if user has logged in
function loginCheck() {
	if (isset($_SESSION['login_user'])) {
		$un = $_SESSION['login_user'];
		global $db;
		$row = mysqli_query($db,"select username from admin where username = '$un' ");
		if ($row && mysqli_num_rows($row) == 1) {
			return true;
		}
	}
	return false;
}

// Redirect user to login if they haven't.
function loginRequired($errorMsg, $urlAfterLogin) {
	if (!loginCheck()) {
		$_SESSION['redirectError'] = isset($errorMsg) ? $errorMsg : "请先登录再访问此网页";
		$_SESSION['urlAfterLogin'] = $urlAfterLogin;
		header("location:login.php");
	}
}

function getAirport($code) {
	switch ($code) {
    case 'YYZ':
        $result = "YYZ - Toronto Pearson Airport";
        break;
		case 'YTZ':
				$result = "YTZ - Billy Bishop Airport";
				break;
		case 'SHA':
				$result = "SHA - Shanghai Pudong Airport";
				break;
		case 'PEK':
				$result = "PEK - Beijing Capital Airport";
				break;
	}
	return $result;
}

function toDecimal($num) {
	// $num = round($num, 2);
	$num = number_format( (float) $num, 2, '.', '');
	return $num;
}

?>
