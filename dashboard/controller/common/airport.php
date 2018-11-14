<?php

class ControllerCommonAirport extends Controller {
    // Autoload
    public function __construct($registry) {
        parent::__construct();
        if (empty($_SESSION['user_language_id'])) {
            $_SESSION['user_language_id'] = 1;
        }
        $this->load->model('localization/country');
        $this->load->model('airport');
    }

    public function render_dropdown_options($return = false, $data = array()) {
        $airports = array();

        foreach ($this->model_localization_country->listCountries() as $c) {
            $airports[] = array(
                'country' => $c,
                'airports' => $this->model_airport->listAirportsByCountryId($c['country_id'])
            );
        };

        $data['airports'] = $airports;

        // Render
        if ($return)  return $this->load->view('common/airport_dropdown_options', $data, CAPTURE_RESULT);
        else $this->load->view('common/airport_dropdown_options', $data);
    }
}
