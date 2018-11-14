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
    <style type="text/css">
      .modal-dialog {
        max-width: 1000px;
      }
      .register-header {
        font-family: 'Montserrat', sans-serif;
        font-weight: bolder;
        color: #606060;
      }
      .terms {
        border: 3px solid #e5e5e5;
        transition: .35s ease-in-out;
      }
      .terms:focus {
        border: 3px solid #b7b7b7;
        transition: .35s ease-in-out;
      }
      .form-select {
        padding-top: 1em;
      }
      label {
        padding-right: 10px;
      }
      .cs-placeholder {
        /* padding-top: 0 !important; */
        /* height: 50px; */
      }
      .cs-select {
        height: 55px;
      }
      .cs-backdrop {
        border:none;
      }
      div.cs-skin-slide {
        font-family: inherit;
      }
      .login-container {
        overflow-y: auto;
        padding-bottom: 50px;
      }
    </style>
  </head>
  <body class="fixed-header ">
    <div class="login-wrapper ">
      <!-- START Register Background Pic Wrapper-->
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
      <!-- END Register Background Pic Wrapper-->
      <!-- START Login Right Container-->
      <div class="login-container bg-white">
        <div class="p-l-50 m-l-20 p-r-50 m-r-20 p-t-50 m-t-30 sm-p-l-15 sm-p-r-15 sm-p-t-40">
          <!-- <img src="assets/img/logo.png" alt="logo" data-src="assets/img/logo.png" data-src-retina="assets/img/logo_2x.png" width="78" height="22"> -->
          <h3 class="m-t-10 register-header">OttoAir</h3>
          <p class="p-t-35"><?=$text_register?></p>
          <!-- START Login Form -->
          <?php if (!empty($error)) { ?>
          <div class="alert alert-danger" role="alert">
            <button class="close" data-dismiss="alert"></button> <i class="fa fa-exclamation-triangle"></i> <?=$error?>
          </div>
          <?php } ?>
          <form id="registerForm" action="<?=$url_register?>" class="p-t-15" role="form" method="post">

            <!-- MODAL FOR PAYMENT START -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="pg-close fs-14"></i>
                    </button>
                    <h5>User <span class="semi-bold">Agreement</span></h5>
                    <br>
                  </div>
                  <div class="modal-body">
                    <div class="row m-t-15">
                      <div class="col-md-9 m-b-10">
                        <p>Please take some time to review our user agreements:</p>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <textarea class="terms" style="font-family: 'Montserrat', sans-serif; width:100%; padding: 25px;" rows="20" readonly><?=$user_agreements?></textarea>
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" style="width:120px">I Agree</button>
                  </div>
                </div>
              </div>
            </div>
            <!-- END -->




            <!-- START Form Control-->
            <div class="row">
              <div class="col-md-6">
                <div class="form-group form-group-default required">
                  <label><?=$entry_firstname?></label>
                  <input type="text" name="firstname" id="fname" class="form-control" value="<?php if (!empty($firstname)) echo $firstname; ?>" required>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group form-group-default required">
                  <label><?=$entry_lastname?></label>
                  <input type="text" name="lastname" id="lname" class="form-control" value="<?php if (!empty($lastname)) echo $lastname; ?>" required>
                </div>
              </div>
            </div>


            <div class="form-group form-group-default">
              <label><?=$entry_wechat?></label>
              <div class="controls">
                <!-- <input type="text" name="username" value="+1 " class="form-control" required> -->
                <input type="text" name="wechat" id="wechat" class="form-control" value="<?php if (!empty($wechat)) echo $wechat; ?>">
              </div>
            </div>
            <div class="form-group form-group-default required">
              <label><?=$entry_email?></label>
              <div class="controls">
                <!-- <input type="text" name="username" value="+1 " class="form-control" required> -->
                <input type="text" name="email" id="email" class="form-control" value="<?php if (!empty($email)) echo $email; ?>" required>
              </div>
            </div>
            <div class="form-group form-group-default required">
              <label><?=$entry_username?></label>
              <div class="controls">
                <!-- <input type="text" name="username" value="+1 " class="form-control" required> -->
                <input type="text" name="phone" id="phone" class="form-control" value="<?php if (!empty($phone)) echo $phone; ?>" required>
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

            <div class="form-group form-group-default required">
              <label><?=$text_region_select?></label>
              <div class="controls">
                <select id="region-select" name="region" class="form-control full-width cs-select cs-skin-slide" data-init-plugin="cs-select" required>

                  <?php if (empty($region)) { ?>
                  <option value="" selected disabled><?=$text_please_select?></option>
                  <?php } else { ?>
                  <option value=""><?=$text_please_select?></option>
                  <?php } ?>

                  <?php foreach ($regions as $r => $v) { ?>
                    <?php if (!empty($region) && $region == $v) { ?>
                    <option value="<?=$v?>" selected><?=$r?></option>
                    <?php } else { ?>
                    <option value="<?=$v?>"><?=$r?></option>
                    <?php } ?>
                  <?php } ?>

                </select>
              </div>
            </div>

            <!-- START Form Control-->
            <div class="row">
              <div class="col-md-6 no-padding sm-p-l-10">
                <div class="checkbox ">
                  <input type="checkbox" value="1" id="checkbox3" name="keep_signed" <?php if (!empty($keep_signed)) echo 'checked'; ?>>
                  <label for="checkbox3"><?=$entry_keep_signedin?></label>
                </div>
              </div>
              <!-- <div class="col-md-6 d-flex align-items-center justify-content-end">
                <a href="#" class="text-info small">Help? Contact Support</a>
              </div> -->
            </div>
            <!-- END Form Control-->
            <!-- <button id="registerButton" class="btn btn-primary btn-cons m-t-10" type="submit"><?=$button_register?></button> -->

            <button id="registerButton" class="btn btn-primary btn-cons m-t-10" type="button"><?=$button_register?></button>

            <p class="m-t-15"><?=$text_registered?> <a href="login"><?=$button_login?></a></p>
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

    <script>

        $('#registerButton').click(function(){
          $('#exampleModal').modal('show')
        })

    </script>
  </body>
</html>
