<?=$wrapper_top?>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">

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
  .select2-dropdown {
    /* width:90%;
    margin-left: 1em; */
  }
  .hint-text {
    padding-bottom: 1.5rem;
  }

</style>

<!-- START CONTAINER FLUID -->
<div class=" container-fluid   container-fixed-lg">
  <div id="rootwizard" class="m-t-50">
    <!-- Nav tabs -->
    <ul class="nav nav-tabs nav-tabs-linetriangle nav-tabs-separator nav-stack-sm" role="tablist" data-init-reponsive-tabs="dropdownfx" id="steps">
      <li class="nav-item">
        <a class="active" data-toggle="tab" href="#tab1" role="tab"><i class="fa fa-user tab-icon"></i> <span><?=$text_sender_info?></span></a>
      </li>
      <li class="nav-item">
        <a class="" data-toggle="tab" href="#tab2" role="tab"><i class="fa fa-user tab-icon"></i> <span><?=$text_receiver_info?></span></a>
      </li>
      <li class="nav-item">
        <a class="" data-toggle="tab" href="#tab3" role="tab"><i class="fa fa-dropbox tab-icon"></i> <span><?=$text_items?></span></a>
      </li>
      <li class="nav-item">
        <a class="" data-toggle="tab" href="#tab4" role="tab"><i class="fa fa-check tab-icon"></i> <span><?=$text_summary?></span></a>
      </li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">
      <div class="tab-pane padding-20 sm-no-padding active slide-left" id="tab1">
        <div class="row row-same-height">
          <div class="col-md-5 b-r b-dashed b-grey ">
            <div class="padding-30 sm-padding-5 sm-m-t-15 m-t-50">
              <h2><?=$text_sender_contact?></h2>
              <p class="small hint-text"><?=$expl_sender_contact?></p>
              <p class="small hint-text"><?=$expl_discipline?></p>
            </div>
          </div>

          <!-- BEGIN FORM -->
          <div class="col-md-7">
              <div class="card-block">
                <form id="senderInfo" role="form">
                  <div id="senderInfoForm" class="col-md-8 p-l-0">
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group form-group-default required">
                          <label><?=$entry_sender_fname?></label>
                          <input type="text" name="sender_fname" id="sender_fname" class="form-control" required value="<?php if (isset($user['firstname'])) echo $user['firstname']; ?>">
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group form-group-default required">
                          <label><?=$entry_sender_lname?></label>
                          <input type="text" name="sender_lname" id="sender_lname" class="form-control" value="<?php if (isset($user['lastname'])) echo $user['lastname']; ?>">
                        </div>
                      </div>
                    </div>
                    <div class="form-group form-group-default required">
                      <label><?=$entry_sender_email?></label>
                      <input type="email" name="sender_email" id="sender_email" class="form-control" required value="<?php if (isset($user['email'])) echo $user['email']; ?>">
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group form-group-default required">
                          <label><?=$entry_sender_phone?></label>
                          <input type="text" name="sender_phone" id="sender_phone" class="form-control" required value="<?php if (isset($user['phone'])) echo $user['phone']; ?>">
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group form-group-default">
                          <label><?=$entry_sender_wechat?></label>
                          <input type="text" name="sender_wx" id="sender_wx" class="form-control" value="<?php if (isset($user['wechat'])) echo $user['wechat']; ?>">
                        </div>
                      </div>
                    </div>
                    <br>
                    <p>Address</p>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group form-group-default">
                          <label><?=$entry_sender_province?></label>
                          <input type="text" name="sender_province" id="sender_province" class="form-control" value="Ontario">
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group form-group-default">
                          <label><?=$entry_sender_city?></label>
                          <input type="text" name="sender_city" id="sender_city" class="form-control">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-8">
                        <div class="form-group form-group-default required">
                          <label><?=$entry_sender_address?></label>
                          <input type="text" name="sender_address" id="sender_address" class="form-control" required>
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group form-group-default required">
                          <label><?=$entry_sender_postal?></label>
                          <input type="text" name="sender_postal" id="sender_postal" class="form-control" required>
                        </div>
                      </div>
                    </div>
                    <br>
                    <div class="checkbox check-success">
                        <input type="checkbox" value="1" id="saveSenderAddress" checked='checked'>
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
              <h2><?=$text_receiver_contact?></h2>
              <p class="small hint-text"><?=$expl_receiver_contact?></p>
              <p class="small hint-text"><?=$expl_discipline?></p>
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
      <div class="tab-pane slide-left padding-20 sm-no-padding" id="tab3">
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
                <button class="btn btn-success btn-cons m-b-20" id="btn-add-item"><?=$button_add?></button>

                <form id="items" role="form">
                </form>

                  <div id="item-template" class="hidden col-md-10 p-l-0 m-t-10" >
                    <span class="pull-right btn-delete-item"><i class="fa fa-times"></i></span>
                    <p class="itemNumber"><?=$text_item_num?>0 </p>
                    <div class="form-group form-group-default-attached">
                      <div class="row clearfix">
                        <div class="col-md-8">

                          <div class="form-group form-group-default required">
                            <label><?=$entry_item_name?></label>
                            <select name="item[0][item_name]" class="form-control full-width" style="font-family: 'FontAwesome', 'sans-serif'" required>
                              <option value="">Select your item type</option>
                              <optgroup label="<?=$selectgrp_appeals?>">
                                <option value="clothes" data-icon="fa-tshirt" level="2"><?=$select_clothes?></option>
                                <option value="coat" data-icon="fa-tshirt" level="3"><?=$select_coat?></option>
                                <option value="shoes" data-icon="fa-shoe-prints" level="2"><?=$select_shoes?></option>
                                <option value="shoes2" data-icon="fa-box" level="3"><?=$select_shoes2?></option>
                              </optgroup>
                              <optgroup label="<?=$selectgrp_docs?>">
                                <option value="letter" data-icon="fa-envelope-open" level="1"><?=$select_letter?></option>
                                <option value="envelopes" data-icon="fa-envelope" level="1"><?=$select_envelope?></option>
                                <option value="books" data-icon="fa-book" level="2"><?=$select_book?></option>
                              </optgroup>
                              <optgroup label="<?=$selectgrp_cosmetics?>">
                                <option value="makeup" data-icon="fa-highlighter" level="2"><?=$select_makeup?></option>
                                <!-- <option value="liquid">Liquid</option> -->
                              </optgroup>
                              <optgroup label="<?=$selectgrp_health?>">
                                <option value="pills" data-icon="fa-pills" level="2"><?=$select_pills?></option>
                                <option value="liquid" data-icon="fa-tint" level="2"><?=$select_liquid?></option>
                              </optgroup>
                              <optgroup label="<?=$selectgrp_electronics?>">
                                <option value="phone" data-icon="fa-mobile" level="2"><?=$select_phone?></option>
                                <option value="tablet" data-icon="fa-tablet" level="2"><?=$select_tablet?></option>
                              </optgroup>
                              <optgroup level="3">
                                <option value="others" data-icon="fa-sitemap" level="3"><?=$select_other?></option>
                              </optgroup>
                            </select>
                          </div>
                        </div>

                        <div class="form-group form-group-default" style="display:none;">
                          <input type="number" class="form-control" name="item[0][item_level]" value="1">
                        </div>

                        <div class="col-md-4">
                          <div class="form-group form-group-default">
                            <label><?=$entry_item_count?></label>
                            <input type="number" class="form-control" name="item[0][item_count]" value="1">
                          </div>
                        </div>
                      </div>

                      <div class="size">
                        <div class="row clearfix">
                          <div class="col-md-4">
                            <div class="form-group form-group-default required">
                              <label><?=$entry_item_length?></label>
                              <input type="number" id="length" class="form-control" name="item[0][item_length]" value="0" required>
                            </div>
                          </div>
                          <div class="col-md-4">
                            <div class="form-group form-group-default required">
                              <label><?=$entry_item_width?></label>
                              <input type="number" class="form-control" name="item[0][item_width]" value="0" required>
                            </div>
                          </div>
                          <div class="col-md-4">
                            <div class="form-group form-group-default required">
                              <label><?=$entry_item_height?></label>
                              <input type="number" class="form-control" name="item[0][item_height]" value="0" required>
                            </div>
                          </div>
                        </div>
                      </div>

                      <div class="weight-val">
                        <div class="row clearfix">
                          <div class="col-md-6">
                            <div class="form-group form-group-default required">
                              <label><?=$entry_item_weight?></label>
                              <input type="number" class="form-control" name="item[0][item_weight]" value="0" required>
                            </div>
                          </div>
                          <div class="col-md-6">
                            <div class="form-group form-group-default">
                              <label><?=$entry_item_value?></label>
                              <input type="number" class="form-control" name="item[0][item_price]" value="0">
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
              </div>
          </div>
          <!-- END FORM -->

        </div>
      </div>

      <div class="tab-pane slide-left padding-20 sm-no-padding" id="tab4">
        <div class="row row-same-height">

          <!-- BEGIN FORM -->
          <div class="col-md-8 b-r b-dashed b-grey">
              <div class="card-block">
                <div class="row">
                  <div class="col-md-6">
                    <h6><?=$text_sender?></h6>
                    <div id="summary-sender">
                      <!-- Sender info -->
                    </div>
                  </div>
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
                        <td class="text-center"><?=$text_item_value?></td>
                        <td class="text-center"><?=$text_item_weight?></td>
                        <td class="text-center"><?=$text_item_count?></td>
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
              <p><?=$text_shipment_summary?></p>
              <br>
              <!-- <h6><?=$text_estimated_price?></6> -->
              <h5 style="padding-bottom: 12px; border-bottom: 1px solid #eeeeee;"><?=$text_total_weight?></h5>
              <h5><?=$text_total_price?></h5>

              <!-- <p class="small hint-text"><?=$text_our_rate?></p> -->
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
          <!-- <li class="finish hidden">
            <button class="btn btn-success btn-cons btn-animated from-left fa fa-credit-card pull-right" type="button" id="btn-finish-pay">
              <span><?=$button_confirm_pay?></span>
            </button>
          </li> -->
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
            <a href="<?=$url_shipment_list?>">
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
    registerShipment();
  });

  addItem();
  // Adds an empty row for item information
  $('#btn-add-item').click(function () {
    addItem();
  });


  function formatIcon(icon) {
    var originalOption = icon.element;
    return '<i class="fas ' + $(originalOption).attr('data-icon') +'"></i> &nbsp;' + icon.text;
  }

  function addItem() {
    var newItem = $('#item-template').clone()
      .attr('id', "item-" + ++itemIdx).removeClass('hidden');
    newItem.find('.itemNumber').text('<?=$text_item_num?>' + itemIdx);
    newItem.find('select[name^="item"]').each(function(){
      $(this).attr('name', $(this).attr('name').replace('0', itemIdx));
      $(this).select2({
        placeholder: "<?=$select_message?>",
        "language": {
           "noResults": function(){
               return 'No Results Found, Please Select "Others"';
           }
        },
        escapeMarkup: function (markup) {
          return markup;
        },
        templateResult: formatIcon
      });
    });
    newItem.find('input[name^="item"]').each(function(){
      $(this).attr('name', $(this).attr('name').replace('0', itemIdx));
    });
    newItem.find('.btn-delete-item').click(function () {
      $(this).parent().remove();
    });
    $('#items').append(newItem);

    // adjust inputs based on level selected
    $('[id^="item-"] select').change(function(){

      var level = $('option:selected', this).attr('level');
      var item = $(this).parents().eq(3);

      $(item).find('input[name*="item_level"]').val(level);

      if (level == 1) {
        $(item).find('.size').css('display', 'none');
        $(item).find('.weight-val').css('display', 'none');
        removeSizeReq(item);
        removeWeightReq(item);
      } else if (level == 2) {
        $(item).find('.size').css('display', 'none');
        $(item).find('.weight-val').attr('style', '');
        removeSizeReq(item);
        addWeightReq(item);
      } else if (level == 3) {
        $(item).find('.size').attr('style', '');
        $(item).find('.weight-val').attr('style', '');
        addSizeReq(item);
        addWeightReq(item);
      }

    })

    return false;
  }

  function removeSizeReq(field) {
    $(field).find('input[name*="item_length"]').removeAttr('required');
    $(field).find('input[name*="item_width"]').removeAttr('required');
    $(field).find('input[name*="item_height"]').removeAttr('required');
  }
  function removeWeightReq(field) {
    $(field).find('input[name*="item_weight"]').removeAttr('required');
  }

  function addSizeReq(field) {
    $(field).find('input[name*="item_length"]').attr('required', '');
    $(field).find('input[name*="item_width"]').attr('required', '');
    $(field).find('input[name*="item_height"]').attr('required', '');
  }
  function addWeightReq(field) {
    $(field).find('input[name*="item_weight"]').attr('required', '');
  }

  function xhttpRequest(method, data) {
    data = data || "";
    URL = 'https://data.ottoair.ca/dev.php/api/beta/price';
    var xhttp = new XMLHttpRequest();
    xhttp.open(method, URL, false);
    xhttp.setRequestHeader("Accept", "application/json");
    xhttp.setRequestHeader("Content-Type", "application/json");
    xhttp.setRequestHeader('token', 'Q83ZJ4T6PQ4S1G09IEOXLQM9LM974LLS6K8NOPA6XJQ9J4XBS0AEF00GHTPX5TRP');
    xhttp.send(data);

    return JSON.parse(xhttp.responseText);
  }

  // Delete item if needed
  $('.btn-delete-item').click(function () {
    $(this).parent().remove();
  });

  // Tab switch injection
  $('#btn-next, #btn-back, #steps .nav-item a').click(function(){

      if (!$returning) {

        var $current_tab = $('.nav-item a.active').attr('href');

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
        if ($current_tab === '#tab4') {
          // Get item data and add sum
          var total_weight = 0;
          var total_price = 0;
          var total_count = 0;
          $('#summary-items tbody').html('');
          $('#items > div[id^="item-"]').each(function(){

            var item = $('option:selected', this).val();
            var item_name = $('option:selected', this).html();
            var level = $('option:selected', this).attr('level');

            var length = parseFloat($(this).find('input[name*="item_length"]').val());
            var width = parseFloat($(this).find('input[name*="item_width"]').val());
            var height = parseFloat($(this).find('input[name*="item_height"]').val());

            var weight = parseFloat($(this).find('input[name*="item_weight"]').val());
            var count = parseFloat($(this).find('input[name*="item_count"]').val());
            var price = parseFloat($(this).find('input[name*="item_price"]').val());

            $.ajax({
              url: '<?=$url_get_price?>',
              method: 'POST',
              async:false,
              data: {"item": item, "level": level
                   , "size": length * width * height
                   , "weight": weight, "count": count, "value": price},
              // dataType: 'json',
              success: function($data){
                item_price = JSON.parse($data).price;
                total_weight += weight;
                total_price += item_price;
                total_count += count;
                $('<tr><td>'+item_name+'</td>\
                  <td class="text-center">'+price+'</td>\
                  <td class="text-center">'+weight+'</td>\
                  <td class="text-center">'+count+'</td>\
                  <td class="text-right">'+item_price.toFixed(2)+'</td></tr>').appendTo($('#summary-items tbody'));
              }
            })

            // var item = {
            //   "item": item,
            //   "level": level,
            //   "size": length * width * height,
            //   "weight": weight,
            //   "count": count,
            //   "price": price
            // }
            //
            // var priceRaw = xhttpRequest("POST", JSON.stringify(item));
            // total_weight += weight;
            // total_price += priceRaw.data;
            //
            // total_count += count;
            // $('<tr><td>'+$('option:selected', this).html()+'</td>\
            //   <td class="text-center">'+price+'</td>\
            //   <td class="text-center">'+weight+'</td>\
            //   <td class="text-center">'+count+'</td>\
            //   <td class="text-right">'+priceRaw.data.toFixed(2)+'</td></tr>').appendTo($('#summary-items tbody'));
          });

          $('#btn-finish-pay').css('display', (total_price > 0 ? 'block' : 'none'));

          // Make sure the order is not empty
          if (total_count === 0) {
            headsUp('<?=$error_no_item_title?>', '<?=$error_no_item?>', '', 'model-no-item');
            setTimeout(function(){
              $('#steps .nav-item a[href="#tab3"]').click();
            },10);
          }

          // Fill data
          $('#summary-sender').html('<h4>'+$('input[name="sender_name"]').val()+'</h4><p>'+$('input[name="sender_phone"]').val()+'</p><p>'+$('input[name="sender_email"]').val()+'</p><p>'+$('input[name="sender_wx"]').val()+'</p><p>'+$('input[name="sender_address"]').val()+'</p>');
          $('#summary-receiver').html('<h4>'+$('input[name="receiver_name"]').val()+'</h4><p>'+$('input[name="receiver_phone"]').val()+'</p><p>'+$('input[name="receiver_email"]').val()+'</p><p>'+$('input[name="receiver_address"]').val()+'</p><p>'+$('input[name="receiver_wx"]').val()+'</p>');
          $('#summary-weight').html(total_weight);
          $('#summary-price').html(total_price.toFixed(2));
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

  // GET SAVED ADDRESSES FROM DB
  $.ajax({
    url: '<?=$url_get_addresses?>',
    dataType: 'json',
    success: function($data){
      if ($data.success == true) {
        if ($data.data1.length > 0) {
          $('#senderInfoForm').prepend('<p>Stored Info</p>'
              + '<select name="user_s_addresses" id="user_s_addresses" '
              + 'class="form-control full-width" data-init-plugin="select2"></select>')

          $('#user_s_addresses').select2({
            tags:['']
          })

          Object.keys($data.data1).forEach(function(e){
            $('#user_s_addresses').select2({
              tags:[$data.data1[e].address_id + " - " + $data.data1[e].address],
              placeholder: "Saved Sender Info"
            })
          })

          $('#user_s_addresses').next().css({
            'width': '50%',
            'margin-bottom': '2em',
            'padding-left': '1em'
          })

          $('#user_s_addresses').change(function(){
            var temp = user_s_addresses.value.split(" - ");
            var address_id = temp[0];
            Object.keys($data.data1).forEach(function(e){
              if (address_id == $data.data1[e].address_id) {
                $('#sender_province').val($data.data1[e].province);
                $('#sender_city').val($data.data1[e].city);
                $('#sender_address').val($data.data1[e].address);
                $('#sender_postal').val($data.data1[e].postal_code);
              }
            })
          })

        }

        if ($data.data2.length > 0) {
          $('#receiverInfoForm').prepend('<p>Stored Info</p>'
              + '<select name="user_r_addresses" id="user_r_addresses" '
              + 'class="form-control full-width" data-init-plugin="select2"></select>')

          $('#user_r_addresses').select2({
            tags:['']
          })

          Object.keys($data.data2).forEach(function(e){
            $('#user_r_addresses').select2({
              // add name
              tags:[$data.data2[e].address_id + " - " + $data.data2[e].name + ", " + $data.data2[e].address],
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

  // SAVE ADDRESS BUTTON
  $('.check-success').click(function() {
    var $listSort = $('#saveSenderAddress');
    if ($listSort.attr('checked')) {
        $listSort.removeAttr('checked');
    } else {
        $listSort.attr('checked', true);
    }
  });

  $('.check-success').click(function() {
    var $listSort = $('#saveReceiverAddress');
    if ($listSort.attr('checked')) {
        $listSort.removeAttr('checked');
    } else {
        $listSort.attr('checked', true);
    }
  });

  $('#btn-next').click(function(){
    var $current_tab = $('.nav-item a.active').attr('href');
    if ($current_tab == '#tab1') {
      // $.ajax() {
      //
      // }
    }
  })

});
</script>

<?=$wrapper_bottom?>
