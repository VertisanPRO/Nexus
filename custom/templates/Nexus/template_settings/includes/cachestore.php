<?php
if (Input::exists()) {
    if (Token::check()) {
        $cache->setCache('template_settings');

        // Options
            if (isset($_POST['footerView'])) {
                $cache->store('footerView', $_POST['footerView']);
            }

            if (isset($_POST['footerAbout'])) {
                $cache->store('footerAbout', $_POST['footerAbout']);
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

        // Arc
            if (isset($_POST['arcView'])) {
                $cache->store('arcView', $_POST['arcView']);
            }

            if (isset($_POST['arcURL'])) {
                $cache->store('arcURL', $_POST['arcURL']);
            }

        // Widgets
            // Donation
                if (isset($_POST['donateEmail'])) {
                    $cache->store('donateEmail', $_POST['donateEmail']);
                }

                if (isset($_POST['donateFirstAmount'])) {
                    $cache->store('donateFirstAmount', $_POST['donateFirstAmount']);
                }

                if (isset($_POST['donateSecondAmount'])) {
                    $cache->store('donateSecondAmount', $_POST['donateSecondAmount']);
                }

                if (isset($_POST['donateThirdAmount'])) {
                    $cache->store('donateThirdAmount', $_POST['donateThirdAmount']);
                }

            // Message
                if (isset($_POST['messageTitle'])) {
                    $cache->store('messageTitle', $_POST['messageTitle']);
                }

                if (isset($_POST['messageText'])) {
                    $cache->store('messageText', $_POST['messageText']);
                }

                if (isset($_POST['messageIcon'])) {
                    $cache->store('messageIcon', $_POST['messageIcon']);
                }

    // Embed
        if (isset($_POST['embedTitle'])) {
            $cache->store('embedTitle', $_POST['embedTitle']);
        }

        if (isset($_POST['embedText'])) {
            $cache->store('embedText', $_POST['embedText']);
        }

        if (isset($_POST['embedColor'])) {
            $cache->store('embedColor', $_POST['embedColor']);
        }

        if (isset($_POST['embedIcon'])) {
            $cache->store('embedIcon', $_POST['embedIcon']);
        }

        if (isset($_POST['embedKeywords'])) {
            $cache->store('embedKeywords', $_POST['embedKeywords']);
        }

        Session::flash('admin_templates', $language->get('admin', 'successfully_updated'));

    } else {
        $errors = [$language->get('general', 'invalid_token')];
    }
}