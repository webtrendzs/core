<!DOCTYPE html>
<html lang="<?php echo $this->language; ?>">
<head>
<meta charset="<?php echo $this->charset; ?>">
<title><?php echo $this->title; ?> - Contao Open Source CMS <?php echo VERSION; ?></title>
<base href="<?php echo $this->base; ?>">
<link rel="stylesheet" href="<?php
  $objCombiner = new Combiner();
  $objCombiner->add('system/themes/'. $this->theme .'/basic.css');
  $objCombiner->add('system/themes/'. $this->theme .'/switch.css');
  echo $objCombiner->getCombinedFile();
?>" media="all">
<!--[if lt IE 8]><link rel="stylesheet" href="<?php echo TL_SCRIPT_URL; ?>system/themes/<?php echo $this->theme; ?>/iefixes.css?<?php echo VERSION .'.'. BUILD; ?>" media="screen"><![endif]-->
<!--[if gt IE 7]><link rel="stylesheet" href="<?php echo TL_SCRIPT_URL; ?>system/themes/<?php echo $this->theme; ?>/ie8fixes.css?<?php echo VERSION .'.'. BUILD; ?>" media="screen"><![endif]-->
</head>
<body>

<div id="container">

<div id="left">
<p><?php echo $this->fePreview; ?></p>
</div>

<div id="right">
<form action="<?php echo $this->action; ?>" method="post">
<div class="formbody">
<input type="hidden" name="FORM_SUBMIT" value="tl_switch">
<?php if ($this->isAdmin): ?>
<label for="ctrl_user"><?php echo $this->feUser; ?>:</label>
<select name="user" id="ctrl_user" class="tl_select">
<?php foreach ($this->users as $id=>$name): ?>
  <option value="<?php echo $id; ?>"<?php if ($id == $this->user): ?> selected="selected"<?php endif; ?>><?php echo $name; ?></option>
<?php endforeach; ?>
</select>
<?php endif; ?>
<label for="ctrl_unpublished"><?php echo $this->hiddenElements; ?>:</label>
<select name="unpublished" id="ctrl_unpublished" class="tl_select">
  <option value="hide"><?php echo $this->lblHide; ?></option>
  <option value="show"<?php if ($this->show) echo ' selected="selected"'; ?>><?php echo $this->lblShow; ?></option>
</select>
<input type="submit" class="tl_submit" value="<?php echo $this->apply; ?>">
<input type="button" class="tl_submit" value="<?php echo $this->reload; ?>" onclick="parent.frames[1].location.reload();">
<img src="<?php echo $this->closeSrc; ?>" width="12" height="12" alt="Close preview bar" class="close" onclick="parent.location = parent.frames[1].location;">
</div>
</form>
</div>

</div>
<?php if ($this->update): ?>

<script>
parent.frames[1].location.reload();
</script>
<?php endif; ?>

</body>
</html>