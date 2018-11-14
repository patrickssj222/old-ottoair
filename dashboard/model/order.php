<?php

class ModelOrder extends Model {

    public function listOrdersByUserId($user_id) {
        return $this->db->query("SELECT *, total-payment AS balance FROM " .DB_PREFIX. "order WHERE user_id = '" . (int)$user_id . "'")->rows;
    }

    public function getOrder($order_id) {
        return $this->db->query("SELECT *, total-payment AS balance FROM " .DB_PREFIX. "order WHERE order_id = '" . (int)$order_id . "'")->row;
    }

    public function getOrderItems($order_id) {
        return $this->db->query("SELECT * FROM " .DB_PREFIX. "order_item WHERE order_id = '" . (int)$order_id . "'")->rows;
    }

    public function getTotalOrdersByUserId($user_id) {
        if ($r = $this->db->query("SELECT COUNT(*) AS count FROM " .DB_PREFIX. "order WHERE user_id = '" . (int)$user_id . "'")->row) {
            return $r['count'];
        }
        return 0;
    }

    public function getOrderTrackings($order_id) {
        return $this->db->query("SELECT * FROM " .DB_PREFIX. "order_tracking WHERE order_id='" . (int)$order_id . "' ORDER BY date_added DESC")->rows;
    }


    public function createOrder($data, $return = false) {
        $error = '';

        if ($this->db->query("INSERT INTO " .DB_PREFIX. "order SET
            receiver_name = '" . $this->db->escape($data['receiver_fname']) . ' ' . $this->db->escape($data['receiver_lname']) . "',
            receiver_phone = '" . $this->db->escape($data['receiver_phone']) . "',
            receiver_address = '" . $this->db->escape($data['receiver_address']) . "',
            receiver_province = '" . $this->db->escape($data['receiver_province']) . "',
            receiver_city = '" . $this->db->escape($data['receiver_city']) . "',
            receiver_postal = '" . $this->db->escape($data['receiver_postal']) . "',
            payment=0,
            user_id = '" . (int)$data['user_id'] . "',
            date_added=NOW(),
            date_modified=NOW()")) {

            $order_id = $this->db->last_insert_id();

            // Save items
            $total = 0;
            foreach ($data['item'] as $item) {
                if (isset($item['item_url'])) {
                  $url = $this->db->escape($item['item_url']);
                } else $url = '';
                if (!$this->db->query("INSERT INTO " .DB_PREFIX. "order_item SET
                    order_id= $order_id,
                    item_name = '" . $this->db->escape($item['item_name']) . "',
                    item_url = '" . $url . "',
                    item_description = '" . $this->db->escape($item['item_description']) . "',
                    item_quantity = '" . (float)$item['item_quantity'] . "',
                    item_value='" . (float)$item['item_value'] . "',
                    date_added=NOW(),
                    date_modified=NOW()")) {
                    $error = $this->language['error_server'];
                }
                $total += (float)$item['item_quantity'] * (float)$item['item_value'];
            }

            $ref = $this->generateOrderReferenceNumber($order_id);

            $this->db->query("UPDATE " .DB_PREFIX. "order SET reference = '" . $ref . "',
                total = '" . $total . "',
                tax = '" . $total * 0.13 . "',
                total_with_tax = '" . $total * 1.13 . "'
                WHERE order_id = $order_id");

            // Default status = pending
            $this->db->query("INSERT INTO " .DB_PREFIX. "order_tracking SET order_id= $order_id, description = '" . $this->language['status_pending'] . "', date_added=NOW()");
        } else {
            $error = $this->language['error_server'];
        }

        if (empty($error)) {
            $json = array('success' => true, 'message' => $this->language['success_create'], 'reference_number' => $ref, 'order_id' => $order_id);
        } else {
            $json = array('success' => false, 'message' => $error);
        }

        if ($return)  return $json;
        else echo json_encode($json);
    }

    public function generateOrderReferenceNumber($order_id) {
        return 'OT' . str_pad(mt_rand(0, 999999), 6, '0') . '-' . str_pad(9999-(int)$order_id, 4, '0') . 'OD';
    }

    public function orderPayment($order_id, $amount) {
        $this->db->query("UPDATE " .DB_PREFIX. "order SET payment = '" . (float)$amount . "' WHERE order_id = ".$order_id);
    }

    public function getStore() {
        return $this->db->query("SELECT * FROM ".DB_PREFIX."store LIMIT 10")->rows;
    }

    public function getItem($item_id) {
        return $this->db->query("SELECT * FROM ".DB_PREFIX."store WHERE item_id=" . $item_id)->row;
    }

    public function paymentSuccess($order_id) {
        $data = $this->db->query("SELECT * FROM ".DB_PREFIX."order WHERE order_id=" . $order_id)->row;
        $this->db->query("UPDATE " .DB_PREFIX. "order SET payment = '" . (float)$data['total_with_tax'] . "' WHERE order_id = ".$order_id);
    }
}
