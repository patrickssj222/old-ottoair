<?=$wrapper_top?>

<style type="text/css">
  table tr {
    border-top: 1px solid #eee;
  }
  table tr:last-child {
    border-bottom: 1px solid #eee;
  }
  table td {
    padding: 7px;
  }
  h6 {
    font-weight: 400;
  }
</style>
<div class=" container-fluid container-fixed-lg bg-white">
  <!-- START card -->

  <div class="card card-transparent">
    <div class="card-header ">
      <div class="card-title"><?=$heading_title?>
      </div>

    </div>
    <div class="card-block">
      <div class="row row-same-height">

          <!-- BEGIN FORM -->
          <div class="col-md-8 b-r b-dashed b-grey">
              <div class="card-block">
                <div class="row">
                  <div class="col-md-6">
                    <h6><?=$text_flight_info?></h6>
                    <div id="summary-flight">
                      <h4><?=$flight['flight_number']?></h4>
                      <p><?=sprintf($text_leave_on, substr($flight['date_departure'], 0, 10))?></p>
                      <p><?=sprintf($text_return_on, substr($flight['date_arrival'], 0, 10))?></p>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <h6><?=$text_your_info?></h6>
                    <div id="summary-flyer">
                      <h4><?=$flight['name']?></h4>
                      <p><?=$flight['passport']?></p>
                      <p><?=sprintf($text_carry_luggage, $flight['luggage'])?></p>
                    </div>
                  </div>
                </div>
                <div class="row m-t-30">
                  <div class="col-md-6">
                    <h6><?=$text_departure?></h6>
                    <div id="summary-departure">
                      <h4><?=$flight['departure_name']?></h4>
                      <p>(<?=$flight['departure_code']?>)</p>
                      <!-- <p><?=$flight['date_departure']?></p> -->
                    </div>
                  </div>
                  <!-- <div class="col-md-1 m-t-30">
                    <i class="fa fa-arrow-right"></i>
                  </div> -->
                  <div class="col-md-6">
                    <h6><?=$text_arrival?></h6>
                    <div id="summary-arival">
                      <h4><?=$flight['arrival_name']?></h4>
                      <p>(<?=$flight['arrival_code']?>)</p>
                      <!-- <p><?=$flight['date_arrival']?></p> -->
                    </div>
                  </div>
                </div>
                <div class="row m-t-30">
                  <?php if ($flight['identification_image']) { ?>
                  <div class="col-lg-6">
                    <h6><?=$entry_identification_image?></h6>
                    <a class="image-preview" href="<?=HTTP_SERVER . $flight['identification_image']?>" target="_blank"><img src="<?=HTTP_SERVER . $flight['identification_image']?>"/></a>
                  </div>
                  <?php } ?>
                  <?php if ($flight['ticket_image']) { ?>
                  <div class="col-lg-6">
                    <h6><?=$entry_ticket_image?></h6>
                    <a class="image-preview" href="<?=HTTP_SERVER . $flight['ticket_image']?>" target="_blank"><img src="<?=HTTP_SERVER . $flight['ticket_image']?>"/></a>
                  </div>
                  <?php } ?>
                </div>
                <div class="row m-t-30">
                  <div class="col-md-12">
                    <h6><?=$text_status?></h6>
                    <table id="statuses" width="100%">
                    <thead>
                      <tr>
                        <td><?=$column_status_desc?></td>
                        <td class="text-right"><?=$column_status_time?></td>
                      </tr>
                    </thead>
                    <tbody>
                      <?php // Tell user to pay if not paid
                      if ($balance > 0) { ?>
                        <?php // Print the first record. Typically this is 'pending'
                        if ($first_track = array_pop($statuses)) { ?>
                          <tr>
                            <td><?=$first_track['description']?></td>
                            <td class="text-right"><?=$first_track['date_added']?></td>
                          </tr>
                        <?php } ?>
                        <tr>
                          <td colspan="2" class="text-center"><?=$desc_show_when_paid?></td>
                        </tr>
                      <?php } else if (count($statuses) === 0) { ?>
                        <tr>
                          <td colspan="2" class="text-center"><?=$desc_no_tracking?></td>
                        </tr>
                      <?php } else { ?>
                        <?php foreach ($statuses as $track) { ?>
                          <tr>
                            <td><?=$track['description']?></td>
                            <td class="text-right"><?=$track['date_added']?></td>
                          </tr>
                        <?php } ?>
                      <?php } ?>
                    </tbody>
                    </table>
                  </div>
                </div>


              </div>
          </div>
          <!-- END FORM -->

          <div class="col-md-4">
            <div class="padding-30 sm-padding-5 sm-m-t-15">
              <h2><?=$text_summary?></h2>
              <p><?=$text_flight_summary?></p>
              <br>
              <!-- <h6><?=$text_estimated_price?></6> -->
              <h5><?php echo sprintf($text_total_price, number_format($flight['full_price'], 2)); ?></h5>
              <h5><?php echo sprintf($text_you_pay, number_format($flight['price'], 2)); ?></h5>
              <?php if ($balance >= 0) { ?>
                <h5 style="padding-top: 12px; border-top: 1px solid #eeeeee;"><?php echo sprintf($text_balance, number_format($balance, 2)); ?></h5>
              <?php } else if ($balance < 0) { ?>
                <h5 style="padding-top: 12px; border-top: 1px solid #eeeeee;"><?php echo sprintf($text_credit2, number_format(abs($balance), 2)); ?></h5>
              <?php } ?>

              <?php if ($flight['source'] === 'ot-to') { ?>
              <p class="small hint-text m-t-30"><?=$text_our_rate_otto?></p>
              <?php } else if ($flight['source'] === 'existing') { ?>
              <p class="small hint-text m-t-30"><?=$text_our_rate_existing?></p>
              <?php } ?>
            </div>
          </div>

        </div>
        <div class="padding-20 sm-padding-5 sm-m-b-20 sm-m-t-20 bg-white clearfix">
            <?php if ($balance >= 0) { ?>
            <!-- <button class="btn btn-success btn-cons btn-animated from-left fa fa-credit-card pull-right" type="button" data-toggle="modal" data-target="#myModal">
              <span><?=$button_pay_now?></span>
            </button> -->
            <?php } ?>
            <a href="<?=$url_flights?>">
              <button class="btn btn-default btn-cons btn-animated from-left fa fa-arrow-left pull-right" type="button">
                <span><?=$button_back?></span>
              </button>
            </a>
        </div>
    </div>
  </div>
  <!-- END card -->
</div>

<?=$wrapper_bottom?>
