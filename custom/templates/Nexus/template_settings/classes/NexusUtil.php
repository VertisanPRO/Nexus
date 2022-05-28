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


        // INSERT INTO `nl2_nexus_settings` (`id`, `name`, `value`) VALUES
        // (1, 'darkMode', '1'),
        // (2, 'colorsStyle', '0'),
        // (3, 'footerAbout', 'We are an online platform to help users around the world connect through NamelessMC powered forums.'),
        // (4, 'customCSS', ''),
        // (5, 'customJS', ''),
        // (6, 'navbarLogo', 'https://namelessmc.com/uploads/resources_icons/162.png'),
        // (7, 'navbarSticky', '0'),
        // (8, 'navbarStyle', '0'),
        // (9, 'minecraftView', '1'),
        // (10, 'preloaderView', '0'),
        // (11, 'arcView', '0'),
        // (12, 'donateEmail', 'mubeenullah323@gmail.com'),
        // (13, 'donateFirstAmount', '5'),
        // (14, 'donateSecondAmount', '10'),
        // (15, 'donateThirdAmount', '20'),
        // (16, 'messageTitle', 'About'),
        // (17, 'messageText', ''),
        // (18, 'messageIcon', 'fas fa-hand-holding-usd'),
        // (19, 'embedTitle', 'Nexus'),
        // (20, 'embedText', 'We are an online platform to help users around the world connect through NamelessMC powered forums.'),
        // (21, 'embedColor', '#46d0e6'),
        // (22, 'embedIcon', 'https://i.imgur.com/e6YHD.gif'),
        // (23, 'embedKeywords', ''),
        // (24, 'minecraftDomain', 'game.mc-tensa.com'),
        // (25, 'minecraftIP', '95.217.119.207'),
        // (26, 'minecraftPort', '25565'),
        // (27, 'minecraftStyle', '0'),
        // (28, 'discordView', '1'),
        // (29, 'discordID', '760945720470667294'),
        // (30, 'preloaderText', ''),
        // (31, 'preloaderColor', 'red'),
        // (32, 'preloaderSpeed', 'slow'),
        // (33, 'preloaderStyle', 'normal');
    }
}