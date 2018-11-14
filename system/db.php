<?php

/**
 * MySQL driver DB class
 *
 * Otto v3 MVC speed prioritized
 *
 * Jack Mai
 * 2018-03-11
 */
class DB {
    protected $con;

    /**
     * Initialize the db connection if needed
     */
    public function __construct() {
        global $db;
        if (!isset($db)) {
            if (function_exists('configSession')) {
                configSession();
            } else {
                // Make a connection
                $db = mysqli_connect(DB_SERVER,DB_USERNAME,DB_PASSWORD,DB_DATABASE)
                    or die ("Cannot connect to database");
            }
        }
        mysqli_set_charset($db,"utf8");
        $this->con = $db;
    }

    /**
     * @param  string  $q   The escaped query string
     * @param  boolean $raw Whether to return raw mysqli_result obj
     * @return mixed        Boolean, mysqli_result obj or object
     */
    public function query($q, $raw = false) {

        // Return value
        $ret = array(
            'row' => array(),
            'rows' => array(),
            'num_rows' => 0
        );

        $r = mysqli_query($this->con, $q);

        // Was $q an INSERT, UPDATE, REPLACE ... query? The results are
        // boolean true / false
        if (gettype($r) === 'boolean')  return $r;

        // Else must be SELECT, SHOW, DESCRIBE or EXPLAIN query which return
        // mysqli_result object
        if($r){
            if ($raw)  return $r;

            // Extract result
            $ret['num_rows'] = mysqli_num_rows($r);

            while($row = mysqli_fetch_assoc($r)) {
                $ret['rows'][] = $row;
            }

            if ($ret['num_rows'] > 0) {
                $ret['row'] = $ret['rows'][0];
            }
        }
        return (object)$ret;
    }

    /**
     * @param  string $text       The string to escape
     * @return string             The escaped string
     */
    public function escape($text) {
        return mysqli_real_escape_string($this->con, $text);
    }

    public function last_insert_id() {
        return mysqli_insert_id($this->con);
    }

    public function error() {
        return mysqli_error($this->con);
    }
}
