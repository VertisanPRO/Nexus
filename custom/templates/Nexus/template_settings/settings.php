<?php
/*
 *  Made by Samerton
 *  https://github.com/NamelessMC/Nameless/tree/v2/
 *  NamelessMC version 2.0.0
 *
 *  License: MIT
 *
 *  Nexus By Vertisan
 */

$template_file = 'tpl/nexus.tpl';

require_once('classes/NexusUtil.php');
require_once(ROOT_PATH . '/core/templates/backend_init.php');

if (isset($_GET['recheck'])) {
    $cache->setCache('update_check_nexus');
    if ($cache->isCached('update_check_nexus')) {
        $cache->erase('update_check_nexus');
    }
    $templateID = DB::getInstance()->get('templates', ['name', "Nexus"])->results();
    Redirect::to(URL::build('/panel/core/templates/', 'action=settings&template=' . $templateID[0]->id));
}

if (isset($_GET['nexusUpgrade'])) {
    require_once('classes/UpgradeScriptNexus.php');
    $upgradeScriptNexus = UpgradeScriptNexus::get();
    if ($upgradeScriptNexus instanceof UpgradeScriptNexus) {
        $upgradeScriptNexus->run();
    }
    $cache->setCache('update_check_nexus');
    $update_check_nexus = NexusUtil::updateCheckNexus();
    $cache->store('update_check_nexus', $update_check_nexus, 3600);
    $templateID = DB::getInstance()->get('templates', ['name', "Nexus"])->results();
    Redirect::to(URL::build('/panel/core/templates/', 'action=settings&template=' . $templateID[0]->id));
}

