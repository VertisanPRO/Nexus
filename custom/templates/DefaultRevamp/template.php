<?php
/*
 *  Made by Samerton | Revamped by Xemah
 *    https://github.com/NamelessMC/Nameless/
 *    NamelessMC version 2.1.0
 *
 *    License: MIT
 *
 *    DefaultRevamp Template
 */

class DefaultRevamp_Template extends TemplateBase
{

    private array $_template;

    /** @var Language */
    private Language $_language;

    /** @var User */
    private User $_user;

    /** @var Pages */
    private Pages $_pages;

    public function getDsServer($id): array
    {
        $discord_server = [];
        if ($id !== '') {
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 0);
            curl_setopt($ch, CURLOPT_TIMEOUT, 5);
            curl_setopt($ch, CURLOPT_URL, 'https://discordapp.com/api/servers/' . $id . '/widget.json');
            $result = curl_exec($ch);
            $result = json_decode($result);
            curl_close($ch);
            $discord_server = [
                'name' => $result->name,
                'members' => $result->presence_count,
                'link' => $result->instant_invite
            ];
        }
        return $discord_server;
    }

    public function __construct($cache, $smarty, $language, $user, $pages)
    {
        $template = [
            'name' => 'DefaultRevamp',
            'version' => '2.1.0',
            'nl_version' => '2.1.0',
            'author' => '<a href="https://xemah.com/" target="_blank">Xemah</a> & <a href="https://github.com/VertisanPRO" target="_blank">Vertisan</a>',
        ];

        $template['path'] = (defined('CONFIG_PATH') ? CONFIG_PATH : '') . '/custom/templates/' . $template['name'] . '/';

        parent::__construct($template['name'], $template['version'], $template['nl_version'], $template['author']);

        $this->_settings = ROOT_PATH . '/custom/templates/DefaultRevamp/template_settings/settings.php';

        $this->assets()->include([
            AssetTree::FONT_AWESOME,
            AssetTree::JQUERY,
            AssetTree::JQUERY_COOKIE,
            AssetTree::FOMANTIC_UI,
        ]);

        $smarty->assign('TEMPLATE', $template);

        // Other variables
        $smarty->assign('FORUM_SPAM_WARNING_TITLE', $language->get('general', 'warning'));

        $cache->setCache('template_settings');
        $smartyDarkMode = false;
        $smartyNavbarColour = '';

        if (defined('DARK_MODE') && DARK_MODE == '1') {
            $smartyDarkMode = true;
        }

        if ($cache->isCached('navbarColour')) {
            $navbarColour = $cache->retrieve('navbarColour');

            if ($navbarColour != 'white') {
                $smartyNavbarColour = $navbarColour . ' inverted';
            }
        }

        $smarty->assign([
            'DEFAULT_REVAMP_DARK_MODE' => $smartyDarkMode,
            'DEFAULT_REVAMP_NAVBAR_EXTRA_CLASSES' => $smartyNavbarColour,
            'CLICK_TO_COPY' => $language->get('general', 'click_to_copy_tooltip')
        ]);

        $this->_template = $template;
        $this->_language = $language;
        $this->_user = $user;
        $this->_pages = $pages;
        $this->_smarty = $smarty;
    }

    public function onPageLoad()
    {
        $page_load = microtime(true) - PAGE_START_TIME;
        define('PAGE_LOAD_TIME', $this->_language->get('general', 'page_loaded_in', ['time' => round($page_load, 3)]));

        $this->addCSSFiles([
            $this->_template['path'] . 'css/custom.css?v=210' => [],
            $this->_template['path'] . 'css/nexus.css' => [],
            $this->_template['path'] . 'css/ghost.css' => []
        ]);

        $route = (isset($_GET['route']) ? rtrim($_GET['route'], '/') : '/');

        $JSVariables = [
            'siteName' => Output::getClean(SITE_NAME),
            'siteURL' => URL::build('/'),
            'fullSiteURL' => URL::getSelfURL() . ltrim(URL::build('/'), '/'),
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
            'onePlayerOnline' => $this->_language->get('general', 'currently_1_player_online'),
            'xPlayersOnline' => $this->_language->get('general', 'currently_x_players_online'),
            'noPlayersOnline' => $this->_language->get('general', 'no_players_online'),
            'offline' => $this->_language->get('general', 'offline'),
            'confirmDelete' => $this->_language->get('general', 'confirm_deletion'),
            'debugging' => (defined('DEBUGGING') && DEBUGGING == 1) ? '1' : '0',
            'loggedIn' => $this->_user->isLoggedIn() ? '1' : '0',
            'cookie' => defined('COOKIE_NOTICE') ? '1' : '0',
            'loadingTime' => Util::getSetting('page_loading') === '1' ? PAGE_LOAD_TIME : '',
            'route' => $route,
            'csrfToken' => Token::get(),
        ];

        // Logo
        $cache = new Cache(['name' => 'nameless', 'extension' => '.cache', 'path' => ROOT_PATH . '/cache/']);
        $cache->setCache('backgroundcache');
        $logo_image = $cache->retrieve('logo_image');
        $JSVariables['logoImage'] = !empty($logo_image) ? $logo_image : null;

        $this->_smarty->assign([
            'LOGO' => !empty($logo_image) ? $logo_image : null
        ]);

        if (str_contains($route, '/forum/topic/') || PAGE === 'profile') {
            $this->assets()->include([
                AssetTree::JQUERY_UI,
            ]);
        }

        $JSVars = '';
        $i = 0;
        foreach ($JSVariables as $var => $value) {
            $JSVars .= ($i == 0 ? 'const ' : ', ') . $var . ' = ' . json_encode($value);
            $i++;
        }

        $this->addJSScript($JSVars);

        $this->addJSFiles([
            $this->_template['path'] . 'js/core/core.js?v=203' => [],
            $this->_template['path'] . 'js/core/user.js' => [],
            $this->_template['path'] . 'js/core/pages.js?v=203' => [],
        ]);

        foreach ($this->_pages->getAjaxScripts() as $script) {
            $this->addJSScript('$.getJSON(\'' . $script . '\', function(data) {});');
        }

        $discord_server = self::getDsServer('discordid');
        $cache->store('ds_status_ping', $discord_server, 60);
        $this->_smarty->assign([
            'DISCORD_SERVER' => $discord_server,
        ]);
    }
}

$template = new DefaultRevamp_Template($cache, $smarty, $language, $user, $pages);
$template_pagination = ['div' => 'ui mini pagination menu', 'a' => '{x}item'];