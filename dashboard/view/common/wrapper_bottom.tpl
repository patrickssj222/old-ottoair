
        </div>
        <!-- END PAGE CONTENT -->

        <!-- START COPYRIGHT -->
        <!-- START CONTAINER FLUID -->
        <!-- START CONTAINER FLUID -->
        <div class=" container-fluid  container-fixed-lg footer">
          <div class="copyright sm-text-center">
            <p class="small no-margin pull-left sm-pull-reset">
              <span class="hint-text"><?=$text_copy_right?></span>
              <span class="font-montserrat"><?=$text_otto_group?></span>.
              <span class="hint-text"><?=$text_rights_reserved?></span>
              <span class="sm-block">
                <a href="<?=$url_terms?>" class="m-l-10 m-r-10"><?=$text_terms?></a>
                <span class="muted">|</span>
                <a href="<?=$url_privacy?>" class="m-l-10"><?=$text_privacy?></a>
              </span>
            </p>
            <div class="clearfix"></div>
          </div>
        </div>
        <!-- END COPYRIGHT -->
      </div>
      <!-- END PAGE CONTENT WRAPPER -->
    </div>
    <!-- END PAGE CONTAINER -->
    <!-- BEGIN VENDOR JS -->
    <script src="<?=HTTP_SERVER?>assets/plugins/pace/pace.min.js" type="text/javascript"></script>
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
    <!-- END VENDOR JS -->
    <!-- BEGIN CORE TEMPLATE JS -->
    <script src="<?=HTTP_SERVER?>pages/js/pages.min.js"></script>
    <!-- END CORE TEMPLATE JS -->
    <?php echo !empty($foot)? $foot : ''; ?>
    <script src="<?=HTTP_SERVER?>assets/js/scripts.js" type="text/javascript"></script>
    <script src="<?=HTTP_SERVER?>pages/js/custom.js" type="text/javascript"></script>
  </body>
</html>
