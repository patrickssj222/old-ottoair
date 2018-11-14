<?php
   include("../utils.php");
   configSession();

   if($_SERVER["REQUEST_METHOD"] == "POST") {
      // username and password sent from form

      $myphone = mysqli_real_escape_string($db, $_POST['phone']);
      $mypassword = mysqli_real_escape_string($db, $_POST['password']);
      $fname = mysqli_real_escape_string($db, $_POST['fname']);
      $lname = mysqli_real_escape_string($db, $_POST['lname']);

      $regisDate = date('Y-n-j H:i:s');

      $sql = "INSERT INTO users (phone, password, regisDate, language) VALUES ('$myphone', '$mypassword', '$regisDate', 'en')";
      $result = mysqli_query($db, $sql);
      $userID = mysqli_insert_id($db);

      $sql2 = "INSERT INTO user_info (u_id, firstName, lastName) VALUES ('".$userID."', '".$fname."', '".$lname."')";
      $result2 = mysqli_query($db, $sql2);

      if($result){
         $_SESSION['login_user'] = $myphone;
         $_SESSION['login_id'] = $userID;
         echo '{"status":"success", "redirect" : "index.php"}';
      } else {
         echo '{"status":"error", "errorMsg" : "Username taken. Please try another one"}';
      }
   }
?>
