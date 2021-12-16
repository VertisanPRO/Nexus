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

class Nexus extends Module
{

  public function __construct($language, $pages, $INFO_MODULE)
  {
    $this->_language = $language;

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
    $this->initialise();
  }

  public function onUninstall()
  {
  }

  public function onEnable()
  {
    $this->initialise();
  }

  public function onDisable()
  {
  }

  public function onPageLoad($user, $pages, $cache, $smarty, $navs, $widgets, $template)
  {

    PermissionHandler::registerPermissions($this->module_name, array(
      'admincp.nexus' => NexusUtill::getLanguage('general', 'group_permision')
    ));

    // Widgets
    require_once(ROOT_PATH . '/modules/Nexus/widgets/donate.php');
    $module_pages = $widgets->getPages('Donate');

    $Donate = new Donate($module_pages, $smarty, $user);
    $widgets->add($Donate);

    require_once(ROOT_PATH . '/modules/Nexus/widgets/message.php');
    $module_pages = $widgets->getPages('Message');

    $Message = new Message($module_pages, $smarty, $user);
    $widgets->add($Message);

    $icon = '<i class="fas fa-palette"></i>';
    $order = 19;

    if (defined('FRONT_END')) {

      if ($user->isLoggedIn()) {
        $smarty->assign(array(
          'USER_LOGIN' => 1
        ));
      }
      $settings_data = NexusUtill::getSettingsToSmarty();
      $smarty->assign($settings_data);

      if ($cache->isCached('ds_status_ping')) {
        $discord_server = $cache->retrieve('ds_status_ping');
      } else {
        $discord_server = NexusUtill::getDsServer($settings_data['DISCORD_ID']);
      }
      $cache->store('ds_status_ping', $discord_server, 60);
      $smarty->assign(array(
        'DISCORD_SERVER' => $discord_server,
      ));
    }

    if (defined('BACK_END')) {

      $title = NexusUtill::getLanguage('general', 'title');

      if ($user->hasPermission('admincp.nexus')) {

        $navs[2]->add('nexus_divider', mb_strtoupper($title, 'UTF-8'), 'divider', 'top', null, $order, '');

        $navs[2]->add('nexus_items', $title, URL::build('/panel/nexus'), 'top', null, $order + 0.1, $icon);
      }
    }
  }

  private function initialise()
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
      // Error
    }

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

    try {
      $queries->createTable("nexus_settings", "`id` int(11) NOT NULL AUTO_INCREMENT, `name` varchar(255) NOT NULL, `value` varchar(5000) NOT NULL, PRIMARY KEY (`id`)", "ENGINE=$engine DEFAULT CHARSET=$charset");
    } catch (Exception $e) {
      // Error
    }

  }

    public function getDebugInfo(): array {
        return [];
    }
}
