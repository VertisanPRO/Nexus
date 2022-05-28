<?php

class NexusUtil {

    private static Language $_nexus_language;

    public static function getLanguage(string $file, string $term, array $variables = []): string {
        if (!isset(self::$_nexus_language)) {
            self::$_nexus_language = new Language(ROOT_PATH . '/custom/templates/Nexus/_language', LANGUAGE);
        }
        return self::$_nexus_language->get($file, $term, $variables);
    }

    public static function getDsServer($id) {
        $discord_server = [];
        if ($id !== '') {
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 0);
            curl_setopt($ch, CURLOPT_TIMEOUT, 5);
            curl_setopt($ch, CURLOPT_URL, 'https://discordapp.com/api/servers/' . $id . '/widget.json');
            $result = curl_exec($ch);
            $result = json_decode($result);
            curl_close($ch);
            $discord_server = [
                'name' => $result->name,
                'members' => $result->presence_count,
                'link' => $result->instant_invite
            ];
        }
        return $discord_server;
    }

    public static function getSettingsToSmarty() {
        $queries = new Queries();
        $settings_data = $queries->getWhere('nexus_settings', ['id', '<>', 0]);
        if (count($settings_data)) {
            $result = [];
            foreach ($settings_data as $value) {
                $settings_data_array[$value->name] = [
                    'id' => Output::getClean($value->id),
                    'value' => Output::getClean($value->value)
                ];
                $result[strtoupper($value->name)] = htmlspecialchars_decode($settings_data_array[$value->name]['value']);
            }
        }
        return $result;
    }

    public static function updateOrCreateParam($key, $value) {
        $queries = new Queries();
        $data = end($queries->getWhere('nexus_settings', ['name', '=', $key]));
        if (!empty($data)) {
            $queries->update('nexus_settings', $data->id, [
                'value' => $value
            ]);
        } else {
            $queries->create('nexus_settings', [
                'name' => $key,
                'value' => $value
            ]);
        }
        return;
    }

    public static function initialise() {
        $queries = new Queries();
        try {
            $group = $queries->getWhere('groups', ['id', '=', 2]);
            $group = $group[0];
            $group_permissions = json_decode($group->permissions, TRUE);
            $group_permissions['admincp.nexus'] = 1;
            $group_permissions = json_encode($group_permissions);
            $queries->update('groups', 2, ['permissions' => $group_permissions]);
        } catch (Exception $e) {
            // Error
        }
        try {
            $engine = Config::get('mysql/engine');
            $charset = Config::get('mysql/charset');
        } catch (Exception $e) {
            $engine = 'InnoDB';
            $charset = 'utf8mb4';
        }
        if (!$engine || is_array($engine))
            $engine = 'InnoDB';
        if (!$charset || is_array($charset))
            $charset = 'latin1';
        try {
            $queries->createTable("nexus_settings", "`id` int(11) NOT NULL AUTO_INCREMENT, `name` varchar(255) NOT NULL, `value` varchar(5000) NOT NULL, PRIMARY KEY (`id`)", "ENGINE=$engine DEFAULT CHARSET=$charset");
        } catch (Exception $e) {
            // Error
        }

        try {
          // Insert data
          $queries->create('nexus_settings', array(
            'name' => 'darkMode',
            'value' => 1,
          ));
          $queries->create('nexus_settings', array(
            'name' => 'colorsStyle',
            'value' => 0,
          ));
          $queries->create('nexus_settings', array(
            'name' => 'footerAbout',
            'value' => 'We are an online platform to help users around the world connect through NamelessMC powered forums.',
          ));
          $queries->create('nexus_settings', array(
            'name' => 'navbarLogo',
            'value' => 'https://namelessmc.com/uploads/resources_icons/162.png',
          ));
          $queries->create('nexus_settings', array(
            'name' => 'navbarSticky',
            'value' => 0,
          ));
          $queries->create('nexus_settings', array(
            'name' => 'navbarStyle',
            'value' => 0,
          ));
          $queries->create('nexus_settings', array(
            'name' => 'minecraftView',
            'value' => 1,
          ));
          $queries->create('nexus_settings', array(
            'name' => 'preloaderView',
            'value' => 0,
          ));
          $queries->create('nexus_settings', array(
            'name' => 'arcView',
            'value' => 0,
          ));
          $queries->create('nexus_settings', array(
            'name' => 'donateEmail',
            'value' => 'mubeenullah323@gmail.com',
          ));
          $queries->create('nexus_settings', array(
            'name' => 'donateFirstAmount',
            'value' => 5,
          ));
          $queries->create('nexus_settings', array(
            'name' => 'donateSecondAmount',
            'value' => 10,
          ));
          $queries->create('nexus_settings', array(
            'name' => 'donateThirdAmount',
            'value' => 20,
          ));
          $queries->create('nexus_settings', array(
            'name' => 'messageTitle',
            'value' => 'About',
          ));
          $queries->create('nexus_settings', array(
            'name' => 'messageText',
            'value' => '',
          ));
          $queries->create('nexus_settings', array(
            'name' => 'messageIcon',
            'value' => 'fas fa-hand-holding-usd',
          ));
          $queries->create('nexus_settings', array(
            'name' => 'embedTitle',
            'value' => 'Nexus',
          ));
          $queries->create('nexus_settings', array(
            'name' => 'embedText',
            'value' => 'We are an online platform to help users around the world connect through NamelessMC powered forums.',
          ));
          $queries->create('nexus_settings', array(
            'name' => 'embedColor',
            'value' => '#46d0e6',
          ));
          $queries->create('nexus_settings', array(
            'name' => 'embedIcon',
            'value' => 'https://i.imgur.com/e6YHD.gif',
          ));
          $queries->create('nexus_settings', array(
            'name' => 'minecraftDomain',
            'value' => 'game.mc-tensa.com',
          ));
          $queries->create('nexus_settings', array(
            'name' => 'minecraftIP',
            'value' => 'tensa.co.ua',
          ));
          $queries->create('nexus_settings', array(
            'name' => 'minecraftPort',
            'value' => 25565,
          ));
          $queries->create('nexus_settings', array(
            'name' => 'minecraftStyle',
            'value' => 0,
          ));
          $queries->create('nexus_settings', array(
            'name' => 'discordView',
            'value' => 1,
          ));
          $queries->create('nexus_settings', array(
            'name' => 'discordID',
            'value' => 760945720470667294,
          ));
          $queries->create('nexus_settings', array(
            'name' => 'preloaderText',
            'value' => 'Wait',
          ));
          $queries->create('nexus_settings', array(
            'name' => 'preloaderColor',
            'value' => 'red',
          ));
          $queries->create('nexus_settings', array(
            'name' => 'preloaderSpeed',
            'value' => 'slow',
          ));
          $queries->create('nexus_settings', array(
            'name' => 'preloaderStyle',
            'value' => 'normal',
          ));
        } catch (Exception $e) {
          // Error
        }

    }
}