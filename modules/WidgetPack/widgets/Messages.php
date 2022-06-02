<?php

class Messages extends WidgetBase
{
  public function __construct(Smarty $smarty, Cache $cache, User $user, Queries $queries, WPUtil $wpu, $class_name)
  {
    $this->_queries = $queries;
    $this->_smarty = $smarty;
    $this->_cache = $cache;
    $this->_user = $user;
    $this->_wg_name = strtoupper($class_name);
    $this->_wpu = $wpu->getWgData($class_name);

    // Get widget
    $widget_query = self::getData($class_name);

    parent::__construct(self::parsePages($widget_query));

    // Set widget variables
    $this->_module = 'WidgetPack';
    $this->_name = $class_name;
    $this->_location = $widget_query->location ?? null;
    $this->_description = $class_name . ' Widget';
    $this->_order = $widget_query->order ?? null;
  }
  public function initialise(): void
  {
    // Generate HTML code for widget
    $this->_smarty->assign($this->_wg_name . '_WG', $this);
    $this->_content = $this->_smarty->fetch($this->_module . '/messages.tpl');
  }

  public function get($key, $default = '')
  {
    if (isset($this->_wpu->data[$key])) {
      return $this->_wpu->data[$key];
    } else {
      return $default;
    }
  }
}
