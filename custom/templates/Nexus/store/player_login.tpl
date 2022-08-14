{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="ui stackable grid">
    <div class="ui centered row">

        {if count($WIDGETS_LEFT)}
            <div class="ui six wide tablet four wide computer column">
                {foreach from=$WIDGETS_LEFT item=widget}
                    {$widget}
                {/foreach}
            </div>
        {/if}

        <div
            class="ui {if count($WIDGETS_LEFT) && count($WIDGETS_RIGHT) }four wide tablet eight wide computer{elseif count($WIDGETS_LEFT) || count($WIDGETS_RIGHT)}ten wide tablet twelve wide computer{else}sixteen wide{/if} column">
            <div class="ui segment">

                <h1 style="display:inline;">{$STORE} &raquo; {$ACTIVE_CATEGORY}</h1>
                {include file='store/navbar.tpl'}

                <div class="ui bottom attached segment">
                    {if isset($ERRORS)}
                        <div class="ui message icon announcement"
                            style="border-top-style: solid; border-top-color: #d9534f;">
                            <i class="x icon" style="color: #d9534f;"></i>
                            <div class="content">
                                {foreach from=$ERRORS item=error}
                                    {$error}<br />
                                {/foreach}
                            </div>
                        </div>
                    {/if}

                    <h3>{$PLEASE_ENTER_USERNAME}</h3>
                    <form class="ui form" action="" method="post">
                        <div class="field">
                            <input type="text" name="username" id="username" placeholder="{$PLEASE_ENTER_USERNAME}">
                        </div>
                        <div class="field">
                            <input type="hidden" name="token" value="{$TOKEN}">
                            <input type="hidden" name="type" value="store_login">
                            <input type="submit" class="ui primary button" value="{$CONTINUE} &raquo;">
                        </div>
                    </form>
                </div>

            </div>
        </div>

        {if count($WIDGETS_RIGHT)}
            <div class="ui six wide tablet four wide computer column">
                {if isset($LOGGED_IN_USER) && isset($SHOW_CREDITS_AMOUNT)}
                    <div class="ui fluid card" id="widget-store-account">
                        <div class="content">
                            <h4 class="ui header">{$ACCOUNT}</h4>
                            <div class="description">
                                <div class="ui list">
                                    <div class="item">
                                        <span class="text">{$CREDITS}</span>
                                        <div class="description right floated"><b>{$CURRENCY_SYMBOL}{$CREDITS_VALUE}
                                                {$CURRENCY}</b></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                {/if}
                {foreach from=$WIDGETS_RIGHT item=widget}
                    {$widget}
                {/foreach}
            </div>
        {/if}

    </div>
</div>

{include file='footer.tpl'}