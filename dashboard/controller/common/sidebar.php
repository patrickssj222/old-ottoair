<?php

class ControllerCommonSidebar extends DashboardController
{
    // Autoload
	public function __construct($registry)
	{
		parent::__construct();
        // $this->load->model('common/sidebar');
		$this->load->language('sidebar');
	}

	public function render($return = false, $data = array())
	{

		// Block Render
		$output = '<style>
			.page-container { padding-left:0 !important }
			.btn-link.toggle-sidebar { display:none }
			.nav-header { text-align: left !important }
		</style>
		<script>
			$(document).ready(function(){
				$(\'.header .hidden-md-down\').removeClass(\'hidden-md-down\');
			});
		</script>';
		if ($return) return $output;
		else echo $output;

		$count_flight = $this->load->model('flight')->getTotalFlightsByUserId($this->user['user_id']);
		$count_shipment = $this->load->model('shipment')->getTotalShipmentsByUserId($this->user['user_id']);
		$count_order = $this->load->model('order')->getTotalOrdersByUserId($this->user['user_id']);

		$data['menus'] = array(
			$this->language['text_dashboard'] => array(
				'icon' => 'pg-home',
				'href' => ' ',
				'class' => 'm-t-30'
			),
			$this->language['text_my_flights'] => array(
				'icon' => 'fa fa-plane',
				'href' => 'flight',
				'detail' => sprintf($this->language['text_detail_flights'], $count_flight)
			),
            // $this->language['text_my_shipments'] => array(
            //     'icon' => 'fa fa-truck',
            //     'href' => 'shipment',
            //     'detail' => sprintf($this->language['text_detail_shipments'], $count_shipment)
            // ),
            // $this->language['text_my_orders'] => array(
            //     'icon' => 'pg-bag',
            //     'href' => 'order',
            //     'detail' => sprintf($this->language['text_detail_orders'], $count_order)
            // ),
			$this->language['text_setting'] => array(
				'icon' => 'pg-settings_small_1',
				'href' => 'account/setting'
			),
			$this->language['text_log_out'] => array(
				'icon' => 'pg-power',
				'href' => 'account/logout'
			),
		);

        // Render
		if ($return) return $this->load->view('common/sidebar', $data, CAPTURE_RESULT);
		else $this->load->view('common/sidebar', $data);
	}
}
