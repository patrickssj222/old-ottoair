<?php

class ModelAirport extends Model {

    public function getAirport($airport_id) {
        return $this->db->query("SELECT a.*, ad.name, c.code AS country_code, cd.name AS country_name FROM " .DB_PREFIX. "airport a JOIN " .DB_PREFIX. "airport_description ad ON a.airport_id = ad.airport_id JOIN " .DB_PREFIX. "country c ON a.country_id = c.country_id JOIN " .DB_PREFIX. "country_description cd ON c.country_id = cd.country_id WHERE a.airport_id = '" . (int)$airport_id . "' AND ad.language_id = " . (int)$_SESSION['user_language_id'] . " AND ad.language_id = cd.language_id")->row;
    }

    public function getAirportByCode($code) {
        return $this->db->query("SELECT a.*, ad.name, c.code AS country_code, cd.name AS country_name FROM " .DB_PREFIX. "airport a JOIN " .DB_PREFIX. "airport_description ad ON a.airport_id = ad.airport_id JOIN " .DB_PREFIX. "country c ON a.country_id = c.country_id JOIN " .DB_PREFIX. "country_description cd ON c.country_id = cd.country_id WHERE a.code = '" . $this->db->escape($code) . "' AND ad.language_id = " . (int)$_SESSION['user_language_id'] . " AND ad.language_id = cd.language_id")->row;
    }

    public function listAirportsByCountryId($country_id) {
        return $this->db->query("SELECT a.*, ad.name, c.code AS country_code, cd.name AS country_name FROM " .DB_PREFIX. "airport a JOIN " .DB_PREFIX. "airport_description ad ON a.airport_id = ad.airport_id JOIN " .DB_PREFIX. "country c ON a.country_id = c.country_id JOIN " .DB_PREFIX. "country_description cd ON c.country_id = cd.country_id WHERE c.country_id = '" . (int)$country_id . "' AND ad.language_id = " . (int)$_SESSION['user_language_id'] . " AND ad.language_id = cd.language_id")->rows;
    }
}