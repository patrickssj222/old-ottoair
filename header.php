<nav class="header bg-header transparent-light " data-pages="header" data-pages-header="autoresize" data-pages-resize-class="dark">
  <div class="container relative">
    <!-- BEGIN LEFT CONTENT -->
    <div class="pull-left">
      <!-- .header-inner Allows to vertically Align elements to the Center-->
      <div class="header-inner">
        <!-- BEGIN LOGO -->
        <a href="/">
          <!-- <img src="assets/images/logo_white.png" width="152" height="21" data-src-retina="assets/images/logo_white_2x.png" alt=""> -->
          <h3 class="m-t-25" style="font-family: 'Montserrat', sans-serif; font-weight:bolder;color:#dbdbdb">OttoAir</h3>
        </a>
      </div>
    </div>



    <!-- BEGIN HEADER TOGGLE FOR MOBILE & TABLET -->
    <!-- <div class="pull-right">
      <div class="header-inner">
        <div class="visible-sm-inline visible-xs-inline menu-toggler pull-right p-l-10" data-pages="header-toggle" data-pages-element="#header">
          <div class="one"></div>
          <div class="two"></div>
          <div class="three"></div>
        </div>
      </div>
    </div> -->
    <!-- END HEADER TOGGLE FOR MOBILE & TABLET -->





    <!-- BEGIN RIGHT CONTENT -->
    <!-- <div class="pull-right menu-content clearfix" data-pages-direction="slideRight" id="header"> -->
    <div class="pull-right clearfix" id="header">
      <!-- BEGIN HEADER CLOSE TOGGLE FOR MOBILE -->
      <!-- <div class="pull-right">
        <a href="#" class="padding-10 visible-xs-inline visible-sm-inline pull-right m-t-10 m-b-10 m-r-10" data-pages="header-toggle" data-pages-element="#header">
          <i class=" pg-close_line"></i>
        </a>
      </div> -->
      <!-- END HEADER CLOSE TOGGLE FOR MOBILE -->
      <!-- BEGIN MENU ITEMS -->
      <div class="header-inner">
        <ul class="menu">

          <?php
            if(isset($_SESSION['user_username'])){
              $sql = "SELECT firstname FROM ot_user WHERE phone = '".$_SESSION['user_username']."'";
              $result = mysqli_query($db, $sql);
              $name = mysqli_fetch_assoc($result);
              echo '<li>';

              // if($_SESSION['user_language'] == 'ch'){
              //   echo '<a class="btn btn-sm btn-bordered fs-12 btn-white" href="ch/dashboard/index.php">';
              // } else {
                echo '<a class="btn btn-sm btn-bordered fs-12 btn-white" href="dashboard/">';
              // }


                echo'
                  <i class="fa fa-user-circle-o" aria-hidden="true"></i> '. $name['firstname'] .'
                </a>
              </li>';
            } else {
              echo '<li>
		<a href="dashboard/account/register" class="btn btn-sm btn-bordered fs-12 btn-white">Sign Up</a>
              </li>';
            }

          ?>

        </ul>
      </div>
      <!-- END MENU ITEMS -->
    </div>
  </div>
</nav>


<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"><i class="fa fa-user-circle" aria-hidden="true"></i> Log In</h4>
      </div>
      <div class="modal-body">
        <form role="form" id="loginForm">
          <div class="form-group form-group-default m-t-30 ">
              <label>Phone</label>
              <!-- <input type="text" name="phone" id="phone" class="form-control" value="+1&nbsp;" required> -->
              <input type="text" name="phone" id="phone" class="form-control" required>
          </div>
          <div class="form-group form-group-default ">
              <label>Password</label>
              <input type="password" name="password" id="password" class="form-control" required>
          </div>

          <div class="checkbox check-primary checkbox-circle m-t-20">
              <input type="checkbox" value="1" id="checkbox9">
              <label for="checkbox9">Remember me</label>
              <!-- <p style="float:right;text-align:right; font-size:0.9em;"><a href="#">Forgot Password?</a></p> -->
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <!-- <button type="button" id="loginButton" class="btn btn-primary" data-dismiss="modal" style="width:100%">Log In <i class="fa fa-angle-right" aria-hidden="true"></i></button> -->
        <button type="button" id="loginButton" class="btn btn-primary" style="width:100%;line-height:200%;">Log In <i class="fa fa-angle-right" aria-hidden="true"></i></button>
        <p id="login-border" class="m-t-20">By using Otto services, I agree to <a href="#">Terms & Services</a></p>
        <p class="m-t-20">No account? <a href="dashboard/account/register">Register</a></p>
      </div>
    </div>
  </div>
</div>
