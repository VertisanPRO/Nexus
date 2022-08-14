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

                <h1 style="display:inline">{$STORE}</h1>
                {include file='store/navbar.tpl'}

                {$CHECKOUT_COMPLETE_CONTENT}
            </div>
        </div>

        {if count($WIDGETS_RIGHT)}
            {if isset($LOGGED_IN_USER) && isset($SHOW_CREDITS_AMOUNT)}
                <div class="ui fluid card" id="widget-store-account">
                    <div class="content">
                        <h4 class="ui header">{$ACCOUNT}</h4>
                        <div class="description">
                            <div class="ui list">
                                <div class="item">
                                    <span class="text">{$CREDITS}</span>
                                    <div class="description right floated"><b>{$CURRENCY_SYMBOL}{$CREDITS_VALUE} {$CURRENCY}</b>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            {/if}
            <div class="ui six wide tablet four wide computer column">
                {foreach from=$WIDGETS_RIGHT item=widget}
                    {$widget}
                {/foreach}
            </div>
        {/if}

    </div>
</div>

{include file='footer.tpl'}