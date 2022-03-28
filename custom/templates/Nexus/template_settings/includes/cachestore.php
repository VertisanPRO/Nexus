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

        Session::flash('admin_templates', $language->get('admin', 'successfully_updated'));

    } else {
        $errors = [$language->get('general', 'invalid_token')];
    }
}