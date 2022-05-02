<?php
    require_once('classes/NexusUtill.php');
    $settings_data = NexusUtil::getSettingsToSmarty();

    $this->_smarty->assign($settings_data);

    if ($this->_cache->isCached('ds_status_ping')) {
        $discord_server = $this->_cache->retrieve('ds_status_ping');
    } else {
        $discord_server = NexusUtil::getDsServer($settings_data['DISCORDID']);
    }
    $this->_cache->store('ds_status_ping', $discord_server, 60);
    $this->_smarty->assign(array(
        'DISCORD_SERVER' => $discord_server,
    ));
