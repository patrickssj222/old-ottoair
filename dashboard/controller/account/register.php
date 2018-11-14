<?php
class ControllerAccountRegister extends Controller {

    protected $error = array();

    // Autoload
    public function __construct($registry = array()) {
        parent::__construct($registry);
        // Load model
        $this->load->model('user');
        // Load language
        $this->load->language('account/register');
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
            $this->load->controller('account/login')->then();
            return;
        }

        $data['url_register'] = HTTP_SERVER . 'account/register/register';
        $data['url_login'] = HTTP_SERVER . 'account/login';

        // Perhaps replace with db in future
        $data['regions'] = array(
            $this->language['option_downtown'] => 'downtown',
            $this->language['option_north_york'] => 'north york',
            $this->language['option_markham'] => 'markham',
            $this->language['option_scarborough'] => 'scarborough',
            $this->language['option_richmond_hill'] => 'richmond hill'
        );
        if (!empty($_SESSION['error'])) {
            $data['error'] = $_SESSION['error'];
            unset($_SESSION['error']);
        }

        $this->load->view('account/register', $data);
    }


    public function register() {
        $data = array(
            'firstname' => !empty($_POST['firstname'])? $_POST['firstname'] : '',
            'lastname' => !empty($_POST['lastname'])? $_POST['lastname'] : '',
            'language_id' => 1,
            'phone' => !empty($_POST['phone'])? $_POST['phone'] : '',
            'email' => !empty($_POST['email'])? $_POST['email'] : '',
            'wechat' => !empty($_POST['wechat'])? $_POST['wechat'] : '',
            'region' => !empty($_POST['region'])? $_POST['region'] : '',
            'password' => !empty($_POST['password'])? $_POST['password'] : '',
            'keep_signed' => !empty($_POST['keep_signed'])? true : false,
        );

        // Username and password check
        if ($this->validate_register($data) && $this->model_user->createUser($data)) {
            $this->load->controller('account/login')->login($data['phone'], $data['password']);

        } else {
            $_SESSION['error'] = $this->error[0];
            $this->index($data);
        }

    }

    protected function validate_register($data = array()) {
        if (empty($data['firstname']) || empty($data['email']) || empty($data['phone']) || empty($data['password'])) {
            $this->error[] = $this->language['error_empty'];
        }
        else if (!empty($data['email']) && !filter_var($data['email'], FILTER_VALIDATE_EMAIL)) {
            $this->error[] = $this->language['error_email'];
        }
        else if ($this->model_user->getUserByUsername($data['phone'])) {
            $this->error[] = $this->language['error_phone'];
        }
        else if ($this->model_user->getUserByEmail($data['email'])) {
            $this->error[] = $this->language['error_email'];
        }
        return empty($this->error);
    }
}
