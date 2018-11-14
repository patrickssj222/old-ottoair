<?=$wrapper_top?>

<script src="https://www.paypalobjects.com/api/checkout.js"></script>

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
  .modal-dialog {
    max-width: 1000px;
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

          <!-- MODAL FOR PAYMENT START -->
          <div class="modal" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="pg-close fs-14"></i>
                  </button>
                  <h5>Payment <span class="semi-bold">Information</span></h5>
                  <br>
                </div>
                <div class="modal-body">
                  <div class="row">
                    <div class="col-md-4">
                      <img src="http://ottoair.ca/dashboard/assets/img/paypal.png" style="width:100%;height:auto">
                    </div>
                    <div class="col-md-8">
                      <div class="pull-right m-t-10" style="text-align:right">
                        <p><?php echo sprintf($text_total_price, number_format($order['total'], 2)); ?></p>
                        <p style="padding-bottom: 12px; border-bottom: 1px solid #eeeeee;">
                          <?php echo sprintf($text_total_tax, number_format($order['total']*0.13, 2)); ?></p>
                        <p><?php echo sprintf($text_total_payment, number_format($balance*1.13, 2)); ?></p>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="pull-right" id="checkoutButton">
                        <div id="paypal-button-container" class="m-t-5" style="width:150px"></div>
                      </div>
                    </div>
                  </div>
                  <div class="row m-t-10" style="border-bottom: 1px #DCDCDC solid; padding-bottom:2em">
                    <div class="col-md-12">
                      <p>Please note reward price will be refunded back to your account when shipment is delivered. Please consider our <a href="#">Terms & Services</a></p>
                    </div>
                  </div>
                  <div class="row m-t-15">
                    <div class="col-md-9">
                      <p>If you wish to use other payment methods such as Wechat, Alipay, EMT, Please contact our customer service Wechat account.</p>
                    </div>
                    <div class="col-md-3">
                      <img src="http://ottoair.ca/dashboard/assets/img/wx.jpg" style="width: 100%; height: auto;">
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <p class="pull-right m-t-10">WeChat: Otto_Toronto</p>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
              </div>
            </div>
          </div>
          <!-- END -->

          <!-- BEGIN FORM -->
          <div class="col-md-8 b-r b-dashed b-grey">
              <div class="card-block">
                <div class="row">
                  <div class="col-md-6">
                    <h6><?=$text_receiver?></h6>
                    <div id="summary-receiver">
                      <h4><?=$order['receiver_name']?></h4>
                      <p><?=$order['receiver_phone']?></p>
                      <p><?=$order['receiver_address']?></p>
                    </div>
                  </div>
                </div>
                <div class="row m-t-30">
                  <div class="col-md-12">
                    <h6><?=$text_item_list?></h6>
                    <table id="summary-items" width="100%">
                    <thead>
                      <tr>
                        <td><?=$text_item_name?></td>
                        <td><?=$text_item_description?></td>
                        <td class="text-center"><?=$text_item_value?></td>
                        <td class="text-center"><?=$text_item_quantity?></td>
                        <td class="text-right"><?=$text_item_total_price?></td>
                      </tr>
                    </thead>
                    <tbody>
                      <?php foreach ($items as $item) { ?>
                        <tr>
                          <td><a href="<?=$item['item_url']?>"><?=$item['item_name']?></a></td>
                          <td><?php
                            if (strlen($item['item_description']) > 40) {
                              echo substr($item['item_description'], 0, 40) . '...';
                            } else {
                              echo $item['item_description'];
                            }
                          ?></td>
                          <td class="text-center"><?=number_format($item['item_value'], 2)?></td>
                          <td class="text-center"><?=$item['item_quantity']?></td>
                          <td class="text-right"><?php echo (float)$item['item_quantity'] * (float)$item['item_value']; ?></td>
                        </tr>
                      <?php } ?>
                    </tbody>
                    </table>
                  </div>
                </div>
                <div class="row m-t-30">
                  <div class="col-md-12">
                    <h6><?=$text_tracking?></h6>
                    <table id="tracking-items" width="100%">
                    <thead>
                      <tr>
                        <td><?=$column_tracking_desc?></td>
                        <td><?=$column_tracking_number?></td>
                        <td class="text-right"><?=$column_tracking_time?></td>
                      </tr>
                    </thead>
                    <tbody>
                      <?php // Tell user to pay if not paid
                      if ($balance > 0) { ?>
                        <?php // Print the first record. Typically this is 'pending'
                        if ($first_track = array_pop($trackings)) { ?>
                          <tr>
                            <td><?=$first_track['description']?></td>
                            <td></td>
                            <td class="text-right"><?=$first_track['date_added']?></td>
                          </tr>
                        <?php } ?>
                        <tr>
                          <td colspan="3" class="text-center"><?=$desc_ship_when_paid?></td>
                        </tr>
                      <?php } else if (count($trackings) === 0) { ?>
                        <tr>
                          <td colspan="3" class="text-center"><?=$desc_no_tracking?></td>
                        </tr>
                      <?php } else { ?>
                        <?php foreach ($trackings as $track) { ?>
                          <tr>
                            <td><?=$track['description']?></td>
                            <td><?=$track['tracking_number']?></td>
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
              <p><?=$text_order_summary?></p>
              <br>
              <!-- <h6><?=$text_estimated_price?></6> -->
              <h5><?php echo sprintf($text_total_price, number_format($order['total'], 2)); ?></h5>
              <h5><?php echo sprintf($text_total_tax, number_format($order['total']*0.13, 2)); ?></h5>

              <?php if ($balance !== 0.00) { ?>
                <h5 style="padding-top: 12px; border-top: 1px solid #eeeeee;"><?php echo sprintf($text_balance, number_format($balance, 2)); ?></h5>
              <?php } ?>

              <p class="small hint-text"><?=$text_excl_fee?></p>
              <br>
              <p class="small hint-text"><?=$text_our_rate?></p>
            </div>
          </div>

        </div>
        <div class="padding-20 sm-padding-5 sm-m-b-20 sm-m-t-20 bg-white clearfix">
            <?php if ($balance !== 0.00) { ?>
            <button class="btn btn-success btn-cons btn-animated from-left fa fa-credit-card pull-right" id="payButton" type="button">
              <span><?=$button_pay_now?></span>
            </button>
            <?php } ?>
            <a href="<?=$url_orders?>">
              <button class="btn btn-default btn-cons btn-animated from-left fa fa-arrow-left pull-right" type="button">
                <span><?=$button_back?></span>
              </button>
            </a>
        </div>
    </div>
  </div>
  <!-- END card -->
</div>

<script>
  console.log('<?=$balance?>');

  $('#payButton').click(function(){
    paymentModal();
  })

  function paymentModal() {
    var size = $('input[name=stickup_toggler]:checked').val()
    var modalElem = $('#exampleModal');
    if (size == "mini") {
        $('#modalStickUpSmall').modal('show')
    } else {
        $('#exampleModal').modal('show')
        if (size == "default") {
            modalElem.children('.modal-dialog').removeClass('modal-lg');
        } else if (size == "full") {
            modalElem.children('.modal-dialog').addClass('modal-lg');
        }
    }

    if( $('#paypal-button-container').is(':empty') ) {
      generatePaypal();
    }
  }

  function generatePaypal() {
    var price = '<?=number_format($balance*1.13, 2)?>';
    paypal.Button.render({
        env: 'production', // sandbox | production
        // PayPal Client IDs - replace with your own
        // Create a PayPal app: https://developer.paypal.com/developer/applications/create
        client: {
            sandbox:    'AZDxjDScFpQtjWTOUtWKbyN_bDt4OgqaF4eYXlewfBP4-8aqX3PiV8e1GWU6liB2CUXlkA59kJXE7M6R',
            production: 'ATbTqYCTWZMGH7Z8lmaPPxi97ucGTldEp7inHsJl52B44Vb-ZYNYEPoZGVhggw-h3Sutt2B4JX5ZVYK4'
        },
        style: {
            size: 'responsive',
            color: 'blue',
            shape: 'rect',
            label: 'pay'
        },
        // Show the buyer a 'Pay Now' button in the checkout flow
        commit: true,
        // payment() is called when the button is clicked
        payment: function(data, actions) {
            // Make a call to the REST api to create the payment
            return actions.payment.create({
                payment: {
                    transactions: [
                        {
                            amount: { total: price, currency: 'CAD' }
                        }
                    ]
                }
            });
        },
        // onAuthorize() is called when the buyer approves the payment
        onAuthorize: function(data, actions) {

            // Make a call to the REST api to execute the payment
            return actions.payment.execute().then(function() {
                // AJAX TO CHANGE PAYMENT TO PENDING
                $.ajax({
                  url: '<?=$url_payment_success?>',
                  dataType: 'json',
                  success: function($data){
                    if ($data.success) {
                      console.log('success');
                    }
                  }
                })
            });
        },

        onCancel: function(data, actions) {
          alert('Canceled!');
        }
    }, '#paypal-button-container');
  }
</script>

<?=$wrapper_bottom?>
