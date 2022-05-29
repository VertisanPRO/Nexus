<?php

class WPUtil
{
  private $_queies;

  public function __construct(){
    $this->_queies = new Queries();
  }

  public function getAll(){
    return $this->_queies->getWhere('widgets_pack', array('id', '<>', 0));
  }

  public function getWgData($wg_name){
    $wg = end($this->_queies->getWhere('widgets_pack', array('name', '=', $wg_name)));
    $wg->data = json_decode($wg->data);
    return $wg;
  }

  public function getAllWdgetsData(){
    $wgs = $this->_queies->getWhere('widgets_pack', array('id', '<>', 0));
    foreach ($wgs as $key => $value) {
      $resp = array(
        'data' => $this->getWgData($value->name),
        'widget' => end($this->_queies->getWhere('widgets', array('name', '=', $value->name)))
      );
    }
    return $resp;
  }
}