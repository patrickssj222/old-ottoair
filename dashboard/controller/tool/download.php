<?php

class ControllerToolDownload extends Controller
{

	public function index()
	{
		$this->load->library('file_manager');
		
		if(isset($_GET['filepath'])) {
			$this->library_file_manager->download($_GET['filepath']);	
		}
		
	}
}