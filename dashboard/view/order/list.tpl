<?=$wrapper_top?>
<style>
    .store-container {
      display: flex;
      flex-wrap: wrap;
      /* background-color: DodgerBlue; */
    }

    .store-container > .store-product {
      width: 18%;
      height: auto;
      mid-width:300px;
      margin: 10px;
      text-align: center;
      line-height: 75px;
      font-size: 30px;
      padding-top:1em;
    }

    .product-image {
      width:70%;
      height:auto;
    }

    /* @media (min-width: 1170px) {
      .store-container > .store-product > img {
        width:100%;
        height:auto;
      }
    } */
    @media (max-width: 757px) {
      .store-container > .store-product {
        width: 27%;
      }
      .product-image {
        width:100%;
        height:auto;
      }
    }


    .checked {
        color: black !important;
    }

    .store-product {
      line-height:0;
    }
    .fa-star {
      color: #d1d1d1;
      font-size: 15px;
    }

    h5 {
      padding-bottom: 0px !important;
      margin-bottom: 0px !important;
    }

    .rating {
      line-height:1;
    }
</style>

<div class=" container-fluid   container-fixed-lg bg-white">
  <!-- START card -->

  <div class="card card-transparent">
    <div class="card-header ">
      <div class="card-title"><?=$text_your_orders?>
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
              <th style="width:8%"><?=$column_order_id?></th>
              <th style="width:11%"><?=$column_date?></th>
              <th style="width:25%"><?=$column_names?></th>
              <th style="width:10%"><?=$column_quantity?></th>
              <th style="width:10%"><?=$column_price?></th>
              <th style="width:11%"><?=$column_balance?></th>
              <th style="width:15%"><?=$column_tracking?></th>
              <th style="width:9%"><?=$column_action?></th>
            </tr>
          </thead>
          <tbody>

            <?php foreach ($orders as $o) {
                  $t = $o['tracking'];?>

            <tr id="itemDetail" style="cursor:pointer">
              <td class="v-align-middle" id="flightCheckbox">
                <div class="checkbox text-center">
                  <input type="checkbox" value="3" id="checkbox1">
                  <label for="checkbox1" class="no-padding no-margin"></label>
                </div>
              </td>
              <td class="v-align-middle ">
                OD<?php echo str_pad($o['order_id'], 4, '0', STR_PAD_LEFT)?>
              </td>
              <td class="v-align-middle">
                <?=substr($t['date_added'],0,10)?>
              </td>
              <td class="v-align-middle">
                <?php
                  $limit = 7;
                  $item_names = array();
                  foreach ($o['items'] as $item) {
                    $item_names[] = $item['item_name'];
                    if ($limit++ <= 0) {
                      $item_names.push('...');
                    }
                  }
                  echo implode('<br/>', $item_names);
                ?>
              </td>
              <td class="v-align-middle">
                <?php
                  $item_count = 0;
                  foreach ($o['items'] as $item) {
                    $item_count += (float)$item['item_quantity'];
                  }
                  echo $item_count;
                ?>
              </td>
              <td class="v-align-middle">
                $<?=number_format($o['total'],2)?>
              </td>
              <td class="v-align-middle">
                <?php if ((float)$o['total_with_tax'] <= (float)$o['payment']) { ?>
                  $<?php echo number_format((float)$o['total_with_tax'] - (float)$o['payment'], 2); ?> <br/><?=$text_paid?>
                <?php } else { ?>
                  <span style="cursor:pointer;" data-toggle="modal" data-target="#myModal<?=$o['order_id']?>">$<?php echo number_format((float)$o['total_with_tax'] - (float)$o['payment'], 2); ?> <br/><a href="<?=$o['url_detail_pay']?>"><?=$button_pay_now?></a></span>
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
                <a href="<?=$o['url_detail']?>"><?=$button_detail?></a>
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

<div class=" container-fluid   container-fixed-lg bg-white">
  <div class="card card-transparent">
    <div class="card-header ">
      <div class="card-title"><?=$text_store?></div>
    </div>
    <div class="card-block">
      <div class="store-container">
      </div>
    </div>
  </div>
</div>

<script>
    $.ajax({
      url: '<?=$url_setup_store?>',
      dataType: 'json',
      success: function($data){
        if ($data.success) {
          // console.log($data);
          Object.keys($data.data).forEach(function(e){
            var item_price = $data.data[e].price;
            var rating = $data.data[e].rating;

            if ($data.data[e].original_price != 0) {
              temp = '<span style="text-decoration: line-through;">$'
              + $data.data[e].original_price + '</span>';
            } else temp = '';
            $('.store-container').append('<div class="store-product item_' + $data.data[e].item_id + '">'
              + '<a href="<?=$url_create?>?id=' + $data.data[e].item_id + '">'
              + '<img class="product-image" src="assets/img/products/'+$data.data[e].image+'"></a>'
              + '<h5>' + $data.data[e].name + '</h5>'
              + '<h5><b>'+ temp +' $' + item_price + '</b></h5>'

              + '<div class="rating"><a href="' + $data.data[e].ama_link  + '">'
              + '<span class="fa fa-star ">'
              + '</span><span class="fa fa-star">'
              + '</span><span class="fa fa-star">'
              + '</span><span class="fa fa-star">'
              + '</span><span class="fa fa-star">'
              + '</span></a></div>'
              + '<form action="' + $data.data[e].ama_link + '">'
              + '<button type="submit" class="btn btn-success" style="margin-top:15px;">View Source</button></form>'
              + '</div>');

            for (i = 0; i <= rating; i ++) {
              $('.item_' + $data.data[e].item_id + ' .fa-star:nth-child('+ i + ')').addClass('checked');
            }

          })
        }
      }
    });

</script>

<?=$wrapper_bottom?>
