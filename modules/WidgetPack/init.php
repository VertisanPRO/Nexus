<?php

require_once(ROOT_PATH . '/modules/WidgetPack/module.php');

$widget_language = new Language(ROOT_PATH . '/modules/WidgetPack/language', LANGUAGE);
$module = new WidgetPack_Module($language, $widget_language, $pages);