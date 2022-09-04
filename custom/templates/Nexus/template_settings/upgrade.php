<?php

return new class extends UpgradeScriptNexus {

    public function run(): void {
        $this->deleteFilesInPath('custom/templates/Nexus/Nexus/status/', ['*'], 'true');
        $this->deleteFiles([
            'custom/templates/Nexus/template_settings/tpl/sittings-menu.tpl',
            'custom/templates/Nexus/Nexus/status'
        ]);

        $this->databaseQueries([
            function (DB $db) {
                $db->query('DELETE FROM nl2_nexus_settings WHERE donateEmail');
                $db->query('DELETE FROM nl2_nexus_settings WHERE donateFirstAmount');
                $db->query('DELETE FROM nl2_nexus_settings WHERE donateSecondAmount');
                $db->query('DELETE FROM nl2_nexus_settings WHERE donateThirdAmount');
                $db->query('DELETE FROM nl2_nexus_settings WHERE messageTitle');
                $db->query('DELETE FROM nl2_nexus_settings WHERE messageText');
                $db->query('DELETE FROM nl2_nexus_settings WHERE messageIcon');
            }
        ]);
    }
};
