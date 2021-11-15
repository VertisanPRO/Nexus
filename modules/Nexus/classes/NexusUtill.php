<?php

class NexusUtill {

  private static Language $_nexus_language;

  public static function getLanguage(string $file, string $term): string {
    if (!isset(self::$_nexus_language)) {
        self::$_nexus_language = new Language(ROOT_PATH . '/modules/Nexus/language', LANGUAGE);
    }
    return self::$_nexus_language->get($file, $term);
  }

	public static function languageFileToSmarty(string $file): array {
    require ROOT_PATH . '/modules/Nexus/language/' . LANGUAGE . DIRECTORY_SEPARATOR . $file . '.php';
    $result = array();
    foreach ($language as $key => $value) {
      $result[strtoupper($key)] = $value;
    }
    return $result;
  } 

  public static function getDsServer($id)
  {
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
          'link' => $result->instant_invite,
        );
      }
      return $discord_server;
  }

  public static function getSettingsToSmarty()
  {
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

}