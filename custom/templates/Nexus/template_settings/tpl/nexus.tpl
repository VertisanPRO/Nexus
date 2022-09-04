<!-- Page Content -->
<div class="row">
    <div class="col-sm-3">
        {include file="{$TPL_PATH}navigation.tpl"}
    </div>

    <div class="col-sm-9">
        <div class="tab-content" id="v-pills-tabContent">
            <div class="tab-pane fade {if empty($TPL_NAME_SESSION) or $TPL_NAME_SESSION eq 'options'}show active{/if}"
                id="v-pills-options" role="tabpanel" aria-labelledby="v-pills-options-tab">
                {include file="{$TPL_PATH}options.tpl"}
            </div>
            <div class="tab-pane fade {if $TPL_NAME_SESSION eq 'colors'}show active{/if}" id="v-pills-colors"
                role="tabpanel" aria-labelledby="v-pills-colors-tab">
                {include file="{$TPL_PATH}colors.tpl"}
            </div>
            <div class="tab-pane fade {if $TPL_NAME_SESSION eq 'navbar'}show active{/if}" id="v-pills-navbar"
                role="tabpanel" aria-labelledby="v-pills-navbar-tab">
                {include file="{$TPL_PATH}navbar.tpl"}
            </div>
            <div class="tab-pane fade {if $TPL_NAME_SESSION eq 'connections'}show active{/if}" id="v-pills-connections"
                role="tabpanel" aria-labelledby="v-pills-connections-tab">
                {include file="{$TPL_PATH}connections.tpl"}
            </div>
            <div class="tab-pane fade {if $TPL_NAME_SESSION eq 'preloader'}show active{/if}" id="v-pills-preloader"
                role="tabpanel" aria-labelledby="v-pills-preloader-tab">
                {include file="{$TPL_PATH}preloader.tpl"}
            </div>
            <div class="tab-pane fade {if $TPL_NAME_SESSION eq 'addons'}show active{/if}" id="v-pills-addons"
                role="tabpanel" aria-labelledby="v-pills-addons-tab">
                {include file="{$TPL_PATH}addons.tpl"}
            </div>
            <div class="tab-pane fade {if $TPL_NAME_SESSION eq 'widgets'}show active{/if}" id="v-pills-widgets"
                role="tabpanel" aria-labelledby="v-pills-widgets-tab">
                {include file="{$TPL_PATH}widgets.tpl"}
            </div>
            <div class="tab-pane fade {if $TPL_NAME_SESSION eq 'embed'}show active{/if}" id="v-pills-embed"
                role="tabpanel" aria-labelledby="v-pills-embed-tab">
                {include file="{$TPL_PATH}embed.tpl"}
            </div>
            <div class="tab-pane fade {if $TPL_NAME_SESSION eq 'updates'}show active{/if}" id="v-pills-updates"
                role="tabpanel" aria-labelledby="v-pills-updates-tab">
                {include file="{$TPL_PATH}updates.tpl"}
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">{$WARNING}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                {$INSTALL_CONFIRM}
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">{$CANCEL}</button>
                <a href="{$UPGRADE_LINK}" class="btn btn-primary">{$UPDATE}</a>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function showConfirmModal() {
        $('#confirmModal').modal().show();
    }
</script>