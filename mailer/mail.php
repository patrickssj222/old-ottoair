<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: *');
header('Access-Control-Allow-Methods: *');
header('Content-Type: application/json');

$method = $_SERVER['REQUEST_METHOD'];
$request = explode('/', trim($_SERVER['PATH_INFO'],'/'));
$input = json_decode(file_get_contents('php://input'),true);

$body = '';

// if ($method == 'POST') {
  $mail = new PHPMailer(); // create a new object
  $mail->IsSMTP(); // enable SMTP
  $mail->SMTPDebug = 1; // debugging: 1 = errors and messages, 2 = messages only
  $mail->SMTPAuth = true; // authentication enabled
  $mail->SMTPSecure = 'ssl'; // secure transfer enabled REQUIRED for Gmail
  $mail->Host = "smtp.gmail.com";
  $mail->Port = 465; // or 587
  $mail->IsHTML(true);
  $mail->Username = "ottoairdev@gmail.com";
  $mail->Password = "otto1221";
  $mail->SetFrom("ottoairdev@gmail.com", "OttoAir Dev");
  $mail->Subject = "New Shipment - ID 50";

  // sender id, name, phone, email
  // sender address

  // receiver name, phone, email
  // receiver address
  $sum = 0;

  $body .= '<b>Shipment ID ID</b> - ' . $input['shipment_id'] . "<br><br>";
  $body .= '<b>Customer ID</b> - ' . $input['user_id'] . "<br><br>";
  $body .= '<b>Sender Name</b> - ' . $input['sender_name'] . "<br>";
  $body .= '<b>Sender Phone</b> - ' . $input['sender_phone'] . "<br>";
  $body .= '<b>Sender Wx</b> - ' . $input['sender_wx'] . "<br>";
  $body .= '<b>Sender Email</b> - ' . $input['sender_email'] . "<br>";
  $body .= '<b>Sender Address</b> - ' . $input['sender_address'] . "<br><br>";
  $body .= '<b>Receiver Name</b> - ' . $input['receiver_name'] . "<br>";
  $body .= '<b>Receiver Phone</b> - ' . $input['receiver_phone'] . "<br>";
  $body .= '<b>Receiver Address</b> - ' . $input['receiver_address'] . "<br><br>";
  $body .= '<b>Items</b> - <br>';
  foreach ($input['items'] as $item) {
    $body .= $item['item_name'] . " * " . $item['item_count'] . ", " . " total weight: " . $item['item_weight'] . '<br>';
    $sum += (float) $item['item_weight'] * 8.00;
    // $body .= $item['item_name'];
  }
  $body .= '<br><b>Total price</b> - $' . $sum;


  $mail->Body = $body;
  $mail->AddAddress("weli@ottoair.ca");
  $mail->AddCC("george.siqi.wang@gmail.com");

   if(!$mail->Send()) {
      echo "Mailer Error: " . $mail->ErrorInfo;
   } else {
      echo "Message has been sent";
   }
   // $data = array(
   //     'method'    =>    $method,
   //     // 'request'   =>    $request,
   //     'input'     =>    $input
   // );
   // echo json_encode($data);

// }

?>