$smarty->assign(NexusUtil::getSettingsToSmarty());
$smarty->assign([
    // Everything else
        'TPL_PATH' => ROOT_PATH . '/custom/templates/Nexus/template_settings/tpl/',
        'SETTINGS_TEMPLATE' => ROOT_PATH . '/custom/templates/Nexus/template_settings/' . $template_file,
        'SUBMIT' => $language->get('general', 'submit'),
        'YES' => $language->get('general', 'yes'),
        'NO' => $language->get('general', 'no'),
        'BACK' => $language->get('general', 'back'),
        'ARE_YOU_SURE' => $language->get('general', 'are_you_sure'),
        'CONFIRM_DELETE' => $language->get('general', 'confirm_delete'),
        'NAME' => $language->get('admin', 'name'),
        'INFO' => $language->get('general', 'info'),
        'ENABLED' => $language->get('admin', 'enabled'),
        'DISABLED' => $language->get('admin', 'disabled'),
        'NOTE' => NexusUtil::getLanguage('general', 'note'),
        'UP_TO_DATE' => NexusUtil::getLanguage('updates', 'up_to_date'),
        'CHECK_AGAIN' => $language->get('admin', 'check_again'),
        'WARNING' => $language->get('general', 'warning'),

    // Navigation
        'NAVIGATION' => NexusUtil::getLanguage('navigation', 'navigation'),
        'OPTIONS_PAGE' => NexusUtil::getLanguage('navigation', 'options_page'),
        'COLORS_PAGE' => NexusUtil::getLanguage('navigation', 'colors_page'),
        'NAVBAR_PAGE' => NexusUtil::getLanguage('navigation', 'navbar_page'),
        'CONNECTIONS_PAGE' => NexusUtil::getLanguage('navigation', 'connections_page'),
        'PRELOADER_PAGE' => NexusUtil::getLanguage('navigation', 'preloader_page'),
        'ADDONS_PAGE' => NexusUtil::getLanguage('navigation', 'addons_page'),
        'WIDGETS_PAGE' => NexusUtil::getLanguage('navigation', 'widgets_page'),
        'EMBED_PAGE' => NexusUtil::getLanguage('navigation', 'embed_page'),
        'UPDATES_PAGE' => NexusUtil::getLanguage('navigation', 'updates_page'),
        'SUPPORT_PAGE' => NexusUtil::getLanguage('navigation', 'support_page'),

    // Options
        'NOTE_REVIEW' => NexusUtil::getLanguage('options', 'note_review', [
            'reviewLinkStart' => '<a class=\'text-success\' href=\'https://namelessmc.com/resources/resource/162\' target=\'_blank\'>',
            'reviewLinkEnd' => '</a>'
        ]),
        'FOOTERABOUT_LABEL' => NexusUtil::getLanguage('options', 'footerabout_label'),
        'FOOTERABOUT_PLACEHOLDER_LABEL' => NexusUtil::getLanguage('options', 'footerabout_placeholder_label'),
        'CUSTOMCSS_LABEL' => NexusUtil::getLanguage('options', 'customcss_label'),
        'CUSTOMCSS_INFO_LABEL' => NexusUtil::getLanguage('options', 'customcss_info_label'),
        'CUSTOMJS_LABEL' => NexusUtil::getLanguage('options', 'customjs_label'),
        'CUSTOMJS_INFO_LABEL' => NexusUtil::getLanguage('options', 'customjs_info_label'),

    // Colors
        'DARKMODE_LABEL' => NexusUtil::getLanguage('colors', 'darkmode_label'),
        'COLORSSTYLE_LABEL' => NexusUtil::getLanguage('colors', 'colorsstyle_label'),
        'COLORSSTYLE_NORMAL_LABEL' => NexusUtil::getLanguage('colors', 'colorsstyle_normal_label'),
        'COLORSSTYLE_COLORS_LABEL' => NexusUtil::getLanguage('colors', 'colorsstyle_colors_label'),
        'PRIMARYCOLOR_LABEL' => NexusUtil::getLanguage('colors', 'primarycolor_label'),
        'NAVBARCOLOR_LABEL' => NexusUtil::getLanguage('colors', 'navbarcolor_label'),
        'FOOTERCOLOR_LABEL' => NexusUtil::getLanguage('colors', 'footercolor_label'),
        'OUTLINECOLOR_LABEL' => NexusUtil::getLanguage('colors', 'outlinecolor_label'),
        'OUTLINECOLOR_INFO_LABEL' => NexusUtil::getLanguage('colors', 'outlinecolor_info_label', [
            'colorCodeStart' => '<code>',
            'colorCodeEnd' => '</code>'
        ]),
        'COLORS_INFO_LABEL' => NexusUtil::getLanguage('colors', 'colors_info_label', [
            'colorCodeStart' => '<code>',
            'colorCodeEnd' => '</code>'
        ]),
        'NAVBARTEXTCOLOR_LABEL' => NexusUtil::getLanguage('colors', 'navbartextcolor_label'),
        'NAVBARTEXT_NORMAL_LABEL' => NexusUtil::getLanguage('colors', 'navbartext_normal_label'),
        'NAVBARTEXT_BLACK_LABEL' => NexusUtil::getLanguage('colors', 'navbartext_black_label'),
        'NAVBARTEXT_WHITE_LABEL' => NexusUtil::getLanguage('colors', 'navbartext_white_label'),

    // Navbar
        'NAVBARLOGO_LABEL' => NexusUtil::getLanguage('navbar', 'navbarlogo_label'),
        'NAVBARLOGO_INFO_LABEL' => NexusUtil::getLanguage('navbar', 'navbarlogo_info_label'),
        'NAVBAREXCLUDE_LABEL' => NexusUtil::getLanguage('navbar', 'navbarexclude_label'),
        'NAVBAREXCLUDE_INFO_LABEL' => NexusUtil::getLanguage('navbar', 'navbarexclude_info_label', [
            'slashCodeStart' => '<code>',
            'slashCodeEnd' => '</code>'
        ]),
        'NAVBARSTICKY_LABEL' => NexusUtil::getLanguage('navbar', 'navbarsticky_label'),
        'NAVBARSTICKY_INFO_LABEL' => NexusUtil::getLanguage('navbar', 'navbarsticky_info_label'),
        'NAVBARSTYLE_LABEL' => NexusUtil::getLanguage('navbar', 'navbarstyle_label'),
        'NAVBARSTYLE_INFO_LABEL' => NexusUtil::getLanguage('navbar', 'navbarstyle_info_label'),
        'NAVBARELEGANT_LABEL' => NexusUtil::getLanguage('navbar', 'navbarelegant_label'),
        'NAVBARDYNAMIC_LABEL' => NexusUtil::getLanguage('navbar', 'navbardynamic_label'),
        'NAVBARMODERN_LABEL' => NexusUtil::getLanguage('navbar', 'navbarmodern_label'),

    // Connections
        // Discord
            'DISCORD_LABEL' => NexusUtil::getLanguage('connections', 'discord_label'),
            'DISCORDVIEW_LABEL' => NexusUtil::getLanguage('connections', 'discordview_label'),
            'DISCORDVIEW_INFO_LABEL' => NexusUtil::getLanguage('connections', 'discordview_info_label'),
            'DISCORDID_LABEL' => NexusUtil::getLanguage('connections', 'discordid_label'),
            'DISCORDID_INFO_LABEL' => NexusUtil::getLanguage('connections', 'discordid_info_label', [
                'moreinfoLinkStart' => '<a href=\'https://support.discord.com/hc/en-us/articles/206346498\' target=\'_blank\'>',
                'moreinfoLinkEnd' => '</a>'
            ]),

        // Minecraft
            'MINECRAFT_LABEL' => NexusUtil::getLanguage('connections', 'minecraft_label'),
            'MINECRAFTVIEW_LABEL' => NexusUtil::getLanguage('connections', 'minecraftview_label'),
            'MINECRAFTDOMAIN_LABEL' => NexusUtil::getLanguage('connections', 'minecraftdomain_label'),
            'MINECRAFTIP_LABEL' => NexusUtil::getLanguage('connections', 'minecraftip_label'),
            'MINECRAFTPORT_LABEL' => NexusUtil::getLanguage('connections', 'minecraftport_label'),
            'MINECRAFTSTYLE_LABEL' => NexusUtil::getLanguage('connections', 'minecraftstyle_label'),
            'MINECRAFTSTYLE_INFO_LABEL' => NexusUtil::getLanguage('connections', 'minecraftstyle_info_label'),
            'SIMPLE_LABEL' => NexusUtil::getLanguage('connections', 'simple_label'),
            'ADVANCED_LABEL' => NexusUtil::getLanguage('connections', 'advanced_label'),

    // Preloader
        'PRELOADERVIEW_LABEL' => NexusUtil::getLanguage('preloader', 'preloaderview_label'),
        'PRELOADERVIEW_INFO_LABEL' => NexusUtil::getLanguage('preloader', 'preloaderview_info_label'),
        'PRELOADERTEXT_LABEL' => NexusUtil::getLanguage('preloader', 'preloadertext_label'),
        'PRELOADERLOADING_LABEL' => NexusUtil::getLanguage('preloader', 'preloaderloading_label'),
        'PRELOADERCOLOR_LABEL' => NexusUtil::getLanguage('preloader', 'preloadercolor_label'),
        'PRELOADER_RED' => $language->get('general', 'red'),
        'PRELOADER_ORANGE' => $language->get('general', 'orange'),
        'PRELOADER_YELLOW' => $language->get('general', 'yellow'),
        'PRELOADER_OLIVE' => $language->get('general', 'olive'),
        'PRELOADER_GREEN' => $language->get('general', 'green'),
        'PRELOADER_TEAL' => $language->get('general', 'teal'),
        'PRELOADER_BLUE' => $language->get('general', 'blue'),
        'PRELOADER_VIOLET' => $language->get('general', 'violet'),
        'PRELOADER_PURPLE' => $language->get('general', 'purple'),
        'PRELOADER_PINK' => $language->get('general', 'pink'),
        'PRELOADER_BROWN' => $language->get('general', 'brown'),
        'PRELOADER_GRAY' => $language->get('general', 'grey'),
        'PRELOADER_BLACK' => NexusUtil::getLanguage('preloader', 'preloader_black'),
        'PRELOADERSPEED_LABEL' => NexusUtil::GetLanguage('preloader', 'preloaderspeed_label'),
        'PRELOADER_SLOW' => NexusUtil::getLanguage('preloader', 'preloader_slow'),
        'PRELOADER_NORMAL' => NexusUtil::getLanguage('preloader', 'preloader_normal'),
        'PRELOADER_FAST' => NexusUtil::getLanguage('preloader', 'preloader_fast'),
        'PRELOADERSTYLE_LABEL' => NexusUtil::getLanguage('preloader', 'preloaderstyle_label'),
        'PRELOADER_DOUBLE' => NexusUtil::getLanguage('preloader', 'preloader_double'),
        'PRELOADER_ELASTIC' => NexusUtil::getLanguage('preloader', 'preloader_elastic'),

    // Addons
        // WidgetBot
            'WIDGETBOT_LABEL' => NexusUtil::getLanguage('addons', 'widgetbot_label'),
            'WIDGETBOTVIEW_INFO_LABEL' => NexusUtil::getLanguage('addons', 'widgetbotview_info_label', [
                'widgetbotLinkStart' => '<a href=\'https://add.widgetbot.io\' target=\'_blank\'>',
                'widgetbotLinkEnd' => '</a>'
            ]),
            'WIDGETBOTSERVERID_LABEL' => NexusUtil::getLanguage('addons', 'widgetbotserverid_label'),
            'WIDGETBOTSERVERID_INFO_LABEL' => NexusUtil::getLanguage('addons', 'widgetbotserverid_info_label', [
                'moreinfoLinkStart' => '<a href=\'https://support.discord.com/hc/en-us/articles/206346498\' target=\'_blank\'>',
                'moreinfoLinkEnd' => '</a>'
            ]),
            'WIDGETBOTCHANNELID_LABEL' => NexusUtil::getLanguage('addons', 'widgetbotchannelid_label'),
            'WIDGETBOTCHANNELID_INFO_LABEL' => NexusUtil::getLanguage('addons', 'widgetbotchannelid_info_label', [
                'moreinfoLinkStart' => '<a href=\'https://support.discord.com/hc/en-us/articles/206346498\' target=\'_blank\'>',
                'moreinfoLinkEnd' => '</a>'
            ]),
            'WIDGETBOTVERTICALLOCATION_LABEL' => NexusUtil::getLanguage('addons', 'widgetbotverticallocation_label'),
            'WIDGETBOTLOCATION_BOTTOM_LABEL' => NexusUtil::getLanguage('addons', 'widgetbotlocation_bottom_label'),
            'WIDGETBOTLOCATION_TOP_LABEL' => NexusUtil::getLanguage('addons', 'widgetbotlocation_top_label'),
            'WIDGETBOTHORIZONTALLOCATION_LABEL' => NexusUtil::getLanguage('addons', 'widgetbothorizontallocation_label'),
            'WIDGETBOTLOCATION_RIGHT_LABEL' => NexusUtil::getLanguage('addons', 'widgetbotlocation_right_label'),
            'WIDGETBOTLOCATION_LEFT_LABEL' => NexusUtil::getLanguage('addons', 'widgetbotlocation_left_label'),
            'WIDGETBOTCOLOR_LABEL' => NexusUtil::getLanguage('addons', 'widgetbotcolor_label'),
            'WIDGETBOTCOLOR_ORIGINAL_LABEL' => NexusUtil::getLanguage('addons', 'widgetbotcolor_original_label'),
            'WIDGETBOTCOLOR_NORMAL_LABEL' => NexusUtil::getLanguage('addons', 'widgetbotcolor_normal_label'),
            'WIDGETBOTCOLOR_CUSTOM_LABEL' => NexusUtil::getLanguage('addons', 'widgetbotcolor_custom_label'),

        // Arc
            'ARC_LABEL' => NexusUtil::getLanguage('addons', 'arc_label'),
            'ARCVIEW_INFO_LABEL' => NexusUtil::getLanguage('addons', 'arcview_info_label', [
                'registerLinkStart' => '<a href=\'https://arc.io\' target=\'_blank\'>',
                'registerLinkEnd' => '</a>',
                'scriptLinkStart' => '<a href=\'https://arc.io/arc-sw.js\' target=\'_blank\'>',
                'scriptLinkEnd' => '</a>',
                'addwidgetCodeStart' => '<code>',
                'addwidgetCodeEnd' => '</code>'
            ]),
            'ARCURL_LABEL' => NexusUtil::getLanguage('addons', 'arcurl_label'),

    // Widgets
        'NOTE_WIDGETS' => NexusUtil::getLanguage('widgets', 'note_widgets', [
            'downloadLinkStart' => '<a class=\'text-success\' href=\'https://github.com/VertisanPRO/WidgetPack\' target=\'_blank\'>',
            'downloadLinkEnd' => '</a>'
        ]),

    // Embed
        'EMBEDTITLE_LABEL' => NexusUtil::getLanguage('embed', 'embedtitle_label'),
        'EMBEDTITLE_INFO_LABEL' => NexusUtil::getLanguage('embed', 'embedtitle_info_label', [
            'everyCodeStart' => '<code>',
            'everyCodeEnd' => '</code>'
        ]),
        'EMBEDTEXT_LABEL' => NexusUtil::getLanguage('embed', 'embedtext_label'),
        'EMBEDCOLOR_LABEL' => NexusUtil::getLanguage('embed', 'embedcolor_label'),
        'EMBEDICON_LABEL' => NexusUtil::getLanguage('embed', 'embedicon_label'),
        'EMBEDICON_INFO_LABEL' => NexusUtil::getLanguage('embed', 'embedicon_info_label', [
            'typeCodeStart' => '<code>',
            'typeCodeEnd' => '</code>'
        ]),
        'EMBEDKEYWORDS_LABEL' => NexusUtil::getLanguage('embed', 'embedkeywords_label'),
        'EMBEDKEYWORDS_INFO_LABEL' => NexusUtil::getLanguage('embed', 'embedkeywords_info_label', [
            'keywordsCodeStart' => '<code>',
            'keywordsCodeEnd' => '</code>'
        ]),
        'EMBEDPREVIEW_LABEL' => NexusUtil::getLanguage('embed', 'embedpreview_label'),
        'EMBEDTEMPLATE_LABEL' => NexusUtil::getLanguage('embed', 'embedtemplate_label'),
        'EMBEDBOT_LABEL' => NexusUtil::getLanguage('embed', 'embedbot_label'),
        'EMBEDMESSAGEPREVIEW_LABEL' => NexusUtil::getLanguage('embed', 'embedmessagepreview_label'),
]);

