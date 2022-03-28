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

// Navbar
    if ($cache->isCached('navbarLogo')) {
        $navbarLogo = $cache->retrieve('navbarLogo');
    } else {
        $navbarLogo = 'https://namelessmc.com/uploads/resources_icons/162.png';
        $cache->store('navbarLogo', $navbarLogo);
    }

    if ($cache->isCached('navbarSticky')) {
        $navbarSticky = $cache->retrieve('navbarSticky');
    } else {
        $navbarSticky = '0';
        $cache->store('navbarSticky', $navbarSticky);
    }

    if ($cache->isCached('navbarStyle')) {
        $navbarStyle = $cache->retrieve('navbarStyle');
    } else {    
        $navbarStyle = '0';
        $cache->store('navbarStyle', $navbarStyle);
    }

// Connections
    // Discord
        if ($cache->isCached('discordView')) {
            $discordView = $cache->retrieve('discordView');
        } else {
            $discordView = '0';
            $cache->store('discordView', $discordView);
        }

        if ($cache->isCached('discordID')) {
            $discordID = $cache->retrieve('discordID');
        } else {
            $discordID = '760945720470667294';
            $cache->store('discordID', $discordID);
        }

    // Minecraft
        if ($cache->isCached('minecraftView')) {
            $minecraftView = $cache->retrieve('minecraftView');
        } else {
            $minecraftView = '0';
            $cache->store('minecraftView', $minecraftView);
        }

        if ($cache->isCached('minecraftDomain')) {
            $minecraftDomain = $cache->retrieve('minecraftDomain');
        } else {
            $minecraftDomain = 'game.mc-tensa.com';
            $cache->store('minecraftDomain', $minecraftDomain);
        }

        if ($cache->isCached('minecraftIP')) {
            $minecraftIP = $cache->retrieve('minecraftIP');
        } else {
            $minecraftIP = '95.217.119.207';
            $cache->store('minecraftIP', $minecraftIP);
        }

        if ($cache->isCached('minecraftPort')) {
            $minecraftPort = $cache->retrieve('minecraftPort');
        } else {
            $minecraftPort = '25565';
            $cache->store('minecraftPort', $minecraftPort);
        }

        if ($cache->isCached('minecraftStyle')) {
            $minecraftStyle = $cache->retrieve('minecraftStyle');
        } else {
            $minecraftStyle = '0';
            $cache->store('minecraftStyle', $minecraftStyle);
        }

