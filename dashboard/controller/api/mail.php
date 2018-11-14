<?php
/**
 * Jack 2018-10-02
 */
class ControllerApiMail extends Controller {
    // Accpets POSTing to this file
    public function index()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            return $this->load->library('mail')->send($_POST);
        }
        return false;
    }

    public function tester()
    {
        echo '
        <form action="'.HTTP_SERVER.'api/mail" method="POST">
            From: <input type="text" name="from" value="info@ottoair.ca"/><br/>
            From Name: <input type="text" name="from_name" value="OttoAir"/><br/>
            Reply To: <input type="text" name="reply_to" value="info@ottoair.ca"/><br/>
            Reply To Name: <input type="text" name="reply_name" value="OttoAir"/><br/>
            To: <input type="text" name="to" value="mymjack@hotmail.com"/><br/>
            CC: <input type="text" name="cc">
            Subject: <input type="text" name="subject" value="OttoAir - This is a developer test email"/><br/>
            Body: <textarea name="body">Dear mymjack, <br/><br/>Hope this email finds you well, the program is delighted to inform you that the program you wrote is working correctly, if you see this email. <br/><br/>OttoAir</textarea><br/>
            <button>Send!</button>
        </form>
        ';
    }
}
