<?php

/**
 * Determine the path. Search the directory based on URI. Find and call the
 * first matching controller and method, pass in the rest of the URI pieces as parameters.
 * If no method is provided, method index() is assumed. If a method is provided
 * but not found in the controller, magic method __call() is called;
 *
 * e.g., If you have a controller A at __DIR__/controller/a/home.php, who has methods
 * index() and home($a, $b), then URI //HOST/a/home or //HOST/a/home/index invokes
 * A->index() method, and //HOST/a/home/c/d invokes A->home() with parameters $a='c', $b='d'
 * URI that does not have a match results in a 404.
 *
 * Otto v3 MVC speed prioritized
 *
 * Jack Mai
 * 2018-05-30
 */

class Router 
{

	public static function dispatch($path = '') 
	{
		// Sanitize input and check 404
		if (empty($path) && !empty($_GET['path'])) {
			$path = $_GET['path'];
		}

		if (empty($path) || strpos($path, '404') === 0) {
			self::_404();
		}

		$tokens = array_filter(explode('/', $path));
		$base = dir_check(DIR_APPLICATION . 'controller', true);
		$path = '';

		// Search for controller directory
		while (!empty($tokens) && is_dir($base . $path . $tokens[0])) {
		    $path .= array_shift($tokens) . '/';
		}

		// Locate and load controller
		if (!empty($tokens)) {
		    $c_name = array_shift($tokens);
		    if ($c_file = file_check($base . $path . $c_name . '.php')) {
		        require_once($c_file);

		        // Instantiate controller
		        $c_name = 'Controller' . str_replace('_', '', str_replace('/', '', $path) . $c_name);
		        $c = new $c_name(array());

		        // Determine method
		        if (!empty($tokens))  $m = array_shift($tokens);
		        else  $m = 'index';

		        // Call method
		        if(method_exists($c, $m)) {
		            // The rest of the tokens become parameters
		            switch (count($tokens)) {
		                case 0:
		                    $c->{$m}(); break;
		                case 1:
		                    $c->{$m}($tokens[0]); break;
		                case 2:
		                    $c->{$m}($tokens[0], $tokens[1]); break;
		                case 3:
		                    $c->{$m}($tokens[0], $tokens[1], $tokens[2]); break;
		                // call_user_func_array is very slow. So we hard code first 4 variations
		                default:
		                    call_user_func_array(array($c, $m), $tokens); break;
		            }
		            return true;

		        // Try falling back to __call magic method
		        } else if(method_exists($c, '__call')) {
		            switch (count($tokens)) {
		                case 0:
		                    $c->__call($m); break;
		                case 1:
		                    $c->__call($m, $tokens[0]); break;
		                case 2:
		                    $c->__call($m, $tokens[0], $tokens[1]); break;
		                case 3:
		                    $c->__call($m, $tokens[0], $tokens[1], $tokens[2]); break;
		                default:
		                    call_user_func_array(array($c, '__call'), array_merge($m, $tokens)); break;
		            }
		            return true;
		        } 
		    } 
		} 
		//         } else var_dump('method not found'); // Method not found
		//     } else var_dump('controller not found'); // Controller not found
		// } else var_dump('path not found'); // Path invalid

		// 404 fallback
		self::_404();
	}


	public static function _404($error = '') 
	{
	    header('Location: '. HTTP_SERVER . '404');
	    header("HTTP/1.0 404 " . ($error ?: 'Not Found'));

	    if ($_404 = file_check(DIR_APPLICATION . '/controller/404.php')) {
	    	require_once($_404);
		    $c = new Controller404();
		    $c->index($error);
	    }
	    die();
	}
}