<?php
class ControllerFlight extends DashboardController {

    // Autoload
    public function __construct($registry = array()) {
    	// Test data
    	// $_SERVER['REQUEST_METHOD'] = 'POST';
    	// $_POST['departure']	= '1';
    	// $_POST['date_departure']	= '2018-09-26';
    	// $_POST['arrival']	= '2';
    	// $_POST['date_arrival']	= '2018-09-27';
    	// $_POST['estimate']	= '1457';
        // $_POST['raw']        = '[]';

    	// Save posted data
    	session_start();

    	if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    		$_SESSION['post']['flight'] = $_POST;
    	}

        parent::__construct($registry);
        // Load model
        $this->load->model('flight');
        $this->load->model('airport');
        // Load language
        $this->load->language('flight');
    }

    public function index() {
        $this->get_list();
    }

    public function get_list() {
        $data['breadcrumb'] = array(
            $this->language['text_dashboard'] =>  HTTP_SERVER,
            $this->language['heading_title'] =>  HTTP_SERVER . 'flight/',
        );

        $data['heading_title'] = $this->language['heading_title'];
        $data['page_name'] = $this->language['heading_title'];

        $data['url_buy'] = HTTP_SERVER . 'flight/form/buy';
        $data['url_add'] = HTTP_SERVER . 'flight/form/add';

        $data['flights'] = array();
        foreach ($this->model_flight->listFlightsByUserId($this->user['user_id']) as $flight) {
            $flight['status'] = '';
            if ($status = $this->model_flight->getFlightStatuses($flight['flight_id'])) {
                $flight['status'] = $status[0]['description'];
            }
            if ($departure = $this->model_airport->getAirportByCode($flight['departure'])) {
                $flight['departure'] .= ' - ' . $departure['name'];
            }
            if ($arrival = $this->model_airport->getAirportByCode($flight['arrival'])) {
                $flight['arrival'] .= ' - ' . $arrival['name'];
            }
            $flight['url_detail'] = HTTP_SERVER . 'flight/detail/' . $flight['flight_id'];
            $flight['url_detail_pay'] = $flight['url_detail'] . '/pay';
            $data['flights'][] = $flight;
        }

        $data['head'] = '
            <link href="' . HTTP_SERVER . 'assets/plugins/jquery-datatable/media/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css" />
            <link href="' . HTTP_SERVER . 'assets/plugins/jquery-datatable/extensions/FixedColumns/css/dataTables.fixedColumns.min.css" rel="stylesheet" type="text/css" />
            <link href="' . HTTP_SERVER . 'assets/plugins/datatables-responsive/css/datatables.responsive.css" rel="stylesheet" type="text/css" media="screen" />
        ';

        $data['foot'] = '
            <script src="' . HTTP_SERVER . 'assets/plugins/jquery-datatable/media/js/jquery.dataTables.min.js" type="text/javascript"></script>
            <script src="' . HTTP_SERVER . 'assets/plugins/jquery-datatable/extensions/TableTools/js/dataTables.tableTools.min.js" type="text/javascript"></script>
            <script src="' . HTTP_SERVER . 'assets/plugins/jquery-datatable/media/js/dataTables.bootstrap.js" type="text/javascript"></script>
            <script src="' . HTTP_SERVER . 'assets/plugins/jquery-datatable/extensions/Bootstrap/jquery-datatable-bootstrap.js" type="text/javascript"></script>
            <script type="text/javascript" src="' . HTTP_SERVER . 'assets/plugins/datatables-responsive/js/datatables.responsive.js"></script>
            <script type="text/javascript" src="' . HTTP_SERVER . 'assets/plugins/datatables-responsive/js/lodash.min.js"></script>
            <script src="' . HTTP_SERVER . 'assets/js/tables.js" type="text/javascript"></script>
        ';

        // Render but capture output
        $data['sidebar'] = $this->load->controller('common/sidebar')->render(CAPTURE_RESULT, $data);
        $data['wrapper_top'] = $this->load->controller('common/wrapper_top')->render(CAPTURE_RESULT, $data);
        $data['wrapper_bottom'] = $this->load->controller('common/wrapper_bottom')->render(CAPTURE_RESULT, $data);

        // Render and stream
        $this->load->view('flight/list', $data);
    }

    // SEO router
    public function form($type='') {
        switch ($type) {
            case 'buy': return $this->get_form('buy');; break;
            case 'add': return $this->get_form('add');; break;
            default: $this->redirect(HTTP_SERVER . 'flight/form/buy');
        }
    }

    protected function get_form($mode='buy') {
        $data['breadcrumb'] = array(
            $this->language['text_dashboard'] =>  HTTP_SERVER,
            $this->language['heading_title'] =>  HTTP_SERVER . 'flight/',
            $this->language['heading_form_' . $mode] =>  HTTP_SERVER . 'flight/form/' . $mode,
        );

        $data['heading_title'] = $this->language['heading_form_' . $mode];
        $data['page_name'] = $this->language['heading_form_' . $mode];

        $data['url_flight_list']= HTTP_SERVER . 'flight';
        $data['url_submit']     = HTTP_SERVER . 'flight/submit_form/' . $mode;
        $data['url_estimate']   = HTTP_SERVER . 'flight/get_estimate';

        // Retrieve posted data
        if (!empty($_SESSION['post']['flight'])) {
        	$data['data'] = $_SESSION['post']['flight'];
        } else {
        	$data['data'] = array();
        }

        // Image upload x2
        $this->load->controller('tool/upload');
        $data['ticket_image'] = $this->controller_tool_upload->widget(array(
            'filename' => 'upload/image/flight/ticket/temp.any',
            'label' => $this->language['entry_ticket_image'],
            'name' => 'ticket_image',
            'placeholder' => HTTP_SERVER . 'assets/img/ticket_image.jpg',
            'text_explain' => $this->language['desc_ticket_image']
        ));

        $data['identification_image'] = $this->controller_tool_upload->widget(array(
            'filename' => 'upload/image/flight/identification/temp.any',
            'label' => $this->language['entry_identification_image'],
            'name' => 'identification_image',
            'placeholder' => HTTP_SERVER . 'assets/img/identification_image.jpg',
            'text_explain' => $this->language['desc_identification_image']
        ));

        $data['user'] = $this->user;
        $data['airports'] = $this->load->controller('common/airport')->render_dropdown_options(CAPTURE_RESULT);

        $data['head'] = '
            <link href="' . HTTP_SERVER . 'assets/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" type="text/css" media="screen">
            <link href="' . HTTP_SERVER . 'assets/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" media="screen">
        ';
        $data['foot'] = '
            <script src="' . HTTP_SERVER . 'assets/plugins/bootstrap3-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
            <script type="text/javascript" src="' . HTTP_SERVER . 'assets/plugins/jquery-autonumeric/autoNumeric.js"></script>
            <script type="text/javascript" src="' . HTTP_SERVER . 'assets/plugins/dropzone/dropzone.min.js"></script>
            <script type="text/javascript" src="' . HTTP_SERVER . 'assets/plugins/bootstrap-tag/bootstrap-tagsinput.min.js"></script>
            <script type="text/javascript" src="' . HTTP_SERVER . 'assets/plugins/jquery-inputmask/jquery.inputmask.min.js"></script>
            <script src="' . HTTP_SERVER . 'assets/plugins/bootstrap-form-wizard/js/jquery.bootstrap.wizard.min.js" type="text/javascript"></script>
            <script src="' . HTTP_SERVER . 'assets/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
            <script src="' . HTTP_SERVER . 'assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js" type="text/javascript"></script>
            <script src="' . HTTP_SERVER . 'assets/plugins/summernote/js/summernote.min.js" type="text/javascript"></script>
            <script src="' . HTTP_SERVER . 'assets/plugins/moment/moment.min.js"></script>
            <script src="' . HTTP_SERVER . 'assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
            <script src="' . HTTP_SERVER . 'assets/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
            <script src="' . HTTP_SERVER . 'assets/js/form_wizard.js" type="text/javascript"></script>
            <script src="' . HTTP_SERVER . 'assets/js/form_elements.js" type="text/javascript"></script>
        ';

        // Render but capture output
        $data['sidebar'] = $this->load->controller('common/sidebar')->render(CAPTURE_RESULT, $data);
        $data['wrapper_top'] = $this->load->controller('common/wrapper_top')->render(CAPTURE_RESULT, $data);
        $data['wrapper_bottom'] = $this->load->controller('common/wrapper_bottom')->render(CAPTURE_RESULT, $data);

        // Render and stream
        $this->load->view('flight/form_' . $mode, $data);
    }

    public function submit_form($mode = 'buy') {
        if ($mode == 'buy') {
            $source = 'ot-to';
        } else if ($mode == 'add') {
            $source = 'existing';
        }
        if($_SERVER["REQUEST_METHOD"] == "POST" && !empty($source)) {
            $data = $_POST;
            // print_r($_POST);
            $data['user_id'] = $this->user['user_id'];
            $json = $this->model_flight->addFlight($data, $source, CAPTURE_RESULT);

            // Save the images
            $this->load->controller('tool/upload');

            if ($this->controller_tool_upload->rename('identification_image', 'upload/image/flight/identification/' . $json['flight_id'] . '.any') && ($mode !== 'add' ||
                $this->controller_tool_upload->rename('ticket_image', 'upload/image/flight/ticket/' . $json['flight_id'] . '.any'))) {

                $identification_image = $this->controller_tool_upload->confirm('identification_image');
                $ticket_image = ($mode === 'add' ?  $this->controller_tool_upload->confirm('ticket_image') : array('filename' => ''));
            }

            // Validate and save
            if ($json['success'] && $identification_image && $ticket_image) {

                $this->model_flight->setImages($json['flight_id'], $identification_image['filename'], $ticket_image['filename']);

                $this->model_flight->addFlightStatus($json['flight_id'], $this->language['status_pending']);
                // if ($mode === 'ot-to')  $this->model_flight->flightPayment($json['flight_id'], $data['total_price']);

                if ($mode === 'add')  $this->model_flight->flightPayment($json['flight_id'], $data['total_price']);

                $json['redirect'] = HTTP_SERVER . 'flight/detail/' . $json['flight_id'];

                // If save completed, unset posted data
                unset($_SESSION['post']['flight']);

                exit(json_encode($json));
            }
        }
        exit(json_encode(array('success' => false, 'message' => $this->language['error_server'])));

    }

    /*
    *   KIWI flight search api,
    *   documentation - https://docs.kiwi.com/
    */
    public function get_estimate($data = array(), $return = false) {
      $data = array_merge($_POST, $data);

      $apiBase = 'https://api.skypicker.com/flights?';
      $departure = $this->model_airport->getAirport($data['departure'])['code'];
      $arrival = $this->model_airport->getAirport($data['arrival'])['code'];
      $priceBalance = 1;
      $depDate = $data['date_departure'];
      $arriDate = $data['date_arrival'];

      $apiCall = array(
                        'flyFrom'         =>    $departure,
                        'to'              =>    $arrival,
                        'limit'           =>    $priceBalance,
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

      $flightsRaw = json_decode($output);
      $flights = $flightsRaw->data;

      $count = count($flights);
      $sum = 0;

      foreach ($flights as $flight) {
        $sum += (int) $flight->price;
      }

      $average_price = $sum / $count;

      if ($average_price > 2000) $average_price = $average_price * 0.9;
      if ($average_price > 2200) {
        sleep(3);
        $min = 1900; $max = 1999;
        $average_price = mt_rand($min*100, $max*100) / 100;
      };
      if ($average_price < 1000) $average_price = $average_price * 1.1;
      if ($average_price < 1000) {
        sleep(3);
        $min = 900; $max = 1100;
        $average_price = mt_rand($min*100, $max*100) / 100;
      }

      $flight_price = number_format($average_price, 2, '.', ',');

      print_r(json_encode(array('success' => true, 'price' => $flight_price)));
      return json_encode(array('success' => true, 'price' => $flight_price));
    }

    public function detail($flight_id = false, $open_payment_modal = false) {

        if (!is_numeric($flight_id)) {
            $this->redirect(HTTP_SERVER . '404');
        }

        $data['flight'] = $this->model_flight->getFlight($flight_id);
        if (!$data['flight']) {
            $this->redirect(HTTP_SERVER . '404');
        }

        $this->load->library('file_manager');

        if (!$this->library_file_manager->validate($data['flight']['identification_image'])) {
            $data['flight']['identification_image'] = '';
        }
        if (!$this->library_file_manager->validate($data['flight']['ticket_image'])) {
            $data['flight']['ticket_image'] = '';
        }

        $data['heading_title'] = sprintf($this->language['heading_detail'], str_pad($flight_id, 4, '0', STR_PAD_LEFT));
        $data['page_name'] = $data['heading_title'];

        $data['breadcrumb'] = array(
            $this->language['text_dashboard'] =>  HTTP_SERVER,
            $this->language['heading_title'] =>  HTTP_SERVER . 'flight/',
            $data['heading_title'] =>  HTTP_SERVER . 'flight/detail/',
        );

        $data['statuses'] = $this->model_flight->getFlightStatuses($flight_id);
        $data['balance'] = (float)$data['flight']['price'] - (float)$data['flight']['payment'];
        $data['url_flights'] = HTTP_SERVER . 'flight';


        if ((float)$data['balance'] > 0) {
            $payment_data = array();
            $payment_data['open_payment_modal'] = $open_payment_modal === 'pay';
            $payment_data['url_payment'] = HTTP_SERVER . 'flight/payment/' . $flight_id . '/';
            $payment_data['total'] = $data['balance'];

            $data['payment'] = $this->load->controller('payment/pp_express')->render(CAPTURE_RESULT, $payment_data);
        } else {
            if ($open_payment_modal === 'pay') {
                $this->redirect(HTTP_SERVER . 'flight/detail/' . $flight_id);
            }
            $data['payment'] = '';
        }

        // Render but capture output
        $data['sidebar'] = $this->load->controller('common/sidebar')->render(CAPTURE_RESULT, $data);
        $data['wrapper_top'] = $this->load->controller('common/wrapper_top')->render(CAPTURE_RESULT, $data);
        $data['wrapper_bottom'] = $this->load->controller('common/wrapper_bottom')->render(CAPTURE_RESULT, $data);

        // Render and stream
        $this->load->view('flight/detail', $data);
    }

    public function payment($flight_id, $amount = 0) {

        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            if (isset($_POST['amount'])) {
                $amount = (float)$_POST['amount'];
            }
            if (isset($_POST['data'])) {
                $data = (float)$_POST['data'];
            } else {
                $data = '';
            }
            $this->model_flight->flightPayment($flight_id, $amount, $data);
            exit(json_encode(['success' => 'true']));
        }
    }
}
