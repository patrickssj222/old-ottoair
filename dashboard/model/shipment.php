<?php

class ModelShipment extends Model {

    public function listShipmentsByUserId($user_id) {
        return $this->db->query("SELECT s.*, SUM(item_count) AS item_count, SUM(item_weight) AS total_weight,
                SUM(item_price * item_count) AS total_value, SUM(total_price) AS total_price
                FROM " .DB_PREFIX. "shipment s NATURAL JOIN " .DB_PREFIX. "shipment_item
                WHERE user_id = '" . (int)$user_id . "' GROUP BY shipment_id")->rows;
    }

    public function getShipment($shipment_id) {
        return $this->db->query("SELECT s.*, SUM(item_count) AS item_count, SUM(item_weight) AS total_weight,
                SUM(item_price * item_count) AS total_value, SUM(total_price) AS total_price
                FROM " .DB_PREFIX. "shipment s NATURAL JOIN " .DB_PREFIX. "shipment_item
                WHERE shipment_id = '" . (int)$shipment_id . "' GROUP BY shipment_id")->row;
    }

    public function getTotalShipmentsByUserId($user_id) {
        if ($r = $this->db->query("SELECT COUNT(*) AS count FROM " .DB_PREFIX. "shipment WHERE user_id = '" . (int)$user_id . "'")->row) {
            return $r['count'];
        }
        return 0;
    }

    public function getShipmentItems($shipment_id) {
        return $this->db->query("SELECT * FROM " .DB_PREFIX. "shipment_item WHERE shipment_id='" . (int)$shipment_id . "'")->rows;
    }

    public function getShipmentTrackings($shipment_id) {
        return $this->db->query("SELECT * FROM " .DB_PREFIX. "shipment_tracking WHERE shipment_id='" . (int)$shipment_id . "' ORDER BY date_added DESC")->rows;
    }


    public function createShipment($data, $return = false) {
        $error = '';

        if ($this->db->query("INSERT INTO " .DB_PREFIX. "shipment SET
            user_id = '".(int)$data['user_id']."',
            sender_name = '" . $this->db->escape($data['sender_name']) . "',
            sender_phone = '" . $this->db->escape($data['sender_phone']) . "',
            sender_wx = '" . $this->db->escape($data['sender_wx']) . "',
            sender_email = '" . $this->db->escape($data['sender_email']) . "',
            sender_province = '" . $this->db->escape($data['sender_province']) . "',
            sender_city = '" . $this->db->escape($data['sender_city']) . "',
            sender_address = '" . $this->db->escape($data['sender_address']) . "',
            sender_postal = '" . $this->db->escape($data['sender_postal']) . "',
            receiver_province = '" . $this->db->escape($data['receiver_province']) . "',
            receiver_city = '" . $this->db->escape($data['receiver_city']) . "',
            receiver_address = '" . $this->db->escape($data['receiver_address']) . "',
            receiver_postal = '" . $this->db->escape($data['receiver_postal']) . "',
            receiver_name = '" . $this->db->escape($data['receiver_name']) . "',
            receiver_phone = '" . $this->db->escape($data['receiver_phone']) . "',
            payment = 0,
            date_added=NOW(),
            date_modified=NOW()")) {

            $shipment_id = $this->db->last_insert_id();

            $ref = $this->generateShipmentReferenceNumber($shipment_id);

            $this->db->query("UPDATE " .DB_PREFIX. "shipment SET reference = '" . $ref . "' WHERE shipment_id = " . $shipment_id);

            // print_r($data['items']);
            foreach ($data['items'] as $item) {
                // call api
                $length = (float) $item['item_length'];
                $width = (float) $item['item_width'];
                $height = (float) $item['item_height'];

                if ($length < 1) $length = 1;
                if ($width < 1) $width = 1;
                if ($height < 1) $height = 1;

                $body = array(
                    'item'         =>     $this->db->escape($item['item_name']),
                    'level'        =>     (int)$item['item_level'],
                    'size'         =>     $length * $width * $height,
                    'weight'       =>     (float)$item['item_weight'],
                    'count'        =>     (float)$item['item_count'],
                    'price'        =>     (float)$item['item_price']
                );
                //curl call
                $host = "https://data.ottoair.ca/dev.php/api/beta/price";
                $process = curl_init($host);
                curl_setopt($process, CURLOPT_HTTPHEADER, array(
                    'Content-Type: application/json',
                    'Accept: application/json',
                    'token: Q83ZJ4T6PQ4S1G09IEOXLQM9LM974LLS6K8NOPA6XJQ9J4XBS0AEF00GHTPX5TRP'
                    ));
                curl_setopt($process, CURLOPT_POSTFIELDS, json_encode($body));
                curl_setopt($process, CURLOPT_TIMEOUT, 30);
                curl_setopt($process, CURLOPT_RETURNTRANSFER, true);
                $result = curl_exec($process);
                curl_close($process);
                $item_price = (float) json_decode($result)->data;

                if (!$this->db->query("INSERT INTO " .DB_PREFIX. "shipment_item SET
                    shipment_id = '" . $shipment_id . "',
                    item_name = '" . $this->db->escape($item['item_name']) . "',
                    item_count = '" . (float)$item['item_count'] . "',
                    item_weight = '" . (float)$item['item_weight'] . "',
                    item_length = '" . $length . "',
                    item_width = '" . $width . "',
                    item_height = '" . $height . "',
                    item_price = '" . (float)$item['item_price'] . "',
                    total_price = '" . $item_price . "'")) {
                    $error = $this->language['error_server'];
                }
            }

            // insert saved addresses
            $this->db->query("INSERT INTO " .DB_PREFIX. "addresses SET
                customer_id = '" . (int)$data['user_id'] . "',
                name = '" . $this->db->escape($data['sender_name']) . "',
                phone = '" . $this->db->escape($data['sender_phone']) . "',
                province = '" . $this->db->escape($data['sender_province']) . "',
                city = '" . $this->db->escape($data['sender_city']) . "',
                address = '" . $this->db->escape($data['sender_address']) . "',
                postal_code = '" . $this->db->escape($data['sender_postal']) . "',
                type = 1");

            $this->db->query("INSERT INTO " .DB_PREFIX. "addresses SET
                customer_id = '" . (int)$data['user_id'] . "',
                name = '" . $this->db->escape($data['receiver_name']) . "',
                phone = '" . $this->db->escape($data['receiver_phone']) . "',
                province = '" . $this->db->escape($data['receiver_province']) . "',
                city = '" . $this->db->escape($data['receiver_city']) . "',
                address = '" . $this->db->escape($data['receiver_address']) . "',
                postal_code = '" . $this->db->escape($data['receiver_postal']) . "',
                type = 2");

            // Default status = pending
            $this->db->query("INSERT INTO " .DB_PREFIX. "shipment_tracking SET shipment_id= $shipment_id, description = '" . $this->language['status_pending'] . "', date_added=NOW()");

        } else {
            $error = $this->language['error_server'];
        }

        if (empty($error)) {
            $json = array('success' => true, 'message' => $this->language['success_create'], 'reference_number' => $ref, 'shipment_id' => $shipment_id);
        } else {
            $json = array('success' => false, 'message' => $error);
        }

        if ($return)  return $json;
        else echo json_encode($json);
    }

    public function generateShipmentReferenceNumber($shipment_id) {
        return 'OT' . str_pad(mt_rand(0, 999999), 6, '0') . '-' . str_pad(9999-(int)$shipment_id, 4, '0') . 'REF';
    }

    public function shipmentPayment($shipment_id, $amount) {
        $this->db->query("UPDATE " .DB_PREFIX. "shipment SET payment = '" . (float)$amount . "' WHERE shipment_id = " . $shipment_id);
    }

    public function getPD($shipment_id) {
        return $this->db->query("SELECT pdSelect, region FROM " .DB_PREFIX. "shipment WHERE shipment_id = " . $shipment_id)->row;
    }

    public function updatePD($shipment_id, $data) {
      // UPDATE ot_shipment SET pdselect="test", region="test" WHERE shipment_id = 43
        return $this->db->query("UPDATE " .DB_PREFIX. "shipment SET
            pdselect = '" . $this->db->escape($data['pd-select']) . "',
            region = '" . $this->db->escape($data['pd-region']) . "'
            WHERE shipment_id = " . $shipment_id);
    }
}
