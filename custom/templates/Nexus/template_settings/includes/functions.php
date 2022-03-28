<?php
$smarty->assign(array(
    // Options
        'ABOUTFOOTER' => $aboutFooter,

    // Colors
        'DARKMODE' => $darkMode,
        'PRIMARYCOLOR' => $primaryColor,
        'NAVBARCOLOR' => $navbarColor,
        'FOOTERCOLOR' => $footerColor,
        'OUTLINECOLOR' => $outlineColor,
        'NAVBARTEXTCOLOR' => $navbarTextColor,

    // Navbar
        'NAVBARLOGO' => $navbarLogo,
        'NAVBARSTICKY' => $navbarSticky,
        'NAVBARSTYLE' => $navbarStyle,

    // Connections
        // Discord
            'DISCORDVIEW' => $discordView,
            'DISCORDID' => $discordID,

        // Minecraft
            'MINECRAFTVIEW' => $minecraftView,
            'MINECRAFTDOMAIN' => $minecraftDomain,
            'MINECRAFTIP' => $minecraftIP,
            'MINECRAFTPORT' => $minecraftPort,
            'MINECRAFTSTYLE' => $minecraftStyle,
));