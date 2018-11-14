<?php
class ControllerCommonWrapperTop extends DashboardController {
    // Autoload
    public function __construct($registry) {
        parent::__construct();

        $this->load->model('localization/language');
    }

    public function render($return = false, $data = array()) {

        $data['text_user'] = $this->user['firstname'];
        $data['text_user_id'] = $this->user['user_id'];
        $data['user_language'] = $this->user['language_code'];
        $data['text_welcome_user'] = sprintf($this->language['text_welcome_user'], $this->user['firstname']);

        $data['image_profile'] = HTTP_SERVER . 'assets/img/profiles/default.jpg';
        $this->load->library('file_manager');

        if ($file = $this->library_file_manager->validate($this->user['profile_image'])) {
            $data['image_profile'] = HTTP_SERVER . $file['filename'] . '?' . filemtime(DIR_UPLOAD .$file['mask']);
        }

        $data['url_setting'] = HTTP_SERVER . 'account/setting';
        $data['url_language'] = HTTP_SERVER . 'account/setting/language';
        $data['url_logout'] = HTTP_SERVER . 'account/logout';

        $data['languages'] = $this->model_localization_language->listLanguages();

        // Render
        if ($return)  return $this->load->view('common/wrapper_top', $data, CAPTURE_RESULT);
        else $this->load->view('common/wrapper_top', $data);
    }
}
