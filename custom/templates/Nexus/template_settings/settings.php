<?php
/*
 *Made by Samerton
 *  https://github.com/NamelessMC/Nameless/tree/v2/
 *  NamelessMC version 2.0.0-pr13
 *
 *  License: MIT
 *
 *  Nexus By Vertisan
 */

require_once('classes/NexusUtill.php');

// Cache Store
include 'includes/cachestore.php';

// Caches
include 'includes/caches.php';

// Debugging
// include 'includes/debug.php';

// Functions & Text
$template_file = 'tpl/nexus.tpl';

include 'includes/functions.php';

$smarty->assign(array(
    // Functions
    'TPL_PATH' => ROOT_PATH . '/custom/templates/Nexus/template_settings/tpl/',
    'SETTINGS_TEMPLATE' => ROOT_PATH . '/custom/templates/Nexus/template_settings/' . $template_file,

    // Text
      // NamelessMC 
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
        'DISCORD_LINK' => NexusUtill::getDsServer(456464564646),
  
  // Navigation
  'NAVIGATION' => NexusUtill::getLanguage('navigation', 'navigation'),
  'OPTIONS_PAGE' => NexusUtill::getLanguage('navigation', 'options_page'),
  'COLORS_PAGE' => NexusUtill::getLanguage('navigation', 'colors_page'),
  'NAVBAR_PAGE' => NexusUtill::getLanguage('navigation', 'navbar_page'),
  'CONNECTIONS_PAGE' => NexusUtill::getLanguage('navigation', 'connections_page'),
  'ARC_PAGE' => NexusUtill::getLanguage('navigation', 'arc_page'),
  'WIDGETS_PAGE' => NexusUtill::getLanguage('navigation', 'widgets_page'),
  'EMBED_PAGE' => NexusUtill::getLanguage('navigation', 'embed_page'),
  'UPDATES_PAGE' => NexusUtill::getLanguage('navigation', 'updates_page'),
  'SUPPORT_PAGE' => NexusUtill::getLanguage('navigation', 'support_page'),

// Options
  'NOTE' => NexusUtill::getLanguage('options', 'note'),
  'NOTE_REVIEW' => NexusUtill::getLanguage('options', 'note_review'),
  'FOOTERABOUT_LABEL' => NexusUtill::getLanguage('options', 'footerabout'),
  'FOOTERABOUT_PLACEHOLDER_LABEL' => NexusUtill::getLanguage('options', 'footerabout_placeholder'),
  'CUSTOMCSS_LABEL' => NexusUtill::getLanguage('options', 'customcss'),
  'CUSTOMCSS_INFO_LABEL' => NexusUtill::getLanguage('options', 'customcss_info'),
  'CUSTOMJS_LABEL' => NexusUtill::getLanguage('options', 'customjs'),
  'CUSTOMJS_INFO_LABEL' => NexusUtill::getLanguage('options', 'customjs_info'),

// Colors
  'DARKMODE_LABEL' => NexusUtill::getLanguage('colors', 'darkmode'),
  'PRIMARYCOLOR_LABEL' => NexusUtill::getLanguage('colors', 'primarycolor'),
  'NAVBARCOLOR_LABEL' => NexusUtill::getLanguage('colors', 'navbarcolor'),
  'FOOTERCOLOR_LABEL' => NexusUtill::getLanguage('colors', 'footercolor'),
  'OUTLINECOLOR_LABEL' => NexusUtill::getLanguage('colors', 'outlinecolor'),
  'COLORS_INFO_LABEL' => NexusUtill::getLanguage('colors', 'colors_info'),
  'NAVBARTEXTCOLOR_LABEL' => NexusUtill::getLanguage('colors', 'navbartextcolor'),
  'NAVBARTEXTBLACK_LABEL' => NexusUtill::getLanguage('colors', 'navbartextblack'),
  'NAVBARTEXTWHITE_LABEL' => NexusUtill::getLanguage('colors', 'navbartextwhite'),

// Navbar
  'NAVBARLOGO_LABEL' => NexusUtill::getLanguage('navbar', 'navbarlogo'),
  'NAVBARLOGO_INFO_LABEL' => NexusUtill::getLanguage('navbar', 'navbarlogo_info'),
  'NAVBARSTICKY_LABEL' => NexusUtill::getLanguage('navbar', 'navbarsticky'),
  'NAVBARSTICKY_INFO_LABEL' => NexusUtill::getLanguage('navbar', 'navbarsticky_info'),
  'NAVBARSTYLE_LABEL' => NexusUtill::getLanguage('navbar', 'navbarstyle'),
  'NAVBARSTYLE_INFO_LABEL' => NexusUtill::getLanguage('navbar', 'navbarstyle_info'),
  'NAVBARELEGANT_LABEL' => NexusUtill::getLanguage('navbar', 'navbarelegant'),
  'NAVBARDYNAMIC_LABEL' => NexusUtill::getLanguage('navbar', 'navbardynamic'),

// Connections
  // Discord
    'DISCORD_LABEL' => NexusUtill::getLanguage('connections', 'discord'),
    'DISCORDVIEW_LABEL' => NexusUtill::getLanguage('connections', 'discordview'),
    'DISCORDVIEW_INFO_LABEL' => NexusUtill::getLanguage('connections', 'discordview_info'),
    'DISCORDID_LABEL' => NexusUtill::getLanguage('connections', 'discordid'),
    'DISCORDID_INFO_LABEL' => NexusUtill::getLanguage('connections', 'discordid_info'),

  // Minecraft
    'MINECRAFT_LABEL' => NexusUtill::getLanguage('connections', 'minecraft'),
    'MINECRAFTVIEW_LABEL' => NexusUtill::getLanguage('connections', 'minecraftview'),
    'MINECRAFTDOMAIN_LABEL' => NexusUtill::getLanguage('connections', 'minecraftdomain'),
    'MINECRAFTIP_LABEL' => NexusUtill::getLanguage('connections', 'minecraftip'),
    'MINECRAFTPORT_LABEL' => NexusUtill::getLanguage('connections', 'minecraftport'),
    'MINECRAFTSTYLE_LABEL' => NexusUtill::getLanguage('connections', 'minecraftstyle'),
    'MINECRAFTSTYLE_INFO_LABEL' => NexusUtill::getLanguage('connections', 'minecraftstyle_info'),
    'SIMPLE_LABEL' => NexusUtill::getLanguage('connections', 'simple'),
    'ADVANCED_LABEL' => NexusUtill::getLanguage('connections', 'advanced'),

// Arc
  'ARCVIEW_LABEL' => NexusUtill::getLanguage('arc', 'arcview'),
  'ARCVIEW_INFO_LABEL' => NexusUtill::getLanguage('arc', 'arcview_info'),
  'ARCURL_LABEL' => NexusUtill::getLanguage('arc', 'arcurl'),

// Widgets
  // Donation Widget
    'DONATEWIDGET_LABEL' => NexusUtill::getLanguage('widgets', 'donatewidget'),
    'DONATEEMAIL_LABEL' => NexusUtill::getLanguage('widgets', 'donateemail'),
    'DONATEFIRSTAMOUNT_LABEL' => NexusUtill::getLanguage('widgets', 'donatefirstamount'),
    'DONATESECONDAMOUNT_LABEL' => NexusUtill::getLanguage('widgets', 'donatesecondamount'),
    'DONATETHIRDAMOUNT_LABEL' => NexusUtill::getLanguage('widgets', 'donatethirdamount'),

  // Message Widget
    'MESSAGEWIDGET_LABEL' => NexusUtill::getLanguage('widgets', 'messagewidget'),
    'MESSAGETITLE_LABEL' => NexusUtill::getLanguage('widgets', 'messagetitle'),
    'MESSAGETEXT_LABEL' => NexusUtill::getLanguage('widgets', 'messagetext'),
    'MESSAGEICON_LABEL' => NexusUtill::getLanguage('widgets', 'messageicon'),
    'MESSAGEICON_INFO_LABEL' => NexusUtill::getLanguage('widgets', 'messageicon_info'),

// Embed
  'EMBEDTITLE_LABEL' => NexusUtill::getLanguage('embed', 'embedtitle'),
  'EMBEDTEXT_LABEL' => NexusUtill::getLanguage('embed', 'embedtext'),
  'EMBEDCOLOR_LABEL' => NexusUtill::getLanguage('embed', 'embedcolor'),
  'EMBEDICON_LABEL' => NexusUtill::getLanguage('embed', 'embedicon'),
  'EMBEDICON_INFO_LABEL' => NexusUtill::getLanguage('embed', 'embedicon_info'),
  'EMBEDKEYWORDS_LABEL' => NexusUtill::getLanguage('embed', 'embedkeywords'),
  'EMBEDKEYWORDS_INFO_LABEL' => NexusUtill::getLanguage('embed', 'embedkeywords_info'),
  'EMBEDPREVIEW_LABEL' => NexusUtill::getLanguage('embed', 'embedpreview'),
  'EMBEDTEMPLATE_LABEL' => NexusUtill::getLanguage('embed', 'embedtemplate'),
  'EMBEDBOT_LABEL' => NexusUtill::getLanguage('embed', 'embedbot'),
  'EMBEDMESSAGEPREVIEW_LABEL' => NexusUtill::getLanguage('embed', 'embedmessagepreview'),
));