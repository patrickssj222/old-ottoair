<nav class="page-sidebar" data-pages="sidebar">
  <!-- BEGIN SIDEBAR MENU HEADER-->
  <div class="sidebar-header">
    <img src="<?=HTTP_SERVER?>assets/img/logo_white.png" alt="logo" class="brand" data-src="<?=HTTP_SERVER?>assets/img/logo_white.png" data-src-retina="<?=HTTP_SERVER?>assets/img/logo_white_2x.png" width="78" height="22" style="visibility:hidden">

    <div class="sidebar-header-controls">
      <button type="button" class="btn btn-xs sidebar-slide-toggle btn-link m-l-20 hidden-md-down" data-pages-toggle="#appMenu" style="visibility: hidden;"><i class="fa fa-angle-down fs-16"></i>
      </button>
      <button type="button" class="btn btn-link hidden-md-down" data-toggle-pin="sidebar"><i class="fa fs-12"></i>
      </button>
    </div>
  </div>
  <!-- END SIDEBAR MENU HEADER-->


  <!-- START SIDEBAR MENU -->
  <div class="sidebar-menu">
    <!-- BEGIN SIDEBAR MENU ITEMS-->
    <ul class="menu-items">
        <?php foreach ($menus as $name => $v) { ?>
            <li class="<?php if (!empty($v['class'])) echo $v['class'];?> <?php if (strpos($_GET['path'], $v['href']) !== false) echo 'active'; ?>">
                <a <?php if (!empty($v['href'])) echo 'href="' . HTTP_SERVER . $v['href'] . '"'?> class="<?php if (!empty($v['detail'])) echo 'detailed';?>">
                    <span class="title"><?=$name?></span>
                    <?php if (!empty($v['detail'])) { ?>
                        <span class="details"><?=$v['detail']?></span>
                    <?php } ?>
                </a>
                <span class="icon-thumbnail <?php if (strpos($_GET['path'], $v['href']) !== false || ($v['href'] == ' ' && $_GET['path']=='home')) echo 'bg-success'; ?>"><i class="<?=$v['icon']?>"></i></span>
            </li>
        <?php } ?>
    </ul>
    <div class="clearfix"></div>
  </div>
  <!-- END SIDEBAR MENU -->
</nav>

<script type="text/javascript">
/****************** 2017-09-21 Jack *******************/
  // Append a href to all icons. No jQuery at this point
  var icons = document.getElementsByClassName('icon-thumbnail');
  for (var i = icons.length - 1; i >= 0; i--) {
    if (icons[i].previousElementSibling.tagName.toLowerCase() == 'a') {
      var a = document.createElement('a');
      a.href = icons[i].previousElementSibling.href;
      a.className='icon-after';
      icons[i].appendChild(a);
    }
  }
</script>