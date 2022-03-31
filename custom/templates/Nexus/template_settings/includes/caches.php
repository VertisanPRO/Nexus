<?php
$cache->setCache('template_settings');

// Options
    if ($cache->isCached('footerView')) {
        $footerView = $cache->retrieve('footerView');
    } else {
        $footerView = '1';
        $cache->store('footerView', $footerView);
    }

    if ($cache->isCached('footerAbout')) {
        $footerAbout = $cache->retrieve('footerAbout');
    } else {
        $footerAbout = 'We are an online platform to help users around the world connect through NamelessMC powered forums.';
        $cache->store('footerAbout', $footerAbout);
    }

    if ($cache->isCached('customCSS')) {
        $customCSS = $cache->retrieve('customCSS');
    } else {
        $cache->store('customCSS', $customCSS);
    }

    if ($cache->isCached('customJS')) {
        $customJS = $cache->retrieve('customJS');
    } else {
        $cache->store('customJS', $customJS);
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

// Arc
    if ($cache->isCached('arcView')) {
        $arcView = $cache->retrieve('arcView');
    } else {
        $arcView = '0';
        $cache->store('arcView', $arcView);
    }

    if ($cache->isCached('arcURL')) {
        $arcURL = $cache->retrieve('arcURL');
    } else {
        $arcURL = 'https://arc.io/widget.min.js#9YB4rHQn';
        $cache->store('arcURL', $arcURL);
    }

// Widgets
    // Donation
        if ($cache->isCached('donateEmail')) {
            $donateEmail = $cache->retrieve('donateEmail');
        } else {
            $donateEmail = 'mubeenullah323@gmail.com';
            $cache->store('donateEmail', $donateEmail);
        }

        if ($cache->isCached('donateFirstAmount')) {
            $donateFirstAmount = $cache->retrieve('donateFirstAmount');
        } else {
            $donateFirstAmount = '5';
            $cache->store('donateFirstAmount', $donateFirstAmount);
        }

        if ($cache->isCached('donateSecondAmount')) {
            $donateSecondAmount = $cache->retrieve('donateSecondAmount');
        } else {
            $donateSecondAmount = '10';
            $cache->store('donateSecondAmount', $donateSecondAmount);
        }

        if ($cache->isCached('donateThirdAmount')) {
            $donateThirdAmount = $cache->retrieve('donateThirdAmount');
        } else {
            $donateThirdAmount = '20';
            $cache->store('donateThirdAmount', $donateThirdAmount);
        }

    // Message
        if ($cache->isCached('messageTitle')) {
            $messageTitle = $cache->retrieve('messageTitle');
        } else {
            $messageTitle = 'About';
            $cache->store('messageTitle', $messageTitle);
        }

        if ($cache->isCached('messageText')) {
            $messageText = $cache->retrieve('messageText');
        } else {
            $messageText = 'We are an online platform to help users around the world connect through NamelessMC powered forums.';
            $cache->store('messageText', $messageText);
        }

        if ($cache->isCached('messageIcon')) {
            $messageIcon = $cache->retrieve('messageIcon');
        } else {
            $messageIcon = 'fas fa-hand-holding-usd';
            $cache->store('messageIcon', $messageIcon);
        }

// Embed
    if ($cache->isCached('embedTitle')) {
        $embedTitle = $cache->retrieve('embedTitle');
    } else {
        $embedTitle = '{$TITLE} • {$smarty.const.SITE_NAME}';
        $cache->store('embedTitle', $embedTitle);
    }

    if ($cache->isCached('embedText')) {
        $embedText = $cache->retrieve('embedText');
    } else {
        $embedText = 'We are an online platform to help users around the world connect through NamelessMC powered forums.';
        $cache->store('embedText', $embedText);
    }

    if ($cache->isCached('embedColor')) {
        $embedColor = $cache->retrieve('embedColor');
    } else {
        $embedColor = '#46d0e6';
        $cache->store('embedColor', $embedColor);
    }

    if ($cache->isCached('embedIcon')) {
        $embedIcon = $cache->retrieve('embedIcon');
    } else {
        $embedIcon = 'https://i.imgur.com/e6YHD.gif';
        $cache->store('embedIcon', $embedIcon);
    }

    if ($cache->isCached('embedKeywords')) {
        $embedKeywords = $cache->retrieve('embedKeywords');
    } else {
        $cache->store('embedKeywords', $embedKeywords);
    }