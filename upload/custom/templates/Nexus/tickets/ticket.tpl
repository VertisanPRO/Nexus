{include file='header.tpl'}
{include file='navbar.tpl'}
<style>
    .scale-in-center{ -webkit-animation:scale-in-center .5s cubic-bezier(.25,.46,.45,.94) both;animation:scale-in-center .5s cubic-bezier(.25,.46,.45,.94) both }
    @-webkit-keyframes scale-in-center{ 0% { -webkit-transform:scale(0);transform:scale(0);opacity:1 } 100% { -webkit-transform:scale(1);transform:scale(1);opacity:1 } }@keyframes scale-in-center{ 0% { -webkit-transform:scale(0);transform:scale(0);opacity:1 } 100% { -webkit-transform:scale(1);transform:scale(1);opacity:1 } }
    .status-icon{ border-radius: 100%;
        margin-top: 0.15rem;
        margin-right: 0.2rem;
        width: 2rem;
        font-size: 1.25rem;
        height: 2rem;
        line-height: 1.65;
        text-align: center;
    }
    label .status-icon {
        width: 1.5rem;
        font-size: 0.95rem;
        height: 1.5rem;
        line-height: 1.55;
    }
</style>

<!-- Core page -->
<div class="ui container" id="ticket">
    <div style="display:none;position: absolute;top: 0;left: 0;width: 100%;height: 100%;background: #1e7e34;z-index:500000;"></div>
    <h2 class="ui header">
        <div class="topic title">
            <status></status>
            {$TICKET[0]->title}
            {if count($PERMISSIONS)}
                <div class="res right floated">
                    <div class="ui top right pointing dropdown small primary button">
                        <span class="text">{$ACTIONS}</span>
                        <i class="dropdown icon"></i>
                        <div class="menu" tabindex="-1">
                            {if isset($PERMISSIONS['categories']) && $PERMISSIONS['categories'] === true}
                                <a class="item" id="categories" data-toggle="modal" data-target="#modal-edit-categ">{$EDIT_CATEG}</a>
                            {/if}
                            {if isset($PERMISSIONS['status']) && $PERMISSIONS['status'] === true}
                                <a class="item" id="status" data-toggle="modal" data-target="#modal-edit-status">{$EDIT_STATUS}</a>
                            {/if}
                            {if isset($PERMISSIONS['assign']) && $PERMISSIONS['assign'] === true}
                                <a class="item refreshAssign" id="assign" data-toggle="modal" data-target="#modal-assign">{$ASSIGN_TICKET}</a>
                            {/if}
                            {if isset($PERMISSIONS['delete']) && $PERMISSIONS['delete'] === true}
                                <div class="divider"></div>
                                <a class="item" id="delete" data-toggle="modal" data-target="#modal-delete">{$DELETE_TICKET}</a>
                            {/if}
                            <!-- <a class="item" data-toggle="modal" data-target="#modal-delete">Delete Topic</a> -->
                        </div>
                    </div>
                </div>
            {/if}
        </div>
        <div class="sub header">
            {$STARTED_BY} <a href="/profile/{$TICKET[0]->username}/" style="">{$TICKET[0]->username}</a>
        </div>
    </h2>
    <!-- VueJS Assigned categories -->
    <assigned-categs></assigned-categs>
    <!-- VueJS Answers -->
    <answers></answers>
    <!-- Reply -->
    <reply></reply>

    {include file='./ticket_include_modals.tpl'}

</div>

{include file='footer.tpl'}
{include file='./ticket_include_vue.tpl'}
{include file='./ticket_include_js.tpl'}