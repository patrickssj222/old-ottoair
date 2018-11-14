<?=$wrapper_top?>
<!-- START CONTAINER FLUID -->
<div class=" container-fluid   container-fixed-lg bg-white">
  <!-- START card -->

  <div class="card card-transparent">
    <div class="card-header ">
      <div class="card-title"><?=$text_your_flights?>
      </div>
      <a href="<?=$url_add?>" class="btn btn-success btn-cons pull-right" style="margin-left:20px"><?=$button_existing?></a>
      <a href="<?=$url_buy?>" class="btn btn-success btn-cons pull-right" style="margin-left:20px"><?=$button_buy?></a>

    </div>
    <div class="card-block">
      <div class="table-responsive">
        <table class="table table-hover" id="basicTable">
          <thead>
            <tr>
              <th style="width:1%; display:none" class="text-center">
                <button class="btn btn-link"><i class="pg-trash"></i>
                </button>
              </th>
              <th style="width:6%"><?=$column_flight_id?></th>
              <th style="width:8%"><?=$column_flight_number?></th>
              <th style="width:18%"><?=$column_departure?></th>
              <th style="width:18%"><?=$column_arrival?></th>
              <th style="width:8%"><?=$column_luggage?></th>
              <th style="width:9%"><?=$column_status?></th>
              <th style="width:10%"><?=$column_price?></th>
              <th style="width:10%"><?=$column_balance?></th>
              <th style="width:10%"><?=$column_action?></th>
            </tr>
          </thead>
          <tbody>

            <?php
              foreach ($flights as $f) { ?>
                <tr>
                  <td class="v-align-middle" id="flightCheckbox">
                    <div class="checkbox text-center">
                      <input type="checkbox" value="<?=$f['flight_id']?>" id="checkbox1">
                      <label for="checkbox1" class="no-padding no-margin"></label>
                    </div>
                  </td>
                  <td class="v-align-middle ">
                    <p>FT<?php echo str_pad($f['flight_id'], 4, '0', STR_PAD_LEFT); ?></p>
                  </td>
                  <td class="v-align-middle ">
                    <p><?php if ($f['flight_number'] == '') echo 'In Progress'; else echo $f['flight_number'];?></p>
                  </td>
                  <td class="v-align-middle">
                    <p><?=$f['departure_name']?> (<?=$f['departure_code']?>)<br/>
                      <!-- <?=$f['date_departure']?> -->
                      <?php if (substr($f['date_departure'], 0, 1) == 0) echo 'pending'; else echo substr($f['date_departure'], 0, 10);?>
                    </p>
                  </td>
                  <td class="v-align-middle">
                    <p><?=$f['arrival_name']?> (<?=$f['arrival_code']?>)<br/>
                    	<!-- <?=$f['date_arrival']?> -->
                    	<?php if (substr($f['date_arrival'], 0, 1) == 0) echo 'pending'; else echo substr($f['date_arrival'], 0, 10);?>
                    </p>
                  </td>
                  <td class="v-align-middle">
                    <p><?=$f['luggage']?></p>
                  </td>
                  <td class="v-align-middle">
                    <p><?=$f['status']?></p>
                  </td>
                  <td class="v-align-middle">
                    <p>$<?=number_format((float)$f['price'], 2, '.', ',')?></p>
                  </td>
                  <td class="v-align-middle">

                    <?php if ($f['source'] === 'ot-to') { ?>
                      <?php if ((float)$f['price'] <= (float)$f['payment']) { ?>
                        $<?php echo number_format((float)$f['price'] - (float)$f['payment'], 2); ?> <br/><?=$text_paid?>
                      <?php } else { ?>
                        <span style="cursor:pointer;" data-toggle="modal" data-target="#myModal<?=$f['flight_id']?>">$<?php echo number_format((float)$f['price'] - (float)$f['payment'], 2); ?> <br/><a href="<?=$f['url_detail_pay']?>"><?=$button_pay_now?></a></span>
                      <?php } ?>

                    <?php } else if ($f['source'] === 'existing') { ?>
                      $<?php echo number_format((float)$f['payment'] - (float)$f['price'], 2); ?>&nbsp;
                      <?php if ((float)$f['price'] <= (float)$f['payment']) { ?>
                        <br/><?=$text_credit?>
                      <?php } ?>

                    <?php } ?>

                  </td>
                  <td class="v-align-middle">
                    <a href="<?=$f['url_detail']?>"><?=$button_detail?></a>
                  </td>
                </tr>
              <?php } ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  <!-- END card -->
</div>
<!-- END CONTAINER FLUID -->
<?=$wrapper_bottom?>
