<?php

defined('DIR_TEMP') || define('DIR_TEMP', realpath(__DIR__) . '/../storage/temp/uploader/');

class LibraryFileManager extends DashboardController
{

///////////////
// Variables //
///////////////

	protected $error = array();

	// Future extension load setting from external source
	private $allowed_ext = array(
		'bmp', 
		'jpg', 
		'jpeg', 
		'png',
		'gif', 
		'svg', 
		'pdf'
	);
	private $allowed_mime = array(
		'image/bmp',
		'image/jpg',
		'image/jpeg',
		'image/png',
		'image/gif',
		'image/svg+xml',
		'application/pdf'
	);
	private $filename_length = array(3, 100);
	private $file_size = array(102, 5242880); // 1kb to 5mb


	public function __construct($registry)
	{
        if (!empty($_SESSION['user_username'])) {
        	parent::__construct($registry);
        }
        else {
        	$this->redirect(HTTP_FRONT . '404');
        }
	}

/////////////////////
// Getter / Setter //
/////////////////////


	public function setPrivate($key, $private = true) 
	{
		return $this->db->query("UPDATE " . DB_PREFIX . "upload SET private = " . (int)$private . " WHERE key ='" . $this->db->escape($key) . "'");
	}

//////////////////////
// Public functions //
//////////////////////

