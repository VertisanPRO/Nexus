<?php
/*
 *  Made by Samerton
 *  https://github.com/NamelessMC/Nameless/tree/v2/
 *  NamelessMC version 2.0.0-pr13
 *
 *  License: MIT
 *
 *  Nexus By Vertisan
 */

$template_file = 'tpl/nexus.tpl';

require_once('classes/NexusUtil.php');
require_once(ROOT_PATH . '/core/templates/backend_init.php');
NexusUtil::initialise();

$smarty->assign(NexusUtil::getSettingsToSmarty());
$smarty->assign(array(
  // Functions
    'TPL_PATH' => ROOT_PATH . '/custom/templates/Nexus/template_settings/tpl/',
    'SETTINGS_TEMPLATE' => ROOT_PATH . '/custom/templates/Nexus/template_settings/' . $template_file,

  // Text
    'SUBMIT' => $language->get('general', 'submit'),
    'YES' => $language->get('general', 'yes'),
    'NO' => $language->get('general', 'no'),
    'BACK' => $language->get('general', 'back'),
    'ARE_YOU_SURE' => $language->get('general', 'are_you_sure'),
    'CONFIRM_DELETE' => $language->get('general', 'confirm_delete'),
    'NAME' => $language->get('admin', 'name'),
    'INFO' => $language->get('general', 'info'),
    'ENABLED' => $language->get('admin', 'enabled'),
    'DISABLED' => $language->get('admin', 'disabled'),
));

$smarty->assign(NexusUtil::languageFileToSmarty('navigation'));
$smarty->assign(NexusUtil::languageFileToSmarty('options'));
$smarty->assign(NexusUtil::languageFileToSmarty('colors'));
$smarty->assign(NexusUtil::languageFileToSmarty('navbar'));
$smarty->assign(NexusUtil::languageFileToSmarty('connections'));
$smarty->assign(NexusUtil::languageFileToSmarty('preloader'));
$smarty->assign(NexusUtil::languageFileToSmarty('addons'));
$smarty->assign(NexusUtil::languageFileToSmarty('widgets'));
$smarty->assign(NexusUtil::languageFileToSmarty('embed'));

if (isset($_POST['sel_btn_session'])) {
  Session::flash('sel_btn_session', $_POST['sel_btn_session']);
}

if (!isset($_POST['sel_btn'])) {
  if (Input::exists()) {
    $errors = array();

      foreach ($_POST as $key => $value) {
        if ($key == 'token' or $key == 'sel_btn_session') {
          continue;
        }
        NexusUtil::updateOrCreateParam($key, $value);
      }

      if (empty($errors)) {
        Session::flash('staff', $language->get('admin', 'successfully_updated'));
        Redirect::to(URL::build($_SESSION['last_page']));
        die();
      }
    }
}

if (Session::exists('staff'))
  $success = Session::flash('staff');
  $TPL_NAME_SESSION = '';

if (Session::exists('sel_btn_session'))
  $TPL_NAME_SESSION = Session::flash('sel_btn_session');

$smarty->assign(array(
  'TPL_NAME_SESSION' => $TPL_NAME_SESSION
));

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
));