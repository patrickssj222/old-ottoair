<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <meta charset="utf-8" />
    <title><?=$heading_title?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, shrink-to-fit=no" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
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
    <link href="<?=HTTP_SERVER?>assets/plugins/pace/pace-theme-flash.css" rel="stylesheet" type="text/css" />
    <link href="<?=HTTP_SERVER?>assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<?=HTTP_SERVER?>assets/plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="<?=HTTP_SERVER?>assets/plugins/jquery-scrollbar/jquery.scrollbar.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="<?=HTTP_SERVER?>assets/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="<?=HTTP_SERVER?>assets/plugins/switchery/css/switchery.min.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="<?=HTTP_SERVER?>pages/css/pages-icons.css" rel="stylesheet" type="text/css">
    <link class="main-stylesheet" href="<?=HTTP_SERVER?>pages/css/pages.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    window.onload = function()
    {
      // fix for windows 8
      if (navigator.appVersion.indexOf("Windows NT 6.2") != -1)
        document.head.innerHTML += '<link rel="stylesheet" type="text/css" href="<?=HTTP_SERVER?>pages/css/windows.chrome.fix.css" />'
    }
    </script>
    <style>
      .login-header {
        font-family: 'Montserrat', sans-serif;
        font-weight: bolder;
        color: #606060;
      }
    </style>
  </head>
  <body class="fixed-header ">
    <div class="login-wrapper ">
      <!-- START Login Background Pic Wrapper-->
      <div class="bg-pic">
        <!-- START Background Pic-->
        <img src="<?=HTTP_SERVER?>assets/img/demo/new-york-city-buildings-sunrise-morning-hd-wallpaper.jpg" data-src="<?=HTTP_SERVER?>assets/img/demo/new-york-city-buildings-sunrise-morning-hd-wallpaper.jpg" data-src-retina="<?=HTTP_SERVER?>assets/img/demo/new-york-city-buildings-sunrise-morning-hd-wallpaper.jpg" alt="" class="lazy">
        <!-- END Background Pic-->
        <!-- START Background Caption-->
        <div class="bg-caption pull-bottom sm-pull-bottom text-white p-l-20 m-b-20">
          <h2 class="semi-bold text-white"><?=$text_otto_group?></h2>
          <p class="small"><?=$text_copy_right?> <?=$text_rights_reserved?></p>
        </div>
        <!-- END Background Caption-->
      </div>
      <!-- END Login Background Pic Wrapper-->
      <!-- START Login Right Container-->
      <div class="login-container bg-white">
        <div class="p-l-50 m-l-20 p-r-50 m-r-20 p-t-50 m-t-30 sm-p-l-15 sm-p-r-15 sm-p-t-40">
          <!-- <img src="assets/img/logo.png" alt="logo" data-src="assets/img/logo.png" data-src-retina="assets/img/logo_2x.png" width="78" height="22"> -->
          <h3 class="m-t-10 login-header">OttoAir</h3>
          <p class="p-t-35"><?=$text_login?></p>
          <!-- START Login Form -->
          <?php if (!empty($error)) { ?>
          <div class="alert alert-danger" role="alert">
            <button class="close" data-dismiss="alert"></button> <i class="fa fa-exclamation-triangle"></i> <?=$error?>
          </div>
          <?php } ?>
          <form id="registerForm" action="<?=$url_login?>" class="p-t-15" role="form" method="post">
            <!-- START Form Control-->
            <div class="form-group form-group-default required">
              <label><?=$entry_username?></label>
              <div class="controls">
                <!-- <input type="text" name="username" value="+1 " class="form-control" required> -->
                <input type="text" name="username" id="phone" class="form-control" required>
              </div>
            </div>
            <!-- END Form Control-->
            <!-- START Form Control-->
            <div class="form-group form-group-default required">
              <label><?=$entry_password?></label>
              <div class="controls">
                <input type="password" name="password" id="password" class="form-control" name="password" required>
              </div>
            </div>
            <!-- START Form Control-->
            <div class="row">
              <div class="col-md-6 no-padding sm-p-l-10">
                <div class="checkbox ">
                  <input type="checkbox" value="1" id="checkbox3" name="keep_signed">
                  <label for="checkbox3"><?=$entry_keep_signedin?></label>
                </div>
              </div>
              <!-- <div class="col-md-6 d-flex align-items-center justify-content-end">
                <a href="#" class="text-info small">Help? Contact Support</a>
              </div> -->
            </div>
            <!-- END Form Control-->
            <button class="btn btn-primary btn-cons m-t-10" type="submit"><?=$button_login?></button>
            <p class="m-t-15"><?=$text_no_account?> <a href="<?=$url_register?>"><?=$button_register?></a></p>
          </form>

          <!--END Login Form-->
        </div>
      </div>
      <!-- END Login Right Container-->
    </div>
    <!-- BEGIN VENDOR JS -->
    <script src="<?=HTTP_SERVER?>assets/plugins/pace/pace.min.js" type="text/javascript"></script>
    <script src="<?=HTTP_SERVER?>assets/plugins/jquery/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="<?=HTTP_SERVER?>assets/plugins/modernizr.custom.js" type="text/javascript"></script>
    <script src="<?=HTTP_SERVER?>assets/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
    <script src="<?=HTTP_SERVER?>assets/plugins/tether/js/tether.min.js" type="text/javascript"></script>
    <script src="<?=HTTP_SERVER?>assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="<?=HTTP_SERVER?>assets/plugins/jquery/jquery-easy.js" type="text/javascript"></script>
    <script src="<?=HTTP_SERVER?>assets/plugins/jquery-unveil/jquery.unveil.min.js" type="text/javascript"></script>
    <script src="<?=HTTP_SERVER?>assets/plugins/jquery-ios-list/jquery.ioslist.min.js" type="text/javascript"></script>
    <script src="<?=HTTP_SERVER?>assets/plugins/jquery-actual/jquery.actual.min.js"></script>
    <script src="<?=HTTP_SERVER?>assets/plugins/jquery-scrollbar/jquery.scrollbar.min.js"></script>
    <script type="text/javascript" src="<?=HTTP_SERVER?>assets/plugins/select2/js/select2.full.min.js"></script>
    <script type="text/javascript" src="<?=HTTP_SERVER?>assets/plugins/classie/classie.js"></script>
    <script src="<?=HTTP_SERVER?>assets/plugins/switchery/js/switchery.min.js" type="text/javascript"></script>
    <script src="<?=HTTP_SERVER?>assets/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
    <!-- END VENDOR JS -->
    <script src="<?=HTTP_SERVER?>pages/js/pages.min.js"></script>
    <script type="text/javascript" src="<?=HTTP_SERVER?>../assets/js/scripts.js"></script>
  </body>
</html>
