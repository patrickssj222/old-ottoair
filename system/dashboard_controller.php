<?php
require ('controller.php');

/**
 * Dashboard Admin class
 *
 * Otto v3 MVC speed prioritized
 *
 * Jack Mai
 * 2018-03-11
 */
class DashboardController extends Controller {

    protected $user;

    public function __construct($registry = array()) {
        parent::__construct($registry);

        // Make sure the user has logged in
        $this->load->model('user');
        if (!empty($_SESSION['user_username'])) {
            if ($user = $this->model_user->getUserByUsername($_SESSION['user_username'])) {
                $this->user = $user;
                if (is_dir(DIR_APPLICATION . 'language/' . $user['language_code'])) {
                    $_SESSION['user_language_id'] = (int)$user['language_id'];
                    $_SESSION['user_language'] = $user['language_code'];
                } else {
                    $_SESSION['user_language_id'] = 1;
                    $_SESSION['user_language'] = 'en-gb';
                }
                return;
            }
        }
        // Otherwise redirect to login (which then redirect back to request page)
        if (!isset($_SESSION['redirect'])) {
            $_SESSION['redirect'] = HTTP_SERVER . $_GET['path'];
        }
        $this->redirect(HTTP_SERVER . 'account/login');
    }
}
