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
                <div class="row address-map">
                  <div class="col-md-6">
                    <h6><?=$text_sender?></h6>
                    <div id="summary-sender">
                      <h4><?=$shipment['sender_name']?></h4>
                      <p><?=$shipment['sender_phone']?></p>
                      <p><?=$shipment['sender_email']?></p>
                      <p><?=$shipment['sender_wx']?></p>
                    </div>

                    <div id="sender-map" style="background-color:black;width:100%;height: 250px; padding-top:1rem;"></div>

                    <div>
                    </div>
                  </div>
                  <!-- <div class="col-md-1 m-t-30">
                    <i class="fa fa-arrow-right"></i>
                  </div> -->
                  <div class="col-md-6">
                    <h6><?=$text_receiver?></h6>
                    <div id="summary-receiver">
                      <h4><?=$shipment['receiver_name']?></h4>
                      <p><?=$shipment['receiver_phone']?></p>
                      <p><?=$shipment['receiver_address']?></p>
                    </div>

                    <div id="receiver-map" style="background-color:black;width:100%;height: 250px;padding-top:1rem;"></div>

                  </div>
                </div>

                <br>
                <div class="row">
                  <div class="col-md-6">
                    <h5>Sender Address:</h5>
                    <h6><?=$shipment['sender_address']?>, <?=$shipment['sender_city']?></h6>
                    <h6><?=$shipment['sender_province']?>, <?=$shipment['sender_postal']?></h6>
                    <h6 id="s_lat" style="display: none;"><?=$shipment['s_lat']?></h6>
                    <h6 id="s_lng" style="display: none;"><?=$shipment['s_lng']?></h6>
                  </div>
                  <div class="col-md-6">
                    <h5>Receiver Address:</h5>
                    <h6><?=$shipment['receiver_address']?>, <?=$shipment['receiver_city']?></h6>
                    <h6><?=$shipment['receiver_province']?>, <?=$shipment['receiver_postal']?></h6>
                    <h6 id="r_lat" style="display: none;"><?=$shipment['r_lat']?></h6>
                    <h6 id="r_lng" style="display: none;"><?=$shipment['r_lng']?></h6>
                  </div>
                </div>


                <div class="row m-t-30" style="padding-top: 12px; border-top: 1px solid #eeeeee;">
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
                      <?php foreach ($items as $item) { ?>
                        <tr>
                          <td><?=$item['item_name']?></td>
                          <td class="text-center"><?=$item['item_price']?></td>
                          <td class="text-center"><?=$item['item_weight']?></td>
                          <td class="text-center"><?=$item['item_count']?></td>
                          <td class="text-right"><?=$item['total_price']?></td>
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
              <h2><?=$pb_header?></h2>
              <p><?=$pb_description?></p>
              <br>

              <form id="pd-form">
                <div>
                  <div class="pickupSelection radio radio-info" style="float: left;">
                      <input type="radio" value="pickup" name="pd-select" id="pickup">
                      <label for="pickup"><?=$pb_pickup?></label>
                      <input type="radio" value="dropin" name="pd-select" id="dropin">
                      <label for="dropin"><?=$pb_dropin?></label>
                  </div>
                  <button id="savePD" type="button" class="btn btn-success" style="float: right;"><?=$pb_save?></button>
                </div>

                <br><br>

                <p><?=$pb_region?>
                  <span style="padding-left: 10px;">
                    <select id="pd-region" name="pd-region" class="cs-select cs-skin-slide" data-init-plugin="cs-select">
                        <option value="Downtown">Downtown</option>
                        <option value="NorthYork">North York</option>
                        <option value="Markham">Markham</option>
                        <option value="Scarborough">Scarborough</option>
                        <option value="RichmondHill">Richmond Hill</option>
                    </select>
                  </span>
                </p>

              </form>

              <br>

              <div class="row">
                <div class="col-md-12">
                  <!-- <div id="pdMap" style="background-color:black;background-image: url('../../assets/img/temp-map.png');width:100%;height: 300px;"></div> -->
                  <div id="pdMap" style="background-color:black; width:100%;height: 300px;"></div>
                </div>
              </div>
              <br>

              <div class="details" id="pickupInfo">
                <?=$pb_pickup_info?>
              </div>

              <div class="details" id="dropinInfo" style="display: none;">
                <?=$pb_dropin_info?>
              </div>
            </div>

            <div class="padding-30 sm-padding-5 sm-m-t-15" style="padding-top: 12px; border-top: 1px solid #eeeeee;">
              <h2><?=$text_summary?></h2>
              <p><?=$text_shipment_summary?></p>
              <br>
              <!-- <h6><?=$text_estimated_price?></6> -->
              <h5><?php echo sprintf($text_total_weight, number_format($shipment['total_weight'], 2)); ?></h5>
              <h5><?php echo sprintf($text_total_price, number_format($shipment['total_price'], 2)); ?></h5>
              <?php if ($balance !== 0) { ?>
                <h5 style="padding-top: 12px; border-top: 1px solid #eeeeee;"><?php echo sprintf($text_balance, number_format($balance, 2)); ?></h5>
              <?php } ?>

              <p class="small hint-text"><?=$text_our_rate?></p>
            </div>
          </div>

        </div>

        <script>
          $('input:radio').click(function(){
            $('.details').hide();
            var selection = "#" + $(this).val() + "Info";
            $(selection).fadeIn();
          })
        </script>



        <div class="padding-20 sm-padding-5 sm-m-b-20 sm-m-t-20 bg-white clearfix">
            <?php if ($balance !== 0) { ?>
            <!-- <button class="btn btn-success btn-cons btn-animated from-left fa fa-credit-card pull-right" type="button" data-toggle="modal" data-target="#myModal">
              <span><?=$button_pay_now?></span>
            </button> -->
            <?php } ?>
            <a href="<?=$url_shipments?>">
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

<script>

    var map, infoWindow, u_lat;
    var loc_sender = {lat: parseFloat($('#s_lat').html()),
                      lng: parseFloat($('#s_lng').html())};
    var loc_receiver = {lat: parseFloat($('#r_lat').html()),
                        lng: parseFloat($('#r_lng').html())};

    var locations = {
      location_Scarborough: {lat: 43.7764, lng: -79.2318},
      location_Markham: {lat: 43.8561, lng: -79.3370},
      location_Downtown: {lat: 43.6532, lng: -79.3832},
      location_NorthYork: {lat: 43.7615, lng: -79.4111},
      location_RichmondHill: {lat: 43.8828, lng: -79.4403}
    }

    function initMap() {

      pdMap = new google.maps.Map(document.getElementById('pdMap'), {
        center: locations.location_Downtown,
        zoom: 12
      });

      $.ajax({
        url: '<?=$url_pd_get?>',
        dataType: 'json',
        success: function($data){
          var pd = $data.data.pdSelect;
          if (pd == 'pickup') $('#pickup').attr('checked','');
          if (pd == 'dropin') $('#dropin').attr('checked','');
          if ($data.data.region != ""){
            $('.cs-placeholder').html($data.data.region);
            var point = 'location_' + $data.data.region;
            pdMap.setCenter(locations[point]);
          } else {
            pdMap.setCenter(location_Downtown);
          }
        }
      })

      Object.keys(locations).forEach(function(e){
          createCircle(locations[e], 2000);
          createCircle(locations[e], 5000);
          new google.maps.Marker({
            position: locations[e],
            map: pdMap
          });
      })

      s_map = new google.maps.Map(document.getElementById('sender-map'), {
        center: loc_sender,
        zoom: 11
      });
      new google.maps.Marker({
        position: loc_sender,
        map: s_map
      });


      r_map = new google.maps.Map(document.getElementById('receiver-map'), {
        center: loc_receiver,
        zoom: 11
      });
      new google.maps.Marker({
        position: loc_receiver,
        map: r_map
      });

    }

    $('#pd-region').change(function(){
      var point = 'location_' + $(this).val();
      pdMap.setCenter(locations[point]);
    })


    $('#savePD').click(function(){
      $.ajax({
        url: '<?=$url_pd_select?>',
        data: $('#pd-form').serialize(),
        method: 'POST',
        dataType: 'json',
        success: function($data){
          alert('Saved Pickup/Dropin Selection');
          location.reload();
        }
      })
    })

    function createCircle(c, r) {
      new google.maps.Circle({
        strokeColor: '#FF0000',
        strokeOpacity: 0.3,
        strokeWeight: 2,
        fillColor: '#FF0000',
        fillOpacity: 0.15,
        map: pdMap,
        center: c,
        radius: r
      });
    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAnsr-uSrhCSfnLXOrADz9cv9ATXiLazKU&callback=initMap"
    async defer></script>
