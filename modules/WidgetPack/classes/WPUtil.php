<?php

class WPUtil
{
  private $_queries;
  private static Language $_widget_language;

  public function __construct()
  {
    $this->_queries = new Queries();
  }

  public function getAll()
  {
    return $this->_queries->getWhere('widgets_pack', array('id', '<>', 0));
  }

  public function getWgById($id)
  {
    $wg = end($this->_queries->getWhere('widgets_pack', array('id', '=', $id)));
    if (empty($wg)) {
      return false;
    }
    $wg->data = json_decode($wg->data);
    return $wg;
  }

  public function getWgData($wg_name)
  {
    $wg = end($this->_queries->getWhere('widgets_pack', array('name', '=', $wg_name)));
    $wg->data = json_decode($wg->data, true);
    return $wg;
  }

  public function getAllWdgetsData()
  {
    $wgs = $this->_queries->getWhere('widgets_pack', array('id', '<>', 0));
    foreach ($wgs as $key => $value) {
      $resp = array(
        'data' => $this->getWgData($value->name),
        'widget' => end($this->_queries->getWhere('widgets', array('name', '=', $value->name)))
      );
    }
    return $resp;
  }

  public function wgSaveData($wg_id, array $data)
  {
    unset($data['wg_save']);
    unset($data['token']);
    try {
      $this->_queries->update('widgets_pack', $wg_id, [
        'data' => json_encode($data),
      ]);
    } catch (Exception $e) {
      dd($data);
    }
  }

  public function updatePacks()
  {
    $widgets_pack = scandir(ROOT_PATH . "/modules/WidgetPack/widgets/");
    $installed = $this->_queries->getWhere('widgets_pack', array('id', '<>', 0));
    foreach ($installed as $key => $value) {
      $installed_wg[$value->name] = true;
    }

    foreach ($widgets_pack as $value) {
      if ($value == '..' or $value == '.') {
        continue;
      }
      $class = basename($value, '.php');
      if (isset($installed_wg[$class])) {
        continue;
      }
      try {
        $this->_queries->create('widgets_pack', [
          'name' => $class,
          'type' => 0
        ]);
      } catch (Exception $e) {
        $errors = [$e->getMessage()];
      }
    }
  }







  // Langs
  public static function getWgLangsSection($wg_name)
  {
    $section = strtolower($wg_name);
    $resp = array();
    $langs = json_decode(file_get_contents(ROOT_PATH . '/modules/WidgetPack/language/' . LANGUAGE . '.json'), true);
    foreach ($langs as $key => $value) {
      if (strpos($key, $section) === false) {
        continue;
      }
      $resp[strtoupper(str_replace($section . '/', '', $key))] = $value;
    }
    return $resp;
  }

  public static function getLanguage(string $file, string $term, array $variables = []): string
  {
    if (!isset(self::$_widget_language)) {
      self::$_widget_language = new Language(ROOT_PATH . '/modules/WidgetPack/language', LANGUAGE);
    }
    return self::$_widget_language->get($file, $term, $variables);
  }
}
