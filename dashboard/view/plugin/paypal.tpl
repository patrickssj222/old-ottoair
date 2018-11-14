<div class="modal fade stick-up" id="myModal'.$id2.'" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header clearfix text-left">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="pg-close fs-14"></i>
        </button>
        <h5>Payment <span class="semi-bold">Information</span></h5>
        <br>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-md-4">
            <img src="assets/img/paypal.png" style="width:100%;height:auto">
          </div>
          <div class="col-md-8">
            <div class="pull-right m-t-10" style="text-align:right">
              <p>OttoAir Price - '.$price2.'</p>
              <p style="padding-bottom: 12px; border-bottom: 1px solid #eeeeee;">Reward Price - $'. toDecimal(((0.25*$luggage2*str_replace("$","",$price2)) / (1-0.25*$luggage2))) .'</p>
              <p>Total Price - <span class="bold font-montserrat text-uppercase" id="paypalTotal'.$id2.'">$'.toDecimal(str_replace("$","",$price2) / (1-(0.25*$luggage2))).'</span></p>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="pull-right" id="checkoutButton'.$id2.'">
              <!-- <button type="button" class="btn btn-success btn-block m-t-5">Pay Now</button> -->
              <div id="paypal-button-container'. $id2 .'" class="m-t-5" style="width:150px"></div>
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
            <img src="assets/img/wx.jpg" style="width: 100%; height: auto;">
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <p class="pull-right m-t-10">WeChat: Otto_Toronto</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<?php if (!defined(PAYPAL_SCRIPT_INCLUDED)) { ?>
<script>
        function generatePaypal(id) {
          var x = $("#paypalTotal" + id).text();
          var price = x.replace('$', '');
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
                      $.ajax({url: 'server/payment.php?t_id=' + id});
                      // window.location.href = "flights.php";
                      window.alert('Success!');
                      // AJAX TO CHANGE PAYMENT TO PENDING
                  });
              },

              onCancel: function(data, actions) {
                window.alert('Canceled!');
              }
          }, '#paypal-button-container' + id);
        }
    </script>
    <?php define(PAYPAL_SCRIPT_INCLUDED, true); ?>
    <?php } ?>
