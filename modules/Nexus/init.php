<?php
/*
 *	Made by Samerton
 *  https://github.com/NamelessMC/Nameless/tree/v2/
 *  NamelessMC version 2.0.0-pr12
 *
 *  License: MIT
 *
 *  Nexus By Mubeen & xGIGABAITx
 */

$INFO_MODULE = array(
	'name' => 'Nexus',
	'author' => '<a href="https://github.com/GIGABAIT-Official" target="_blank" rel="nofollow noopener">GIGABAIT Official</a>',
	'module_ver' => '1.6.1',
	'nml_ver' => '2.0.0-pr12',
);

require_once(ROOT_PATH . '/modules/' . $INFO_MODULE['name'] . '/module.php');
require_once(ROOT_PATH . '/modules/'. $INFO_MODULE['name'] .'/classes/NexusUtill.php');

$module = new Nexus($language, $pages, $INFO_MODULE);
