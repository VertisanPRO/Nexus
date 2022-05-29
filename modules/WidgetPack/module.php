<?php

class WidgetPack_Module extends Module
{
  private Language $_language;
  private Language $_widget_language;

  public function __construct($language, $widget_language, $pages, $queries, $navigation, $cache, $endpoints)
  {
    $this->_language = $language;
    $this->_widget_language = $widget_language;

    $name = 'WidgetPack';
    $author = '<a href="https://tensa.co.ua" target="_blank" rel="nofollow noopener">xGIGABAITx</a>';
    $module_version = '1.0.0';
    $nameless_version = '2.0.0-pr13';

    parent::__construct($this, $name, $author, $module_version, $nameless_version);


    // $pages->add($name, '/wigget-pack', 'pages/panel/wigget_pack.php');

  }

  public function onInstall()
  {
    // Initialise
    $this->initialise();
  }

  public function onUninstall()
  {
    // Not necessary
  }

  public function onEnable()
  {
    // Check if we need to initialise again
    $this->initialise();
  }

  public function onDisable()
  {
    // Not necessary
  }

  public function onPageLoad(User $user, Pages $pages, Cache $cache, Smarty $smarty, $navs, Widgets $widgets, ?TemplateBase $template)
  {


    if (defined('BACK_END')) {
      $cache->setCache('panel_sidebar');

      PermissionHandler::registerPermissions('WidgetPack', array(
        'widget_pack.manage' => $this->_widget_language->get('general', 'widget_pack_manage_perm'),
      ));

      $order = end($navs[2]->returnNav())['order'] + 5.5;
      $navs[2]->add('widget_pack_divider', mb_strtoupper($this->_widget_language->get('general', 'widget_pack_module'), 'UTF-8'), 'divider', 'top', null, $order, '');
      $module_icon = '<i class="nav-icon fas fa-tasks"></i>';
      $navs[2]->addDropdown('widget_pack_configuration', $this->_widget_language->get('general', 'widget_pack_module'), 'top', $order + 0.1, $module_icon);


      if ($user->hasPermission('widget_pack.manage')) {

        $dba_icon = '<i class="nav-icon fas fa-user-plus"></i>';

        $navs[2]->addItemToDropdown('widget_pack_configuration', 'widget_pack_settings', $this->_widget_language->get('general', 'widget_pack_settings'), URL::build('/panel/widget-pack/settings'), 'top', $order, $dba_icon);
      }
    }


    if (defined('FRONT_END') || (defined('PANEL_PAGE') && str_contains(PANEL_PAGE, 'widget'))) {

      $widgets_pack = scandir(ROOT_PATH . "/modules/WidgetPack/widgets/");
      foreach ($widgets_pack as $value) {
        if ($value == '..' or $value == '.') {
          continue;
        }
        $class = basename($value, '.php');
        require_once(ROOT_PATH . "/modules/WidgetPack/widgets/{$value}");
        $widgets->add(new $class($smarty));
      }
    }
  }

  private function initialise()
  {

    $queries = new Queries();

    try {
      // Update main admin group permissions
      $group = $queries->getWhere('groups', array('id', '=', 2));
      $group = $group[0];

      $group_permissions = json_decode($group->permissions, TRUE);
      $group_permissions['widget_pack.manage'] = 1;

      $group_permissions = json_encode($group_permissions);
      $queries->update('groups', 2, array('permissions' => $group_permissions));
    } catch (Exception $e) {
      // Error
    }

    try {
      $engine = Config::get('mysql/engine');
      $charset = Config::get('mysql/charset');
      $prefix = Config::get('mysql/prefix');
    } catch (Exception $e) {
      $engine = 'InnoDB';
      $charset = 'utf8mb4';
      $prefix = 'nl2_';
    }

    if (!$engine || is_array($engine))
      $engine = 'InnoDB';

    if (!$charset || is_array($charset))
      $charset = 'latin1';

    if (!$prefix || is_array($prefix))
      $prefix = 'nl2_';
  }

  public function getDebugInfo(): array {
    return [];
  }
}
