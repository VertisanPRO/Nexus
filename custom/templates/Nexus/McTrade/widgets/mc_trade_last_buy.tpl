<div class="ui fluid card" id="widget-latest-logs">
    <div class="content">
        <a class="ui ribbon label" style="margin-bottom: 10px;"><i class="fa-solid fa-cart-plus"></i>
            {$LAST_BUY_LABEL}</a>
        <div class="description">
            {foreach from=$MC_LOGS_LIST item=log}
                <div class="ui relaxed list">
                    <div class="item">
                        <img class="ui mini circular image" src="{$log.avatar}" alt="{$log.username}">
                        <div class="content">
                            <a class="header" data-poload="/queries/user/?id={$log.id}"
                                href="{$log.profile}">{$log.username}</a>
                            <span class="meta">
                                {$log.product_name}
                            </span>
                        </div>
                    </div>
                </div>
            {/foreach}
        </div>
    </div>
</div>