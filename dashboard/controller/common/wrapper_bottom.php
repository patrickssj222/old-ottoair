<?php
class ControllerCommonWrapperBottom extends DashboardController {
    // Autoload
    public function __construct($registry) {
        parent::__construct();
        // Load common language
        $this->load->language();
    }

    public function render($return = false, $data = array()) {
        $data['url_terms'] = HTTP_SERVER . 'terms';
        $data['url_privacy'] = HTTP_SERVER . 'privacy';
        // Render
        if ($return)  return $this->load->view('common/wrapper_bottom', $data, CAPTURE_RESULT);
        else $this->load->view('common/wrapper_bottom', $data);
    }
}
