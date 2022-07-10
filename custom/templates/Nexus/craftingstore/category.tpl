{include file='header.tpl'}
{include file='navbar.tpl'}

<h2 class="ui header">
    {$STORE} &raquo; {$ACTIVE_CATEGORY}
</h2>

<div class="ui stackable grid">
    <div class="ui centered row">
        <div class="ui sixteen wide column">
            <div class="ui padded segment">

                {include file='craftingstore/parts/nav.tpl'}

                <div class="ui bottom attached segment">
                    {if isset($NO_PACKAGES)}
                        <div class="ui message icon announcement"
                            style="border-top-style: solid; border-top-color: #0275d8;">
                            <i class="info icon" style="color: #0275d8; margin-left: 0.5rem;"></i>
                            <div class="content">
                                {$NO_PACKAGES}
                            </div>
                        </div>
                    {else}
                        <div class="ui centered stackable grid">
                            {foreach from=$PACKAGES item=package}
                                <div class="four wide column">
                                    <div class="ui card" style="height: 100%">
                                        {if $package.image}
                                            <div class="image">
                                                <img src="{$package.image}" alt="{$package.name}">
                                            </div>
                                        {/if}
                                        <div class="center aligned content">
                                            <span class="header">{$package.name}</span>
                                            <div class="ui divider"></div>
                                            {$package.price} {$CURRENCY}
                                        </div>
                                        <div class="ui bottom attached blue button"
                                            onClick="$('#modal{$package.id}').modal('show');">
                                            {$BUY} &raquo;
                                        </div>
                                    </div>
                                </div>

                                <div class="ui small modal" id="modal{$package.id}">
                                    <div class="header">
                                        {$package.name} | {$package.price} {$CURRENCY}
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
                                        <a class="ui positive right labeled icon button" target="_blank" rel="nofollow noopener"
                                            href="http://{$STORE_URL}/package/{$package.id}">
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
    </div>
</div>

{include file='footer.tpl'}