<?php
/*
 *	Made by Samerton
 *  https://github.com/NamelessMC/Nameless/tree/v2/
 *  NamelessMC version 2.0.0-pr10
 *
 *  License: MIT
 *
 *  Nexus By Mubeen & xGIGABAITx
 */

$INFO_MODULE = array(
	'name' => 'Nexus',
	'author' => '<a href="https://lectrichost.com" target="_blank" rel="nofollow noopener">Mubeen</a>, <a href="https://tensa.co.ua" target="_blank" rel="nofollow noopener">xGIGABAITx</a> & <a href="https://padow.ru" target="_blank" rel="nofollow noopener">PadowYT2</a>',
	'module_ver' => '1.4.0',
	'nml_ver' => '2.0.0-pr11',
);

$NexusLanguage = new Language(ROOT_PATH . '/modules/' . $INFO_MODULE['name'] . '/language', LANGUAGE);

$GLOBALS['NexusLanguage'] = $NexusLanguage;

require_once(ROOT_PATH . '/modules/' . $INFO_MODULE['name'] . '/module.php');

$module = new Nexus($language, $pages, $INFO_MODULE);
