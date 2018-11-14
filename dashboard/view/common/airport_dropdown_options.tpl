<?php foreach ($airports as $o) { ?>
  <?php if (!empty($o['country']) && !empty($o['airports'])) { ?>
    <optgroup label="<?=$o['country']['name']?> (<?=$o['country']['code']?>)">
  <?php } ?>
  <?php if (!empty($o['airports'])) { ?>
    <?php foreach ($o['airports'] as $a) { ?>
      <option value="<?=$a['airport_id']?>"><?=$a['name']?> (<?=$a['code']?>)</option>
    <?php } ?>
  <?php } ?>
  <?php if (!empty($o['country']) && !empty($o['airports'])) { ?>
    </optgroup>
  <?php } ?>
<?php } ?>