<?php

class NexusUtil {

  private static Language $_nexus_language;

  public static function getLanguage(string $file, string $term, array $variables = []): string {
    if (!isset(self::$_nexus_language)) {
      self::$_nexus_language = new Language(ROOT_PATH . '/custom/templates/Nexus/_language', LANGUAGE);
    }
    return self::$_nexus_language->get($file, $term, $variables);
  }

  public static function languageFileToSmarty(string $file): array {
    $path = ROOT_PATH . '/custom/templates/Nexus/_language/' . LANGUAGE . '.json';
    $terms = json_decode(file_get_contents($path), true);
    $result = array();
    foreach ($terms as $key => $value) {
      [$term_file, $term] = explode('/', $key);
      if ($term_file === $file) {
        $result[strtoupper($term)] = $value;
      }
    }
    return $result;
  }

  public static function getDsServer($id) {
    $discord_server = array();
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
      $discord_server = array(
        'name' => $result->name,
        'members' => $result->presence_count,
        'link' => $result->instant_invite
      );
    }
    return $discord_server;
  }

  public static function getSettingsToSmarty() {
    $queries = new Queries();
    $settings_data = $queries->getWhere('nexus_settings', array('id', '<>', 0));
    if (count($settings_data)) {
      $result =  array();
      foreach ($settings_data as $value) {
        $settings_data_array[$value->name] = array(
          'id' => Output::getClean($value->id),
          'value' => Output::getClean($value->value)
        );
        $result[strtoupper($value->name)] = htmlspecialchars_decode($settings_data_array[$value->name]['value']);
      }
    }
    return $result;
  }

  public static function updateOrCreateParam($key, $value) {
    $queries = new Queries();
    $data = end($queries->getWhere('nexus_settings', array('name', '=', $key)));
    if (!empty($data)) {
      $queries->update('nexus_settings', $data->id, array(
        'value' => $value
      ));
    } else {
      $queries->create('nexus_settings', array(
        'name' => $key,
        'value' => $value
      ));
    }
    return;
  }

  public static function initialise() {
    $queries = new Queries();
    try {
      $group = $queries->getWhere('groups', array('id', '=', 2));
      $group = $group[0];
      $group_permissions = json_decode($group->permissions, TRUE);
      $group_permissions['admincp.nexus'] = 1;
      $group_permissions = json_encode($group_permissions);
      $queries->update('groups', 2, array('permissions' => $group_permissions));
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
  }
}