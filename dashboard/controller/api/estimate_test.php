<?php
/**
 * Jack 2018-09-28
 */
class ControllerApiEstimateTest extends Controller {
    
    public function index()
    {
        $locale     = 'CA';
        $currency   = 'CAD';
        $language   = 'en';        
        // $departure  = htmlspecialchars($_POST["depLoc"]);
        // $arrival    = htmlspecialchars($_POST["arriLoc"]);
        // $dep_date   = htmlspecialchars($_POST["depDate"]);
        // $arri_date  = htmlspecialchars($_POST["arriDate"]);
        $departure = '0';
        $arrival = '4';
        $dep_date = '2018-10-15';
        $arri_date = '2018-10-19';

        if ($row = $this->db->query("SELECT * FROM " . DB_PREFIX . "airport WHERE airport_id = '" .
            $this->db->escape($departure) . "'")->row) {
            $departure = $row['code'];
        }

        if ($row = $this->db->query("SELECT * FROM " . DB_PREFIX . "airport WHERE airport_id = '" .
            $this->db->escape($arrival) . "'")->row) {
            $arrival = $row['code'];
        }

        $ch = curl_init("https://skyscanner-skyscanner-flight-search-v1.p.mashape.com/apiservices/browseroutes/v1.0/$locale/$currency/$language-$locale/$departure-sky/$arrival-sky/$dep_date/$arri_date");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            "X-Mashape-Key: iz8QPVlWIlmshK3MEh3bO3FrQpyMp1iblNBjsn8XFWPL2CqQDX",
            "X-Mashape-Host: skyscanner-skyscanner-flight-search-v1.p.mashape.com",
            "Accept: application/json"
        ));
        $output = curl_exec($ch);
        curl_close($ch);

        $flights = json_decode($output, true);
        $estimates = array();

        // Cache place id
        $places = array();
        foreach ($flights['Places'] as $place) {
            $places[$place['PlaceId']] = $place;
        }

        // Cache Carrier id
        $carriers = array();
        foreach ($flights['Carriers'] as $carrier) {
            $carriers[$carrier['CarrierId']] = $carrier;
        }

        // Remove duplicated quotes (recursive)
        // $quotes = $this->quote_unique($flights['Quotes'], array());

        echo '<pre>';
        echo json_encode($flights['Quotes'], JSON_PRETTY_PRINT);
        echo '</pre>';
        exit;
        

        $quotes = array_slice($flights['Quotes'], 0, 10);

        

        foreach ($quotes as $quote) {

            $carrier_names = array();
            foreach($quote['OutboundLeg']['CarrierIds'] as $carrier_id) {
                $carrier_names[$carrier_id] = $carriers[$carrier_id]['Name'];
            }
            foreach($quote['InboundLeg']['CarrierIds'] as $carrier_id) {
                $carrier_names[$carrier_id] = $carriers[$carrier_id]['Name'];
            }

            $f = array(
                'city_from'     => $places[$quote['OutboundLeg']['OriginId']]['CityName'],
                'city_to'       => $places[$quote['OutboundLeg']['DestinationId']]['CityName'],
                'fly_from'      => $places[$quote['OutboundLeg']['OriginId']]['Name'],
                'fly_to'        => $places[$quote['OutboundLeg']['DestinationId']]['Name'],
                'code_from'     => $places[$quote['OutboundLeg']['OriginId']]['IataCode'],
                'code_to'       => $places[$quote['OutboundLeg']['DestinationId']]['IataCode'],
                'fly_duration'  => '',
                'airlines'      => $carrier_names,
                'price'         => $quote['MinPrice'],
                'thumb'         => array(),
                'id'            => $quote['QuoteId'],
                'from_dTime'    => date('Y-m-d', strtotime($quote['OutboundLeg']['DepartureDate'])),
                'from_aTime'    => '',
                'back_dTime'    => date('Y-m-d', strtotime($quote['InboundLeg']['DepartureDate'])),
                'back_aTime'    => ''
            );


            foreach ($f['airlines'] as $carrier_id => $carrier) {
                $filename = 'assets/images/airlines/' . strtolower($carrier_id) . '.png';
                // if (file_exists(DIR_APPLICATION . '../' . $filename)) {
                    $f['thumb'][] = HTTP_FRONT . $filename;
                // }
            }

            $estimates[$quote['QuoteId']] = $f;
        }

        // echo '<pre>';
        // echo json_encode($estimates, JSON_PRETTY_PRINT);
        // echo '</pre>';
        // exit;

        $_SESSION['estimates'] = $estimates;

        echo json_encode(array_values($estimates));
    }

    public function select($id)
    {
        if (isset($_SESSION['estimates'][$id])) {

            $departure = $arrival = '';
            if ($row = $this->db->query("SELECT * FROM " . DB_PREFIX . "airport WHERE code LIKE '" .
                $this->db->escape($_SESSION['estimates'][$id]['code_from']) . "'")->row) {
                $departure = $row['airport_id'];
            }

            if ($row = $this->db->query("SELECT * FROM " . DB_PREFIX . "airport WHERE code LIKE '" .
                $this->db->escape($_SESSION['estimates'][$id]['code_to']) . "'")->row) {
                $arrival = $row['airport_id'];
            }

            $_SESSION['post']['flight'] = array(
                'departure'     => $departure,
                'date_departure'=> date('Y-m-d', strtotime($_SESSION['estimates'][$id]['from_dTime'])),
                'arrival'       => $arrival,
                'date_arrival'  => date('Y-m-d', strtotime($_SESSION['estimates'][$id]['back_dTime'])),
                'estimate'      => $_SESSION['estimates'][$id]['price'],
                'raw'           => $_SESSION['estimates'][$id]
            );

            $this->redirect(HTTP_SERVER . 'flight/form/buy');
        }
    }

    // At first I thought the quotes were duplicated. But they are not actually
    // protected function quote_unique($quotes, $return)
    // {
    //     if (empty($quotes)) {
    //         return $return;
    //     }
    //     $first = $first_bak = array_shift($quotes);
    //     foreach ($quotes as $quote) {
    //         unset($first['QuoteId']);
    //         unset($first['QuoteDateTime']);
    //         unset($quote['QuoteId']);
    //         unset($quote['QuoteDateTime']);
    //         if ($first == $quote) {
    //             return $this->quote_unique($quotes, $return);
    //         }
    //     }
    //     $return[] = $first_bak;
    //     return $this->quote_unique($quotes, $return);
    // }

    public function index_kiwi()
    {
        $departure = htmlspecialchars($_POST["depLoc"]);
        $arrival = htmlspecialchars($_POST["arriLoc"]);
        $depDate = htmlspecialchars($_POST["depDate"]);
        $arriDate = htmlspecialchars($_POST["arriDate"]);
        $apiBase = 'https://api.skypicker.com/flights?';
        // $departure = 'YYZ';
        // $arrival = 'PEK';
        // $depDate = '2018-09-28';
        // $arriDate = '2018-09-29';

        if ($row = $this->db->query("SELECT * FROM " . DB_PREFIX . "airport WHERE airport_id = '" .
            $this->db->escape($departure) . "'")->row) {
            $departure = $row['code'];
        }

        if ($row = $this->db->query("SELECT * FROM " . DB_PREFIX . "airport WHERE airport_id = '" .
            $this->db->escape($arrival) . "'")->row) {
            $arrival = $row['code'];
        }

        $apiCall = array(
            'flyFrom'         =>    $departure,
            'to'              =>    $arrival,
            'limit'           =>    20,
            'dateFrom'        =>    date('d/m/Y', strtotime($depDate)),
            'dateTo'          =>    date('d/m/Y', strtotime($depDate)),
            'returnFrom'      =>    date('d/m/Y', strtotime($arriDate)),
            'returnTo'        =>    date('d/m/Y', strtotime($arriDate)),
            'curr'            =>    'CAD',
            'directFlights'   =>    '1',
            'typeFlight'      =>    'round'
        );

        $ch = curl_init($apiBase . http_build_query($apiCall));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array( 'Accept: application/json' ));
        $output = curl_exec($ch);
        curl_close($ch);

        $flights = json_decode($output, true)['data'];
        $estimates = array();

        foreach ($flights as $flight) {

            if (!$this->db->query("SELECT * FROM " . DB_PREFIX . "airport WHERE code LIKE '" .
                $this->db->escape($flight['flyFrom']) . "'")->row ||
                !$this->db->query("SELECT * FROM " . DB_PREFIX . "airport WHERE code LIKE '" .
                $this->db->escape($flight['flyTo']) . "'")->row) {
                continue;
            }

            $f = array(
                'city_from'     => $flight['cityFrom'],
                'city_to'       => $flight['cityTo'],
                'fly_from'      => $flight['flyFrom'],
                'fly_to'        => $flight['flyTo'],
                'fly_duration'  => $flight['fly_duration'],
                'airlines'      => $flight['airlines'],
                'price'         => $flight['price'],
                'thumb'         => array(),
                'id'            => $flight['id']

            );

            if (isset($flight['route'][0])) {
                $f['from_dTime'] = date('Y-m-d h:i a', $flight['route'][0]['dTime']);
                $f['from_aTime'] = date('Y-m-d h:i a', $flight['route'][0]['aTime']);
            }

            if (isset($flight['route'][1])) {
                $f['back_dTime'] = date('Y-m-d h:i a', $flight['route'][1]['dTime']);
                $f['back_aTime'] = date('Y-m-d h:i a', $flight['route'][1]['aTime']);
            }

            foreach ($flight['airlines'] as $airline) {
                $filename = 'assets/images/airlines/' . strtolower($airline) . '.png';
                // if (file_exists(DIR_APPLICATION . '../' . $filename)) {
                    $f['thumb'][] = HTTP_FRONT . $filename;
                // }
            }

            $estimates[$flight['id']] = $f;
        }

        // echo '<pre>';
        // echo json_encode($estimates, JSON_PRETTY_PRINT);
        // echo '</pre>';

        $_SESSION['estimates'] = $estimates;

        echo json_encode(array_values($estimates));
    }

    public function select_kiwi($id)
    {
        if (isset($_SESSION['estimates'][$id])) {

            $departure = $arrival = '';
            if ($row = $this->db->query("SELECT * FROM " . DB_PREFIX . "airport WHERE code LIKE '" .
                $this->db->escape($_SESSION['estimates'][$id]['fly_from']) . "'")->row) {
                $departure = $row['airport_id'];
            }

            if ($row = $this->db->query("SELECT * FROM " . DB_PREFIX . "airport WHERE code LIKE '" .
                $this->db->escape($_SESSION['estimates'][$id]['fly_to']) . "'")->row) {
                $arrival = $row['airport_id'];
            }

            $_SESSION['post']['flight'] = array(
                'departure'     => $departure,
                'date_departure'=> date('Y-m-d', strtotime($_SESSION['estimates'][$id]['from_dTime'])),
                'arrival'       => $arrival,
                'date_arrival'  => date('Y-m-d', strtotime($_SESSION['estimates'][$id]['back_dTime'])),
                'estimate'      => $_SESSION['estimates'][$id]['price'],
                'raw'           => $_SESSION['estimates'][$id]
            );

            $this->redirect(HTTP_SERVER . 'flight/form/buy');
        }
    }
}