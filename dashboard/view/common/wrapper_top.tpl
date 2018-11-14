<!DOCTYPE html>

<style type="text/css">

    .nav-header {
      font-family: 'Montserrat', sans-serif;
      font-weight: bolder;
      color: #606060;
    }

    @media (min-width: 992px) {
      .nav-header {
          padding-left: 1.5em;
      }
    }

</style>

<html lang="<?=$_SESSION['user_language']?>">
  <head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <meta charset="utf-8" />
    <title><?=$heading_title?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, shrink-to-fit=no" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <link rel="apple-touch-icon" href="<?=HTTP_SERVER?>pages/ico/60.png">
    <link rel="apple-touch-icon" sizes="76x76" href="<?=HTTP_SERVER?>pages/ico/76.png">
    <link rel="apple-touch-icon" sizes="120x120" href="<?=HTTP_SERVER?>pages/ico/120.png">
    <link rel="apple-touch-icon" sizes="152x152" href="<?=HTTP_SERVER?>pages/ico/152.png">
    <link rel="icon" type="image/x-icon" href="<?=HTTP_SERVER?>favicon.ico" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="default">
    <meta content="" name="description" />
    <meta content="" name="author" />
    <link href="<?=HTTP_SERVER?>assets/plugins/pace/pace-theme-minimal.css" rel="stylesheet" type="text/css" />
    <link href="<?=HTTP_SERVER?>assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<?=HTTP_SERVER?>assets/plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="<?=HTTP_SERVER?>assets/plugins/jquery-scrollbar/jquery.scrollbar.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="<?=HTTP_SERVER?>assets/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="<?=HTTP_SERVER?>assets/plugins/switchery/css/switchery.min.css" rel="stylesheet" type="text/css" media="screen" />

    <link href="<?=HTTP_SERVER?>pages/css/pages-icons.css" rel="stylesheet" type="text/css">
    <script src="<?=HTTP_SERVER?>assets/plugins/jquery/jquery-1.11.1.min.js" type="text/javascript"></script>
    <?php echo !empty($head)? $head : ''; ?>
    <link class="main-stylesheet" href="<?=HTTP_SERVER?>pages/css/pages.css" rel="stylesheet" type="text/css" />
    <link href="<?=HTTP_SERVER?>pages/css/custom.css" rel="stylesheet" type="text/css" />
  </head>
  <body class="fixed-header <?=str_replace('/', '-', $_SESSION['request_path'])?>">
    <!-- BEGIN SIDEBPANEL-->
    <?=$sidebar?>
    <!-- END SIDEBAR -->
    <!-- END SIDEBPANEL-->
    <!-- START PAGE-CONTAINER -->



    <div class="page-container ">
      <!-- START HEADER -->
      <div class="header" style="z-index: 200">
        <!-- START MOBILE SIDEBAR TOGGLE -->
        <a href="#" class="btn-link toggle-sidebar hidden-lg-up pg pg-menu" data-toggle="sidebar">
        </a>
        <!-- END MOBILE SIDEBAR TOGGLE -->
        <div class="">
          <div class="brand inline">
            <a href="<?=HTTP_FRONT?>">
              <!-- <img src="assets/img/logo.png" alt="logo" data-src="assets/img/logo.png" data-src-retina="assets/img/logo_2x.png" width="88" height="22"> -->
              <h3 class="m-t-10 nav-header">OttoAir</h3>

            </a>
          </div>
          <!-- START NOTIFICATION LIST -->