if (isset($_POST['sel_btn_session'])) {
    Session::flash('sel_btn_session', $_POST['sel_btn_session']);
}

if (!isset($_POST['sel_btn'])) {
    if (Input::exists()) {
        $errors = [];

        foreach ($_POST as $key => $value) {
            if ($key == 'token' or $key == 'sel_btn_session') {
                continue;
            }
            NexusUtil::updateOrCreateParam($key, $value);
        }

        if (empty($errors)) {
            Session::flash('staff', $language->get('admin', 'successfully_updated'));
            Redirect::to(URL::build($_SESSION['last_page']));
            die();
        }
    }
}

if (Session::exists('staff'))
    $success = Session::flash('staff');
    $TPL_NAME_SESSION = '';

if (Session::exists('sel_btn_session'))
    $TPL_NAME_SESSION = Session::flash('sel_btn_session');

$smarty->assign([
    'TPL_NAME_SESSION' => $TPL_NAME_SESSION
]);

if (isset($success))
    $smarty->assign([
        'SUCCESS' => $success,
        'SUCCESS_TITLE' => $language->get('general', 'success')
    ]);

if (isset($errors) && count($errors))
    $smarty->assign([
        'ERRORS' => $errors,
        'ERRORS_TITLE' => $language->get('general', 'error')
    ]);

$smarty->assign([
    'TOKEN' => Token::get(),
]);