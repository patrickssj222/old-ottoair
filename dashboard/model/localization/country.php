<?php

class ModelLocalizationCountry extends Model {

    public function getCountry($country_id) {
        return $this->db->query("SELECT c.*, cd.name FROM " .DB_PREFIX. "country c JOIN " .DB_PREFIX. "country_description cd ON c.country_id = cd.country_id WHERE language_id = " . (int)$country_id . " AND cd.language_id = " . (int)$_SESSION['user_language_id'])->row;
    }

    public function listCountries() {
        return $this->db->query("SELECT c.*, cd.name FROM " .DB_PREFIX. "country c JOIN " .DB_PREFIX. "country_description cd ON c.country_id = cd.country_id WHERE cd.language_id = " . (int)$_SESSION['user_language_id'])->rows;
    }
}