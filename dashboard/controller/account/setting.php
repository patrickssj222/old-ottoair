<?php
class ControllerAccountSetting extends DashboardController
{
    // Autoload
    public function __construct($registry = array())
    {
        parent::__construct($registry);
        // Load language
        $this->load->language('account/setting');
        //
        $this->load->model('user');
        $this->load->model('localization/language');
    }

    public function index()
    {
        $data['breadcrumb'] = array(
            $this->language['text_dashboard'] =>  HTTP_SERVER,
            $this->language['heading_title'] =>  HTTP_SERVER . 'account/setting/',
        );

        $data['heading_title'] = $this->language['heading_title'];
        $data['page_name'] = $this->language['heading_title'];

        $data['foot'] = '<script type="text/javascript" src="' . HTTP_SERVER . 'assets/plugins/dropzone/dropzone.min.js"></script>';

        $data['user'] = $this->user;
        $data['languages'] = $this->model_localization_language->listLanguages();
        $data['text_user_id'] = $this->user['user_id'];

        $data['url_submit'] = HTTP_SERVER . 'account/setting/submit';

        $this->load->library('file_manager');

        $upload_data = array(
            'filename' => 'upload/image/user/profile.any',
            'label' => '',
            'name' => 'profile_image',
            'placeholder' => HTTP_SERVER . 'assets/img/profile_image.jpg'
        );

        if ($file = $this->library_file_manager->validate($this->user['profile_image'])) {
            $upload_data['value'] = HTTP_SERVER . $file['filename']/* . '?' . filemtime(DIR_UPLOAD .$file['mask'])*/;
            $data['profile_image'] = $this->user['profile_image'];
        }

        $data['profile_image'] = $this->load->controller('tool/upload')->widget($upload_data);

        // Render but capture output
        $data['sidebar'] = $this->load->controller('common/sidebar')->render(CAPTURE_RESULT, $data);
        $data['wrapper_top'] = $this->load->controller('common/wrapper_top')->render(CAPTURE_RESULT, $data);
        $data['wrapper_bottom'] = $this->load->controller('common/wrapper_bottom')->render(CAPTURE_RESULT, $data);

        // Render and stream
        $b = $this->load->view('account/setting', $data);
    }


    public function submit()
    {
        if ($this->validate()) {

            if ($this->model_user->updateUser($this->user['user_id'], $_POST)) {

                if ($file = $this->load->controller('tool/upload')->confirm('profile_image')) {

                    $this->db->query("UPDATE " . DB_PREFIX . "user SET profile_image = '" . $file['path'] . '/' . $file['name'] . "' WHERE user_id = " . $this->user['user_id']);
                }

                $_SESSION['success'] = $this->language['success'];
                $_SESSION['user_username'] = $_POST['phone'];

                echo json_encode(array(
                    'success' => true,
                    'redirect' => HTTP_SERVER
                ));

                return;
            }
        }

        if (empty($this->error)) {
            $this->error['server'] = array(
                'title' => $this->language['error_title'],
                'message' => $this->language['error']
            );
        }

        echo json_encode(array(
            'success' => false,
            'error' => $this->error
        ));
    }


    protected function validate()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {

            foreach (array('email', 'phone') as $required) {
                if (empty($_POST[$required])) {
                    $this->error[$required] = array(
                        'title' => $this->language['error_empty_title'],
                        'message' => $this->language['error_empty']
                    );
                    return false;
                }
            }

            if (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {

                $this->error['email'] = array(
                    'title' => $this->language['error_email_title'],
                    'message' => $this->language['error_email']
                );
                return false;
            }
            if (!empty($_POST['password'])) {
                if (empty($_POST['old_password']) || md5($_POST['old_password']) !== $this->user['password']) {

                    $this->error['old_password'] = array(
                        'title' => $this->language['error_old_password_title'],
                        'message' => $this->language['error_old_password']
                    );
                    return false;
                }

                // TODO: check new password complexity
                // if ($_POST['password']) {}

                if ($_POST['password'] == $_POST['old_password']) {

                    $this->error['password'] = array(
                        'title' => $this->language['error_same_password_title'],
                        'message' => $this->language['error_same_password']
                    );
                    return false;
                }
            }
            if (empty($_POST['terms'])) {
                    $this->error['terms'] = array(
                        'title' => $this->language['error_terms_title'],
                        'message' => $this->language['error_terms']
                    );
                return false;
            }
            return true;
        }
        return false;
    }


    public function language($locale = 'en-gb', $return = false)
    {

        if (!empty($_GET['language'])) {
            $locale = $_GET['language'];
        }

        if ($language = $this->model_localization_language->getLanguageByCode($locale)) {

            $language_id = $language['language_id'];
            $this->model_user->updateUserLanguage($this->user['user_id'], $language_id);


            if (isset($_GET['redirect'])) $this->redirect($_GET['redirect']);
            $json = json_encode(array('success' => true));
            if ($return) return $json;
            exit($json);
        }

        if (isset($_GET['redirect'])) $this->redirect($_GET['redirect']);
        $json = json_encode(array('success' => false));
        if ($return) return $json;
        exit($json);
    }
}