<?php /**
          <ul class="hidden-md-down notification-list no-margin hidden-sm-down b-grey b-l b-r no-style p-l-30 p-r-20">
            <li class="p-r-10 inline">
              <div class="dropdown">
                <a href="javascript:;" id="notification-center" class="header-icon pg pg-world" data-toggle="dropdown">
                  <span class="bubble"></span>
                </a>


                <!-- START Notification Dropdown -->
                <div class="dropdown-menu notification-toggle" role="menu" aria-labelledby="notification-center">
                  <!-- START Notification -->
                  <div class="notification-panel">
                    <!-- START Notification Body-->
                    <div class="notification-body scrollable">
                      <!-- START Notification Item-->
                      <div class="notification-item unread clearfix">
                        <!-- START Notification Item-->
                        <div class="heading open">
                          <a href="#" class="text-complete pull-left">
                            <i class="pg-map fs-16 m-r-10"></i>
                            <span class="bold">Carrot Design</span>
                            <span class="fs-12 m-l-10">David Nester</span>
                          </a>
                          <div class="pull-right">
                            <div class="thumbnail-wrapper d16 circular inline m-t-15 m-r-10 toggle-more-details">
                              <div><i class="fa fa-angle-left"></i>
                              </div>
                            </div>
                            <span class=" time">few sec ago</span>
                          </div>
                          <div class="more-details">
                            <div class="more-details-inner">
                              <h5 class="semi-bold fs-16">“Apple’s Motivation - Innovation <br>
                                                            distinguishes between <br>
                                                            A leader and a follower.”</h5>
                              <p class="small hint-text">
                                Commented on john Smiths wall.
                                <br> via pages framework.
                              </p>
                            </div>
                          </div>
                        </div>
                        <!-- END Notification Item-->
                        <!-- START Notification Item Right Side-->
                        <div class="option" data-toggle="tooltip" data-placement="left" title="mark as read">
                          <a href="#" class="mark"></a>
                        </div>
                        <!-- END Notification Item Right Side-->
                      </div>
                      <!-- START Notification Body-->
                      <!-- START Notification Item-->
                      <div class="notification-item  clearfix">
                        <div class="heading">
                          <a href="#" class="text-danger pull-left">
                            <i class="fa fa-exclamation-triangle m-r-10"></i>
                            <span class="bold">98% Server Load</span>
                            <span class="fs-12 m-l-10">Take Action</span>
                          </a>
                          <span class="pull-right time">2 mins ago</span>
                        </div>
                        <!-- START Notification Item Right Side-->
                        <div class="option">
                          <a href="#" class="mark"></a>
                        </div>
                        <!-- END Notification Item Right Side-->
                      </div>
                      <!-- END Notification Item-->
                      <!-- START Notification Item-->
                      <div class="notification-item  clearfix">
                        <div class="heading">
                          <a href="#" class="text-warning-dark pull-left">
                            <i class="fa fa-exclamation-triangle m-r-10"></i>
                            <span class="bold">Warning Notification</span>
                            <span class="fs-12 m-l-10">Buy Now</span>
                          </a>
                          <span class="pull-right time">yesterday</span>
                        </div>
                        <!-- START Notification Item Right Side-->
                        <div class="option">
                          <a href="#" class="mark"></a>
                        </div>
                        <!-- END Notification Item Right Side-->
                      </div>
                      <!-- END Notification Item-->
                      <!-- START Notification Item-->
                      <div class="notification-item unread clearfix">
                        <div class="heading">
                          <div class="thumbnail-wrapper d24 circular b-white m-r-5 b-a b-white m-t-10 m-r-10">
                            <img width="30" height="30" data-src-retina="assets/img/profiles/1x.jpg" data-src="assets/img/profiles/1.jpg" alt="" src="assets/img/profiles/1.jpg">
                          </div>
                          <a href="#" class="text-complete pull-left">
                            <span class="bold">Revox Design Labs</span>
                            <span class="fs-12 m-l-10">Owners</span>
                          </a>
                          <span class="pull-right time">11:00pm</span>
                        </div>
                        <!-- START Notification Item Right Side-->
                        <div class="option" data-toggle="tooltip" data-placement="left" title="mark as read">
                          <a href="#" class="mark"></a>
                        </div>
                        <!-- END Notification Item Right Side-->
                      </div>
                      <!-- END Notification Item-->
                    </div>
                    <!-- END Notification Body-->
                    <!-- START Notification Footer-->
                    <div class="notification-footer text-center">
                      <a href="#" class="">Read all notifications</a>
                      <a data-toggle="refresh" class="portlet-refresh text-black pull-right" href="#">
                        <i class="pg-refresh_new"></i>
                      </a>
                    </div>
                    <!-- START Notification Footer-->
                  </div>
                  <!-- END Notification -->
                </div>
                <!-- END Notification Dropdown -->




              </div>
            </li>
          </ul>
*/  ?>
          <!-- END NOTIFICATIONS LIST -->
          <!-- <a href="#" class="search-link hidden-md-down" data-toggle="search"><i class="pg-search"></i>Type anywhere to <span class="bold">search</span></a> -->
          <ul class="hidden-md-down notification-list no-margin hidden-sm-down b-grey b-l b-r no-style p-l-30 p-r-20">
            <li class="p-r-10 inline">
              <h5 class="">Account # - OA<?php echo str_pad($text_user_id, 4, '0', STR_PAD_LEFT);?></h5>
            </li>
          </ul>
        </div>

        <!-- Language select -->
        <div class="d-flex align-items-center">

          <div class="pull-left fs-14 m-r-15 font-heading hidden-md-down" >
          <!-- <select class="cs-select cs-skin-slide m-r-30" data-init-plugin="cs-select"> -->

            <select id="languages" style="width:100px;z-index: 2">
              <?php foreach ($languages as $l) { ?>
                <option value="<?=$l['code']?>" <?php if($l['code']===$user_language){ ?>selected<?php } ?>><?=$l['name']?></option>
              <?php } ?>
            </select>
            <script type="text/javascript">
              $(document).ready(function(){
                $('#languages').select2({
                    minimumResultsForSearch: -1 //Hide search
                });
              });
              $('#languages').change(function() {
                window.location = '<?=$url_language?>/' + this.value + '?redirect=' + encodeURIComponent(window.location.href);
              });
            </script>

          </div>

          <!-- START User Info-->
          <div id="nameDropdown" class="pull-left p-r-10 fs-14 font-heading hidden-md-down"><?=$text_welcome_user?></div>
          <div class="dropdown pull-right hidden-md-down">
            <button class="profile-dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <span class="thumbnail-wrapper d32 circular inline">
                <div style="background:url('<?=$image_profile?>') center no-repeat;background-size: cover;width: 32px;height: 32px"></div>
              </span>
            </button>
            <div class="dropdown-menu dropdown-menu-right profile-dropdown" role="menu">
              <a href="<?=$url_setting?>" class="clearfix dropdown-item">
                <span class="pull-left"><?=$text_setting?></span>
                <span class="pull-right"><i class="pg-settings_small"></i></span>
              </a>
              <a href="<?=$url_logout?>" class="clearfix bg-master-lighter dropdown-item">
                <span class="pull-left"><?=$text_log_out?></span>
                <span class="pull-right"><i class="pg-power"></i></span>
              </a>
            </div>
          </div>
          <!-- END User Info-->
        </div>
      </div>
      <!-- END HEADER -->

      <!-- START PAGE CONTENT WRAPPER -->
      <div class="page-content-wrapper ">
        <!-- START PAGE CONTENT -->
        <div class="content ">
          <!-- START JUMBOTRON -->
          <div class="jumbotron" data-pages="parallax">
            <div class=" container-fluid   container-fixed-lg sm-p-l-0 sm-p-r-0">
              <div class="inner">

                <!-- START BREADCRUMB -->
                <ol class="breadcrumb">
                  <?php foreach ($breadcrumb as $b => $href) { ?>
                    <?php if ($b == $page_name) { ?>
                      <li class="breadcrumb-item active"><?=$b?></li>
                    <?php } else { ?>
                      <li class="breadcrumb-item"><a href="<?=$href?>"><?=$b?></a></li>
                    <?php } ?>
                  <?php } ?>
                </ol>
                <!-- END BREADCRUMB -->
              </div>
            </div>
          </div>
          <!-- END JUMBOTRON -->
