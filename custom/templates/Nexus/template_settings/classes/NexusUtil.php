<?php

class NexusUtil
{
    private static Language $_nexus_language;

    public static function getLanguage(string $file, string $term, array $variables = []): string
    {
        if (!isset(self::$_nexus_language)) {
            self::$_nexus_language = new Language(ROOT_PATH . '/custom/templates/Nexus/_language', LANGUAGE);
        }
        return self::$_nexus_language->get($file, $term, $variables);
    }

    public static function getDsServer($id): array
    {
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

    public static function getSettingsToSmarty(): array
    {
        $settings_data = DB::getInstance()->get('nexus_settings', ['id', '<>', 0])->results();
        $result = [];
        if (count($settings_data)) {
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

    public static function updateOrCreateParam($key, $value)
    {
        $array = DB::getInstance()->get('nexus_settings', ['name', '=', $key])->results();
        $data = end($array);
        if (!empty($data)) {
            DB::getInstance()->update('nexus_settings', $data->id, [
                'value' => $value
            ]);
        } else {
            DB::getInstance()->insert('nexus_settings', [
                'name' => $key,
                'value' => $value
            ]);
        }
    }

    public static function initialise()
    {

        if (DB::getInstance()->showTables('nexus_settings')) {
            $foundLegacy = false;

            foreach (DB::getInstance()->query('SELECT name FROM nl2_nexus_settings')->results() as $row) {
                if ($row->name === 'template_about') {
                    $foundLegacy = true;
                    break;
                }
            }

            if ($foundLegacy) {
                DB::getInstance()->query('DROP TABLE nl2_nexus_settings');
            } else {
                if (DB::getInstance()->showTables('nexus_settings')) {
                    return;
                }
            }
        }

        try {
            $group = DB::getInstance()->get('groups', ['id', '=', 2])->results();
            $group = $group[0];
            $group_permissions = json_decode($group->permissions, TRUE);
            $group_permissions['admincp.nexus'] = 1;
            $group_permissions = json_encode($group_permissions);
            DB::getInstance()->update('groups', 2, ['permissions' => $group_permissions]);
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
            DB::getInstance()->createTable("nexus_settings", "`id` int(11) NOT NULL AUTO_INCREMENT, `name` varchar(255) NOT NULL, `value` varchar(5000) NOT NULL, PRIMARY KEY (`id`)");
        } catch (Exception $e) {
            // Error
        }

        $settings_data = [
            'footerAbout' => 'We are an online platform to help users around the world connect through NamelessMC powered forums.',
            'customCSS' => '',
            'customJS' => '',
            'darkMode' => 1,
            'colorsStyle' => 0,
            'primaryColor' => '#dc3545',
            'navbarColor' => '#000000',
            'footerColor' => '#000000',
            'outlineColor' => '#000000',
            'navbarTextColor' => 0,
            'navbarLogo' => 'https://namelessmc.com/uploads/resources_icons/162.png',
            'navbarExclude' => 'page1/page2',
            'navbarSticky' => 0,
            'navbarStyle' => 0,
            'discordView' => 1,
            'discordID' => 760945720470667294,
            'minecraftView' => 1,
            'minecraftDomain' => 'tensa.co.ua',
            'minecraftIP' => 'tensa.co.ua',
            'minecraftPort' => 25565,
            'minecraftStyle' => 0,
            'preloaderView' => 0,
            'preloaderText' => 'Loading...',
            'preloaderColor' => 'red',
            'preloaderSpeed' => 'normal',
            'preloaderStyle' => 'normal',
            'widgetBotView' => 0,
            'widgetBotServerID' => '760945720470667294',
            'widgetBotChannelID' => '760945722559299668',
            'widgetBotVerticalLocation' => 'bottom',
            'widgetBotHorizontalLocation' => 'right',
            'widgetBotColor' => 1,
            'widgetBotCustomColor' => '#dc3545',
            'arcView' => 0,
            'arcURL' => 'https://arc.io/widget.min.js#9YB4rHQn',
            'embedTitle' => 'Nexus',
            'embedText' => 'We are an online platform to help users around the world connect through NamelessMC powered forums.',
            'embedColor' => '#dc3545',
            'embedIcon' => 'https://i.imgur.com/e6YHD.gif',
            'embedKeywords' => ''
        ];

        foreach ($settings_data as $key => $value) {
            try {
                DB::getInstance()->insert('nexus_settings', [
                    'name' => $key,
                    'value' => $value,
                ]);
            } catch (Exception $e) {
                // Error
            }
        }
    }

    /**
     * Check for Nexus updates.
     */
    public static function updateCheckNexus()
    {
        $update_check_nexus_response = HttpClient::get('https://updates.wemx.net/api/v2/Nexus/updateCheck&version=1.7.2');

        if ($update_check_nexus_response->hasError()) {
            return $update_check_nexus_response->getError();
        }

        $update_check_nexus = new UpdateCheckNexus($update_check_nexus_response);
        if ($update_check_nexus->hasError()) {
            return $update_check_nexus->getErrorMessage();
        }

        return $update_check_nexus;
    }
}
