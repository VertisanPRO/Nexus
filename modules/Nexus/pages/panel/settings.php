<?php
/*
 *	Made by Samerton
 *  https://github.com/NamelessMC/Nameless/tree/v2/
 *  NamelessMC version 2.0.0-pr11
 *
 *  License: MIT
 *
 *  Nexus By Mubeen & xGIGABAITx
 */


// function getExtension($filename)
// // Chek file type. Return array
// {
// 	return explode('.', $filename);
// }


// function getEndRoute()
// // Get last argument from route. Return string
// {
// 	if (empty(end(explode('/', $_SERVER['QUERY_STRING'])))) {
// 		$route = explode('/', $_SERVER['QUERY_STRING']);
// 		array_pop($route);
// 		$route = end($route);
// 	} else {
// 		$route = end(explode('/', $_SERVER['QUERY_STRING']));
// 	}
// 	return $route;
// }

// function getTemplateName($panel = '')
// // no argument return front-end template name
// // argument 'panel_' return staff template name
// {
// 	global $queries;
// 	$template_name = $queries->getWhere($panel . 'templates', array('is_default', '=', 1))['0']->name;
// 	if (empty($template_name)) {
// 		if ($panel == 'panel_') {
// 			$template_name = 'Default';
// 		} else {
// 			$template_name = 'DefaultRevamp';
// 		}
// 	}
// 	return $template_name;
// }

$NexusLanguage = $GLOBALS['NexusLanguage'];
$page_title = $NexusLanguage->get('general', 'title');

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
define('PARENT_PAGE', 'nexus_items');
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
		'TITLE' => $NexusLanguage->get('general', 'title'),

	// Navigation
		'NAVIGATION' => $NexusLanguage->get('navigation', 'navigation'),
		'OPTIONS_PAGE' => $NexusLanguage->get('navigation', 'options_page'),
		'COLORS_PAGE' => $NexusLanguage->get('navigation', 'colors_page'),
		'NAVBAR_PAGE' => $NexusLanguage->get('navigation', 'navbar_page'),
		'CONNECTIONS_PAGE' => $NexusLanguage->get('navigation', 'connections_page'),
		'ADVANCED_PAGE' => $NexusLanguage->get('navigation', 'advanced_page'),
		'ARC_PAGE' => $NexusLanguage->get('navigation', 'arc_page'),
		'WIDGETS_PAGE' => $NexusLanguage->get('navigation', 'widgets_page'),
		'EMBED_PAGE' => $NexusLanguage->get('navigation', 'embed_page'),
		'UPDATES_PAGE' => $NexusLanguage->get('navigation', 'updates_page'),
		'SUPPORT_PAGE' => $NexusLanguage->get('navigation', 'support_page'),

	// Options
		'FAVICON_LABEL' => $NexusLanguage->get('options', 'favicon_label'),
		'ABOUT_LABEL' => $NexusLanguage->get('options', 'about_label'),
		'ABOUT_PLACEHOLDER_LABEL' => $NexusLanguage->get('options', 'about_placeholder_label'),

	// Colors
		'DARKMODE_LABEL' => $NexusLanguage->get('colors', 'darkmode_label'),
		'TEMPLATE_COLOR_LABEL' => $NexusLanguage->get('colors', 'template_color_label'),
		'FOOTER_COLOR_LABEL' => $NexusLanguage->get('colors', 'footer_color_label'),
		'BORDER_COLOR_LABEL' => $NexusLanguage->get('colors', 'border_color_label'),

	// Navbar
		'LOGO_LABEL' => $NexusLanguage->get('navbar', 'logo_label'),
		'NAVIGATION_MENU_LABEL' => $NexusLanguage->get('navbar', 'navigation_menu_label'),
		'NAVIGATION_STYLE_LABEL' => $NexusLanguage->get('navbar', 'navigation_style_label'),
		'NAV_TRUE_LABEL' => $NexusLanguage->get('navbar', 'nav_true_label'),
		'NAV_FALSE_LABEL' => $NexusLanguage->get('navbar', 'nav_false_label'),
		'DYNAMIC_LABEL' => $NexusLanguage->get('navbar', 'dynamic_label'),
		'ELEGANT_LABEL' => $NexusLanguage->get('navbar', 'elegant_label'),

	// Connections
		'SERVER_DOMAIN_LABEL' => $NexusLanguage->get('connections', 'server_domain_label'),
		'IP_ADDRESS_LABEL' => $NexusLanguage->get('connections', 'ip_address_label'),
		'SERVER_PORT_LABEL' => $NexusLanguage->get('connections', 'server_port_label'),
		'STYLE_LABEL' => $NexusLanguage->get('connections', 'style_label'),
		'SIMPLE_LABEL' => $NexusLanguage->get('connections', 'simple_label'),
		'ADVANCED_LABEL' => $NexusLanguage->get('connections', 'advanced_label'),
		'DISCORD_LABEL' => $NexusLanguage->get('connections', 'discord_label'),

	// Advanced
		'ADV_WARNING' => $NexusLanguage->get('advanced', 'adv_warning'),
		'ADV_NAV_LABEL' => $NexusLanguage->get('advanced', 'adv_nav_label'),
		'ADV_CONTAINER_LABEL' => $NexusLanguage->get('advanced', 'adv_container_label'),
		'ADV_MARGIN_TOP_LABEL' => $NexusLanguage->get('advanced', 'adv_margin_top_label'),
		'ADV_MARGIN_BOTTOM_LABEL' => $NexusLanguage->get('advanced', 'adv_margin_bottom_label'),
		'ADV_NAV_SIZE_LABEL' => $NexusLanguage->get('advanced', 'adv_nav_size_label'),
		'MINI_LABEL' => $NexusLanguage->get('advanced', 'mini_label'),
		'TINY_LABEL' => $NexusLanguage->get('advanced', 'tiny_label'),
		'SMALL_LABEL' => $NexusLanguage->get('advanced', 'small_label'),
		'LARGE_LABEL' => $NexusLanguage->get('advanced', 'large_label'),
		'HUGE_LABEL' => $NexusLanguage->get('advanced', 'huge_label'),
		'MASSIVE_LABEL' => $NexusLanguage->get('advanced', 'massive_label'),

	// Arc
		'ARC_LABEL' => $NexusLanguage->get('arc', 'arc_label'),
		'ARC_URL_LABEL' => $NexusLanguage->get('arc', 'arc_url_label'),
		'ARC_INFO_1' => $NexusLanguage->get('arc', 'arc_info_1'),
		'ARC_INFO_2' => $NexusLanguage->get('arc', 'arc_info_2'),
		'ARC_INFO_3' => $NexusLanguage->get('arc', 'arc_info_3'),
		'ARC_INFO_4' => $NexusLanguage->get('arc', 'arc_info_4'),
		'ARC_INFO_5' => $NexusLanguage->get('arc', 'arc_info_5'),

	// Widgets
		// Donation Widget
			'DONATE_WIDGET_LABEL' => $NexusLanguage->get('widgets', 'donate_widget_label'),
			'DONATE_EMAIL_LABEL' => $NexusLanguage->get('widgets', 'donate_email_label'),
			'FIRST_AMOUNT_LABEL' => $NexusLanguage->get('widgets', 'first_amount_label'),
			'SECOND_AMOUNT_LABEL' => $NexusLanguage->get('widgets', 'second_amount_label'),
			'THIRD_AMOUNT_LABEL' => $NexusLanguage->get('widgets', 'third_amount_label'),

		// Message Widget
			'MESSAGE_WIDGET_LABEL' => $NexusLanguage->get('widgets', 'message_widget_label'),
			'MESSAGE_TITLE_LABEL' => $NexusLanguage->get('widgets', 'message_title_label'),
			'MESSAGE_TEXT_LABEL' => $NexusLanguage->get('widgets', 'message_text_label'),
			'MESSAGE_ICON_LABEL' => $NexusLanguage->get('widgets', 'message_icon_label'),

	// Embed
		'EMBED_HEAD_LABEL' => $NexusLanguage->get('embed', 'embed_head_label'),
		'EMBED_DESC_LABEL' => $NexusLanguage->get('embed', 'embed_desc_label'),
		'EMBED_COLOR_LABEL' => $NexusLanguage->get('embed', 'embed_color_label'),
		'EMBED_IMAGE_LABEL' => $NexusLanguage->get('embed', 'embed_image_label'),
		'EMBED_KEYWORDS_LABEL' => $NexusLanguage->get('embed', 'embed_keywords_label'),
		'EMBED_INFO_LABEL' => $NexusLanguage->get('embed', 'embed_info_label'),
		'EMBED_IMAGE_INFO_LABEL' => $NexusLanguage->get('embed', 'embed_image_info_label'),
		'EMBED_KEYWORDS_INFO_LABEL' => $NexusLanguage->get('embed', 'embed_keywords_info_label'),
		'EMBED_PREVIEW_LABEL' => $NexusLanguage->get('embed', 'embed_preview_label'),

	// Other
		'TRUE_LABEL' => $NexusLanguage->get('general', 'true_label'),
		'FALSE_LABEL' => $NexusLanguage->get('general', 'false_label'),
));

