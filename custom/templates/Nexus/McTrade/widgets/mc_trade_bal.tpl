<div class="ui fluid card" id="widget-statistics">
    <div class="ui content">
        <a href="{$MC_ACCOUNT_LINK}" class="ui ribbon label" style="margin-bottom: 10px;"><i
                class="fa-solid fa-user-tie"></i>
            {$WG_TITLE}</a>
        <div class="ui description">
            <div class="ui list">
                {if $VALIDATE != 1}
                    <div class="item">
                        <span class="text">{$MC_ACCOUNT}</span>
                        <div class="description right floated"><b>{$MC_NAME}</b></div>
                    </div>
                    <div class="item">
                        <span class="text">{$BALANCE}</span>
                        <div class="description right floated"><b>{$BAL_VALUE} {$CURRENCY}</b></div>
                    </div>
                    <div class="text-center">
                        <a href="{$MAKE_BALANCE_LINK}" class="ui positive button" role="button"
                            style="width: 100%;">{$MAKE_BALANCE}</a>
                    </div>
                {else}
                    <div class="item">
                        <span class="text-center">{$ACTIVATE_CONTENT}</span>
                        <div class="description right floated"><b>{$USERS_REGISTERED_VALUE}</b></div>
                    </div>
                    <div class="item">
                        <span class="text">{$LATEST_MEMBER}</span>
                        <div class="text-center">
                            <a href="{$VALIDATE_URL}" class="ui positive button" role="button"
                                aria-pressed="true">{$ACTIVATE_ACCOUNT}</a>
                        </div>
                    </div>
                {/if}
            </div>
        </div>
    </div>
</div>