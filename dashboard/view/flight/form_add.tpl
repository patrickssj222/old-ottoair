<?=$wrapper_top?>
<!-- START CONTAINER FLUID -->
<div class=" container-fluid   container-fixed-lg">
  <div id="rootwizard" class="m-t-50">
    <!-- Nav tabs -->
    <ul class="nav nav-tabs nav-tabs-linetriangle nav-tabs-separator nav-stack-sm" role="tablist" data-init-reponsive-tabs="dropdownfx" id="steps">
      <li class="nav-item">
        <a class="active" data-toggle="tab" href="#tab1" role="tab"><i class="fa fa-plane tab-icon"></i> <span><?=$text_flight_info?></span></a>
      </li>
      <li class="nav-item">
        <a class="" data-toggle="tab" href="#tab2" role="tab"><i class="fa fa-user tab-icon"></i> <span><?=$text_your_info?></span></a>
      </li>
      <li class="nav-item">
        <a class="" data-toggle="tab" href="#tab3" role="tab"><i class="fa fa-file tab-icon"></i> <span><?=$text_documents?></span></a>
      </li>
      <li class="nav-item">
        <a class="" data-toggle="tab" href="#tab4" role="tab"><i class="fa fa-check tab-icon"></i> <span><?=$text_summary?></span></a>
      </li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">
      <div class="tab-pane padding-20 sm-no-padding active slide-left" id="tab1">
        <div class="row row-same-height">

          <!-- BEGIN FORM -->
          <div class="col-md-5 b-r b-dashed b-grey">
            <div class="padding-30 sm-padding-5 sm-m-t-15 m-t-50">
              <h2><?=$text_enter_ticket?></h2>
              <p class="small hint-text"><?=$desc_enter_ticket?></p>

              <h6 class="m-t-15" id="full-price"></h6>
            </div>
          </div>
          <div class="col-md-7">
              <div class="card-block">
                <form role="form" id="flightInfo">
                  <div>
                    <div class="col-lg-8 p-l-0 p-r-0">
                      <div class="form-group form-group-default required">
                        <label><?=$entry_departure_airport?>2</label>
                        <select name="departure" id="departure" class="form-control full-width" data-init-plugin="select2" required>
                          <?php echo $airports; ?>
                        </select>
                      </div>
                    </div>

                    <div class="col-lg-8 p-l-0 p-r-0">
                      <div class="form-group form-group-default input-group required">
                        <div class="form-input-group">
                          <label><?=$entry_departure_time?></label>
                          <input type="text" name="date_departure" id="time-departure" class="form-control time" required/>
                        </div>
                        <div class="input-group-addon">
                          <i class="fa fa-clock-o"></i>
                        </div>
                      </div>
                    </div>

                    <div class="col-lg-8 p-l-0 p-r-0">
                      <div class="form-group form-group-default required">
                        <label><?=$entry_arrival_airport?></label>
                        <select name="arrival" id="arrival" class="form-control full-width" data-init-plugin="select2" required>
                          <?php echo $airports; ?>
                        </select>
                      </div>
                    </div>

                    <div class="col-lg-8 p-l-0 p-r-0">
                      <div class="form-group form-group-default input-group required">
                        <div class="form-input-group">
                          <label><?=$entry_arrival_time?></label>
                          <input type="text" name="date_arrival" id="time-arrival" class="form-control time" required/>
                        </div>
                        <div class="input-group-addon">
                          <i class="fa fa-clock-o"></i>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-8 p-l-0 p-r-0">
                      <div class="form-group form-group-default required">
                        <label><?=$entry_flight_number?></label>
                        <input type="text" name="flight_number" id="flight-number" class="form-control" required>
                      </div>
                    </div>
                    <div class="col-lg-8 p-l-0 p-r-0">
                      <div class="form-group form-group-default required">
                        <label><?=$entry_ticket_price?></label>
                        <input type="number" name="total_price" id="total-price" min="0" class="form-control" required>
                      </div>
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
            <div class="padding-30 sm-padding-5  sm-m-t-15 m-t-50">
              <h2><?=$text_enter_info?></h2>
              <p class="small hint-text"><?=$desc_enter_info_add?></p>
              <div class="m-t-30">
                <h5><?=$text_total_price?></h5>
                <h5><?=$text_discount?></h5>
                <h6><?=$text_discounted_price?></h6>
              </div>
            </div>
          </div>
          <!-- BEGIN FORM -->
          <div class="col-md-7">
              <div class="card-block">
                <form id="userInfo" role="form">
                  <div class="col-lg-8 p-l-0 p-r-0">
                    <div class="form-group form-group-default required">
                      <label><?=$entry_name?></label>
                      <input type="text" name="name" id="name" class="form-control" required value="<?php if (isset($user['firstname'])) echo $user['firstname']; ?><?php if (isset($user['firstname'])&&isset($user['lastname'])) echo ' '.$user['lastname']; ?>">
                    </div>
                  </div>
                  <div class="col-lg-8 p-l-0 p-r-0">
                    <div class="form-group form-group-default required">
                      <label><?=$entry_passport?></label>
                      <input type="text" pattern=".{7,}" name="passport" id="passport" class="form-control" required>
                    </div>
                  </div>
                  <div class="col-lg-8 p-l-0 p-r-0">
                    <div class="form-group form-group-default">
                      <label><?=$entry_luggage_count?></label>
                      <select name="luggage" id="luggage" class="form-control full-width cs-select cs-skin-slide" data-init-plugin="cs-select">
                        <option value="0"><?=$option_luggage_loose?></option>
                        <option value="1"><?=$option_luggage_add_1?></option>
                        <option value="2" selected><?=$option_luggage_add_2?></option>
                      </select>
                    </div>
                  </div>
                  <div class="col-lg-3 p-l-0 p-r-0" id="loose-weight" style="display: none;">
                    <div class="form-group form-group-default required">
                      <label><?=$entry_loose_weight?></label>
                      <input type="number" name="weight" id="weight" class="form-control">
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
            <div class="padding-30 sm-padding-5  sm-m-t-15 m-t-50">
              <h2><?=$text_upload_documents?></h2>
              <p class="small hint-text"><?=$desc_upload_documents?></p>
            </div>
          </div>
          <!-- BEGIN FORM -->
          <div class="col-md-7">
              <div class="card-block">
                <?=$ticket_image?>
                <div class="m-t-30"></div>
                <?=$identification_image?>
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
                    <h6><?=$text_departure?></h6>
                    <div id="summary-departure">
                    </div>
                  </div>
                  <div class="col-md-6">
                    <h6><?=$text_arrival?></h6>
                    <div id="summary-arrival">
                    </div>
                  </div>
                </div>
                <div class="row m-t-30">
                  <div class="col-md-6">
                    <h6><?=$text_flight_info?></h6>
                    <div id="summary-flight">
                    </div>
                  </div>
                  <div class="col-md-6">
                    <h6><?=$text_your_info?></h6>
                    <div id="summary-info">
                    </div>
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
              <h5 style="padding-bottom: 12px; border-bottom: 1px solid #eeeeee;"><?=$text_total_price?></h5>
              <h5><?=$text_discount?></h5>
              <h6><?=$text_discounted_price?></h6>

              <p class="small hint-text">
              <?=$text_luggage_reward?><?=$desc_luggage_reward_add?>
              </p>
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
            <a href="<?=$url_flight_list?>">
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
  var $estimated = false;

  function validate($current_tab=false, $check_callback=false, $error_callback=function(){}) {
    if ($check_callback==false) {
      $check_callback = function(){return true;};
    }
    if (!$current_tab) {
      // Find current tab
      $current_tab = $('.nav-item a.active').attr('href');
    }
    var $error = false;
    $($current_tab).find('form .has-error').removeClass('has-error');
    $($current_tab).find('form').find('input, textarea, select').each(function(){

      // required field empty?
      if (($(this).prop('required') && $(this).val().trim().length === 0)) {
        headsUp('<?=$error_required_title?>', '<?=$error_required?>', '', 'modal-required');
        $error = true;
        $(this).closest('.form-group').addClass('has-error')
        $error_callback($(this));
        return false; // Stop the loop
      }

      // Custom validation method
      if (!$check_callback($(this))) {
        $error = true;
        $(this).closest('.form-group').addClass('has-error')
        $error_callback($(this));
        return false; // Stop the loop
      }
    });

    return !$error;
  }

  $(document).ready(function(){
    $('.form-control.time').datetimepicker({format: "YYYY-MM-DD HH:mm:00"}).focus(function(){
      var $this = $(this);
      setTimeout(function(){
        var widget = $this.next('.bootstrap-datetimepicker-widget')
        var offset = widget.offset();
        var height = widget.height();
        if (offset && height) {
          widget.appendTo($('body'))
            .css('top',offset.top+'px')
            .css('left',offset.left+'px')
            .css('max-height', height+10+'px')
            .css('min-width', '280px');
        }
      },20);
    });

    // Luggage count change
    $('#luggage').change(function(){
      if ($('#luggage').val() == 0) {
        $('#weight').attr('required', '');
        $('#loose-weight').attr('style', '');
        $('.discount').html(0);
        $('.you-pay').html(parseFloat(Math.max(0, $('.total-price').html())));

        $('#weight').change(function() {
            $('.discount').html(parseFloat($('#weight').val()) * 5.00);
            $('.you-pay').html(parseFloat(Math.max(0, $('.total-price').html() - parseFloat($('#weight').val()) * 5.00)));
        })
      } else {
        $('#weight').removeAttr('required');
        $('.discount').html(parseFloat($(this).val()) * 200);
        $('.you-pay').html(parseFloat(Math.max(0, $('.total-price').html() - parseFloat($(this).val()) * 200)));
        $('#loose-weight').css('display', 'none');
      }
    });

    // Tab switch injection
    $('#btn-next, #btn-back, #steps .nav-item a').click(function(){

        // Before tab change
        if (!$returning) {

          var $current_tab = $('.nav-item a.active').attr('href');

          validate($current_tab,
            function($current){
              if ($current_tab=='#tab1') {
                if ($current.attr('name') == 'departure') {
                  if ($('select[name="departure"]').select2('data')[0].id == $('select[name="arrival"]').select2('data')[0].id) {
                    headsUp('<?=$error_location_title?>', '<?=$error_location?>', '', 'modal-same-dep-arr');
                    return false;
                  }
                }
                // Make sure dates are valid
                if ($current.attr('name') == 'date_departure' || $current.attr('name') == 'date_arrival') {
                  var $time_departure = $('input[name="date_departure"]').val();
                  var $time_arrival = $('input[name="date_arrival"]').val();
                  var $yesterday = new Date();
                  $yesterday.setDate($yesterday.getDate() - 1);
                  $yesterday = $yesterday.toISOString().split('T')[0];

                  if ($current.attr('name') == 'date_departure') {
                    if ($time_arrival < $time_departure || $time_departure < $yesterday) {
                      headsUp('<?=$error_date_title?>', '<?=$error_date?>', '', 'modal-same-dep-arr');
                      return false;
                    }
                  }
                  else {
                    if ($time_arrival < $yesterday || $time_arrival < $yesterday) {
                      headsUp('<?=$error_date_title?>', '<?=$error_date?>', '', 'modal-same-dep-arr');
                      return false;
                    }
                  }
                }
              }
              return true;
            },
            function($source){
              setTimeout(function(){
              $returning = true;
                $('#steps .nav-item a[href="'+$current_tab+'"]').click();
              },10);
              setTimeout(function(){$returning=false;},20);
            }
          );
        }
        // After tab change
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
          if ($current_tab === '#tab2') {
            $price = parseFloat($('input[name="total_price"]').val());
              $('.total-price').html($price);
              $('.discount').html(400);
              $('.you-pay').html(Math.max(0,$price-400));
          }
          if ($current_tab === '#tab4') {
            // Make sure info is filled in
            if (validate('#tab2',false,function(){$('#steps .nav-item a[href="#tab2"]').click();})) {

              // Fill data
              $('#summary-departure').html('<h4>'+$('select[name="departure"]').select2('data')[0].text+'</h4><p>'+$('input[name="date_departure"]').val()+'</p>');
              $('#summary-arrival').html('<h4>'+$('select[name="arrival"]').select2('data')[0].text+'</h4><p>'+$('input[name="date_arrival"]').val()+'</p>');
              $('#summary-flight').html('<h4>'+$('input[name="flight_number"]').val()+'</h4>');
              $('#summary-info').html('<h4>'+$('input[name="name"]').val()+'</h4><p>'+$('input[name="passport"]').val()+'</p>');
            }
          }
        }, 10);
    });


    $('#btn-finish').click(function(){
      $.ajax({
        url: '<?=$url_submit?>',
        method: 'POST',
        data: $('.tab-content form').serialize()+'&full_price='+
              $('.total-price').html()+'&price='+$('.you-pay').html(),
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
        data: $('.tab-content form').serialize()+'&full_price='+
              $('.total-price').html()+'&price='+$('.you-pay').html(),
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
  });
</script>
<?=$wrapper_bottom?>
