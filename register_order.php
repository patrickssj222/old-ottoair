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
    <h4 id="register-order-h4">Register Order</h4>
    <!-- START FORM -->
    <div class="register-order-form">
      <form role="form">

        <h5>Sender</h5>
        <!-- <div class="form-group-attached"> -->
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group form-group-default required">
                <label for="senderName">Sender Name</label>
                <input type="text" class="form-control" id="senderName">
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group form-group-default required">
                <label for="senderPhone">Sender Phone</label>
                <input type="text" class="form-control" id="senderPhone">
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group form-group-default">
                <label for="senderWeChat">Sender WeChat</label>
                <input type="text" class="form-control" id="senderWeChat">
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group form-group-default">
                <label for="senderEmail">Sender E-mail</label>
                <input type="text" class="form-control" id="senderEmail">
              </div>
            </div>
          </div>
        <!-- </div> -->
        <br>

        <h5>Receiver</h5>
        <div class="form-group-attached">
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group form-group-default required">
                <label for="receiverName">Receiver Name</label>
                <input type="text" class="form-control" id="receiverName" placeholder="Enter name">
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group form-group-default required">
                <label for="receiverPhone">Receiver Phone</label>
                <input type="text" class="form-control" id="receiverPhone" placeholder="Enter phone">
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-sm-6">
              <div class="form-group form-group-default">
                <label for="receiverWeChat">Receiver WeChat</label>
                <input type="text" class="form-control" id="receiverWeChat" placeholder="Enter wechat">
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group form-group-default">
                <label for="receiverEmail">Receiver E-mail</label>
                <input type="text" class="form-control" id="receiverEmail" placeholder="Enter email">
              </div>
            </div>
          </div>
          <div class="form-group form-group-default required">
            <label for="receiverAddress">Receiver Address</label>
            <input type="text" class="form-control" id="receiverAddress" placeholder="Enter address">
          </div>
        </div>

        <br>
        <h5>Items</h5>

        <p>Item #1</p>
        <div class="form-group-attached">
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group form-group-default required">
                <label for="itemName">Item Name</label>
                <input type="text" class="form-control" id="itemName" placeholder="Enter name">
              </div>
            </div>
            <div class="col-sm-2">
              <div class="form-group form-group-default">
                <label for="itemCount">Count</label>
                <input type="number" class="form-control" id="itemCount" min="1" max="100">
              </div>
            </div>
            <div class="col-sm-2">
              <div class="form-group form-group-default">
                <label for="itemWeight">Weight (lbs)</label>
                <input type="number" class="form-control" id="itemWeight">
              </div>
            </div>
            <div class="col-sm-2">
              <div class="form-group form-group-default">
                <label for="itemPrice">Price</label>
                <input type="number" class="form-control" id="itemPrice">
              </div>
            </div>
          </div>
        </div>

        <p class="p-t-10">Item #2</p>
        <div class="form-group-attached">
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group form-group-default required">
                <label for="itemName">Item Name</label>
                <input type="text" class="form-control" id="itemName" placeholder="Enter name">
              </div>
            </div>
            <div class="col-sm-2">
              <div class="form-group form-group-default">
                <label for="itemCount">Count</label>
                <input type="number" class="form-control" id="itemCount" min="1" max="100">
              </div>
            </div>
            <div class="col-sm-2">
              <div class="form-group form-group-default">
                <label for="itemWeight">Weight (lbs)</label>
                <input type="number" class="form-control" id="itemWeight">
              </div>
            </div>
            <div class="col-sm-2">
              <div class="form-group form-group-default">
                <label for="itemPrice">Price</label>
                <input type="number" class="form-control" id="itemPrice">
              </div>
            </div>
          </div>
        </div>

        <p class="p-t-10">Item #3</p>
        <div class="form-group-attached">
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group form-group-default required">
                <label for="itemName">Item Name</label>
                <input type="text" class="form-control" id="itemName" placeholder="Enter name">
              </div>
            </div>
            <div class="col-sm-2">
              <div class="form-group form-group-default">
                <label for="itemCount">Count</label>
                <input type="number" class="form-control" id="itemCount" min="1" max="100">
              </div>
            </div>
            <div class="col-sm-2">
              <div class="form-group form-group-default">
                <label for="itemWeight">Weight (lbs)</label>
                <input type="number" class="form-control" id="itemWeight">
              </div>
            </div>
            <div class="col-sm-2">
              <div class="form-group form-group-default">
                <label for="itemPrice">Price</label>
                <input type="number" class="form-control" id="itemPrice">
              </div>
            </div>
          </div>
        </div>


        <div class="radio radio-primary p-t-20">
            <input type="radio" checked="checked" value="yes" name="radio3" id="radio3Yes">
            <label for="radio3Yes">Otto Pickup</label>
            <input type="radio" value="no" name="radio3" id="radio3No">
            <label for="radio3No">Deliver to Location</label>
        </div>

        <h6>Prices will be finalized when item is obtained.</h6>
        <br>

        <div class="checkbox check-primary">
            <!-- <input type="checkbox" checked="checked" value="1" id="checkbox3"> -->
            <input type="checkbox" value="1" id="checkbox3">
            <label for="checkbox3">I agree to <a href="http://ottoair.ca/v2.1/ch/terms.php">Terms and Services</a></label>
        </div>

        <button type="submit" class="btn btn-primary m-t-10">Submit</button>
      </form>
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
    <script type="text/javascript" src="assets/plugins/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="assets/plugins/jquery-appear/jquery.appear.js"></script>
    <script type="text/javascript" src="assets/plugins/animateNumber/jquery.animateNumbers.js"></script>
    <!-- END VENDOR JS -->
    <!-- BEGIN PAGES FRONTEND LIB -->
    <script type="text/javascript" src="pages/js/pages.frontend.js"></script>
    <!-- END PAGES LIB -->
    <!-- BEGIN YOUR CUSTOM JS -->
    <script type="text/javascript" src="assets/js/custom.js"></script>
    <!-- END PAGES LIB -->
  </body>
</html>
