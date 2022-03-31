<?php
// Options
    var_dump($cache->retrieve('footerView'));
    var_dump($cache->retrieve('footerAbout'));
    var_dump($cache->retrieve('customCSS'));
    var_dump($cache->retrieve('customJS'));

// Colors
    var_dump($cache->retrieve('darkMode'));
    var_dump($cache->retrieve('primaryColor'));
    var_dump($cache->retrieve('navbarColor'));
    var_dump($cache->retrieve('footerColor'));
    var_dump($cache->retrieve('outlineColor'));
    var_dump($cache->retrieve('navbarTextColor'));

// Navbar
    var_dump($cache->retrieve('navbarLogo'));
    var_dump($cache->retrieve('navbarSticky'));
    var_dump($cache->retrieve('navbarStyle'));

// Connections
    // Discord
        var_dump($cache->retrieve('discordView'));
        var_dump($cache->retrieve('discordID'));
    // Minecraft
        var_dump($cache->retrieve('minecraftView'));
        var_dump($cache->retrieve('minecraftDomain'));
        var_dump($cache->retrieve('minecraftIP'));
        var_dump($cache->retrieve('minecraftPort'));
        var_dump($cache->retrieve('minecraftStyle'));

// Arc
    var_dump($cache->retrieve('arcView'));
    var_dump($cache->retrieve('arcURL'));

// Widgets
    // Donation
        var_dump($cache->retrieve('donateEmail'));
        var_dump($cache->retrieve('donateFirstAmount'));
        var_dump($cache->retrieve('donateSecondAmount'));
        var_dump($cache->retrieve('donateThirdAmount'));

    // Message
        var_dump($cache->retrieve('messageTitle'));
        var_dump($cache->retrieve('messageText'));
        var_dump($cache->retrieve('messageIcon'));

// Embed
    var_dump($cache->retrieve('embedTitle'));
    var_dump($cache->retrieve('embedText'));
    var_dump($cache->retrieve('embedColor'));
    var_dump($cache->retrieve('embedIcon'));
    var_dump($cache->retrieve('embedKeywords'));