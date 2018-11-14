<?php
class ControllerAccountLogout extends DashboardController {

    public function index() {
        // Delete session token
        $this->load->model('user');
        $this->model_user->deleteUserToken($this->user['user_id']);

        // Delete session
        session_destroy();

        // Unset cookie
        setcookie('OTTOAIR_SESSION_TOKEN', '', time()-3600, "/");

        $this->redirect(HTTP_FRONT);
    }
}