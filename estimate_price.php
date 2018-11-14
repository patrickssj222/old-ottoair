<?php
  include("utils.php");
  configSession();
?>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <meta charset="utf-8" />
    <title>登记订单 - Otto物流</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <link rel="apple-touch-icon" href="pages/ico/60.png">
    <link rel="apple-touch-icon" sizes="76x76" href="pages/ico/76.png">
    <link rel="apple-touch-icon" sizes="120x120" href="pages/ico/120.png">
    <link rel="apple-touch-icon" sizes="152x152" href="pages/ico/152.png">
    <link rel="icon" type="image/x-icon" href="favicon.ico" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="default">
    <meta content="" name="description" />
    <meta content="" name="author" />
    <!-- BEGIN PLUGINS -->
    <link href="assets/plugins/pace/pace-theme-flash.css" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/swiper/css/swiper.css" rel="stylesheet" type="text/css" media="screen" />
    <!-- END PLUGINS -->
    <!-- BEGIN PAGES CSS -->
    <link class="main-stylesheet" href="pages/css/pages.css" rel="stylesheet" type="text/css" />
    <link class="main-stylesheet" href="pages/css/pages-icons.css" rel="stylesheet" type="text/css" />
    <link class="main-stylesheet" href="pages/css/style.css" rel="stylesheet" type="text/css" />
    <!-- BEGIN PAGES CSS -->
  </head>
  <body class="pace-dark">
    <!-- BEGIN HEADER -->
    <?php include("header.php"); ?>
    <!-- END HEADER -->

    <!-- DARK BACKGROUND -->
    <div class="p-b-50 p-t-50 bg-master-dark"></div>
    <h4 id="register-order-h4">Estimate Price</h4>
    <!-- START FORM -->
    <div class="register-order-form">
      <!-- <h6>Prices will be finalized when item is obtained.</h6> -->

      <!-- <div class="checkbox check-primary">
          <input type="checkbox" value="1" id="checkbox3">
          <label for="checkbox3">I agree to <a href="http://ot-to.co/v2.1/ch/terms.php">Terms and Services</a></label>
      </div> -->

      <form id="getInfo">
        <div class="form-group-attached">
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group form-group-default required">
                <label for="itemName">From</label>
                <input type="text" class="form-control" id="depLoc" name="depLoc">
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group form-group-default required">
                <label for="itemName">To</label>
                <input type="text" class="form-control" id="arriLoc" name="arriLoc" placeholder="Enter airport">
              </div>
            </div>
          </div>

          <div class="row">
              <div class="col-sm-6">
                <div class="form-group form-group-default required">
                  <label for="itemName">Dep Date</label>
                  <input type="text" id="dateSelect" name="depDate" class="form-control">
                </div>
              </div>
              <div class="col-sm-6">
                <div class="form-group form-group-default required">
                  <label for="itemName">Arri Date</label>
                  <input type="text" id="dateSelect2" name="arriDate" class="form-control">
                </div>
              </div>
          </div>
        </div>
      </form>




      <!-- <button type="submit" class="btn btn-primary m-t-10 m-b-15">Submit</button> -->
      <a class="btn btn-primary m-t-10 m-b-15" id="priceSubmit">Submit</a>

      <div id="waitNoti" style="display:none">
        <p>Estimating your price <span id="wait">.</span></p>
        <div class="progress">
            <div class="progress-bar-primary progress-bar-indeterminate"></div>
        </div>
      </div>

      <p id="flightPrice"></p>

    </div>
    <!-- END FORM -->


    <!-- START FOOTER -->
    <?php include("footer.php"); ?>
    <!-- END FOOTER -->
    <!-- BEGIN VENDOR JS -->
    <script src="assets/plugins/pace/pace.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="pages/js/pages.image.loader.js"></script>
    <script type="text/javascript" src="assets/plugins/jquery/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="assets/plugins/swiper/js/swiper.jquery.min.js"></script>
    <script type="text/javascript" src="assets/plugins/velocity/velocity.min.js"></script>
    <script type="text/javascript" src="assets/plugins/velocity/velocity.ui.js"></script>
    <script type="text/javascript" src="assets/plugins/jquery-appear/jquery.appear.js"></script>
    <script type="text/javascript" src="assets/plugins/animateNumber/jquery.animateNumbers.js"></script>
    <script type="text/javascript" src="assets/plugins/bootstrap/js/bootstrap.js"></script>
    <!-- <script type="text/javascript" src="assets/plugins/bootstrap/js/bootstrap.js"></script> -->
    <script type="text/javascript" src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <!-- END VENDOR JS -->
    <!-- BEGIN PAGES FRONTEND LIB -->
    <script type="text/javascript" src="pages/js/pages.frontend.js"></script>
    <!-- END PAGES LIB -->
    <!-- BEGIN YOUR CUSTOM JS -->
    <script type="text/javascript" src="assets/js/scripts.js"></script>
    <script type="text/javascript" src="assets/js/custom.js"></script>
    <script>
    var dots = window.setInterval( function() {
        var wait = document.getElementById("wait");
        if ( wait.innerHTML.length > 2 )
            wait.innerHTML = "";
        else
            wait.innerHTML += ".";
        }, 300);
    </script>
    <script>
      $("#priceSubmit").click(function(){
        $("#waitNoti").show(300);
        // document.getElementById("priceSubmit").disabled = true;
        $("#priceSubmit").attr("disabled", true);

        // setTimeout(function(){
        //   // window.location.replace("http://stackoverflow.com");
        //   $.get("create_json.php");
        //   // return false;
        // }, 2000);

        // $.get("get_price.php");
        $.ajax({
      		url: 'get_price.php',
          type: "POST",
      		data: $('#getInfo').serialize(),
      		success: function(result) {
      			data = JSON.parse(result);
      			if (data.status == "success") {
              document.getElementById("flightPrice").textContent = "Your price is " + data.price;
              $("#waitNoti").hide(300);
              $("#priceSubmit").attr("disabled", false);
      			}
      		}
          });

      })
    </script>
    <script>
      $('#dateSelect').datepicker({
        format: "yyyy-mm-dd"
      });
      $('#dateSelect2').datepicker({
        format: "yyyy-mm-dd"
      });
    </script>






    <script>
      $(document).ready(function() {
        $("#loginButton").click(function(){login();});
      });
    </script>
    <!-- END PAGES LIB -->
  </body>
</html>