$settings_data = $queries->getWhere('nexus_settings', array('id', '<>', 0));
if (count($settings_data)) {
	foreach ($settings_data as $key => $value) {
		$settings_data_array[$value->name] = array(
			'id' => Output::getClean($value->id),
			'value' => Output::getClean($value->value)
		);
		$smarty->assign(array(
			strtoupper($value->name) => $settings_data_array[$value->name]['value']
		));
	}
}



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

							Session::flash('staff', $NexusLanguage->get('general', 'save_successfully'));
							Redirect::to(URL::build('/panel/nexus/'));
							die();
						}
					} else {
						$errors = $NexusLanguage->get('general', 'img_empty_and_size') . ini_get('upload_max_filesize');
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
						$errors[] = $NexusLanguage->get('general', 'save_errors');
					}
				}
				Session::flash('select_btn', $_POST['sel_btn_session']);
				if (!count($errors)) {
					Session::flash('staff', $NexusLanguage->get('general', 'save_successfully'));
					Redirect::to(URL::build('/panel/nexus/'));
					die();
				}
			}
		} else {
			$errors[] = $language->get('general', 'invalid_token');
		}
	}
}





// Smarty variables for links to tpl files admin panel
// $tpl_panel_files = scandir(join(DIRECTORY_SEPARATOR, array(ROOT_PATH, 'custom', 'panel_templates', getTemplateName('panel_'), 'nexus')));
// foreach ($tpl_panel_files as $key => $file) {
// 	$file = getExtension($file);
// 	if ($file['1'] != 'tpl') {
// 		continue;
// 	}

// 	$smarty->assign(array(
// 		strtoupper($file['0']) . '_URL' => URL::build('/panel/nexus/' . $file['0'])

// 	));
// }


// Route == name tpl file
// $template_file = 'nexus/' . getEndRoute() . '.tpl';
$template_file = 'nexus/nexus.tpl';
// $smarty->assign(array(
// 	'TPL_NAME' => $_POST['sel_btn']
// ));



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
));

require(ROOT_PATH . '/core/templates/panel_navbar.php');

$template->displayTemplate($template_file, $smarty);
