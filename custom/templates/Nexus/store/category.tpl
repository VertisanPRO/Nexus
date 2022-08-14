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

                {if isset($SUCCESS)}
                    <div class="ui message icon announcement" style="border-top-style: solid; border-top-color: #5cb85c;">
                        <i class="check icon" style="color: #5cb85c;"></i>
                        <div class="content">
                            {$SUCCESS}
                        </div>
                    </div>
                {/if}

                {if isset($ERRORS)}
                    <div class="ui message icon announcement" style="border-top-style: solid; border-top-color: #d9534f;">
                        <i class="x icon" style="color: #d9534f;"></i>
                        <div class="content">
                            <ul class="list">
                                {foreach from=$ERRORS item=error}
                                    <li>{$error}</li>
                                {/foreach}
                            </ul>
                        </div>
                    </div>
                {/if}

                <div class="ui bottom attached segment">
                    {$CONTENT}

                    {if isset($NO_PRODUCTS)}
                        <div class="ui message icon announcement"
                            style="border-top-style: solid; border-top-color: #0275d8;">
                            <i class="info icon" style="color: #0275d8;"></i>
                            <div class="content">
                                {$NO_PRODUCTS}
                            </div>
                        </div>
                    {else}
                        <div class="ui centered stackable grid">
                            {foreach from=$PRODUCTS item=product}
                                <div class="four wide column">
                                    <div class="ui card" style="height: 100%">
                                        {if $product.image}
                                            <div class="image">
                                                {if $product.sale_active}
                                                    <span class="ui right ribbon red label">
                                                        {$SALE}
                                                    </span>
                                                {/if}
                                                <img src="{$product.image}" alt="{$product.name}">
                                            </div>
                                        {/if}

                                        <div class="center aligned content">
                                            <span class="header">{$product.name}</span>
                                            <div class="ui divider"></div>
                                            {if $product.sale_active}
                                                <span
                                                    style="color: #dc3545;text-decoration:line-through;">{$CURRENCY_SYMBOL}{$product.price}{$CURRENCY}</span>
                                            {/if}
                                            {$CURRENCY_SYMBOL}{$product.real_price} {$CURRENCY}
                                        </div>
                                        <div class="ui bottom attached blue button"
                                            onClick="$('#modal{$product.id}').modal('show');">
                                            {$BUY} &raquo;
                                        </div>
                                    </div>
                                </div>

                                <div class="ui small modal" id="modal{$product.id}">
                                    <div class="header">
                                        {$product.name} | {$CURRENCY_SYMBOL}{$product.price} {$CURRENCY}
                                    </div>
                                    <div class="{if $product.image}image {/if}content">
                                        {if $product.image}
                                            <div class="ui small image">
                                                <img src="{$product.image}" alt="{$product.name}">
                                            </div>
                                        {/if}
                                        <div class="description forum_post">
                                            {$product.description}
                                        </div>
                                    </div>
                                    <div class="actions">
                                        <div class="ui red deny button">
                                            {$CLOSE}
                                        </div>
                                        <a class="ui positive right labeled icon button" href="{$product.link}">
                                            {$BUY}
                                            <i class="shopping cart icon"></i>
                                        </a>
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                    {/if}
                </div>

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