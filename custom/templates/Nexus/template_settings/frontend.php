<?php
    require_once('classes/NexusUtil.php');
    $settings_data = NexusUtil::getSettingsToSmarty();

    $this->_smarty->assign($settings_data);

    $discord_server = NexusUtil::getDsServer($settings_data['DISCORDID']);
    $this->_cache->store('ds_status_ping', $discord_server, 60);
    $this->_smarty->assign([
        'DISCORD_SERVER' => $discord_server,
    ]);