	public function upload(
		$file, 
		$path = DIR_UPLOAD, 
		$confirm = false,
		$mask = true, 
		$private = true, 
		$encrypted = false
	) {
		$file['path'] = $path;

    	if ($this->sanity_check($file)) {

			$filename = pathinfo($path, PATHINFO_FILENAME);
			$ext = pathinfo($file['name'], PATHINFO_EXTENSION);
			$path = dirname($path);

			if (empty($filename)) {
				$filename = $file['name'];
			}
			else {
				$filename = $filename . '.' . $ext;
			}

			// if ($encrypt) {
				// $filename = Encryption::encrypt($file);
			// }

			// Generate masked filename. Private resource must be masked
			if ($private || $mask) {

				if (gettype($mask) === 'string') {
					$realname = $mask;
				} else {
					$realname = str_pad($this->user['user_id'], 4, "0",STR_PAD_LEFT) . '-' . date('YmdHis') . '-' . token(7);
				}
			} else {
				$realname = $filename;
			}

			$path = str_replace(realpath(DIR_APPLICATION), '', $path);

    		if ($dir = dir_check(DIR_TEMP, true)) {

				$key = token(15);

				if ($this->db->query("INSERT INTO " . DB_PREFIX . "upload SET 
					`user_id` = " . $this->db->escape($this->user['user_id']) . ",
					`key`  = '" . $this->db->escape($key) . "',
					`name` = '" . $this->db->escape($filename) . "',
					`path` = '" . $this->db->escape($path) . "',
					`mask` = '" . $this->db->escape($realname) . "',
					`mime` = '" . $this->db->escape($file['type']) . "',
					`size` = " . (float)$file['size'] . ",
					`source` = '" . $this->db->escape($_GET['path']) . "',
					`encrypted` = " . (int)$encrypted . ",
					`confirmed` = 0,
					`private` = " . (int)$private . ",
					`date_added` = NOW()")) {

					if (move_uploaded_file($file['tmp_name'], $dir . $realname)) {

						if (!$confirm || $this->confirm($key, false, DIR_TEMP)) {
							return $key;
						}
					}
				}

				$this->error = array('Failed to upload file!');
				return false;
			}
    	}
		
		return false;
	}


	public function confirm($key, $overwrite = true) 
	{
		if ($file = $this->find(array('key' => $key))->row) {

			$filepath = $file['mask'];

			if (file_check(DIR_TEMP . $file['mask']) && dir_check(DIR_UPLOAD, true)) {

				if (file_check(DIR_UPLOAD . $file['mask']) && !$overwrite) {

					$this->error = array('File already exists');
					return false;
				} 

				if (rename(DIR_TEMP . $file['mask'], DIR_UPLOAD . $file['mask'])) {

					foreach ($this->find(array('confirmed' => 1, 'filepath' => $file['path'] . '/' . $file['name'], 'user_id' => $this->user['user_id']))->rows as $dump) {

						if ($dump['key'] !== $key) {
							$this->delete($dump['key']);
						}
					}

					$this->db->query("UPDATE " . DB_PREFIX . "upload SET confirmed = 1 WHERE `key` ='" . $this->db->escape($key) . "'");

					foreach ($this->find(array('confirmed' => 0, 'filepath' => $file['path'] . '/' . $file['name'], 'user_id' => $this->user['user_id']))->rows as $dump) {
						
						$this->delete($dump['key'], 0);
					}

					return $this->validate($key);
				}
			}
		}
		
		$this->error = array('File not found');
		return false;
	}


	public function find($filter = array())
	{
		$quries = array();

		$filter_keys = array(
			'user_id',
			'key',
			'size',
			'path',
			'mime',
			'source',
			'encrypted',
			'confirmed',
			'private'
		);

		foreach (array_intersect_key($filter, array_flip($filter_keys)) as $k => $v) {
			$quries[] = "`$k` = '" . $this->db->escape(trim($v)) . "'";
		}

		if (isset($filter['name'])) {
			$quries[] = "`name` LIKE '%" . $this->db->escape(trim($filter['name'])) . "%'";
		}

		if (isset($filter['filepath'])) {
			$quries[] = "CONCAT(`path`, '/', `name`) = '" . $this->db->escape(trim($filter['filepath'])) . "'";
		}

		if (isset($filter['date_added'])) {
			$quries[] = "`date_added` <= '" . $this->db->escape(trim($filter['date_added'])) . "%'";
		};

		$limit = isset($filter['limit']) ? (int)$filter['limit'] : 25;
		$page = isset($filter['page']) ? (int)$filter['page'] : 1;
		$start = ($page - 1) * $limit;
		$order = isset($filter['order']) && in_array($filter['order'], array_merge(array('name', 'date_added'), $filter_keys)) ? $this->db->escape($filter['order']) : 'date_added';
		$sort = isset($filter['sort']) && $filter['sort'] == 'ASC' ? 'ASC' : 'DESC';

		return $this->db->query("SELECT * FROM " . DB_PREFIX . "upload " . ($quries ? "WHERE " . implode(' AND ', $quries) : "") . " ORDER BY $order $sort LIMIT $start, $limit");
	}


	public function rename($key, $path)
	{
		if ($file = $this->find(array('key' => $key))->row) {

			$ext = pathinfo($file['name'], PATHINFO_EXTENSION);
			$filename = pathinfo($path, PATHINFO_FILENAME) . '.' . $ext;
			$path = dirname($path);

			if (!empty($filename) && !empty($path) &&
			 	$this->db->query("UPDATE " . DB_PREFIX . "upload SET `name` = '" . $this->db->escape($filename) . "', `path` = '" . $this->db->escape($path) . "' WHERE `key` = '" . $this->db->escape($key) . "'")) {

				return $this->find(array('key' => $key))->row;
			}
		}

		return false;
	}


	public function delete($key, $confirmed = 1)
	{
		if ($file = $this->find(array('key' => $key))->row) {

			@unlink(((int)$file['confirmed'] ? DIR_UPLOAD : DIR_TEMP) . $file['mask']);

			return $this->db->query("DELETE FROM " . DB_PREFIX . "upload WHERE `key` = '" . $this->db->escape($key) . "' AND `confirmed` = " . (int)$confirmed);
		}

		return true;
	}


	public function clean()
	{
		foreach ($this->find(array('confirmed' => 0))->rows as $dump) {
		 	$this->delete($dump['key']);
		 } 
	}


	public function download($kof)
	{
		$file = $this->validate($kof);

		if (!$file && !empty($_GET['key'])) {
			$file = $this->validate($_GET['key']);
		}

		if (!$file && !empty($_GET['filepath'])) {
			$file = $this->validate($_GET['filepath']);
		}

		if ($file) {
			$filepath = DIR_UPLOAD . $file['mask'];
			header('Content-Disposition: inline; filename="' . $file['name'] . '"');
			header('Content-Type:'.$file['mime']);
			header('Content-Length: ' . filesize($filepath));
			readfile($filepath);
			exit;
		}

		$this->redirect(HTTP_SERVER . '404');
	}


	public function last_error() 
	{
		return $this->error;
	}


	public function validate($kof)
	{
		$file = false;

		if (!empty($kof)) {

			if ($kof == pathinfo($kof, PATHINFO_FILENAME)) {
				$file = $this->find(array('key' => $kof, 'confirmed' => 1, 'user_id' => $this->user['user_id']))->row;
			}
			else {
				$file = $this->find(array('filepath' => $kof, 'confirmed' => 1, 'user_id' => $this->user['user_id']))->row;
			}
		}

		if ($file && file_check(DIR_UPLOAD .$file['mask'])) {
			
			$file['filename'] = $file['path'] . '/' . $file['name'];
			return $file;
		}

		return false;
	}

//////////////////
// Internal use //
//////////////////

	protected function sanity_check($file) 
	{
		$this->error = array();

		// File upload error
		if (!empty($file['error'])) {
			$this->error[] = 'File upload error';
		}

		// File exist
        if(!file_exists($file['tmp_name']) || !is_uploaded_file($file['tmp_name'])) {
			$this->error[] = 'File uploader error';
        }

        // No upper dir '..' check
        if (strpos($file['path'], '..') !== false) {
        	$this->error[] = 'Invalid directory';
        }

		// File name check
		if (strpos($file['name'], '.') === 0) {
			$this->error[] = 'Invalid file name';
		}

		// File name length check
		if (strlen(pathinfo($file['name'], PATHINFO_FILENAME)) < $this->filename_length[0] ||
			strlen(pathinfo($file['name'], PATHINFO_FILENAME)) > $this->filename_length[1]) {
			$this->error[] = 'Invalid file name';
		}

		// File size check
		if ($file['size'] < $this->file_size[0] || $file['size'] > $this->file_size[1]) {
			$this->error[] = 'Invalid file size';
		}
		
		// Extension check
		if (!in_array(pathinfo($file['name'], PATHINFO_EXTENSION), $this->allowed_ext)) {
			$this->error[] = 'Invalid file extension';
		}

		// mime type check
		if (!in_array($file['type'], $this->allowed_mime)) {
			$this->error[] = 'Invalid file type';
		}
		
		// Make sure no php is injected
		if (preg_match('/<\?php/i', file_get_contents($file['tmp_name']))) {
			$this->error[] = 'Script injection detected';
		}


		// if ($this->error) {
			// file_put_contents('upload_error.log', json_encode($this->error, JSON_PRETTY_PRINT));
		// }

		return !$this->error;
	}

}