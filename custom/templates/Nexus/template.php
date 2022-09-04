<?php
/*
 *  Made by Samerton
 *  https://github.com/NamelessMC/Nameless/
 *  NamelessMC version 2.0.0
 *
 *  License: MIT
 *
 *  Nexus Template
 */

class Nexus_Template extends TemplateBase
{

    private array $_template;

    /** @var Language */
    private Language $_language;

    /** @var User */
    private User $_user;

    /** @var Pages */
    private Pages $_pages;
    private $_smarty;
    private $_cache;

    public function __construct($cache, $smarty, $language, $user, $pages)
    {
        $template = [
            'name' => 'Nexus',
            'version' => '1.7.2',
            'nl_version' => '2.0.2',
            'author' => '<a href="https://github.com/VertisanPRO" target="_blank">Vertisan</a>',
        ];

        $template['path'] = (defined('CONFIG_PATH') ? CONFIG_PATH : '') . '/custom/templates/' . $template['name'] . '/';

        parent::__construct($template['name'], $template['version'], $template['nl_version'], $template['author']);
        $current_version_nexus = $template['version'];

        $this->_settings = ROOT_PATH . '/custom/templates/Nexus/template_settings/settings.php';

        $this->_smarty = $smarty;
        $this->_cache = $cache;

        $this->assets()->include([
            AssetTree::FONT_AWESOME,
            AssetTree::JQUERY,
            AssetTree::JQUERY_COOKIE,
        ]);

        $this->addCSSFiles([
            $template['path'] . 'css/fomantic.min.css' => [],
        ]);

        $this->addJSFiles([
            $template['path'] . 'js/fomantic.min.js' => [],
            $template['path'] . 'js/nexus.js?v=' . $current_version_nexus => [],
        ]);

        $smarty->assign('TEMPLATE', $template);

        // Other variables
        $smarty->assign('FORUM_SPAM_WARNING_TITLE', $language->get('general', 'warning'));

        $cache->setCache('template_settings');
        $smartyDarkMode = false;

        if (defined('DARK_MODE') && DARK_MODE == '1') {
            $smartyDarkMode = true;
        }

        $smarty->assign([
            'NEXUS_DARK_MODE' => $smartyDarkMode
        ]);

        $this->_template = $template;
        $this->_language = $language;
        $this->_user = $user;
        $this->_pages = $pages;

        require_once('template_settings/classes/NexusUtil.php');
        require_once('template_settings/classes/UpdateCheckNexus.php');
        NexusUtil::initialise();

        $smarty->assign([
            'CLICK_TO_JOIN' => NexusUtil::getLanguage('frontend', 'click_to_join'),
            'MEMBERS_ONLINE' => NexusUtil::getLanguage('frontend', 'members_online'),
            'CLICK_TO_COPY' => $language->get('general', 'click_to_copy_tooltip'),
            'PLAYERS_ONLINE' => NexusUtil::getLanguage('frontend', 'players_online'),
            'SERVER_OFFLINE' => $language->get('general', 'server_offline'),
            'POWERED_BY' => NexusUtil::getLanguage('frontend', 'powered_by'),
            'TEMPLATE_BY' => NexusUtil::getLanguage('frontend', 'template_by'),
            'ABOUT' => $language->get('user', 'about')
        ]);

        if ($user->isLoggedIn()) {
            if ($user->hasPermission('admincp.update')) {

                $templateID = DB::getInstance()->get('templates', ['name', "Nexus"])->results();
                $smarty->assign(
                    'CHECK_AGAIN_LINK', URL::build('/panel/core/templates/', 'recheck&action=settings&template=' . $templateID[0]->id)
                );
                $smarty->assign(
                    'UPGRADE_LINK', URL::build('/panel/core/templates/', 'nexusUpgrade&action=settings&template=' . $templateID[0]->id)
                );
                $smarty->assign(
                    'UPDATE_LINK_NEXUS', URL::build('/panel/core/templates/', 'action=settings&template=' . $templateID[0]->id)
                );

                $cache->setCache('update_check_nexus');
                if ($cache->isCached('update_check_nexus')) {
                    $update_check_nexus = $cache->retrieve('update_check_nexus');
                } else {
                    $update_check_nexus = NexusUtil::updateCheckNexus();
                    $cache->store('update_check_nexus', $update_check_nexus, 3600);
                }

                if (!is_string($update_check_nexus) && $update_check_nexus->updateAvailable()) {
                    $smarty->assign([
                        'NEW_UPDATE_NEXUS' => $update_check_nexus->isUrgent()
                            ? $language->get('admin', 'new_urgent_update_available')
                            : $language->get('admin', 'new_update_available'),
                        'NEW_UPDATE_URGENT_NEXUS' => $update_check_nexus->isUrgent(),
                        'CURRENT_VERSION_NEXUS' => $language->get('admin', 'current_version_x', [
                            'version' => 'Nexus (' . $template["version"] . ')'
                        ]),
                        'NEW_VERSION_NEXUS' => $language->get('admin', 'new_version_x', [
                            'version' => Output::getClean($update_check_nexus->version())
                        ]),
                        'UPDATE_NEXUS' => $language->get('admin', 'update'),
                    ]);
                }

                if (!is_string($update_check_nexus)) {
                    if ($update_check_nexus->updateAvailable()) {
                        $smarty->assign([
                            'INSTRUCTIONS' => $language->get('admin', 'instructions'),
                            'INSTRUCTIONS_VALUE' => Output::getDecoded($update_check_nexus->instructions()),
                            'DOWNLOAD_LINK' => $update_check_nexus->upgradeZipLink(),
                            'UPDATE' => $language->get('admin', 'update'),
                            'DOWNLOAD' => $language->get('admin', 'download'),
                            'INSTALL_CONFIRM' => $language->get('admin', 'install_confirm'),
                            'WARNING' => $language->get('general', 'warning'),
                            'CANCEL' => $language->get('general', 'cancel'),
                        ]);
                    }
                } else {
                    $smarty->assign([
                        'UPDATE_CHECK_ERROR_NEXUS' => $update_check_nexus,
                    ]);
                }
            }
        }
    }

