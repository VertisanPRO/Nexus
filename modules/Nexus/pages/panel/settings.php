<?php
/*
 *	Made by Samerton
 *  https://github.com/NamelessMC/Nameless/tree/v2/
 *  NamelessMC version 2.0.0-pr9
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
	'SUBMIT' => $language->get('general', 'submit'),
	'YES' => $language->get('general', 'yes'),
	'NO' => $language->get('general', 'no'),
	'BACK' => $language->get('general', 'back'),
	'BACK_LINK' => URL::build('/panel/nexus'),
	'ARE_YOU_SURE' => $language->get('general', 'are_you_sure'),
	'CONFIRM_DELETE' => $language->get('general', 'confirm_delete'),
	'NAME' => $language->get('admin', 'name'),
	'DESCRIPTION' => $language->get('admin', 'description'),
	'TITLE' => $NexusLanguage->get('general', 'title'),
	'FAVICON_LABEL' => $NexusLanguage->get('general', 'favicon_label'),
	'TEMPLATE_COLOR_LABEL' => $NexusLanguage->get('general', 'template_color_label'),
	'BACKGROUND_COLOR_LABEL' => $NexusLanguage->get('general', 'background_color_label'),
	'FOOTER_BACKGROUND_COLOR_LABEL' => $NexusLanguage->get('general', 'footer_background_color_label'),
	'CONTENT_BACKGROUND_COLOR_LABEL' => $NexusLanguage->get('general', 'content_background_color_label'),
	'NAV_HEIGHT_LABEL' => $NexusLanguage->get('general', 'nav_height_label'),
	'FORUM_ACCORDION_LABEL' => $NexusLanguage->get('general', 'forum_accordion_label'),
	'WIDGET_COLOR_LABEL' => $NexusLanguage->get('general', 'wigget_color_label'),
	'INDEX_BUTTON_ICON_LABEL' => $NexusLanguage->get('general', 'index_button_icon_label'),
	'INDEX_BUTTON_TEXT_LABEL' => $NexusLanguage->get('general', 'index_button_text_label'),
	'LOGIN_SKIN_LABEL' => $NexusLanguage->get('general', 'login_skin_label'),
	'DONATE_EMAIL_LABEL' => $NexusLanguage->get('general', 'donate_email_label'),
	'DISPLAY_DISCORD_LABEL' => $NexusLanguage->get('general', 'display_discord_label'),
	'DISCORD_ID_LABEL' => $NexusLanguage->get('general', 'discord_id_label'),
	'CHANNEL_ID_LABEL' => $NexusLanguage->get('general', 'channel_id_label'),
	'ABOUT_LABEL' => $NexusLanguage->get('general', 'about_label'),
	'CAPTCHA_LABEL' => $NexusLanguage->get('general', 'captcha_label'),
	'INDEX_BUTTON_LOCATION_LABEL' => $NexusLanguage->get('general', 'index_button_location_label'),
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
