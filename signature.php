<?php
// Region code and Product ASIN
// $response = getAmazonPrice("ca", "B00Q0PACEI");

$response = aws_signed_request("ca", 'B00Q0PACEI');

function getAmazonPrice($region, $asin) {

	$xml = aws_signed_request($region, array(
		"Operation" => "ItemLookup",
		"ItemId" => $asin,
		"IncludeReviewsSummary" => False,
		"ResponseGroup" => "Medium,OfferSummary",
	));

	$item = $xml->Items->Item;
	$title = htmlentities((string) $item->ItemAttributes->Title);
	$url = htmlentities((string) $item->DetailPageURL);
	$image = htmlentities((string) $item->MediumImage->URL);
	$price = htmlentities((string) $item->OfferSummary->LowestNewPrice->Amount);
	$code = htmlentities((string) $item->OfferSummary->LowestNewPrice->CurrencyCode);
	$qty = htmlentities((string) $item->OfferSummary->TotalNew);

	if ($qty !== "0") {
		$response = array(
			"code" => $code,
			"price" => number_format((float) ($price / 100), 2, '.', ''),
			"image" => $image,
			"url" => $url,
			"title" => $title
		);
	}

	return $response;
}

function getPage($url) {

	$curl = curl_init($url);
	curl_setopt($curl, CURLOPT_FAILONERROR, true);
	curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true);
	curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
	curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
	curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
	$html = curl_exec($curl);
	curl_close($curl);
	return $html;
}

function aws_signed_request($region, $params) {

	$public_key = "AKIAJGBELMIXTS7WGEVA";
	$private_key = "NHoe0Ny3F+7ZqYqa1ctYY6arkyd2+FsRq/XBlZB+";

	$method = "GET";
	$host = "ecs.amazonaws." . $region;
	$host = "webservices.amazon." . $region;
	$uri = "/onca/xml";

	$params["Service"] = "AWSECommerceService";
	$params["AssociateTag"] = "ottoair-20"; // Put your Affiliate Code here
	$params["AWSAccessKeyId"] = $public_key;
	$params["Timestamp"] = gmdate("Y-m-d\TH:i:s\Z");
	$params["Version"] = "2011-08-01";

	ksort($params);

	$canonicalized_query = array();
	foreach ($params as $param => $value) {
		$param = str_replace("%7E", "~", rawurlencode($param));
		$value = str_replace("%7E", "~", rawurlencode($value));
		$canonicalized_query[] = $param . "=" . $value;
	}

	$canonicalized_query = implode("&", $canonicalized_query);

	$string_to_sign = $method . "\n" . $host . "\n" . $uri . "\n" . $canonicalized_query;
	$signature = base64_encode(hash_hmac("sha256", $string_to_sign, $private_key, True));
	$signature = str_replace("%7E", "~", rawurlencode($signature));

	$request = "http://" . $host . $uri . "?" . $canonicalized_query . "&Signature=" . $signature;
	$response = getPage($request);

	var_dump($response);

	$pxml = @simplexml_load_string($response);
	if ($pxml === False) {
		return False;// no xml
	} else {
		return $pxml;
	}
}

die;
// $AccessKeyID = 'AKIAJJTOF3GAHOFV6UFA';
$AccessKeyID = 'AKIAJGBELMIXTS7WGEVA';
// $SecretAccessKey = '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';
$SecretAccessKey = 'NHoe0Ny3F+7ZqYqa1ctYY6arkyd2+FsRq/XBlZB+';
$storeHash = 'ottoair-20';
$itemID = 'B00Q0PACEI';

$httpsCall = 'https://webservices.amazon.com/onca/xml?';

$signatureRequest = "GET\r\n"
."webservices.amazon.com\r\n"
."/onca/xml\r\n";

$requestURL = 'Service=AWSECommerceService&AWSAccessKeyId='
    . $AccessKeyID . '&AssociateTag='
    . $storeHash . '&Operation=ItemLookup&ItemId='
    . $itemID . '&ResponseGroup=Offers&IdType=ASIN'
    . '&Version=2018-05-05&region=US&Timestamp='
    . date('Y-m-d\TH:i:s.Z\Z', time());
$string_to_sign = rawurlencode($requestURL);

// print_r($string_to_sign);
// die;


$signature = base64_encode(hash_hmac("sha256", $signatureRequest . $string_to_sign, $SecretAccessKey, True));

// print_r($httpsCall.$string_to_sign.'&Signature='.$signature);
// die;

$ch = curl_init($httpsCall.$string_to_sign.'&Signature='.$signature);
// $ch = curl_init($result);
// curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
// curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_HTTPHEADER, array( 'Content-Type: application/json' ));
// curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
$output = curl_exec($ch);
curl_close($ch);
print_r($output);
?>
