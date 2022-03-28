<?php
$cache->setCache('template_settings');

// Options

if ($cache->isCached('aboutFooter')) {
    $aboutFooter = $cache->retrieve('aboutFooter');
} else {
    $aboutFooter = 'We are an online platform to help users
        around the world connect through NamelessMC powered forums.';
    $cache->store('aboutFooter', $aboutFooter);
}

// Colors

if ($cache->isCached('darkMode')) {
    $darkMode = $cache->retrieve('darkMode');
} else {
    $darkMode = '0';
    $cache->store('darkMode', $darkMode);
}

if ($cache->isCached('primaryColor')) {
    $primaryColor = $cache->retrieve('primaryColor');
} else {
    $primaryColor = '#dc3545';
    $cache->store('primaryColor', $primaryColor);
}

if ($cache->isCached('navbarColor')) {
    $navbarColor = $cache->retrieve('navbarColor');
} else {
    $navbarColor = '#dc3545';
    $cache->store('navbarColor', $navbarColor);
}

if ($cache->isCached('footerColor')) {
    $footerColor = $cache->retrieve('footerColor');
} else {
    $footerColor = '#dc3545';
    $cache->store('footerColor', $footerColor);
}

if ($cache->isCached('outlineColor')) {
    $outlineColor = $cache->retrieve('outlineColor');
} else {
    $outlineColor = '#dc3545';
    $cache->store('outlineColor', $outlineColor);
}

if ($cache->isCached('navbarTextColor')) {
    $navbarTextColor = $cache->retrieve('navbarTextColor');
} else {
    $navbarTextColor = '0';
    $cache->store('navbarTextColor', $navbarTextColor);
}