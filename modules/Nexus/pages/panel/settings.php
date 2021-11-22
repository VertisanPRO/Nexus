<?php
/*
 *	Made by Samerton
 *  https://github.com/NamelessMC/Nameless/tree/v2/
 *  NamelessMC version 2.0.0-pr12
 *
 *  License: MIT
 *
 *  Nexus By Mubeen & xGIGABAITx
 */

$page_title = NexusUtill::getLanguage('general', 'title');

if ($user->isLoggedIn()) {
  if ($user->canViewStaffCP) {

    Redirect::to(URL::build('/'));
    die();
  }
  if (!$user->isAdmLoggedIn()) {

    Redirect::to(URL::build('/panel/auth'));
    die();
  } else {
    if (!$user->hasPermission('admincp.nexus')) {
      require_once(ROOT_PATH . '/403.php');
      die();
    }
  }
} else {
  // Not logged in
  Redirect::to(URL::build('/login'));
  die();
}

define('PAGE', 'panel');
define('PANEL_PAGE', 'nexus_items');

require_once(ROOT_PATH . '/core/templates/backend_init.php');


$smarty->assign(array(
  // NamelessMC 
    'SUBMIT' => $language->get('general', 'submit'),
    'YES' => $language->get('general', 'yes'),
    'NO' => $language->get('general', 'no'),
    'BACK' => $language->get('general', 'back'),
    'BACK_LINK' => URL::build('/panel/nexus'),
    'ARE_YOU_SURE' => $language->get('general', 'are_you_sure'),
    'CONFIRM_DELETE' => $language->get('general', 'confirm_delete'),
    'NAME' => $language->get('admin', 'name'),
    'DESCRIPTION' => $language->get('admin', 'description'),

  // Nexus About
    'TITLE' => NexusUtill::getLanguage('general', 'title'),

  // Navigation
    'NAVIGATION' => NexusUtill::getLanguage('navigation', 'navigation'),
    'OPTIONS_PAGE' => NexusUtill::getLanguage('navigation', 'options_page'),
    'COLORS_PAGE' => NexusUtill::getLanguage('navigation', 'colors_page'),
    'NAVBAR_PAGE' => NexusUtill::getLanguage('navigation', 'navbar_page'),
    'CONNECTIONS_PAGE' => NexusUtill::getLanguage('navigation', 'connections_page'),
    'ADVANCED_PAGE' => NexusUtill::getLanguage('navigation', 'advanced_page'),
    'ARC_PAGE' => NexusUtill::getLanguage('navigation', 'arc_page'),
    'WIDGETS_PAGE' => NexusUtill::getLanguage('navigation', 'widgets_page'),
    'EMBED_PAGE' => NexusUtill::getLanguage('navigation', 'embed_page'),
    'UPDATES_PAGE' => NexusUtill::getLanguage('navigation', 'updates_page'),
    'SUPPORT_PAGE' => NexusUtill::getLanguage('navigation', 'support_page'),

  // Options
    'FAVICON_LABEL' => NexusUtill::getLanguage('options', 'favicon_label'),
    'ABOUT_LABEL' => NexusUtill::getLanguage('options', 'about_label'),
    'ABOUT_PLACEHOLDER_LABEL' => NexusUtill::getLanguage('options', 'about_placeholder_label'),

  // Colors
    'DARKMODE_LABEL' => NexusUtill::getLanguage('colors', 'darkmode_label'),
    'TEMPLATE_COLOR_LABEL' => NexusUtill::getLanguage('colors', 'template_color_label'),
    'NAVBAR_COLOR_LABEL' => NexusUtill::getLanguage('colors', 'navbar_color_label'),
    'FOOTER_COLOR_LABEL' => NexusUtill::getLanguage('colors', 'footer_color_label'),
    'BORDER_COLOR_LABEL' => NexusUtill::getLanguage('colors', 'border_color_label'),
    'COLORS_INFO_LABEL' => NexusUtill::getLanguage('colors', 'colors_info_label'),
    'NAVBAR_TEXT_LABEL' => NexusUtill::getLanguage('colors', 'navbar_text_label'),
    'BLACK_LABEL' => NexusUtill::getLanguage('colors', 'black_label'),
    'WHITE_LABEL' => NexusUtill::getLanguage('colors', 'white_label'),

  // Navbar
    'LOGO_LABEL' => NexusUtill::getLanguage('navbar', 'logo_label'),
    'NAVIGATION_MENU_LABEL' => NexusUtill::getLanguage('navbar', 'navigation_menu_label'),
    'NAVIGATION_STYLE_LABEL' => NexusUtill::getLanguage('navbar', 'navigation_style_label'),
    'NAV_TRUE_LABEL' => NexusUtill::getLanguage('navbar', 'nav_true_label'),
    'NAV_FALSE_LABEL' => NexusUtill::getLanguage('navbar', 'nav_false_label'),
    'DYNAMIC_LABEL' => NexusUtill::getLanguage('navbar', 'dynamic_label'),
    'ELEGANT_LABEL' => NexusUtill::getLanguage('navbar', 'elegant_label'),

  // Connections
    'SERVER_DOMAIN_LABEL' => NexusUtill::getLanguage('connections', 'server_domain_label'),
    'IP_ADDRESS_LABEL' => NexusUtill::getLanguage('connections', 'ip_address_label'),
    'SERVER_PORT_LABEL' => NexusUtill::getLanguage('connections', 'server_port_label'),
    'STYLE_LABEL' => NexusUtill::getLanguage('connections', 'style_label'),
    'SIMPLE_LABEL' => NexusUtill::getLanguage('connections', 'simple_label'),
    'ADVANCED_LABEL' => NexusUtill::getLanguage('connections', 'advanced_label'),
    'DISCORD_LABEL' => NexusUtill::getLanguage('connections', 'discord_label'),
    'DISCORD_ID_LABEL' => NexusUtill::getLanguage('connections', 'discord_id_label'),
    'ENABLE_DISCORD_LABEL' => NexusUtill::getLanguage('connections', 'enable_discord_label'),
    'ENABLE_MINECRAFT_LABEL' => NexusUtill::getLanguage('connections', 'enable_minecraft_label'),

  // Advanced
    'ADV_WARNING' => NexusUtill::getLanguage('advanced', 'adv_warning'),
    'ADV_NAV_LABEL' => NexusUtill::getLanguage('advanced', 'adv_nav_label'),
    'ADV_CONTAINER_LABEL' => NexusUtill::getLanguage('advanced', 'adv_container_label'),
    'ADV_MARGIN_TOP_LABEL' => NexusUtill::getLanguage('advanced', 'adv_margin_top_label'),
    'ADV_MARGIN_BOTTOM_LABEL' => NexusUtill::getLanguage('advanced', 'adv_margin_bottom_label'),
    'ADV_NAV_SIZE_LABEL' => NexusUtill::getLanguage('advanced', 'adv_nav_size_label'),
    'MINI_LABEL' => NexusUtill::getLanguage('advanced', 'mini_label'),
    'TINY_LABEL' => NexusUtill::getLanguage('advanced', 'tiny_label'),
    'SMALL_LABEL' => NexusUtill::getLanguage('advanced', 'small_label'),
    'LARGE_LABEL' => NexusUtill::getLanguage('advanced', 'large_label'),
    'HUGE_LABEL' => NexusUtill::getLanguage('advanced', 'huge_label'),
    'MASSIVE_LABEL' => NexusUtill::getLanguage('advanced', 'massive_label'),

  // Arc
    'ARC_LABEL' => NexusUtill::getLanguage('arc', 'arc_label'),
    'ARC_URL_LABEL' => NexusUtill::getLanguage('arc', 'arc_url_label'),
    'ARC_INFO_1' => NexusUtill::getLanguage('arc', 'arc_info_1'),
    'ARC_INFO_2' => NexusUtill::getLanguage('arc', 'arc_info_2'),
    'ARC_INFO_3' => NexusUtill::getLanguage('arc', 'arc_info_3'),
    'ARC_INFO_4' => NexusUtill::getLanguage('arc', 'arc_info_4'),
    'ARC_INFO_5' => NexusUtill::getLanguage('arc', 'arc_info_5'),

  // Widgets
    // Donation Widget
      'DONATE_WIDGET_LABEL' => NexusUtill::getLanguage('widgets', 'donate_widget_label'),
      'DONATE_EMAIL_LABEL' => NexusUtill::getLanguage('widgets', 'donate_email_label'),
      'FIRST_AMOUNT_LABEL' => NexusUtill::getLanguage('widgets', 'first_amount_label'),
      'SECOND_AMOUNT_LABEL' => NexusUtill::getLanguage('widgets', 'second_amount_label'),
      'THIRD_AMOUNT_LABEL' => NexusUtill::getLanguage('widgets', 'third_amount_label'),

    // Message Widget
      'MESSAGE_WIDGET_LABEL' => NexusUtill::getLanguage('widgets', 'message_widget_label'),
      'MESSAGE_TITLE_LABEL' => NexusUtill::getLanguage('widgets', 'message_title_label'),
      'MESSAGE_TEXT_LABEL' => NexusUtill::getLanguage('widgets', 'message_text_label'),
      'MESSAGE_ICON_LABEL' => NexusUtill::getLanguage('widgets', 'message_icon_label'),

  // Embed
    'EMBED_HEAD_LABEL' => NexusUtill::getLanguage('embed', 'embed_head_label'),
    'EMBED_DESC_LABEL' => NexusUtill::getLanguage('embed', 'embed_desc_label'),
    'EMBED_COLOR_LABEL' => NexusUtill::getLanguage('embed', 'embed_color_label'),
    'EMBED_IMAGE_LABEL' => NexusUtill::getLanguage('embed', 'embed_image_label'),
    'EMBED_KEYWORDS_LABEL' => NexusUtill::getLanguage('embed', 'embed_keywords_label'),
    'EMBED_IMAGE_INFO_LABEL' => NexusUtill::getLanguage('embed', 'embed_image_info_label'),
    'EMBED_KEYWORDS_INFO_LABEL' => NexusUtill::getLanguage('embed', 'embed_keywords_info_label'),
    'EMBED_PREVIEW_LABEL' => NexusUtill::getLanguage('embed', 'embed_preview_label'),

  // Other
    'TRUE_LABEL' => NexusUtill::getLanguage('general', 'true_label'),
    'FALSE_LABEL' => NexusUtill::getLanguage('general', 'false_label'),
    'INFO_BOX_LABEL' => NexusUtill::getLanguage('general', 'info_box_label'),
));