    public function onPageLoad()
    {
        $page_load = microtime(true) - PAGE_START_TIME;
        define('PAGE_LOAD_TIME', $this->_language->get('general', 'page_loaded_in', ['time' => round($page_load, 3)]));

        $this->addCSSFiles([
            $this->_template['path'] . 'css/custom.css?v=200' => []
        ]);

        $route = (isset($_GET['route']) ? rtrim($_GET['route'], '/') : '/');

        $JSVariables = [
            'siteName' => SITE_NAME,
            'siteURL' => URL::build('/'),
            'fullSiteUrl' => URL::getSelfURL() . ltrim(URL::build('/'), '/'),
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
            'debugging' => ((defined('DEBUGGING') && DEBUGGING == 1) ? '1' : '0'),
            'loggedIn' => ($this->_user->isLoggedIn() ? '1' : '0'),
            'cookie' => (defined('COOKIE_NOTICE') ? '1' : '0'),
            'loadingTime' => Util::getSetting('page_loading') === '1' ? PAGE_LOAD_TIME : '',
            'route' => $route,
            'csrfToken' => Token::get(),
            'serverOffline' => $this->_language->get('general', 'server_offline'),
            'playersOnline' => NexusUtil::getLanguage('frontend', 'players_online'),
        ];

        if (strpos($route, '/forum/topic/') !== false || PAGE == 'profile') {
            $this->assets()->include([
                AssetTree::JQUERY_UI,
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
            $this->_template['path'] . 'js/core/core.js?v=202' => [],
            $this->_template['path'] . 'js/core/user.js' => [],
            $this->_template['path'] . 'js/core/pages.js?v=202' => [],
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