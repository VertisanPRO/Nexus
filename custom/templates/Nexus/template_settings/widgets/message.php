<?php
/*
 *    Made by Samerton
 *  https://github.com/NamelessMC/Nameless/tree/v2/
 *  NamelessMC version 2.0.0-pr9
 *
 *  License: MIT
 *
 *  Nexus By Mubeen & xGIGABAITx
 */
class Message extends WidgetBase
{
    private $_smarty;
    public function __construct($pages = array(), $smarty, $user)
    {
        parent::__construct($pages);
        $this->_smarty = $smarty;
        $this->_user = $user;
        // Get order
        $order = DB::getInstance()->query('SELECT `location`, `order` FROM nl2_widgets WHERE `name` = ?', array('Message'))->first();

        // Set widget variables
        $this->_module = 'Nexus';
        $this->_name = 'Message';
        $this->_location = isset($order->location) ? $order->location : null;;
        $this->_description = 'Message Widget';
        $this->_order = $order->order;
    }
    public function initialise()
    {

        $this->_content = $this->_smarty->fetch($this->_module . '/widgets/message.tpl');
    }
}
