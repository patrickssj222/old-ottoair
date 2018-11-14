<?php
class ControllerAccountLogin extends Controller {

    // Autoload
    public function __construct($registry = array()) {
        parent::__construct($registry);
        // Load model
        $this->load->model('user');
        // Load language
        $this->load->language('account/login');
    }


    public function index($data = array()) {

        if (isset($_POST['redirect'])) {
            $_SESSION['redirect'] = $_POST['redirect'];
        }
        if (isset($_GET['redirect'])) {
            $_SESSION['redirect'] = $_GET['redirect'];
        }

        // Already logged in?
        if (!empty($_SESSION['user_username']) &&
        $this->model_user->getUserByUsername($_SESSION['user_username'])) {
            $this->then();
            return;
        }

        // Check remember me cookie
        if (isset($_COOKIE['OTTOAIR_SESSION_TOKEN']) &&
        $user = $this->model_user->getUserByToken($_COOKIE['OTTOAIR_SESSION_TOKEN'])) {
            $this->then();
        }

        // Fall back to login form
        $data['url_login'] = HTTP_SERVER . 'account/login/login';
        $data['url_register'] = HTTP_SERVER . 'account/register';
        if (!empty($_SESSION['error'])) {
            $data['error'] = $_SESSION['error'];
            unset($_SESSION['error']);
        }
        $this->load->view('account/login', $data);
    }


    public function login($username = '', $pass = '') {
        if (!empty($_POST['username'])) {
            $username = $_POST['username'];
        }
        if (!empty($_POST['password'])) {
            $pass = $_POST['password'];
        }

        if (empty($username) || empty($pass)) {
            $_SESSION['error'] = $this->language['error_empty'];
            $this->redirect(HTTP_SERVER . 'account/login');
        }

        // Username and password check
        if ($user = $this->model_user->getUserByCredentials($username, $pass)) {
            // Session vars
            $_SESSION['user_username'] = $user['phone'];
            $_SESSION['user_id'] = $user['user_id'];

            // Keep me logged in
            $login_token = md5(time()) . $user['user_id'];
            if (!empty($_POST['keep_signed'])) {
                $this->model_user->updateUserToken($user['user_id'], $login_token);
                setcookie('OTTOAIR_SESSION_TOKEN', $login_token, time() + (86400 * 30), "/"); // 86400 = 1 day
            } else {
                $this->model_user->deleteUserToken($user['user_id'], $login_token);
            }

            $this->then();

        } else {
            $_SESSION['error'] = $this->language['error_login'];
            $this->redirect(HTTP_SERVER . 'account/login');
        }

    }

    public function then() {
        // Redirect
        if (isset($_SESSION['redirect'])) {

            $url = $_SESSION['redirect'];
            unset($_SESSION['redirect']);

            // Make sure we dont redirect to a file
            if (!preg_match('/\.\w*$/i', $url)) {
                $this->redirect($url);
            }
        }
        $this->redirect(HTTP_SERVER);
    }
}
