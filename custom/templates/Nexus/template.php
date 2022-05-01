<?php
/*
 *	Made by Samerton
 *	https://github.com/NamelessMC/Nameless/
 *	NamelessMC version 2.0.0-pr13
 *
 *	License: MIT
 *
 *	Nexus Template
 */

class Nexus_Template extends TemplateBase {

    private array $_template;

    /** @var Language */
    private Language $_language;

    /** @var User */
    private User $_user;

    /** @var Pages */
    private Pages $_pages;
    private $_smarty;
    private $_cache;

    public function __construct($cache, $smarty, $language, $user, $pages) {
        $template = [
            'name' => 'Nexus',
            'version' => '2.0.0-pr13',
            'nl_version' => '2.0.0-pr13',
            'author' => '<a href="https://github.com/VertisanPRO" target="_blank">Vertisan</a>',
        ];

        $template['path'] = (defined('CONFIG_PATH') ? CONFIG_PATH : '') . '/custom/templates/' . $template['name'] . '/';

        parent::__construct($template['name'], $template['version'], $template['nl_version'], $template['author']);

        $this->_settings = ROOT_PATH . '/custom/templates/Nexus/template_settings/settings.php';

        $this->_smarty = $smarty;
        $this->_cache = $cache;

        $this->addCSSFiles([
            $template['path'] . 'css/fomantic.min.css' => [],
            $template['path'] . 'css/toastr.min.css' => [],
            (defined('CONFIG_PATH') ? CONFIG_PATH : '') . '/core/assets/css/font-awesome.min.css' => [],
        ]);

        $this->addJSFiles([
            $template['path'] . 'js/jquery.min.js' => [],
            $template['path'] . 'js/jquery.cookie.js' => [],
            $template['path'] . 'js/fomantic.min.js' => [],
            $template['path'] . 'js/toastr.min.js' => [],
            $template['path'] . 'js/nexus.js?v=1.7.0' => [],
        ]);

        // Caches
            include 'template_settings/includes/caches.php';

        // Functions
            include 'template_settings/includes/functions.php';

        $smarty->assign('TEMPLATE', $template);

        // Other variables
        $smarty->assign('FORUM_SPAM_WARNING_TITLE', $language->get('general', 'warning'));

        $cache->setCache('template_settings');
        $smartyDarkMode = false;
        $smartyNavbarColour = '';

        $darkMode = $cache->isCached('darkMode') ? $cache->retrieve('darkMode') : '0';
        if ($user->isLoggedIn()) {
            $darkMode = $user->data()->night_mode !== null ? $user->data()->night_mode : $darkMode;
        } else {
            if (Cookie::exists('night_mode')) {
                $darkMode = Cookie::get('night_mode');
            }
        }

        if (isset($darkMode) && $darkMode == '1') {
            $smartyDarkMode = true;
            define('TEMPLATE_TINY_EDITOR_DARKMODE', true);
        }

        if ($cache->isCached('navbarColour')) {
            $navbarColour = $cache->retrieve('navbarColour');

            if ($navbarColour != 'white') {
                $smartyNavbarColour = $navbarColour . ' inverted';
            }
        }

        $smarty->assign([
            'NEXUS_DARK_MODE' => $smartyDarkMode
        ]);

        $this->_template = $template;
        $this->_language = $language;
        $this->_user = $user;
        $this->_pages = $pages;
    }

    public function onPageLoad() {

        $this->addCSSFiles([
            $this->_template['path'] . 'css/custom.css?v=2pr12' => []
        ]);

        $route = (isset($_GET['route']) ? rtrim($_GET['route'], '/') : '/');

        $JSVariables = [
            'siteName' => SITE_NAME,
            'siteURL' => URL::build('/'),
            'fullSiteUrl' => Util::getSelfURL() . ltrim(URL::build('/'), '/'),
            'page' => PAGE,
            'avatarSource' => AvatarSource::getUrlToFormat(),
            'copied' => $this->_language->get('general', 'copied'),
            'cookieNotice' => $this->_language->get('general', 'cookie_notice'),
            'noMessages' => $this->_language->get('user', 'no_messages'),
            'newMessage1' => $this->_language->get('user', '1_new_message'),
            'newMessagesX' => $this->_language->get('user', 'x_new_messages'),
            'noAlerts' => $this->_language->get('user', 'no_alerts'),
            'newAlert1' => $this->_language->get('user', '1_new_alert'),
            'newAlertsX' => $this->_language->get('user', 'x_new_alerts'),
            'bungeeInstance' => $this->_language->get('general', 'bungee_instance'),
            'andMoreX' => $this->_language->get('general', 'and_x_more'),
            'noPlayersOnline' => $this->_language->get('general', 'no_players_online'),
            'offline' => $this->_language->get('general', 'offline'),
            'confirmDelete' => $this->_language->get('general', 'confirm_deletion'),
            'debugging' => ((defined('DEBUGGING') && DEBUGGING == 1) ? '1' : '0'),
            'loggedIn' => ($this->_user->isLoggedIn() ? '1' : '0'),
            'cookie' => (defined('COOKIE_NOTICE') ? '1' : '0'),
            'loadingTime' => ((defined('PAGE_LOADING') && PAGE_LOADING == 1) ? PAGE_LOAD_TIME : ''),
            'route' => $route
        ];

        if (strpos($route, '/forum/topic/') !== false || PAGE == 'profile') {
            $this->addJSFiles([
                $this->_template['path'] . 'js/jquery-ui.min.js' => []
            ]);
        }

        $JSVars = '';
        $i = 0;
        foreach ($JSVariables as $var => $value) {
            $JSVars .= ($i == 0 ? 'var ' : ', ') . $var . ' = "' . $value . '"';
            $i++;
        }

        $this->addJSScript($JSVars);

        $this->addJSFiles([
            $this->_template['path'] . 'js/core/core.js' => [],
            $this->_template['path'] . 'js/core/user.js' => [],
            $this->_template['path'] . 'js/core/pages.js' => [],
            $this->_template['path'] . 'js/scripts.js' => [],
        ]);

        foreach ($this->_pages->getAjaxScripts() as $script) {
            $this->addJSScript('$.getJSON(\'' . $script . '\', function(data) {});');
        }

        require_once('template_settings/frontend.php');
    }
}

$template = new Nexus_Template($cache, $smarty, $language, $user, $pages);
$template_pagination = ['div' => 'ui mini pagination menu', 'a' => '{x}item'];