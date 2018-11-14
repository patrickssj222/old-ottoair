<div class="modal fade stick-up" id="pp_express" tabindex="-1" role="dialog" aria-hidden="true" style="opacity:1 !important">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header clearfix text-left">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="pg-close fs-14"></i>
        </button>
        <h5><?=$text_payment?></h5>
        <br>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-md-4">
            <img src="assets/img/paypal.png" style="width:100%;height:auto">
          </div>
          <div class="col-md-8">
            <div class="pull-right m-t-10" style="text-align:right">
              <p><?=$title?></p>
              <p style="padding-bottom: 12px; border-bottom: 1px solid #eeeeee;"><?=$description?></p>
              <p>Total Price: $<span class="bold font-montserrat text-uppercase" id="pp-express-total"><?=$total?></span></p>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="pull-right" id="checkoutButton'.$id2.'">
              <!-- <button type="button" class="btn btn-success btn-block m-t-5">Pay Now</button> -->
              <div id="paypal-button-container" class="m-t-5" style="width:150px"></div>
            </div>
          </div>
        </div>
        <div class="row m-t-15">
          <div class="col-md-9">
            <p><?=$desc_other_methods?></p>
          </div>
          <div class="col-md-3">
            <img src="assets/img/wx.jpg" style="width: 100%; height: auto;">
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <p class="pull-right m-t-10"><?=$text_wechat?></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="https://www.paypalobjects.com/api/checkout.js"></script>
<script type="text/javascript">
  function paymentModal() {
    var size = $('input[name=stickup_toggler]:checked').val()
    var modalElem = $('#pp_express');
    if (size == "mini") {
        $('#modalStickUpSmall').modal('show')
    } else {
        $('#pp_express').modal('show')
        if (size == "default") {
            modalElem.children('.modal-dialog').removeClass('modal-lg');
        } else if (size == "full") {
            modalElem.children('.modal-dialog').addClass('modal-lg');
        }
    }
  }
  <?php if ($open_payment_modal) { ?>
    $(document).ready(function(){
      paypal.Button.render({
          env: 'sandbox', // sandbox | production
          // PayPal Client IDs - replace with your own
          // Create a PayPal app: https://developer.paypal.com/developer/applications/create
          client: {
              // sandbox:    'AZDxjDScFpQtjWTOUtWKbyN_bDt4OgqaF4eYXlewfBP4-8aqX3PiV8e1GWU6liB2CUXlkA59kJXE7M6R',
              sandbox:    'Af1bw-YVjSQqUQxDAM5M4ipJL_XN-SuiwWswSkAuUFI5Fsksk4W8CyMjPJ9csS8UVUzMrQ8HSfxumaW5',
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
                              amount: { total: <?=$total?>, currency: 'CAD' }
                          }
                      ]
                  }
              });
          },
          // onAuthorize() is called when the buyer approves the payment
          onAuthorize: function(data, actions) {

              // Make a call to the REST api to execute the payment
              return actions.payment.execute().then(function() {
                  $.ajax({
                    url: '<?=$url_payment?>',
                    method: 'POST',
                    data: 'data=' + JSON.stringify(data) + '&amount=<?=$total?>',
                    dataType: 'json',
                    success: function(data){
                      if (data.success == 'true') {
                        location.reload();
                      } else {
                        window.alert('<?=$error_failed?>');
                      }
                    }
                  });
              });
          },

          onCancel: function(data, actions) {
            window.alert('<?=$error_canceled?>');
          }
      }, '#paypal-button-container');
      paymentModal();
    });
  <?php } ?>
</script>