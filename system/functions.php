<?php

/**
 * MVC use global functions.
 *
 * Otto v3 MVC speed prioritized
 *
 * Jack Mai
 * 2018-05-30
 */

function token($length = 15)
{
	return bin2hex(openssl_random_pseudo_bytes($length));
}


function dir_check($path, $create = false, $permission = 0755) 
{
	if (is_dir($path)) {
		return realpath($path) . '/';
	} 
	else if ($create) {
		mkdir($path, $permission, true);
		return realpath($path) . '/';
	} 
	return false;
} 


function file_check($path, $create = false) 
{
	if (is_file($path)) {
		return realpath($path);
	} 
	else if ($create) {
		dir_check(dirname($path), true);
		touch($path);
		return realpath($path);
	} 
	return false;
}

