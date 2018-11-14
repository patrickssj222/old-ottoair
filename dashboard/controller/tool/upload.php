<?php
/**
 * Middleware for handling file upload at a higher level.
 * Renders the upload form, auto upload and confirm the file.
 * Uses the file field name as identifier
 */
class ControllerToolUpload extends DashboardController
{

	public function __construct($registry)
	{
		parent::__construct($registry);
		$this->load->library('file_manager');
	}


	public function index() {}


	// $data = array(
	// 		'fliename' 	=> '',
	// 		'label' 	=> '',
	// 		'name' 		=> '',
	// 		'value' 	=> '',
	// 		'placeholder' 	=> '',
	// 		'button_add' 	=> '',
	// 		'text_explain' 	=> '',
	// 		'accept' 	=> '.jpeg,.jpg,.png,.gif'
	// );
	public function widget($data, $return = CAPTURE_RESULT)
	{
		if (empty($data['filename']) || empty($data['name'])) {
			throw new Exception('Tool/Uploader: filename and name are required!');
		}

		$this->load->language('tool/upload');
		
		$data['url_upload'] 	= HTTP_SERVER . 'tool/upload/upload/' . $data['name'];
		$data['value']			= !empty($data['value']) ? $data['value'] : '';
		$data['confirm'] 		= !empty($data['confirm']);
		$data['placeholder']	= !empty($data['placeholder']) ? $data['placeholder'] : HTTP_SERVER . 'assets/img/uploader_placeholder.jpg';
		$data['accept']			= !empty($data['accept']) ? $data['accept'] : '.jpeg,.jpg,.png,.gif,.bmp';

		$_SESSION['dz_' . $data['name']] = $data;

		if ($return)  return $this->load->view('tool/upload_widget', $data, CAPTURE_RESULT);
		else  $this->load->view('tool/upload_widget', $data);
	}


	public function upload($name, $confirm = false, $return = false)
	{
		$success = $key = false;

		if (isset($_SESSION['dz_' . $name]['filename'])) {

			if ($key = $this->library_file_manager->upload($_FILES['file'], $_SESSION['dz_' . $name]['filename'])) {

				if (!empty($_SESSION['dz_' . $name]['confirm'])) {
					$this->confirm($name);
				}

				$_SESSION['dz_' . $name]['key'] = $key;
				$success = true;
			}
		}

		if ($return)  return $key;
		else exit(json_encode(array('success' => $success, 'message' => $success? 'File has been uploaded' : $this->library_file_manager->last_error()/*, 'key' => $key*/)));
	}


	public function confirm($name)
	{
		if (isset($_SESSION['dz_' . $name]['key'])) {
			if ($file = $this->library_file_manager->confirm($_SESSION['dz_' . $name]['key'])) {
			
				unset($_SESSION['dz_' . $name]);
				return $file;
			}
		}

		return false;
	}


	public function rename($name, $filename)
	{
		if (isset($_SESSION['dz_' . $name]['key'])) {
			if ($file = $this->library_file_manager->rename($_SESSION['dz_' . $name]['key'], $filename)) {

				return $file;
			}
		}

		return false;
	} 


	public function file_check($file)
	{
		return $this->library_file_manager->file_check($file);
	}
}