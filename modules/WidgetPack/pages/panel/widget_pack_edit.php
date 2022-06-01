<?php

$page_title = $widget_language->get('general', 'widget_pack_module');


if ($user->isLoggedIn()) {
  if ($user->canViewStaffCP) {

    Redirect::to(URL::build('/'));
    die();
  }
  if (!$user->isAdmLoggedIn()) {

    Redirect::to(URL::build('/panel/auth'));
    die();
  } else {
    if (!$user->hasPermission('widget_pack.manage')) {
      require_once(ROOT_PATH . '/403.php');
      die();
    }
  }
} else {
  // Not logged in
  Redirect::to(URL::build('/login'));
  die();
}

if (!isset($_GET['id'])) {
  Redirect::to(URL::build('/panel/widget-pack'));
}

define('PAGE', 'panel');
define('PARENT_PAGE', 'widget_pack_configuration');
define('PANEL_PAGE', 'widget_pack_widgets');

require_once(ROOT_PATH . '/core/templates/backend_init.php');
require_once(ROOT_PATH . "/modules/WidgetPack/classes/WPUtil.php");

$wgpacks = new WPUtil();
$widget = $wgpacks->getWgById($_GET['id']);

foreach ($wgpacks->getWgData($widget->name)->data as $key => $value) {
  $wg_data[strtoupper($key)] = $value;
}

$smarty->assign($wg_data);

if (Input::exists()) {
  if (Token::check()) {
    if (isset($_POST['wg_save'])) {
      $wgpacks->wgSaveData($_GET['id'], $_POST);
      Session::flash('wg_packs_success', $widget_language->get('general', 'widget_pack_edit_succses'));
      Redirect::to(URL::build('/panel/widget-pack'));
    }
  }
}
$smarty->assign(WPUtil::getWgLangsSection($widget->name));

$smarty->assign(array(
  'WG_TITLE' => $widget_language->get('general', 'widget_pack_module'),
  'WGPACKS' => $wgpacks->getAll(),
  'BACK_URL' => URL::build('/panel/widget-pack'),
  'WG' => $widget
));







$template_file = 'widget_pack\widgets\\' . strtolower($widget->name) . '.tpl';

// Load modules + template
Module::loadPage($user, $pages, $cache, $smarty, [$navigation, $cc_nav, $staffcp_nav], $widgets, $template);
$page_load = microtime(true) - $start;
define('PAGE_LOAD_TIME', str_replace('{x}', round($page_load, 3), $language->get('general', 'page_loaded_in')));
$template->onPageLoad();

if (Session::exists('wg_packs_success'))
  $success = Session::flash('wg_packs_success');

if (Session::exists('wg_packs_errors'))
  $errors = [Session::flash('wg_packs_errors')];

if (isset($success))
  $smarty->assign(array(
    'SUCCESS' => $success,
    'SUCCESS_TITLE' => $language->get('general', 'success')
  ));

if (isset($errors) && count($errors))
  $smarty->assign(array(
    'ERRORS' => $errors,
    'ERRORS_TITLE' => $language->get('general', 'error')
  ));

$smarty->assign(array(
  'TOKEN' => Token::get(),
  'PAGE' => PANEL_PAGE,
  'PARENT_PAGE' => PARENT_PAGE,
  'PANEL_PAGE' => PANEL_PAGE,
  'DASHBOARD' => $language->get('admin', 'dashboard'),
));


require(ROOT_PATH . '/core/templates/panel_navbar.php');

$template->displayTemplate($template_file, $smarty);
