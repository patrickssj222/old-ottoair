<?=$wrapper_top?>

<div class=" container-fluid   container-fixed-lg bg-white">
  <!-- START card -->

  <div class="card card-transparent">
    <div class="card-header ">
      <div class="card-title"><?=$text_your_shipments?>
      </div>
      <a href="<?=$url_create?>" class="btn btn-success btn-cons pull-right" style="margin-left:20px"><?=$button_create?></a>

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
              <th style="width:7%"><?=$column_shipment_id?></th>
              <th style="width:12%"><?=$column_date?></th>
              <th style="width:20%"><?=$column_receiver?></th>
              <th style="width:8%"><?=$column_item_count?></th>
              <th style="width:9%"><?=$column_weight?></th>
              <th style="width:9%"><?=$column_price?></th>
              <th style="width:9%"><?=$column_balance?></th>
              <th style="width:11%"><?=$column_tracking?></th>
              <th style="width:7%"><?=$column_action?></th>
            </tr>
          </thead>
          <tbody>

            <?php foreach ($shipments as $s) {
                  $t = $s['tracking'];?>

            <tr id="itemDetail" style="cursor:pointer">
              <td class="v-align-middle" id="flightCheckbox">
                <div class="checkbox text-center">
                  <input type="checkbox" value="3" id="checkbox1">
                  <label for="checkbox1" class="no-padding no-margin"></label>
                </div>
              </td>
              <td class="v-align-middle ">
                SP<?php echo str_pad($s['shipment_id'], 4, '0', STR_PAD_LEFT)?>
              </td>
              <td class="v-align-middle">
                <?=substr($s['date_added'],0,10)?>
              </td>
              <td class="v-align-middle">
                <?=$s['receiver_name']?>
              </td>
              <?php /* ?>
                <td class="v-align-middle">
                  <?=$s['receiver_address']?><!-- <br/>Ontario, Canada -->
                </td>
              <?php */ ?>
              <td class="v-align-middle">
                <?=$s['item_count']?>
              </td>
              <td class="v-align-middle">
                <?=$s['total_weight']?>
              </td>
              <td class="v-align-middle">
                $<?=number_format($s['total_price'],2)?>
              </td>
              <td class="v-align-middle">
                <?php if ((float)$s['total_price'] <= (float)$s['payment']) { ?>
                  $<?php echo number_format((float)$s['total_price'] - (float)$s['payment'], 2); ?> <br/><?=$text_paid?>
                <?php } else { ?>
                  <span style="cursor:pointer;" data-toggle="modal" data-target="#myModal<?=$s['shipment_id']?>">$<?php echo number_format((float)$s['total_price'] - (float)$s['payment'], 2); ?> <br/><a href="<?=$s['url_detail_pay']?>"><?=$button_pay_now?></a></span>
                <?php } ?>
              </td>
              <td class="v-align-middle">
                <?php
                  if (!empty($t['tracking_number'])) {
                    echo $t['tracking_number'];
                  }
                  if (!empty($t['tracking_number']) && !empty($t['description'])) {
                    echo '<br/>';
                  }
                  if (!empty($t['description'])) {
                    echo $t['description'];
                  }
                ?>
              </td>
              <td class="v-align-middle">
                <a href="<?=$s['url_detail']?>"><?=$button_detail?></a>
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
<?=$wrapper_bottom?>