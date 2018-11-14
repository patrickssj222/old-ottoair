<?=$wrapper_top?>

<style type="text/css">
  .home .widget.card:before {
    background-image: url(<?=HTTP_SERVER?>pages/img/linear_gradient.png);
    background-repeat: repeat-x;
    content: " ";
    left: 0;
    right: 0;
    height: 325px;
    bottom: 0;
    position: absolute;
    z-index: 2;
  }
  .home .widget.card .widget-background {
    background-position: left center;
    background-size: cover;
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    opacity: 0.69;
  }
  .home .widget.card .widget-background ~ * {
    z-index: 3;
  }
  .home .widget.card span.label {
    background-color: rgba(255, 255, 255, 0.3);
    color: #fff;
  }
  .home .widget.card p.hint-text {
    opacity: 0;
    transition: 0.5s;
    max-height: 0;
    margin: 0;
  }
  .home .widget.card:hover p.hint-text {
    opacity: 0.6;
    max-height: 100px;
  }
</style>

<!-- START CONTAINER FLUID -->
<div class="container-fluid padding-25 sm-padding-10">
  <!-- START ROW -->
  <div class="row">
    <div class="col-lg-9 col-xlg-6">
      <div class="row">

        <?php foreach ($blocks as $b) { ?>
        <div class="<?=(!empty($b['class']) ? $b['class'] : 'col-xs-12')?>">
            <div class="ar-1-2" style="cursor:pointer" onclick="location.href='<?=(!empty($b['href']) ? $b['href'] : '#')?>'">
              <!-- START WIDGET widget_imageWidgetBasic-->
              <div class="widget card no-border bg-primary widget widget-loader-circle-lg no-margin">
                <div class="widget-background" style="background-image:url('<?=$b['background-image']?>');"></div>
                <div class="card-header ">
                  <div class="card-controls">
                    <ul>
                      <li><a href="#" class="card-refresh" data-toggle="refresh"><i class="card-icon card-icon-refresh-lg-white"></i></a>
                      </li>
                    </ul>
                  </div>
                </div>

                <div class="card-block">
                  <div class="pull-bottom bottom-left bottom-right padding-25">
                    <span class="label font-montserrat fs-11" style="text-transform:uppercase;"><?=$b['label']?></span>
                    <br>
                    <h3 class="text-white"><?=$b['title']?></h3>
                    <p class="text-white hint-text"><?=$b['summary']?></p>
                  </div>
                </div>
              </div>
            <!-- END WIDGET -->
            </div>
        </div>
        <?php } ?>


      </div>
    </div>
  </div>
  <!-- END ROW -->
</div>

<?=$wrapper_bottom?>
