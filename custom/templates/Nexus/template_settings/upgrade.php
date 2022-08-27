<?php

# unlink('custom/templates/Nexus/...');
# Uncomment when next update is available

# DB::getInstance()->query('DELETE FROM nl2_nexus_settings WHERE donateEmail');
# DB::getInstance()->query('DELETE FROM nl2_nexus_settings WHERE donateFirstAmount');
# DB::getInstance()->query('DELETE FROM nl2_nexus_settings WHERE donateSecondAmount');
# DB::getInstance()->query('DELETE FROM nl2_nexus_settings WHERE donateThirdAmount');
# DB::getInstance()->query('DELETE FROM nl2_nexus_settings WHERE messageTitle');
# DB::getInstance()->query('DELETE FROM nl2_nexus_settings WHERE messageText');
# DB::getInstance()->query('DELETE FROM nl2_nexus_settings WHERE messageIcon');

$cache->setCache('update_check_nexus');
$update_check_nexus = NexusUtil::updateCheckNexus();
$cache->store('update_check_nexus', $update_check_nexus, 3600);

# As of now this is the first release of upgrades, there's nothing
# unlink('custom/templates/Nexus/...');
