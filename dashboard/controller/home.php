<?php
class ControllerHome extends DashboardController
{

    // Autoload
	public function __construct($registry = array())
	{
		parent::__construct($registry);
		$this->redirect('flight');
        // Load language
		$this->load->language('home');
	}

	public function index()
	{
		$data['breadcrumb'] = array(
			$this->language['text_dashboard'] => HTTP_SERVER
		);

		$data['heading_title'] = $this->language['heading_title'];
		$data['page_name'] = $this->language['heading_title'];

        // Render but capture output
		$data['sidebar'] = $this->load->controller('common/sidebar')->render(CAPTURE_RESULT, $data);
		$data['wrapper_top'] = $this->load->controller('common/wrapper_top')->render(CAPTURE_RESULT, $data);
		$data['wrapper_bottom'] = $this->load->controller('common/wrapper_bottom')->render(CAPTURE_RESULT, $data);

		$data['blocks'] = array(
			array(
				'label' => $this->language['text_flight'],
				'title' => $this->language['text_your_flights'],
				'summary' => $this->language['desc_flight'],
				'background-image' => HTTP_SERVER . 'assets/img/dashboard/flight.jpg',
				'href' => HTTP_SERVER . 'flight',
				'class' => 'col-sm-4 m-b-20'
			),
			array(
				'label' => $this->language['text_shipment'],
				'title' => $this->language['text_your_shipments'],
				'summary' => $this->language['desc_shipment'],
				'background-image' => HTTP_SERVER . 'assets/img/dashboard/shipment.jpg',
				'href' => HTTP_SERVER . 'shipment',
				'class' => 'col-sm-4 m-b-20'
			),
			array(
				'label' => $this->language['text_order'],
				'title' => $this->language['text_your_orders'],
				'summary' => $this->language['desc_order'],
				'background-image' => HTTP_SERVER . 'assets/img/dashboard/order.jpg',
				'href' => HTTP_SERVER . 'order',
				'class' => 'col-sm-4 m-b-20'
			),
		);

        // Render and stream
		$b = $this->load->view('home', $data);
	}
}
