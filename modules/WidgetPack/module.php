<?php

class WidgetPack_Module extends Module {
    private Language $_language;
    private Language $_widget_language;

    public function __construct($language, $widget_language, $pages) {
        $this->_language = $language;
        $this->_widget_language = $widget_language;

        $name = 'WidgetPack';
        $author = '<a href="https://tensa.co.ua" target="_blank" rel="nofollow noopener">xGIGABAITx</a>';
        $module_version = '1.0.0';
        $nameless_version = '2.0.0-pr13';

        parent::__construct($this, $name, $author, $module_version, $nameless_version);

        $pages->add($name, '/panel/widget-pack', 'pages/panel/widget_pack.php');
        $pages->add($name, '/panel/widget-pack/edit', 'pages/panel/widget_pack_edit.php');
    }

    public function onInstall() {
        $this->initialise();
    }

    public function onUninstall() {}

    public function onEnable() {
        $this->initialise();
        require_once(ROOT_PATH . "/modules/WidgetPack/classes/WPUtil.php");
        $wgpacks = new WPUtil;
        $wgpacks->updatePacks();
    }

    public function onDisable() {}

    public function onPageLoad(User $user, Pages $pages, Cache $cache, Smarty $smarty, $navs, Widgets $widgets, ?TemplateBase $template) {
        if (defined('BACK_END')) {
            PermissionHandler::registerPermissions('WidgetPack', [
                'widget_pack.manage' => $this->_widget_language->get('general', 'widget_pack_manage_perm'),
            ]);
            $array = $navs[2]->returnNav();
            $order = end($array)['order'] + 5.5;
            $navs[2]->add('widget_pack_divider', mb_strtoupper($this->_widget_language->get('general', 'widget_pack_module'), 'UTF-8'), 'divider', 'top', null, $order, '');
            $module_icon = '<i class="nav-icon fas fa-th fa-fw"></i>';
            $navs[2]->add('widget_pack_widgets', $this->_widget_language->get('general', 'widget_pack_module'), URL::build('/panel/widget-pack'), 'top', null, $order + 0.1, $module_icon);
        }

        if (defined('FRONT_END') || (defined('PANEL_PAGE') && str_contains(PANEL_PAGE, 'widget'))) {
            require_once(ROOT_PATH . "/modules/WidgetPack/classes/WPUtil.php");
            $wpu = new WPUtil();
            $widgets_pack = scandir(ROOT_PATH . "/modules/WidgetPack/widgets/");
            foreach ($widgets_pack as $value) {
                if ($value == '..' or $value == '.') {
                    continue;
                }
                $class = basename($value, '.php');
                require_once(ROOT_PATH . "/modules/WidgetPack/widgets/{$value}");
                $widgets->add(new $class($smarty, $cache, $user, new Queries(), $wpu, $class));
            }
        }
    }

    private function initialise() {
        $queries = new Queries();
        try {
            $group = DB::getInstance()->get('groups', ['id', '=', 2])->results();
            $group = $group[0];
            $group_permissions = json_decode($group->permissions, TRUE);
            $group_permissions['widget_pack.manage'] = 1;
            $group_permissions = json_encode($group_permissions);
            $queries->update('groups', 2, ['permissions' => $group_permissions]);
        } catch (Exception $e) {
            // Error
        }

        try {
            $engine = Config::get('mysql/engine');
            $charset = Config::get('mysql/charset');
            Config::get('mysql/prefix');
        } catch (Exception $e) {
            $engine = 'InnoDB';
            $charset = 'utf8mb4';
        }

        try {
            DB::getInstance()->createTable("widgets_pack", " `id` int(11) NOT NULL AUTO_INCREMENT, `name` varchar(255) DEFAULT NULL, `data` text DEFAULT NULL, `type` int(11) NOT NULL DEFAULT '0', PRIMARY KEY (`id`)");
        } catch (Exception $e) {
            // Error
        }
    }

    public function getDebugInfo(): array {
        return [];
    }
}