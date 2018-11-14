<?=$wrapper_top?>

<style type="text/css">
  .btn-delete-item:hover {
    cursor: pointer;
    opacity: 0.7;
  }
  #summary-items tr {
    border-top: 1px solid #eee;
  }
  #summary-items tr:last-child {
    border-bottom: 1px solid #eee;
  }
  #summary-items td {
    padding: 5px;
  }
  h6 {
    font-weight: 400;
  }

  #items > div > .loading-overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(255,255,255,0.6);
    padding: 120px 47%;
    font-size: 160%;
    display: none;
  }

  #items > div.loading > .loading-overlay {
    display: block;
  }
</style>

<!-- START CONTAINER FLUID -->
<div class=" container-fluid   container-fixed-lg">
  <div id="rootwizard" class="m-t-50">
    <!-- Nav tabs -->
    <ul class="nav nav-tabs nav-tabs-linetriangle nav-tabs-separator nav-stack-sm" role="tablist" data-init-reponsive-tabs="dropdownfx" id="steps">
      <li class="nav-item">
        <a class="" data-toggle="tab" href="#tab1" role="tab"><i class="fa fa-user tab-icon"></i> <span><?=$text_receiver_info?></span></a>
      </li>
      <li class="nav-item">
        <a class="" data-toggle="tab" href="#tab2" role="tab"><i class="fa fa-dropbox tab-icon"></i> <span><?=$text_items?></span></a>
      </li>
      <li class="nav-item">
        <a class="" data-toggle="tab" href="#tab3" role="tab"><i class="fa fa-check tab-icon"></i> <span><?=$text_summary?></span></a>
      </li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">

      <div class="tab-pane slide-left padding-20 sm-no-padding" id="tab1">
        <div class="row row-same-height">
          <div class="col-md-5 b-r b-dashed b-grey ">
            <div class="padding-30 sm-padding-5 sm-m-t-15 m-t-50">
              <h2><?=$text_receiver_contact?></h2>
              <p class="small hint-text"><?=$expl_receiver_contact?></p>
              <br/>
              <p class="small"><?=$expl_privacy_more?></p>
            </div>
          </div>
          <!-- BEGIN FORM -->
          <div class="col-md-7">
              <div class="card-block">
                <form id="receiverInfo" role="form">
                  <div id="receiverInfoForm" class="col-md-8 p-l-0">
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group form-group-default required">
                          <label><?=$entry_receiver_fname?></label>
                          <input type="text" name="receiver_fname" id="receiver_fname" class="form-control" required>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group form-group-default required">
                          <label><?=$entry_receiver_lname?></label>
                          <input type="text" name="receiver_lname" id="receiver_lname" class="form-control" required>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group form-group-default required">
                          <label><?=$entry_receiver_phone?></label>
                          <input type="text" name="receiver_phone" id="receiver_phone" class="form-control" required>
                        </div>
                      </div>
                    </div>

                    <br>
                    <p>Address</p>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group form-group-default">
                          <label><?=$entry_receiver_province?></label>
                          <input type="text" name="receiver_province" id="receiver_province" class="form-control">
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group form-group-default">
                          <label><?=$entry_receiver_city?></label>
                          <input type="text" name="receiver_city" id="receiver_city" class="form-control">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-8">
                        <div class="form-group form-group-default required">
                          <label><?=$entry_receiver_address?></label>
                          <input type="text" name="receiver_address" id="receiver_address" class="form-control" required>
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group form-group-default required">
                          <label><?=$entry_receiver_postal?></label>
                          <input type="text" name="receiver_postal" id="receiver_postal" class="form-control" required>
                        </div>
                      </div>
                    </div>
                    <br>
                    <div class="checkbox check-success">
                        <input type="checkbox" value="1" id="saveReceiverAddress" checked='checked'>
                        <label for="checkbox2">Save this address</label>
                    </div>
                  </div>
                </form>
              </div>
          </div>
          <!-- END FORM -->
        </div>
      </div>
      <div class="tab-pane slide-left padding-20 sm-no-padding" id="tab2">
        <div class="row row-same-height">
          <div class="col-md-5 b-r b-dashed b-grey ">
            <div class="padding-30 sm-padding-5 sm-m-t-15 m-t-50">
              <h2><?=$text_items_to_send?></h2>
              <p class="small hint-text"><?=$text_our_rate?></p>
              <br/>
              <p class="small"><?=$expl_limitations?></p>
            </div>
          </div>

          <!-- BEGIN FORM -->
          <div class="col-md-7">
              <div class="card-block">
                <!-- <button id="createItem" onclick="return addItem()" class="btn btn-success btn-cons m-b-20">Add New</button> -->
                <!-- <a href = "javascript:void(0);" class="btn btn-success btn-cons m-b-20" id="createItem">  -->
                <button class="btn btn-success btn-cons m-b-20" id="btn-add-item"><?=$button_add?></button>

                <form id="items" role="form">
                </form>

                  <div id="item-template" class="hidden col-md-10 p-l-0 m-t-10" >
                    <span class="pull-right btn-delete-item"><i class="fa fa-times"></i></span>
                    <p class="itemNumber"><?=$text_item_num?>0 </p>
                    <div class="form-group form-group-default-attached">
                      <div class="row clearfix">
                        <div class="col-md-12">
                          <div class="form-group form-group-default required">
                            <label><?=$entry_item_url?></label>
                            <input type="text" class="form-control item-url" name="item[0][item_url]" required>
                          </div>
                        </div>
                      </div>
                      <div class="row clearfix">
                        <div class="col-md-12">
                          <div class="form-group form-group-default required">
                            <label><?=$entry_item_name?></label>
                            <input type="text" class="form-control item-name" name="item[0][item_name]" required>
                          </div>
                        </div>
                      </div>
                      <div class="row clearfix">
                        <div class="col-md-12">
                          <div class="form-group form-group-default">
                            <label><?=$entry_item_description?></label>
                            <textarea class="form-control item-description" rows="3" name="item[0][item_description]"></textarea>
                          </div>
                        </div>
                      </div>
                      <div class="row clearfix">
                        <div class="col-md-6">
                          <div class="form-group form-group-default required">
                            <label><?=$entry_item_quantity?></label>
                            <input type="number" class="form-control" name="item[0][item_quantity]" value="1" required>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group form-group-default required">
                            <label><?=$entry_item_value?></label>
                            <input type="number" class="form-control item-value" name="item[0][item_value]" value="0" required>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="loading-overlay">
                      <i class="fa fa-spin fa-spinner"></i>
                    </div>
                  </div>

              </div>
          </div>
          <!-- END FORM -->

        </div>
      </div>

      <div class="tab-pane slide-left padding-20 sm-no-padding" id="tab3">
        <div class="row row-same-height">

          <!-- BEGIN FORM -->
          <div class="col-md-8 b-r b-dashed b-grey">
              <div class="card-block">
                <div class="row">
                  <!-- <div class="col-md-1 m-t-30">
                    <i class="fa fa-arrow-right"></i>
                  </div> -->
                  <div class="col-md-6">
                    <h6><?=$text_receiver?></h6>
                    <div id="summary-receiver">
                      <!-- Receiver info -->
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
                        <td class="text-center"><?=$text_item_description?></td>
                        <td class="text-center"><?=$text_item_value?></td>
                        <td class="text-center"><?=$text_item_quantity?></td>
                        <td class="text-right"><?=$text_item_total_price?></td>
                      </tr>
                    </thead>
                    <tbody>
                      <!-- Items -->
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
              <h5 style="padding-bottom: 12px; border-bottom: 1px solid #eeeeee;"><!-- <?=$text_total_weight?> --></h5>
              <h5><?=$text_total_price?></h5>
              <h5><?=$text_total_tax?></h5>
              <h5 style="padding-top: 1em;"><?=$text_total_payment?></h5>

              <p class="small hint-text"><?=$text_our_rate?></p>
            </div>
          </div>

        </div>
      </div>



      <div class="padding-20 sm-padding-5 sm-m-b-20 sm-m-t-20 bg-white clearfix">
        <ul class="pager wizard no-style">
          <li class="next">
            <button class="btn btn-success btn-cons btn-animated from-left fa fa-arrow-right pull-right" type="button" id="btn-next">
              <span><?=$button_next?></span>
            </button>
          </li>
          <li class="finish hidden">
            <button class="btn btn-success btn-cons btn-animated from-left fa fa-credit-card pull-right" type="button" id="btn-finish-pay">
              <span><?=$button_confirm_pay?></span>
            </button>
          </li>
          <li class="finish hidden">
            <button class="btn btn-success btn-cons btn-animated from-left fa fa-check pull-right" type="button" id="btn-finish">
              <span><?=$button_confirm?></span>
            </button>
          </li>
          <li class="previous" style="display:none">
            <button class="btn btn-default btn-cons btn-animated from-left fa fa-arrow-left pull-right" type="button" id="btn-back">
              <span><?=$button_back?></span>
            </button>
          </li>
          <li>
            <a href="<?=$url_order_list?>">
              <button class="btn btn-default btn-cons btn-animated from-left fa fa-arrow-left pull-right" type="button" id="btn-cancel">
                <span><?=$button_cancel?></span>
              </button>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>
