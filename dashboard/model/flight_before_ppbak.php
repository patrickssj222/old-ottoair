<?php

class ModelFlight extends Model 
{

    public function listFlightsByUserId($user_id) 
    {
        return $this->db->query("SELECT f.*, a.code AS departure_code, ad.name AS departure_name, b.code AS arrival_code, bd.name AS arrival_name FROM " .DB_PREFIX. "flight f JOIN " . DB_PREFIX . "airport a ON f.departure = a.airport_id JOIN " . DB_PREFIX . "airport_description ad ON a.airport_id = ad.airport_id JOIN " . DB_PREFIX . "airport b ON f.arrival = b.airport_id JOIN " . DB_PREFIX . "airport_description bd ON b.airport_id = bd.airport_id WHERE user_id = '" . $this->db->escape($user_id) . "' AND ad.language_id = " . $_SESSION['user_language_id'] . " AND bd.language_id = " . $_SESSION['user_language_id'] . " ORDER BY date_added DESC")->rows;
    }

    
    public function getFlight($flight_id) 
    {
        return $this->db->query("SELECT f.*, a.code AS departure_code, ad.name AS departure_name, b.code AS arrival_code, bd.name AS arrival_name FROM " .DB_PREFIX. "flight f JOIN " . DB_PREFIX . "airport a ON f.departure = a.airport_id JOIN " . DB_PREFIX . "airport_description ad ON a.airport_id = ad.airport_id JOIN " . DB_PREFIX . "airport b ON f.arrival = b.airport_id JOIN " . DB_PREFIX . "airport_description bd ON b.airport_id = bd.airport_id WHERE flight_id = '" . $this->db->escape($flight_id) . "' AND ad.language_id = " . $_SESSION['user_language_id'] . " AND bd.language_id = " . $_SESSION['user_language_id'])->row;
    }

    
    public function getTotalFlightsByUserId($user_id) 
    {
        if ($r = $this->db->query("SELECT COUNT(*) AS count FROM " .DB_PREFIX. "flight WHERE user_id = '" . $this->db->escape($user_id) . "'")->row) {
            return $r['count'];
        }
        return 0;
    }

    
    public function getFlightStatuses($flight_id) 
    {
        return $this->db->query("SELECT * FROM " .DB_PREFIX. "flight_status WHERE flight_id='" . $this->db->escape($flight_id) . "' ORDER BY date_added DESC")->rows;
    }

    
    public function addFlight($data, $source='ot-to', $return = false) 
    {
        $error = '';

        if ($this->db->query("INSERT INTO " .DB_PREFIX. "flight SET " .
            (!empty($data['flight_number']) ? "flight_number='" .
                $this->db->escape($data['flight_number']) . "'," : "") . "
            departure = '" . (int)$data['departure'] . "',
            date_departure = '" . $this->db->escape($data['date_departure']) . "',
            arrival = '" . (int)$data['arrival'] . "',
            date_arrival = '" . $this->db->escape($data['date_arrival']) . "',
            price = '" . (float)$data['price'] . "',
            full_price = '" . (float)$data['full_price'] . "',
            source = '" . $this->db->escape($source) . "',
            luggage = '" . (float)$data['luggage'] . "',
            name = '" . $this->db->escape($data['name']) . "',
            passport = '" . $this->db->escape($data['passport']) . "',
            user_id = '" . (int)$data['user_id'] . "',
            date_added = NOW()")) {

            $flight_id = $this->db->last_insert_id();

            $ref = $this->generateFlightReferenceNumber($flight_id);

            $this->db->query("UPDATE " .DB_PREFIX. "flight SET reference = '" . $ref . "' WHERE flight_id = ".$flight_id);
        } else {
            $error = $this->language['error_server'];
        }

        if (empty($error)) {
            $json = array('success' => true, 'message' => $this->language['success_create'], 'reference_number' => $ref, 'flight_id' => $flight_id);
        } else {
            $json = array('success' => false, 'message' => $error);
        }

        if ($return)  return $json;
        else echo json_encode($json);
    }

    
    public function setImages($flight_id, $identification_image, $ticket_image = '') 
    {
        return $this->db->query("UPDATE " .DB_PREFIX. "flight SET identification_image = '" . $this->db->escape($identification_image) . "', ticket_image = '" . $this->db->escape($ticket_image) . "' WHERE flight_id = " . (int)$flight_id);
    }

    
    public function addFlightStatus($flight_id, $description = '') 
    {
        if (!empty($description)) {
            $this->db->query("INSERT INTO " .DB_PREFIX. "flight_status SET flight_id = " . (int)$flight_id . ", description = '" . $this->db->escape($description) . "', date_added=NOW()");
        }
    }

    
    public function generateFlightReferenceNumber($flight_id) 
    {
        return 'TK' . str_pad(mt_rand(0, 999999), 6, '0') . '-' . str_pad(9999-(int)$flight_id, 4, '0') . 'REF';
    }

    
    public function flightPayment($flight_id, $amount) 
    {
        $this->db->query("UPDATE " .DB_PREFIX. "flight SET payment = '" . (float)$amount . "' WHERE flight_id = ".$flight_id);
    }
}
