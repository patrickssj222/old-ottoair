<?php

/**
 * Mailer adapted form George's PHPMailer driver.
 * Jack 2018-10-02
 */
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require DIR_APPLICATION . '../vendor/PHPMailer/src/Exception.php';
require DIR_APPLICATION . '../vendor/PHPMailer/src/PHPMailer.php';
require DIR_APPLICATION . '../vendor/PHPMailer/src/SMTP.php';

class LibraryMail extends Controller
{

    public function send($data = array())
    {
        if (!empty($data['body']) &&
            !empty($data['subject'])) {

            $mail = new PHPMailer(); // create a new object
            $mail->IsSMTP();         // enable SMTP
            $mail->SMTPDebug    = 1; // debugging: 1 = errors and messages, 2 = messages only
            $mail->IsHTML(true);
            $mail->SMTPAuth     = true;  // authentication enabled
            $mail->SMTPSecure   = 'ssl'; // secure transfer enabled REQUIRED for Gmail
            $mail->Host         = "smtp.gmail.com";
            $mail->Port         = 465;   // or 587
            $mail->Username     = "ottoairdev@gmail.com";
            $mail->Password     = "otto1221";

            if (empty($data['to'])) {
                // if (!empty($data['from'])) {
                //     $data['to'] = $data['from'];
                // } else {
                    $data['to'] = 'info@ottoair.ca';
                // }
            }
            if (gettype($data['to']) == 'string') {
                $data['to'] = array($data['to']);
            }
            foreach ($data['to'] as $rp) {
                $mail->AddAddress($rp);
            }

            if (!empty($data['cc'])) {
                if (gettype($data['cc']) == 'string') {
                    $data['cc'] = array($data['cc']);
                }
                foreach ($data['cc'] as $cc) {
                    $mail->AddCC($cc);
                }
            }

            if (!empty($data['from'])) {
                if (!empty($data['from_name'])) {
                    $mail->SetFrom($data['from'], $data['from_name']);
                } else {
                    $mail->SetFrom($data['from']);
                }
            } else {
                $mail->setFrom('info@ottoair.ca', 'OttoAir');
            }

            if (!empty($data['reply_to'])) {
                if (!empty($data['reply_name'])) {
                    $mail->AddReplyTo($data['reply_to'], $data['reply_name']);
                } else {
                    $mail->AddReplyTo($data['reply_to']);
                }
            } else {
                $mail->AddReplyTo('info@ottoair.ca', 'OttoAir');
            }

            $mail->Subject  = $data['subject'];
            $mail->Body     = $data['body'];

            return $mail->send();
            // echo 'reached the end';
            // echo '<pre>';
            // echo json_encode($data, JSON_PRETTY_PRINT);
            // echo '</pre>';
        }
    }

}

