<?php

class ModelTest extends Model {

    // variables declared here as private will only be available to this model
    private $b;

    // Autoload. Make sure to pass in $registry to __construct()
    public function __construct($registry) {
        parent::__construct($registry);
        echo('Model Test loaded' . '<br/>');
    }

    // Sets a model private variable $b and shared variable $a
    public function test() {
        echo('Model Test is setting variables' . '<br/>');

        $this->a = 'a';
        $this->b = 'b';
    }

    // Prints some variables and return something to controller
    public function test2() {
        echo('Model Test is printing shared $a:' . $this->a . '<br/>');
        echo('Model Test is printing model private $b:' . $this->b . '<br/>');
        // var_export('Model Test is printing itself (methods are obmitted):' . '<br/>' );
        // var_dump($this);
        return 'd';
    }
}