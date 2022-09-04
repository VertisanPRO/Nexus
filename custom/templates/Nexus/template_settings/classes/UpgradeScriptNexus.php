<?php
abstract class UpgradeScriptNexus {

    protected Cache $_cache;

    public function __construct() {
        $this->_cache = new Cache(
            ['name' => 'nexus', 'extension' => '.cache', 'path' => ROOT_PATH . '/cache/']
        );
    }

    public static function get(): ?UpgradeScriptNexus {
        $path = ROOT_PATH . '/custom/templates/Nexus/template_settings/upgrade.php';

        if (!file_exists($path)) {
            return null;
        }

        return require $path;
    }

    abstract public function run(): void;

    protected function log(string $message): void {
        echo $message . '<br/>';
        ErrorHandler::logWarning('UPGRADING EXCEPTION: ' . $message);
    }

    protected function databaseQuery(Closure $query) {
        return $this->databaseQueries([$query])[0];
    }

    protected function databaseQueries(array $queries): array {
        $results = [];

        foreach ($queries as $query) {
            try {
                $results[] = $query(DB::getInstance());
            } catch (Exception $exception) {
                $results[] = null;
                $this->log($exception->getMessage());
            }
        }

        return $results;
    }

    protected function deleteFilesInPath(string $path, array $files, bool $recursive = false): void {
        if (in_array('*', $files)) {
            $files = scandir($path);
        }

        foreach ($files as $file) {

            if ($file[0] == '.') {
                continue;
            }

            if (file_exists($newFile = implode(DIRECTORY_SEPARATOR, [$path, $file]))) {

                if (is_dir($newFile)) {
                    if ($recursive) {
                        $this->deleteFilesInPath($newFile, ['*'], true);
                        $this->deleteFiles($newFile);
                    }
                } else {
                    $this->deleteFiles($newFile);
                }

            } else {
                $this->log("'$newFile' does not exist, cannot delete.");
            }

        }
    }

    protected function deleteFiles($paths): void {
        foreach ((array) $paths as $path) {
            $path = ROOT_PATH . '/' . $path;
            if (!file_exists($path)) {
                $this->log("'$path' does not exist, cannot delete.");
                continue;
            }

            if (!is_writable($path)) {
                $this->log("'$path' is not writable, cannot delete.");
                return;
            }

            if (is_dir($path) && !rmdir($path)) {
                $this->log("Could not delete '$path', is it empty?");
            }

            unlink($path);
        }
    }
}
