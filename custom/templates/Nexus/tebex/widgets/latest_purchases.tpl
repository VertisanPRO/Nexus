<div class="ui fluid card" id="widget-featured-package">
    <div class="content">
        <h4 class="ui header">{$LATEST_PURCHASES}</h4>
        {if count($PURCHASES)}
            {foreach from=$PURCHASES item=purchase name=purchaseLoop}
                <div class="ui relaxed list">
                    <div class="item">
                        <img class="ui mini circular image" src="{$purchase.avatar}" alt="{$purchase.username}">
                        <div class="content">
                            <a class="header" {if $purchase.user_id}href="{$purchase.profile}" data-poload="{$USER_INFO_URL}{$purchase.user_id}"{/if} style="{$purchase.style|replace:';':''}!important;margin-bottom:2px">{$purchase.username}</a>
                            {$purchase.currency_symbol}{$purchase.price}
                        </div>
                    </div>
                </div>
                {if not $smarty.foreach.purchaseLoop.last}<div class="ui divider"></div>{/if}
            {/foreach}
        {/if}
    </div>
</div>