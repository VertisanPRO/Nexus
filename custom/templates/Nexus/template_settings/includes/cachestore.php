<?php
if (Input::exists()) {
    if (Token::check()) {
        $cache->setCache('template_settings');

        // Options
            if (isset($_POST['aboutFooter'])) {
                $cache->store('aboutFooter', $_POST['aboutFooter']);
            }

        // Colors
            if (isset($_POST['darkMode'])) {
                $cache->store('darkMode', $_POST['darkMode']);
            }

            if (isset($_POST['primaryColor'])) {
                $cache->store('primaryColor', $_POST['primaryColor']);
            }

            if (isset($_POST['navbarColor'])) {
                $cache->store('navbarColor', $_POST['navbarColor']);
            }

            if (isset($_POST['footerColor'])) {
                $cache->store('footerColor', $_POST['footerColor']);
            }

            if (isset($_POST['outlineColor'])) {
                $cache->store('outlineColor', $_POST['outlineColor']);
            }

            if (isset($_POST['navbarTextColor'])) {
                $cache->store('navbarTextColor', $_POST['navbarTextColor']);
            }

        // Navbar
            if (isset($_POST['navbarLogo'])) {
                $cache->store('navbarLogo', $_POST['navbarLogo']);
            }

            if (isset($_POST['navbarSticky'])) {
                $cache->store('navbarSticky', $_POST['navbarSticky']);
            }

            if (isset($_POST['navbarStyle'])) {
                $cache->store('navbarStyle', $_POST['navbarStyle']);
            }

        // Connections
            // Discord
                if (isset($_POST['discordView'])) {
                    $cache->store('discordView', $_POST['discordView']);
                }

                if (isset($_POST['discordID'])) {
                    $cache->store('discordID', $_POST['discordID']);
                }

            // Minecraft
                if (isset($_POST['minecraftView'])) {
                    $cache->store('minecraftView', $_POST['minecraftView']);
                }

                if (isset($_POST['minecraftDomain'])) {
                    $cache->store('minecraftDomain', $_POST['minecraftDomain']);
                }

                if (isset($_POST['minecraftIP'])) {
                    $cache->store('minecraftIP', $_POST['minecraftIP']);
                }

                if (isset($_POST['minecraftPort'])) {
                    $cache->store('minecraftPort', $_POST['minecraftPort']);
                }

                if (isset($_POST['minecraftStyle'])) {
                    $cache->store('minecraftStyle', $_POST['minecraftStyle']);
                }

        Session::flash('admin_templates', $language->get('admin', 'successfully_updated'));

    } else {
        $errors = [$language->get('general', 'invalid_token')];
    }
}