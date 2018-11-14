<?php
  $json = file_get_contents("response.json");
  $jsonIterator = new RecursiveIteratorIterator(
      new RecursiveArrayIterator(json_decode($json, TRUE)),
      RecursiveIteratorIterator::SELF_FIRST);
  $response = array();

  foreach ($jsonIterator as $key => $val) {
    if(is_array($val) && ($key == "pricing")) {
        echo "";
    } else if ($key == "saleTotal") {
        // echo "$val";
        $val2 = str_replace("CAD", "", $val);
        array_push($response, $val2);
    }
  }

  $price = array_sum($response)/count($response);
  echo $price;
?>
