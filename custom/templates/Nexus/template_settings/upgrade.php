<?php

DB::getInstance()->query('DELETE FROM nl2_nexus_settings WHERE donateEmail');
DB::getInstance()->query('DELETE FROM nl2_nexus_settings WHERE donateFirstAmount');
DB::getInstance()->query('DELETE FROM nl2_nexus_settings WHERE donateSecondAmount');
DB::getInstance()->query('DELETE FROM nl2_nexus_settings WHERE donateThirdAmount');
DB::getInstance()->query('DELETE FROM nl2_nexus_settings WHERE messageTitle');
DB::getInstance()->query('DELETE FROM nl2_nexus_settings WHERE messageText');
DB::getInstance()->query('DELETE FROM nl2_nexus_settings WHERE messageIcon');