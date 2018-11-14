<?=$wrapper_top?>
<!-- START CONTAINER FLUID -->
<div class=" container-fluid   container-fixed-lg">
  <!-- BEGIN PlACE PAGE CONTENT HERE -->
  <!-- START card -->
  <div class="card card-transparent">
    <div class="card-header ">
      <div class="card-title"><?=$text_account_setting?>
      </div>
    </div>
    <div class="card-block">
      <div class="row">
        <div class="col-md-10">
          <br>
          <div class="form-horizontal">
            <div class="form-group row">
              <label for="fname" class="col-md-3 control-label"><?=$text_account_number?></label>
              <div class="col-md-4">
                <p>OA<?php echo str_pad($text_user_id, 4, '0', STR_PAD_LEFT);?></p>
              </div>
            </div>

            <div class="form-group row p-t-25 p-b-0">
              <label for="fname" class="col-md-3 control-label"><?=$text_image?></label>
              <div class="col-md-5">
                <?=$profile_image?>
              </div>
            </div>
          </div>

          <form id="form-setting" class="form-horizontal" role="form" method="post">
              <div class="form-group row">
                <label for="fname" class="col-md-3 control-label"><?=$entry_name?></label>
                <div class="col-md-4">
                  <input type="text" class="form-control" id="fname" value="<?=(!empty($user['firstname']) ? $user['firstname'] : '')?>" placeholder="<?=$entry_firstname?>" name="firstname">
                </div>
                <div class="col-md-4">
                  <input type="text" class="form-control" id="lname" value="<?=(!empty($user['lastname']) ? $user['lastname'] : '')?>" placeholder="<?=$entry_lastname?>" name="lastname">
                </div>
              </div>
              <div class="form-group row required">
                <label for="email" class="col-md-3 control-label"><?=$entry_email?></label>
                <div class="col-md-8">
                  <input type="email" class="form-control" id="email" value="<?=(!empty($user['email']) ? $user['email'] : '')?>" placeholder="<?=$entry_email?>" name="email">
                </div>
              </div>
              <div class="form-group row required">
                <label for="phone" class="col-md-3 control-label"><?=$entry_phone?></label>
                <div class="col-md-8">
                  <input type="phone" class="form-control" id="phone" value="<?=(!empty($user['phone']) ? $user['phone'] : '')?>" placeholder="<?=$entry_email?>" name="phone">
                </div>
              </div>
              <div class="form-group row">
                <label for="wechat" class="col-md-3 control-label"><?=$entry_wechat?></label>
                <div class="col-md-8">
                  <input type="text" class="form-control" id="wechat" value="<?=(!empty($user['wechat']) ? $user['wechat'] : '')?>" placeholder="<?=$entry_wechat?>" name="wechat">
                </div>
              </div>
              <div class="form-group row">
                <label class="col-md-3 control-label"><?=$entry_language?></label>
                <div class="col-md-8">
                  <select name="setting_language" data-init-plugin="select2" style="width: 200px;max-width: 100%">
                    <?php foreach ($languages as $l) { ?>
                      <option value="<?=$l['code']?>" <?php if($l['code']===$user['language_code']){ ?>selected<?php } ?>><?=$l['name']?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <!-- <div class="form-group row">
                <label for="position" class="col-md-3 control-label">Reset Password</label>
                <div class="col-md-8">
                  <input type="text" class="form-control" id="position" placeholder="Enter Old Password">
                  <br>
                  <input type="text" class="form-control" id="position" placeholder="Enter New Password">
                  <br>
                  <input type="text" class="form-control" id="position" placeholder="Repeat New Password">
                </div>
              </div> -->

              <div class="form-group row">
                <label class="col-md-3 control-label"><?=$entry_newsletter?></label>
                <div class="col-md-8">
                  <div class="radio radio-success">
                    <input type="radio" value="1" name="optionNews" id="newsletter-yes">
                    <label for="newsletter-yes"><?=$text_yes?></label>
                    <input type="radio" value="0" name="optionNews" id="newsletter-no">
                    <label for="newsletter-no"><?=$text_no?></label>
                  </div>
                </div>
              </div>

              <div class="form-group">

                <a data-toggle="collapse" href="javascript:void(0)" data-target="#change-password"><?=$text_change_password?>&nbsp;<i class="fa fa-angle-down"></i></a>

                <div id="change-password" class="collapse">

                  <div class="form-group row required">
                    <label class="col-md-3 control-label"><?=$entry_old_password?></label>
                    <div class="col-md-8">
                      <input type="password" class="form-control" id="old-password" name="old_password">
                    </div>
                  </div>
                  <div class="form-group row required">
                    <label class="col-md-3 control-label"><?=$entry_new_password?></label>
                    <div class="col-md-8">
                      <input type="password" class="form-control" id="password" name="password">
                    </div>
                  </div>
                </div>
            </div>

              <div class="form-group row required">
                <label class="col-md-3 control-label"><?=$entry_terms?></label>
                <div class="col-md-8">
                  <div class="checkbox check-success  ">
                    <input type="checkbox" value="1" id="terms" name="terms" class="pull-left">
                    <label for="terms"><?=$label_terms?></label>
                  </div>
                </div>
                <div class="col-md-12 padding-20 sm-padding-5 sm-m-b-20 sm-m-t-20 clearfix">

                    <button class="btn btn-success btn-cons btn-animated from-left fa fa-check pull-right" type="button" id="btn-submit"><span><?=$button_confirm?></span></button>
                    <button class="btn btn-default btn-cons btn-animated from-left fa fa-arrow-left pull-right" type="button" onclick="location.href='<?=HTTP_SERVER?>'"><span><?=$button_cancel?></span></button>
                </div>
              </div>


          </form>
        </div>
      </div>
    </div>
  </div>
  <!-- END card -->
  <!-- END PLACE PAGE CONTENT HERE -->
</div>
<!-- END CONTAINER FLUID -->

<script type="text/javascript">
  $('#form-setting').submit(false);

  $('#btn-submit').click(function(){
    $.ajax({
      url: '<?=$url_submit?>',
      method: 'post',
      data: $('#form-setting').serialize(),
      dataType: 'json',
      success: function(data){
        $('.has-error').removeClass('has-error');

        if (data.success) {
          if (data.redirect) {
            location.href = data.redirect;
          } else {
            location.href = '<?=HTTP_SERVER?>';
          }

        } else if (data.error) {
          $.each(data.error, function($k, $v){
            headsUp($v.title, $v.message, '', 'model-' + $k);
            $('input[name="' + $k + '"]').closest('.form-group').addClass('has-error');
          });

        }

      }
    });
  });
</script>


<?=$wrapper_bottom?>