$smarty->assign(NexusUtill::getSettingsToSmarty());

if (!isset($_POST['sel_btn'])) {
  if (Input::exists()) {
    $errors = array();


    if (Token::check(Input::get('token'))) {

      Session::flash('select_btn', $_POST['sel_btn']);

      if (count($_FILES)) {

        require(ROOT_PATH . '/core/includes/bulletproof/bulletproof.php');

        $module_img_dir = join(DIRECTORY_SEPARATOR, array(ROOT_PATH, 'uploads', 'Nexus'));

        if (!file_exists($module_img_dir)) {
          mkdir($module_img_dir);
        }

        foreach ($_FILES as $key => $value) {

          $image = new Bulletproof\Image($_FILES);

          $image_extensions = array('jpg', 'png', 'gif', 'jpeg');
          $image->setSize(1000, 10 * 1048576);
          $image->setDimension(2000, 2000);
          $image->setMime($image_extensions);
          $image->setName($key);

          $image->setLocation(join(DIRECTORY_SEPARATOR, array(ROOT_PATH, 'uploads', 'Nexus')));

          if ($image[$key]) {
            $upload = $image->upload();
            if ($upload) {

              $img_url = $_SERVER['REQUEST_SCHEME'] . '://' . $_SERVER['SERVER_NAME'] . '/uploads/Nexus/' . $upload->getName() . '.' . $upload->getMime();

              try {
                $queries->update('nexus_settings', $settings_data_array[$key]['id'], array(
                  'value' => $img_url
                ));
              } catch (Exception $e) {
                $queries->create('nexus_settings',  array(
                  'name' => $key,
                  'value' => $img_url
                ));
              }

              Session::flash('staff', NexusUtill::getLanguage('general', 'save_successfully'));
              Redirect::to(URL::build('/panel/nexus/'));
              die();
            }
          } else {
            $errors = NexusUtill::getLanguage('general', 'img_empty_and_size') . ini_get('upload_max_filesize');
          }
        }
      } else {

        foreach ($_POST as $key => $value) {

          if ($key == 'token') {
            continue;
          }

          $validate = new Validate();
          $validation = $validate->check($_POST, array(
            'token' => array(
              'required' => true
            )
          ));

          if ($validation->passed()) {
            try {
              try {
                $queries->update('nexus_settings', $settings_data_array[$key]['id'], array(
                  'value' => Input::get($key)
                ));
              } catch (Exception $e) {
                $queries->create('nexus_settings',  array(
                  'name' => $key,
                  'value' => Input::get($key)
                ));
              }
            } catch (Exception $e) {
              $errors[] = $e->getMessage();
            }
          } else {
            $errors[] = NexusUtill::getLanguage('general', 'save_errors');
          }
        }
        Session::flash('select_btn', $_POST['sel_btn_session']);
        if (!count($errors)) {
          Session::flash('staff', NexusUtill::getLanguage('general', 'save_successfully'));
          Redirect::to(URL::build('/panel/nexus/'));
          die();
        }
      }
    } else {
      $errors[] = $language->get('general', 'invalid_token');
    }
  }
}

$template_file = 'nexus/nexus.tpl';

// Load modules + template
Module::loadPage($user, $pages, $cache, $smarty, array($navigation, $cc_nav, $mod_nav), $widgets, $template);
$page_load = microtime(true) - $start;
define('PAGE_LOAD_TIME', str_replace('{x}', round($page_load, 3), $language->get('general', 'page_loaded_in')));
$template->onPageLoad();

if (Session::exists('select_btn')) {
  $smarty->assign(array(
    'TPL_NAME_SESSION' =>  Session::flash('select_btn')
  ));
}

if (Session::exists('staff'))
  $success = Session::flash('staff');

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
));

require(ROOT_PATH . '/core/templates/panel_navbar.php');

$template->displayTemplate($template_file, $smarty);
