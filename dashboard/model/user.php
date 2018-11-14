<?php

class ModelUser extends Model {
    public function getUserByCredentials($username, $password) {
        return $this->db->query("SELECT u.*, l.code AS language_code, l.name AS language_name FROM " .DB_PREFIX. "user u JOIN " .DB_PREFIX. "language l ON u.language_id = l.language_id WHERE (phone = '" . $this->db->escape($username) . "' OR email LIKE '" . $this->db->escape($username) . "') AND password= '" . $this->db->escape(md5($password)) . "' AND status = 1")->row;
    }
    public function getUserByUsername($username) {
        return $this->db->query("SELECT u.*, l.code AS language_code, l.name AS language_name FROM " .DB_PREFIX. "user u JOIN " .DB_PREFIX. "language l ON u.language_id = l.language_id WHERE phone = '" . $this->db->escape($username) . "' AND status = 1")->row;
    }

    public function getUserByEmail($email) {
        return $this->db->query("SELECT u.*, l.code AS language_code, l.name AS language_name FROM " .DB_PREFIX. "user u JOIN " .DB_PREFIX. "language l ON u.language_id = l.language_id WHERE email = '" . $this->db->escape($email) . "' AND status = 1")->row;
    }

    public function getUserByToken($token) {
        return $this->db->query("SELECT u.*, l.code AS language_code, l.name AS language_name FROM " .DB_PREFIX. "user u JOIN " .DB_PREFIX. "language l ON u.language_id = l.language_id WHERE token = '" . $this->db->escape($token) . "' AND status = 1")->row;
    }

    public function getUser($user_id) {
        return $this->db->query("SELECT u.*, l.code AS language_code, l.name AS language_name FROM " .DB_PREFIX. "user u JOIN " .DB_PREFIX. "language l ON u.language_id = l.language_id WHERE user_id = '" . (int)$user_id . "' AND status = 1")->row;
    }

    public function createUser($data) {
        return $this->db->query("INSERT INTO " .DB_PREFIX. "user SET
            phone = '" . $this->db->escape($data['phone']) . "',
            password = '" . md5($data['password']) . "',
            language_id = '" . (int)(isset($data['language_id'])?$data['language_id']:1) . "',
            firstname = '" . $this->db->escape($data['firstname']) . "',
            lastname = '" . $this->db->escape($data['lastname']) . "',
            email = '" . $this->db->escape($data['email']) . "',
            region = '" . $this->db->escape($data['region']) . "',
            wechat = '" . $this->db->escape($data['wechat']) . "',
            date_added = NOW()");
    }

    public function updateUser($user_id, $data) {
        return $this->db->query("UPDATE " .DB_PREFIX. "user SET
                phone = '" . $this->db->escape($data['phone']) . "'," . 
                (!empty($data['password']) ? "password = '" . md5($data['password']) . "',":"" ) . "
                language_id = '" . (int)(isset($data['language_id'])?$data['language_id']:1) . "',
                firstname = '" . $this->db->escape($data['firstname']) . "',
                lastname = '" . $this->db->escape($data['lastname']) . "',
                email = '" . $this->db->escape($data['email']) . "',
                wechat = '" . $this->db->escape($data['wechat']) . "'
            WHERE user_id = '" . (int)$user_id . "'");
    }

    public function updateUserLanguage($user_id, $language_id) {
        return $this->db->query("UPDATE " .DB_PREFIX. "user SET language_id = '" . (int)$language_id . "' WHERE user_id = '" . (int)$user_id . "'");
    }

    public function updateUserToken($user_id, $token) {
        return $this->db->query("UPDATE " .DB_PREFIX. "user SET token = '" . $this->db->escape($token) . "' WHERE user_id = '" . (int)$user_id . "'");
    }

    public function updateUserStatus($user_id, $status) {
        return $this->db->query("UPDATE " .DB_PREFIX. "user SET status = '" . (int)$status . "' WHERE user_id = '" . (int)$user_id . "'");
    }

    public function deleteUserToken($user_id) {
        return $this->db->query("UPDATE " .DB_PREFIX. "user SET token = '' WHERE user_id = '" . (int)$user_id . "'");
    }

    public function deleteUser($user_id) {
        return $this->db->query("DELETE FROM " .DB_PREFIX. "user WHERE user_id = '" . (int)$user_id . "'");
    }

    public function getUserAddress($user_id) {
        return $this->db->query("SELECT a.*, l.code AS language_code, l.name AS language_name FROM " .DB_PREFIX. "user u JOIN " .DB_PREFIX. "language l JOIN " .DB_PREFIX. "addresses a ON u.language_id = l.language_id AND u.user_id = a.customer_id WHERE u.user_id = '" .  (int) $user_id . "' AND status = 1")->rows;
    }
}
