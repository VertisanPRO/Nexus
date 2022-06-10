<?php

class Message extends WidgetBase {

    private string $_wg_name;
    /**
     * @var false|mixed
     */
    private $_wpu;
    protected User $_user;
    protected Cache $_cache;

    public function __construct(Smarty $smarty, Cache $cache, User $user, Queries $queries, WPUtil $wpu, $class_name) {
        $this->_queries = $queries;
        $this->_smarty = $smarty;
        $this->_cache = $cache;
        $this->_user = $user;
        $this->_wg_name = strtoupper($class_name);
        $this->_wpu = $wpu->getWgData($class_name);
        
        $widget_query = self::getData($class_name);
        parent::__construct(self::parsePages($widget_query));

        $this->_module = 'WidgetPack';
        $this->_name = $class_name;
        $this->_location = $widget_query->location ?? null;
        $this->_description = $class_name . ' Widget';
        $this->_order = $widget_query->order ?? null;
    }

    /**
     * @throws SmartyException
     */
    public function initialise(): void {
        $this->_smarty->assign($this->_wg_name . '_WG', $this->_wpu->data);
        $this->_content = $this->_smarty->fetch($this->_module . '/message.tpl');
    }
}
