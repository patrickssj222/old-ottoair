<?php
require_once ('registry.php');

/**
 * Controller Base class
 *
 * Otto v3 MVC speed prioritized
 *
 * Jack Mai
 * 2018-03-11
 */
class Controller extends Registry {

    protected $registry;
    protected $error;

    public function __construct($registry = false) {
        parent::__construct($registry);

        // Loader and db
        require_once('loader.php');
        require_once('db.php');
        $this->registry->load = new Loader($this->registry);
        $this->registry->db   = new DB();

        // Start session
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        // If in the future we want language [code] to be part of the reqeust url,
        // (so the request is: e.g., ottoair.ca/en-gb/a/... which becomes
        // ottoair.ca/index.php?path=en-bg/a/.., or if we use .htaccess rewrite,
        // ottoair.ca/index.php?lang=en-bg&path=a/..), parse it here, and call
        // setting/language/[code] to switch language, then remove [code] from path

        $_SESSION['request_path'] = $_GET['path'];

        // Load base Model class
        require_once('model.php');

        // Load common language
        $this->load->language();
    }

    /**
     * Force a redirect immediately
     * @param  string $url Target url
     * @return null
     */
    public function redirect($url) {
        header("Location: " . $url);
        die();
    }
}
