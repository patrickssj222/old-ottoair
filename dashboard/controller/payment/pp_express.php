<?php

class ControllerPaymentPPExpress extends Controller
{

    public function render($return = false, $data = array())
    {
        $this->load->language('payment/pp_express');
        if ($return)  return $this->load->view('payment/pp_express', $data, CAPTURE_RESULT);
        else $this->load->view('payment/pp_express', $data);

    }

}