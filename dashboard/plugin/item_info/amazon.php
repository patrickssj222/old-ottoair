<?php
class PluginItemInfoAmazon {
    /**
     * Takes a amazon url and return the corresponding item information
     * @param  string $url The amazon url
     * @return array       The item information
     */
    public function index($url) {
        $json = array();
        $json['item_name'] = 'SimToys Pink Bunny';
        $json['item_description'] = 'SimToys Pink Bunny w/ Pink Blue Bow';
        $json['item_value'] = '50.00';
        return $json;
    }
}