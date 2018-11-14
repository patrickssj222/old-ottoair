<?php

class ModelLocalizationLanguage extends Model {

    public function getLanguage($language_id) {
        return $this->db->query("SELECT * FROM " .DB_PREFIX. "language WHERE language_id = " . (int)$language_id)->row;
    }

    public function getLanguageByCode($code) {
        return $this->db->query("SELECT * FROM " .DB_PREFIX. "language WHERE code = '" . $this->db->escape($code) . "'")->row;
    }

    public function listLanguages() {
        return $this->db->query("SELECT * FROM " .DB_PREFIX. "language")->rows;
    }
}