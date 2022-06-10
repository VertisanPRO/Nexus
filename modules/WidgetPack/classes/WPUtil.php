<?php

class WPUtil {
    private static Language $_widget_language;

    public function getAll(): array {
        return DB::getInstance()->get('widgets_pack', ['id', '<>', 0])->results();
    }

    public function getWgById($id) {
        $array = DB::getInstance()->get('widgets_pack', ['id', '=', $id])->results();
        $wg = end($array);
        if (empty($wg)) {
            return false;
        }
        $wg->data = json_decode($wg->data);
        return $wg;
    }

    public function getWgData($wg_name) {
        $array = DB::getInstance()->get('widgets_pack', ['name', '=', $wg_name])->results();
        $wg = end($array);
        $wg->data = json_decode($wg->data, true);
        return $wg;
    }

    public function getAllWidgetsData(): array {
        $wgs = DB::getInstance()->get('widgets_pack', ['id', '<>', 0])->results();
        foreach ($wgs as $key => $value) {
            $array = DB::getInstance()->get('widgets', ['name', '=', $value->name])->results();
            $resp[] = [
                'pack' => $this->getWgData($value->name),
                'widget' => end($array),
            ];
        }
        return $resp;
    }

    public function wgSaveData($wg_id, array $data) {
        unset($data['wg_save']);
        unset($data['token']);
        try {
            DB::getInstance()->update('widgets_pack', $wg_id, [
                'data' => json_encode($data),
            ]);
        } catch (Exception $e) {
            dd($data);
        }
    }

    public function updatePacks() {
        $widgets_pack = scandir(ROOT_PATH . "/modules/WidgetPack/widgets/");
        $installed = DB::getInstance()->get('widgets_pack', ['id', '<>', 0])->results();
        if (empty($installed)) {
            $installed_wg = [];
        } else {
            foreach ($installed as $key => $value) {
                $installed_wg[$value->name] = true;
            }
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
                DB::getInstance()->insert('widgets_pack', [
                    'name' => $class,
                    'type' => 0
                ]);
            } catch (Exception $e) {
                $errors = [$e->getMessage()];
            }
        }
    }

    public static function getWgLangsSection($wg_name): array {
        $section = strtolower($wg_name);
        $resp = [];
        $langs = json_decode(file_get_contents(ROOT_PATH . '/modules/WidgetPack/language/' . LANGUAGE . '.json'), true);
            foreach ($langs as $key => $value) {
                if (strpos($key, $section) === false) {
                    continue;
                }
                $resp[strtoupper(str_replace($section . '/', '', $key))] = $value;
            }
        return $resp;
    }

    public static function getLanguage(string $file, string $term, array $variables = []): string {
        if (!isset(self::$_widget_language)) {
            self::$_widget_language = new Language(ROOT_PATH . '/modules/WidgetPack/language', LANGUAGE);
        }
        return self::$_widget_language->get($file, $term, $variables);
    }

    public function removeWG($id) {
        $protect_wg = [
            'Message' => true,
            'Donate' => true, 
            'Iframe' => true, 
        ];
        $array = DB::getInstance()->get('widgets_pack', ['id', '=', $id])->results();
        $wg = end($array);
        if (empty($wg) or isset($protect_wg[$wg->name])) {
            Session::flash('wg_packs_errors', "Widget {$wg->name} protected");
            Redirect::to(URL::build('/panel/widget-pack'));
            return;
        }
        unlink(ROOT_PATH . "/modules/WidgetPack/widgets/".ucfirst($wg->name).".php");
        unlink(ROOT_PATH . "/custom/panel_templates/Default/widget_pack/widgets/".strtolower($wg->name).".tpl");
        $array1 = DB::getInstance()->get('templates', ['is_default', '=', 1])->results();
        $template = end($array1);
        if (empty($template)) {
            $template = 'Nexus';
        }
        unlink(ROOT_PATH . "/custom/templates/{$template->name}/WidgetPack/".strtolower($wg->name).".tpl");
        DB::getInstance()->delete('widgets_pack', ['id', $wg->id]);
        $this->updatePacks();
        Session::flash('wg_packs_success', "Widget {$wg->name} removed");
        Redirect::to(URL::build('/panel/widget-pack'));
    }

    public function generateNewWG($class_name) {
        $class_file = file_get_contents(ROOT_PATH . "/modules/WidgetPack/widgets/Messages.php");
        $class_name = str_replace(' ', '', ucfirst($class_name));
        $tpl_name = strtolower($class_name);
        $class_file = str_replace('Messages', $class_name, $class_file);
        $class_content = str_replace('messages', strtolower($tpl_name), $class_file);
        $class_file_save_path = ROOT_PATH . "/modules/WidgetPack/widgets/{$class_name}.php";
        if (file_exists($class_file_save_path)) {
            return;
        }
        file_put_contents($class_file_save_path, $class_content);
        $panel_file = file_get_contents(ROOT_PATH . "/custom/panel_templates/Default/widget_pack/widgets/messages.tpl");
        $panel_file = str_replace('MESSAGE', strtoupper($class_name), $panel_file);
        $panel_file = str_replace('message', strtolower($class_name), $panel_file);
        $panel_tpl_content = str_replace('M_WG', strtoupper($class_name['0'] . '_WG'), $panel_file);
        $panel_tpl_save_path = ROOT_PATH . "/custom/panel_templates/Default/widget_pack/widgets/" . strtolower($class_name) . ".tpl";
        file_put_contents($panel_tpl_save_path, $panel_tpl_content);
        $template = end($this->_queries->getWhere('templates', array('is_default', '=', 1)));
        if (empty($template)) {
            $template = 'Nexus';
        } else {
            $template = $template->name;
        }
        $widget_file = file_get_contents(ROOT_PATH . "/custom/templates/{$template}/WidgetPack/messages.tpl");
        $widget_file = str_replace('MESSAGES', strtoupper($class_name), $widget_file);
        $widget_tpl_content = str_replace('message', strtolower($class_name), $widget_file);
        $widget_tpl_save_path = ROOT_PATH . "/custom/templates/{$template}/WidgetPack/" . strtolower($class_name) . ".tpl";
        file_put_contents($widget_tpl_save_path, $widget_tpl_content);
        $langs = json_decode(file_get_contents(ROOT_PATH . '/modules/WidgetPack/language/' . LANGUAGE . '.json'), true);
        $langs["$tpl_name/{$tpl_name['0']}_wg_label"] = "{$class_name} Widget";
        $langs["$tpl_name/{$tpl_name['0']}_wg_title_label"] = "{$class_name} Label";
        $langs["$tpl_name/{$tpl_name['0']}_wg_text_label"] = "{$class_name} Text";
        $langs["$tpl_name/{$tpl_name['0']}_wg_icon_label"] = "{$class_name} Icon";
        $langs["$tpl_name/{$tpl_name['0']}_wg_header_label"] = "{$class_name} Header";
        file_put_contents(ROOT_PATH . '/modules/WidgetPack/language/' . LANGUAGE . '.json', json_encode($langs, JSON_UNESCAPED_SLASHES|JSON_PRETTY_PRINT));
        $this->updatePacks();
        Session::flash('wg_packs_success', "Widget editing files:
            <p>{$panel_tpl_save_path}</p>
            <p>{$widget_tpl_save_path}</p>
        ");
        Redirect::to(URL::build('/panel/widget-pack'));
    }
}