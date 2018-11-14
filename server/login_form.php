<?php
   include("../utils.php");
   configSession();

   if($_SERVER["REQUEST_METHOD"] == "POST") {
      // username and password sent from form

      $myphone = mysqli_real_escape_string($db, $_POST['phone']);
      $mypassword = mysqli_real_escape_string($db, $_POST['password']);
      // $myphone = str_replace("+1&nbsp;", '', $phone);

      $sql = "SELECT * FROM users WHERE phone = '$myphone' and password = '$mypassword'";
      $result = mysqli_query($db, $sql);
      $row = mysqli_fetch_array($result, MYSQLI_ASSOC);
      // $active = $row['active'];

      // If result matched $myusername and $mypassword, table row must be 1 row
      if(mysqli_num_rows($result) == 1) {
         $_SESSION['login_user'] = $myphone;
         $_SESSION['login_id'] = $row['u_id'];
         $_SESSION['user_language'] = $row['language'];

         if (isset( $_SESSION['urlAfterLogin']) && !empty($_SESSION['urlAfterLogin'] )){
            $forward = $_SESSION['urlAfterLogin'];
            session_unset($_SESSION['urlAfterLogin']);
         } else {
            if ($_SESSION['user_language'] == 'ch'){
              $forward = 'ch/dashboard/index.php';
            } else {
              $forward = 'dashboard/index.php';
            }
         }

         echo '{"status":"success", "redirect" : "'.$forward.'"}';
      } else {
         echo '{"status":"error", "errorMsg" : "Your Login Name or Password is invalid"}';
      }
   }
?>
