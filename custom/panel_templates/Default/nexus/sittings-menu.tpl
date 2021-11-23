<div class="card mb-3">
    <h3 class="card-header mb-3 text-center">{$NAVIGATION}</h3>
    <div class="card-body">
        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <a class="nav-link {if !isset($TPL_NAME_SESSION) or $TPL_NAME_SESSION == 'options'}active{/if}" id="v-pills-options-tab" data-toggle="pill" href="#v-pills-options" role="tab" aria-controls="v-pills-options" aria-selected="true">
                <i class="fas fa-cog"></i> {$OPTIONS_PAGE}
            </a>

            <a class="nav-link {if $TPL_NAME_SESSION == 'colors'}active{/if}" id="v-pills-colors-tab" data-toggle="pill" href="#v-pills-colors" role="tab" aria-controls="v-pills-colors" aria-selected="false">
                <i class="fas fa-paint-brush"></i> {$COLORS_PAGE}
            </a>

            <a class="nav-link {if $TPL_NAME_SESSION == 'navbar'}active{/if}" id="v-pills-navbar-tab" data-toggle="pill" href="#v-pills-navbar" role="tab" aria-controls="v-pills-navbar" aria-selected="false">
                <i class="fas fa-compass"></i> {$NAVBAR_PAGE}
            </a>

            <a class="nav-link {if $TPL_NAME_SESSION == 'connections'}active{/if}" id="v-pills-connections-tab" data-toggle="pill" href="#v-pills-connections" role="tab" aria-controls="v-pills-connections" aria-selected="false">
                <i class="fas fa-signal"></i> {$CONNECTIONS_PAGE}
            </a>

            <a class="nav-link {if $TPL_NAME_SESSION == 'advanced'}active{/if}" id="v-pills-advanced-tab" data-toggle="pill" href="#v-pills-advanced" role="tab" aria-controls="v-pills-advanced" aria-selected="false">
                <i class="fas fa-cogs"></i> {$ADVANCED_PAGE}
            </a>

            <a class="nav-link {if $TPL_NAME_SESSION == 'arc'}active{/if}" id="v-pills-arc-tab" data-toggle="pill" href="#v-pills-arc" role="tab" aria-controls="v-pills-arc" aria-selected="false">
                <i class="fas fa-dot-circle"></i> {$ARC_PAGE}
            </a>

            <a class="nav-link {if $TPL_NAME_SESSION == 'widgets'}active{/if}" id="v-pills-widgets-tab" data-toggle="pill" href="#v-pills-widgets" role="tab" aria-controls="v-pills-widgets" aria-selected="false">
                <i class="fas fa-th-large"></i> {$WIDGETS_PAGE}
            </a>

            <a class="nav-link {if $TPL_NAME_SESSION == 'embed'}active{/if}" id="v-pills-embed-tab" data-toggle="pill" href="#v-pills-embed" role="tab" aria-controls="v-pills-embed" aria-selected="false">
                <i class="fas fa-link"></i> {$EMBED_PAGE}
            </a>

            <a class="nav-link {if $TPL_NAME_SESSION == 'update'}active{/if}" id="v-pills-update-tab" data-toggle="pill" href="#v-pills-update" role="tab" aria-controls="v-pills-update" aria-selected="false">
                <i class="fas fa-cloud-download-alt"></i> {$UPDATES_PAGE}
            </a>

            <a class="nav-link" href="https://resourcemc.net/discord" target="_blank"><i class="fas fa-life-ring"></i> {$SUPPORT_PAGE}</a>

            <style>
                .nav-link {
                    color: #979797;
                }
            </style>
        </div>
    </div>
</div>
