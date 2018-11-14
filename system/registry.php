<?php

/**
 * Registry class, base class of all mvc Controllers and Models
 *
 * Otto v3 MVC speed prioritized
 *
 * Jack Mai
 * 2018-03-11
 *
 * The purpose of this class is to enable variable sharing between child
 * classes. They will be calling $this->sth., e.g. $this->db to access
 * the singleton DB class. Basically all variable operations are done in the
 * registry object. Think of this as an $_GLOBAL array
 */


class Registry {

    protected $registry;

    public function __construct($registry = false) {
        if (!$registry)  $registry = new stdClass();
        $this->registry = $registry;
    }

    // Over loaded methods, access variables in registry
    public function __get($name) {
        if (isset($this->registry->{$name})) {
            return $this->registry->{$name};
        }
    }
    public function __set($name, $value) {
        $this->registry->{$name} = $value;
    }

    public function __isset($name) {
        return isset($this->registry->{$name});
    }

    public function __unset($name) {
        unset($this->registry->{$name});
    }
}