<?php

// $apiBase = 'https://api.skypicker.com/flights?';
// $departure = htmlspecialchars($_POST["depLoc"]);
// $arrival = htmlspecialchars($_POST["arriLoc"]);
// $depDate = htmlspecialchars($_POST["depDate"]);
// $arriDate = htmlspecialchars($_POST["arriDate"]);
$apiBase = 'https://api.skypicker.com/flights?';
$departure = 'YYZ';
$arrival = 'PVG';
$priceBalance = 35;
$depDate = '06/06/2018';
$arriDate = '06/07/2018';

$apiCall = 'flyFrom=' . $departure
    . '&to=' . $arrival
    . '&limit=' . $priceBalance
    . '&dateFrom=' . $depDate
    . '&dateTo=' . $arriDate
    . '&curr=CAD&directFlights=1&typeFlight=round';

$ch = curl_init($apiBase.$apiCall);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_HTTPHEADER, array( 'Accept: application/json' ));
$output = curl_exec($ch);
curl_close($ch);

$flightsRaw = json_decode($output);
$flights = $flightsRaw->data;

$count = count($flights);
$sum = 0;

foreach ($flights as $flight) {
  $sum += (int) $flight->price;
}

echo '{"status":"success", "price" : "' . number_format($sum / $count, 2, '.', ',') . '"}';

?>
