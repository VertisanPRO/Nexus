<?php
/*
 *	Made by Samerton
 *  https://github.com/NamelessMC/Nameless/tree/v2/
 *  NamelessMC version 2.0.0-pr10
 *
 *  License: MIT
 *
 *  Nexus By Mubeen & xGIGABAITx
 */

class Nexus extends Module
{

	private $_language, $NexusLanguage;

	public function __construct($language, $pages, $INFO_MODULE)
	{
		$this->_language = $language;

		$this->NexusLanguage = $GLOBALS['NexusLanguage'];

		$this->module_name = $INFO_MODULE['name'];
		$author = $INFO_MODULE['author'];
		$module_version = $INFO_MODULE['module_ver'];
		$nameless_version = $INFO_MODULE['nml_ver'];
		parent::__construct($this, $this->module_name, $author, $module_version, $nameless_version);

		// StaffCP
		$pages->add($this->module_name, '/panel/nexus', 'pages/panel/settings.php');
	}

	public function onInstall()
	{

		try {
			$engine = Config::get('mysql/engine');
			$charset = Config::get('mysql/charset');
		} catch (Exception $e) {
			$engine = 'InnoDB';
			$charset = 'utf8mb4';
		}
		if (!$engine || is_array($engine))
			$engine = 'InnoDB';

		if (!$charset || is_array($charset))
			$charset = 'latin1';

		// Queries
		$queries = new Queries();

		try {
			$queries->createTable("nexus_settings", "`id` int(11) NOT NULL AUTO_INCREMENT, `name` varchar(255) NOT NULL, `value` varchar(5000) NOT NULL, PRIMARY KEY (`id`)", "ENGINE=$engine DEFAULT CHARSET=$charset");
		} catch (Exception $e) {
			var_dump($e);
		}
	}

	public function onUninstall()
	{
	}

	public function onEnable()
	{

		$queries = new Queries();

		try {

			$group = $queries->getWhere('groups', array('id', '=', 2));
			$group = $group[0];

			$group_permissions = json_decode($group->permissions, TRUE);
			$group_permissions['admincp.nexus'] = 1;

			$group_permissions = json_encode($group_permissions);
			$queries->update('groups', 2, array('permissions' => $group_permissions));
		} catch (Exception $e) {
			// Ошибка
		}
	}

	public function onDisable()
	{
	}

	public function onPageLoad($user, $pages, $cache, $smarty, $navs, $widgets, $template)
	{

		PermissionHandler::registerPermissions($this->module_name, array(
			'admincp.nexus' => $this->NexusLanguage->get('general', 'group_permision')
		));




		// Widgets
		require_once(ROOT_PATH . '/modules/Nexus/widgets/donate.php');
		$module_pages = $widgets->getPages('Donate');
		$NexusLanguage = $this->NexusLanguage;
		$Donate = new Donate($module_pages, $smarty, $user, $NexusLanguage);
		$widgets->add($Donate);

		require_once(ROOT_PATH . '/modules/Nexus/widgets/message.php');
		$module_pages = $widgets->getPages('Message');
		$NexusLanguage = $this->NexusLanguage;
		$Message = new Message($module_pages, $smarty, $user, $NexusLanguage);
		$widgets->add($Message);




		// $jsonIn = file_get_contents('https://discordapp.com/api/servers/760945720470667294/widget.json');
		// $JSON = json_decode($jsonIn, true);
		// $dsOnlineUsers = $JSON['presence_count'];
		// $dsName = $JSON['name'];


		// echo '<pre>DS NAME = ' . $dsName . '<br>';
		// echo 'DS ONLINE USERS = ' . $dsOnlineUsers . '</pre>';


		$icon = '<i class="fas fa-palette"></i>';
		$order = 19;

		if (defined('FRONT_END')) {

			if ($user->isLoggedIn()) {
				$smarty->assign(array(
					'USER_LOGIN' => 1
				));
			}

			$queries = new Queries();
			$settings_data = $queries->getWhere('nexus_settings', array('id', '<>', 0));
			if (count($settings_data)) {
				foreach ($settings_data as $value) {
					$settings_data_array[$value->name] = array(
						'id' => Output::getClean($value->id),
						'value' => Output::getClean($value->value)
					);

					if ($value->name == 'login_skin') {
						$login_skin = "https://api.mojang.com/users/profiles/minecraft/" . $settings_data_array[$value->name]['value'];
						$login_skin = json_decode(file_get_contents($login_skin))->id;
						$smarty->assign(array(
							strtoupper($value->name) => $login_skin
						));
						continue;
					}

					if ($value->name == 'discord_id') {

						$discord_server = array();
						if ($value->value !== '') {

							if ($cache->isCached('ds_status_ping')) {
								$discord_server = $cache->retrieve('ds_status_ping');
							} else {
								$ch = curl_init();
								curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
								curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
								curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 0);
								curl_setopt($ch, CURLOPT_TIMEOUT, 5);
								curl_setopt($ch, CURLOPT_URL, 'https://discordapp.com/api/servers/' . $value->value . '/widget.json');
								$result = curl_exec($ch);
								$result = json_decode($result);
								curl_close($ch);

								$discord_server = array(
									'name' => $result->name,
									'members' => $result->presence_count,
									'link' => $result->instant_invite,
								);

								$cache->store('ds_status_ping', $discord_server, 60);
							}

							$smarty->assign(array(
								'DISCORD_SERVER' => $discord_server,
							));
						}
					}

					$smarty->assign(array(
						strtoupper($value->name) => htmlspecialchars_decode($settings_data_array[$value->name]['value'])
					));
				}
			}
		}

		if (defined('BACK_END')) {

			$title = $this->NexusLanguage->get('general', 'title');


			if ($user->hasPermission('admincp.nexus')) {

				$navs[2]->add('nexus_divider', mb_strtoupper($title, 'UTF-8'), 'divider', 'top', null, $order, '');

				$navs[2]->add('nexus_items', $title, URL::build('/panel/nexus'), 'top', null, $order + 0.1, $icon);
			}
		}
	}
}
