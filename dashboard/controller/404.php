<?php
class Controller404 extends DashboardController {

    // Autoload
    public function __construct($registry = array()) {
        parent::__construct($registry);
        // Load language
        $this->load->language('404');
    }

    public function index() {
        $data['breadcrumb'] = array(
            $this->language['text_dashboard'] =>  HTTP_SERVER,
            $this->language['heading_title'] =>  HTTP_SERVER . '404/',
        );

        $data['heading_title'] = $this->language['heading_title'];
        $data['page_name'] = $this->language['heading_title'];

        // Render but capture output
        $data['sidebar'] = $this->load->controller('common/sidebar')->render(CAPTURE_RESULT, $data);
        $data['wrapper_top'] = $this->load->controller('common/wrapper_top')->render(CAPTURE_RESULT, $data);
        $data['wrapper_bottom'] = $this->load->controller('common/wrapper_bottom')->render(CAPTURE_RESULT, $data);

        // Render and stream
        $b = $this->load->view('common/404', $data);
    }
}