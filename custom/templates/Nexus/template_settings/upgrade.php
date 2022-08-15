<?php

# As of now this is the first release of upgrades, there's nothing
# unlink('custom/templates/Nexus/...');

$cache->setCache('update_check_nexus');
$update_check_nexus = NexusUtil::updateCheckNexus();
$cache->store('update_check_nexus', $update_check_nexus, 3600);