<!-- END CONTAINER FLUID -->


<script>
  var $returning = false;
  var itemIdx = 0;


$(document).ready(function(){

  $('#depTime, #arriTime').timepicker().on('show.timepicker', function(e) {
    var widget = $('.bootstrap-timepicker-widget');
    widget.find('.glyphicon-chevron-up').removeClass().addClass('pg-arrow_maximize');
    widget.find('.glyphicon-chevron-down').removeClass().addClass('pg-arrow_minimize');
  });
  $('.autonumeric').autoNumeric('init');
  $('#finishItem').click(function(){
    registerorder();
  });


  addItem();
  // NOTE,
  // Should switch to http request later
  // Using this way for fast launch

  var path = window.location.href;
  var n = path.search('\\?');

  if (n != '-1') {
    product_id = parseURLParams(window.location.href)['id'][0];
    console.log(product_id);

    $.ajax({
      url: '<?=$url_get_item?>',
      method: 'POST',
      data: {'id': product_id},
      dataType: 'json',
      success: function($data) {
        // console.log($data.data);
        $("input[name='item[" + itemIdx + "][item_url]']").parent().remove();
        $("input[name='item[" + itemIdx + "][item_name]']").val($data.data['name']);
        $("textarea[name='item[" + itemIdx + "][item_description]']").html($data.data[4]);
        $("input[name='item[" + itemIdx + "][item_value]']").val($data.data['price']);
        $("input[name='item[" + itemIdx + "][item_value]']").attr('readonly','');
      }
    })

  }

  $('#btn-add-item').click(function () {
    addItem();
  });

  function addItem() {
    var newItem = $('#item-template').clone()
      .attr('id', "item-" + ++itemIdx).removeClass('hidden');
    newItem.find('.itemNumber').text('<?=$text_item_num?>' + itemIdx);
    newItem.find('input[name^="item"], textarea[name^="item"], select[name^="item"]').each(function(){
      $(this).attr('name', $(this).attr('name').replace('0', itemIdx));
    });
    newItem.find('.btn-delete-item').click(function () {
      $(this).parent().remove();
    });
    newItem.find('input.item-url').change(function () {
      $.ajax({
        url: '<?=$url_item_info?>',
        method: 'POST',
        data: 'item_url=' + $(this).val(),
        dataType: 'json',
        beforeSend: function(){
          newItem.addClass('loading');
        },
        success: function($data){
          if ($data.item_name && newItem.find('input.item-name').val().trim().length == 0) {
            newItem.find('input.item-name').val($data.item_name);
          }
          if ($data.item_description && newItem.find('textarea.item-description').val().trim().length == 0) {
            newItem.find('textarea.item-description').val($data.item_description);
          }
          if ($data.item_value && newItem.find('input.item-value').val() == '0') {
            newItem.find('input.item-value').val($data.item_value);
          }
        },
        complete: function(){
          newItem.removeClass('loading');
        }
      });
    });
    $('#items').append(newItem);

    return false;
  }
  // Delete item if needed
  $('.btn-delete-item').click(function () {
    $(this).parent().remove();
  });

  // Tab switch injection
  $('#btn-next, #btn-back, #steps .nav-item a').click(function(){

      if (!$returning) {

        // form validation, blocks tab switching
        var $current_tab = $('.nav-item a.active').attr('href');
        $($current_tab).find('form .has-error').removeClass('has-error');
        $($current_tab).find('form').find('input, textarea, select').each(function(){

          var $error = false;

          // required field empty?
          if (($(this).prop('required') && $(this).val().trim().length === 0)) {
            headsUp('<?=$error_required_title?>', '<?=$error_required?>', '', 'model-required');
            $error = true;
          }

          // Email invalid?
          if ($(this).attr('type')=='email' && $(this).val().trim().length > 0
            && !/^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/.test($(this).val())) {
            headsUp('<?=$error_email_title?>', '<?=$error_email?>', '', 'model-email');
            $error = true;
          }

          if ($error) {
            $(this).parent().addClass('has-error');
            setTimeout(function(){
            $returning = true;
              $('#steps .nav-item a[href="'+$current_tab+'"]').click();
            },10);
            setTimeout(function(){$returning=false;},20);
            return false;
          }
        });
      }
      setTimeout(function(){
        var $current_tab = $('.nav-item a.active').attr('href');
        if ($current_tab === '#tab1') {
          // Show cancel button
          $('#btn-cancel').parent().show();
          $('#btn-back').parent().hide();
        } else {
          // Hide cancel button
          $('#btn-cancel').parent().hide();
          $('#btn-back').parent().show();
        }
        if ($current_tab === '#tab3') {
          // Get item data and add sum
          var total_price = 0;
          var total_count = 0;
          $('#summary-items tbody').html('');
          $('#items > div[id^="item-"]').each(function(){
            var count = parseFloat($(this).find('input[name*="item_quantity"]').val());
            var price = parseFloat($(this).find('input[name*="item_value"]').val());
            total_price += price * count;
            total_count += count;
            var description = $(this).find('input[name*="item_name"]').val();
            $('<tr><td>'+$(this).find('input[name*="item_name"]').val()+'</td>\
              <td class="text-center">'+(description.length > 40 ? description.slice(0,40) + '...' : description)+'</td>\
              <td class="text-center">'+price.toFixed(2)+'</td>\
              <td class="text-center">'+count.toFixed(2)+'</td>\
              <td class="text-right">'+price * count.toFixed(2)+'</td></tr>').appendTo($('#summary-items tbody'));
          });

          $('#btn-finish-pay').css('display', (total_price > 0 ? 'block' : 'none'));

          // Make sure the order is not empty
          if (total_count === 0) {
            headsUp('<?=$error_no_item_title?>', '<?=$error_no_item?>', '', 'model-no-item');
            setTimeout(function(){
              $('#steps .nav-item a[href="#tab2"]').click();
            },10);
          }

          // Fill data
          $('#summary-receiver').html('<h4>'+$('input[name="receiver_name"]').val()+'</h4><p>'+$('input[name="receiver_phone"]').val()+'</p><p>'+$('input[name="receiver_email"]').val()+'</p><p>'+$('input[name="receiver_address"]').val()+'</p><p>'+$('input[name="receiver_wx"]').val()+'</p>');
          $('#summary-price').html(total_price);
          $('#summary-tax').html((total_price * 0.13).toFixed(2));
          $('#summary-payment').html((total_price * 1.13).toFixed(2));
        }
      }, 10);
  });

  $('#btn-finish').click(function(){
    $.ajax({
      url: '<?=$url_submit?>',
      method: 'POST',
      data: $('.tab-content form').serialize(),
      dataType: 'json',
      success: function($data){
        if ($data.success) {
          if ($data.redirect) {
            location.href = $data.redirect;
          }
        } else {
          headsUp('<?=$error_title?>', $data.message);
        }
      }
    });
  });
  $('#btn-finish-pay').click(function(){
    $.ajax({
      url: '<?=$url_submit?>',
      method: 'POST',
      data: $('.tab-content form').serialize(),
      dataType: 'json',
      success: function($data){
        if ($data.success) {
          if ($data.redirect) {
            location.href = $data.redirect + '/pay';
          }
        } else {
          headsUp('<?=$error_title?>', $data.message);
        }
      }
    });
  });

  $.ajax({
    url: '<?=$url_get_addresses?>',
    dataType: 'json',
    success: function($data){
      if ($data.success == true) {
        if ($data.data2.length > 0) {
          $('#receiverInfoForm').prepend('<p>Stored Info</p>'
              + '<select name="user_r_addresses" id="user_r_addresses" '
              + 'class="form-control full-width" data-init-plugin="select2"></select>')

          $('#user_r_addresses').select2({
            tags:['']
          })

          Object.keys($data.data2).forEach(function(e){
            $('#user_r_addresses').select2({
              tags:[$data.data2[e].address_id + " - " + $data.data2[e].address],
              placeholder: "Saved Receiver Info"
            })
          })

          $('#user_r_addresses').next().css({
            'width': '50%',
            'margin-bottom': '2em',
            'padding-left': '1em'
          })

          $('#user_r_addresses').change(function(){
            var temp = user_r_addresses.value.split(" - ");
            var address_id = temp[0];
            Object.keys($data.data2).forEach(function(e){
              if (address_id == $data.data2[e].address_id) {
                var name = $data.data2[e].name.split(' ');
                $('#receiver_fname').val(name[0]);
                $('#receiver_lname').val(name[1]);
                $('#receiver_phone').val($data.data2[e].phone);
                $('#receiver_province').val($data.data2[e].province);
                $('#receiver_city').val($data.data2[e].city);
                $('#receiver_address').val($data.data2[e].address);
                $('#receiver_postal').val($data.data2[e].postal_code);
              }
            })
          })
        }
      }
    }
  })

  $('.check-success').click(function() {
    var $listSort = $('#saveReceiverAddress');
    if ($listSort.attr('checked')) {
        $listSort.removeAttr('checked');
    } else {
        $listSort.attr('checked', true);
    }
  });

  // should switch later
  function parseURLParams(url) {
      var queryStart = url.indexOf("?") + 1,
          queryEnd   = url.indexOf("#") + 1 || url.length + 1,
          query = url.slice(queryStart, queryEnd - 1),
          pairs = query.replace(/\+/g, " ").split("&"),
          parms = {}, i, n, v, nv;

      if (query === url || query === "") return;

      for (i = 0; i < pairs.length; i++) {
          nv = pairs[i].split("=", 2);
          n = decodeURIComponent(nv[0]);
          v = decodeURIComponent(nv[1]);

          if (!parms.hasOwnProperty(n)) parms[n] = [];
          parms[n].push(nv.length === 2 ? v : null);
      }
      return parms;
  }
});
</script>

<?=$wrapper_bottom?>
