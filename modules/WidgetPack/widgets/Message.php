<?php

class Message extends WidgetBase {
    public function __construct(Smarty $smarty) {
        $this->_smarty = $smarty;
        // Get widget
        $widget_query = self::getData('Message');

        parent::__construct(self::parsePages($widget_query));

        // Set widget variables
        $this->_module = 'WidgetPack';
        $this->_name = 'Message';
        $this->_location = $widget_query->location ?? null;
        $this->_description = 'Message Widget';
        $this->_order = $widget_query->order ?? null;
    }
    public function initialise(): void {
        // Generate HTML code for widget
        $this->_smarty->assign('LATEST_POSTS_ARRAY', ['sadas', 'asda']);
        $this->_content = $this->_smarty->fetch($this->_module . '/message.tpl');

    }
}
