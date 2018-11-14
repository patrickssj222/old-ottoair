<?php

/**
 * Loader class
 *
 * Otto v3 MVC speed prioritized
 *
 * Jack Mai
 * 2018-03-11
 */
class Loader {
    protected $registry;

    public function __construct($registry = false) {
        if (!$registry)  $registry = new stdClass();
        $this->registry = $registry;
    }


    /**
     * Determine if the file exists
     * @param  string  $type           one of the folder names
     * @param  string  $path           The file path
     * @param  boolean $suppress_error Whether to ignore the not found error
     * @return string                  The absolute path of the original
     */
    protected function file_check($type = 'A file of importance', $path = '', $suppress_error = false) {
        // var_dump(DIR_APPLICATION . $type . '/' . $path);
        if (!empty($path) && substr($path, -1) !== '/')  {
            
            if (file_exists(DIR_APPLICATION . $type . '/' . $path)) {
                return realpath(DIR_APPLICATION . $type . '/' . $path);
            }
            if (file_exists(DIR_SYSTEM . $type . '/' . $path)) {
                return realpath(DIR_SYSTEM . $type . '/' . $path);
            }
        }

        if ($suppress_error)  return false;
        else throw new Exception($type . ' ' . pathinfo($path, PATHINFO_FILENAME) . ' was not found.');
    }


    /**
     * Load a controller or model (or maybe module, plugin, & more in the future)
     * @param  string $type The called method name. e.g., 'controller'
     * @param  string $path The file path
     * @return mixed        The loaded entity
     */
    public function __call($type, $path = array('')) {
        $path = $path[0];

        require_once ($this->file_check($type, $path . '.php'));

        $field = strtolower($type . '_' . str_replace('/', '_', $path));
        $name = $type . str_replace('/', '', str_replace('_', '', $path));
        $this->registry->{$field} = new $name($this->registry);

        return $this->registry->{$field};
    }


    /**
     * @param  string  $path           The file path
     * @param  string  $locale         A folder name under language/
     * @param  boolean $suppress_error Whether to ignore not found errors
     * @return array                   The loaded language array
     */
    public function language($path = '', $locale = '', $suppress_error = true) {
        if (empty($locale)) {

            // Determine locale
            if (!empty($this->registry->user['language_code'])) {
                $locale = $this->registry->user['language_code'];
            }
            else if (!empty($_SESSION['user_language'])) {
                $locale = $_SESSION['user_language']; // Legacy
            }
            else $locale = 'en-gb'; // user language fallback
        }

        if (!$valid_path = $this->file_check('language/' . $locale, (!empty($path)?$path:$locale).'.php', $suppress_error)) {
            // File not found fallback
            $valid_path = $this->file_check('language/en-gb', (!empty($path)?$path:'en-gb').'.php');
        }
        if ($valid_path) {
            require ($valid_path);
            if ($common = $this->file_check('language/' . $locale, $locale . '.php', true)) {
                require($common);
            }
            if (!empty($this->registry->language)) {
                $this->registry->language = array_merge($this->registry->language, $_);
            } else {
                $this->registry->language = $_;
            }
            return $_;
        }
        return array();
    }


    /**
     * @param  string  $path           The file path
     * @param  array   $data           The data to be passed into the template
     * @param  boolean $return         Whether to capture the result
     * @param  boolean $suppress_error Whether to ignore not found errors
     * @return string                  The render result, or null
     */
    public function view($path = '', $data = array(), $return = false, $suppress_error = false) {
        $path = $path . '.tpl';

        if ($path = $this->file_check('view', $path, $suppress_error)) {

            // Merge with language
            if (!empty($this->registry->language)) {
                $data = array_merge($this->registry->language, $data);
            }
            // The Template class was obmitted so we're literally setting variables
            foreach ($data as $k => $v) {
                $$k = $v;
            }

            if ($return)  ob_start();
            require ($path); // Render
            if ($return)  return ob_get_clean();
        }
    }
}
