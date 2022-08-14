<div class="ui fluid card" id="widget-featured-package">
    <div class="content">
        <a class="ui ribbon label" style="margin-bottom: 10px;"><i class="fa-solid fa-cart-plus"></i>
            {$LATEST_PURCHASES}</a>
        {if isset($LATEST_PURCHASES_LIST) && count($LATEST_PURCHASES_LIST)}
            {foreach from=$LATEST_PURCHASES_LIST item=purchase name=purchaseLoop}
                <div class="ui relaxed list">
                    <div class="item">
                        <img class="ui mini circular image" src="{$purchase.avatar}" alt="{$purchase.username}">
                        <div class="content">
                            <a class="header" {if $purchase.user_id}href="{$purchase.profile}"
                                data-poload="{$USER_INFO_URL}{$purchase.user_id}" {/if}
                                style="{$purchase.style|replace:';':''}!important;margin-bottom:2px">{$purchase.username}</a>
                            {$purchase.currency_symbol}{$purchase.price} {$purchase.currency}
                        </div>
                    </div>
                </div>
                {if not $smarty.foreach.purchaseLoop.last}<div class="ui divider"></div>{/if}
            {/foreach}
        {else}
            <div class="ui divider"></div>
            {$NO_PURCHASES}
        {/if}
    </div>
</div>