{include file='header.tpl'}
{include file='navbar.tpl'}

<h2 class="ui header">
    {$STORE} &raquo; {$ACTIVE_CATEGORY}
</h2>

<div class="ui stackable grid">
    <div class="ui centered row">
        <div class="ui {if count($WIDGETS)}ten wide tablet twelve wide computer{else}sixteen wide{/if} column">
            <div class="ui padded segment">
                <div class="ui top attached menu">
                    <a class="item" href="{$HOME_URL}">
                        {$HOME}
                    </a>
                    {foreach from=$CATEGORIES item=category}
                        {if isset($category.subcategories) && count($category.subcategories)}
                            <div class="ui pointing dropdown link item">
                                <span class="text">{$category.title}</span>
                                <i class="dropdown icon"></i>
                                <div class="menu">
                                    <a class="{if $category.active}active {/if}item" href="{$category.url}">{$category.title}</a>
                                    {foreach from=$category.subcategories item=subcategory}
                                        <a class="{if $subcategory.active}active {/if}item" href="{$subcategory.url}">{$subcategory.title}</a>
                                    {/foreach}
                                </div>
                            </div>
                        {else}
                            <a class="{if $category.active}active {/if}item" href="{$category.url}">
                                {$category.title}
                            </a>
                        {/if}
                    {/foreach}
                </div>
                <div class="ui bottom attached segment">
                    {if isset($NO_PACKAGES)}
                        <div class="ui icon message">
                            <i class="info icon"></i>
                            <div class="content">
                                <p>{$NO_PACKAGES}</p>
                            </div>
                        </div>
                    {else}
                        <div class="ui centered stackable grid">
                            {foreach from=$PACKAGES item=package}
                                <div class="four wide column">
                                    <div class="ui card" style="height: 100%">
                                        {if $package.image}
                                            <div class="image">
                                                {if $package.sale_active}
                                                    <span class="ui right ribbon red label">
                                                        {$SALE}
                                                    </span>
                                                {/if}
                                                <img src="{$package.image}" alt="{$package.name}">
                                            </div>
                                        {/if}
                                        <div class="center aligned content">
                                            <span class="header">{$package.name}</span>
                                            <div class="ui divider"></div>
                                            {if $package.sale_active}
                                                <span style="color: #dc3545;text-decoration:line-through;">{$CURRENCY}{$package.price}</span>
                                            {/if}
                                            {$CURRENCY}{$package.real_price}
                                        </div>
                                        <div class="ui bottom attached blue button" onClick="$('#modal{$package.id}').modal('show');">
                                            {$BUY} &raquo;
                                        </div>
                                    </div>
                                </div>

                                <div class="ui small modal" id="modal{$package.id}">
                                    <div class="header">
                                        {$package.name} | {$CURRENCY}{$package.real_price}
                                    </div>
                                    <div class="{if $package.image}image {/if}content">
                                        {if $package.image}
                                            <div class="ui small image">
                                                <img src="{$package.image}" alt="{$package.name}">
                                            </div>
                                        {/if}
                                        <div class="description forum_post">
                                            {$package.description}
                                        </div>
                                    </div>
                                    <div class="actions">
                                        <div class="ui red deny button">
                                            {$CLOSE}
                                        </div>
                                        <a class="ui positive right labeled icon button" target="_blank" rel="nofollow noopener" href="{$package.link}">
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
        {if count($WIDGETS)}
            <div class="ui six wide tablet four wide computer column">
                {foreach from=$WIDGETS item=widget}
                    {$widget}
                {/foreach}
            </div>
        {/if}
    </div>
</div>

{include file='footer.tpl'}