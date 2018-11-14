<div class="form-group">
<form id="dz-<?=$name?>" class="drop-zone text-center" method="post" enctype="multipart/form-data" runat="server">
  <?php if (!empty($label)) { ?>
  <div class="text-left">
    <label class="dz-label"><?=$label?></label>
  </div>
  <?php } ?>
  <input type="hidden" name="<?=$name?>" value="<?=$value?>"/>
  <div class="dz-hints m-t-30 <?php echo ($value? 'hidden' : ''); ?> " id="dz-<?=$name?>-hints">
    <!-- <button type="button" class="btn btn-success"><?=$button_open?></button><br/> -->
    <button type="button" class="btn btn-default btn-cons btn-animated from-left fa fa-arrow-up" type="button"><span><?=$button_open?></span></button><br/>
    <small class="hint-text m-t-5"><?=$text_drop?></small>
    <?php if (!empty($text_explain)) { ?>
      <br/>
      <p class="dz-explain hint-text m-t-30"><?=$text_explain?></p>
    <?php } ?>
  </div>
  <!-- <div class="fallback">
    <input name="<?=$name?>" value="<?=$value?>"/>
  </div> -->
  <?php if ($value) { ?>
  <div class="dz-preview dz-processing dz-image-preview" id="dz-<?=$name?>-original">
    <div class="dz-details" style="display: inline-block;">
      <div class="dz-filename"><span data-dz-name=""><?=$text_original?></span></div>
      <div class="dz-original" style="background: url('<?=$value?>');"></div>
    </div>
  </div>
  <?php } ?>

  <div class="mask">
    <i class="fa fa-spinner fa-spin"></i>
  </div>

  <script type="text/javascript">
    $(document).ready(function()
    {

      $("#dz-<?=$name?>").dropzone({
        url: '<?=$url_upload?>',
        thumbnailWidth: 140,
        thumbnailHeight: 140,
        maxFiles: 1, // Must work with on maxfilesexceeded
        init: function() {
          this.on("maxfilesexceeded", function(file) 
          {
            this.removeAllFiles();
            this.addFile(file);
          });
          this.on("selectedfiles", function(listFiles) {
            $("#dz-<?=$name?>").addClass('loading');
          });
        },
        acceptedFiles: '<?=$accept?>',
        success: function(file, response)
        {
          $("#dz-<?=$name?>").removeClass('loading');
          var response = JSON.parse(response);
          if (response.success) {
            $('#dz-<?=$name?>-hints, #dz-<?=$name?>-original').addClass('hidden');
            $("#dz-<?=$name?> .dz-preview .dz-details").css('display', 'inline-block').click(function(e)
            {
              e.preventDefault();
              $(this).closest('form').click();
              return false;
            });
          } else {
            this.removeAllFiles();
            if ($('#dz-<?=$name?>-original').length) {
              $('#dz-<?=$name?>-original').removeClass('hidden');
            } else {
              $('#dz-<?=$name?>-hints').removeClass('hidden');
            }
            headsUp('Warning', response.message);
          }
        }
      });

      $("#dz-<?=$name?> *").click(function(e)
      {
        e.preventDefault();
        $(this).closest('form').click();
        return false;
      });
    });
  </script>
</form>
</div>