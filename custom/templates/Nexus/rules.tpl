{include file='header.tpl'}
{include file='navbar.tpl'}
<h2 class="ui header">{$RULES}</h2>
<div class="ui stackable grid">
    <div class="ui row">

        {if count($WIDGETS_LEFT)}
            <div class="ui six wide tablet four wide computer column">
                {foreach from=$WIDGETS_LEFT item=widget}
                    {$widget}
                {/foreach}
            </div>
        {/if}

        <div
            class="ui {if count($WIDGETS_LEFT) && count($WIDGETS_RIGHT) }four wide tablet eight wide computer{elseif count($WIDGETS_LEFT) || count($WIDGETS_RIGHT)}ten wide tablet twelve wide computer{else}sixteen wide{/if} column">
            <div class="ui top attached tabular menu">
                <a class="item active" data-tab="home"><i class="fas fa-gavel"></i> {$RULES}</a>
                {foreach from=$CATAGORIES item=catagory}
                    <a class="item"
                        data-tab="id-{$catagory.id}">{if isset($catagory.icon) && $catagory.icon|count_characters > 0}{$catagory.icon}
                        {/if}{$catagory.name}</a>
                {/foreach}
            </div>
            <div class="ui bottom attached tab segment active" data-tab="home" id="home">
                {$MESSAGE}
                {if !empty($BUTTONS)}<br />
                    <div style="text-align:center">
                        {foreach from=$BUTTONS item=button}
                            <a class="ui primary button" href="{$button.link}"
                                style="margin-left: 5px; margin-right: 5px">{$button.name}</a>
                        {/foreach}
                </div>{/if}
            </div>
            {foreach from=$CATAGORIES item=catagory}
                <div class="ui bottom attached tab segment" id="id-{$catagory.id}" data-tab="id-{$catagory.id}">
                    {$catagory.rules}</div>
            {/foreach}
        </div>

        {if count($WIDGETS_RIGHT)}
            <div class="ui six wide tablet four wide computer column">
                {foreach from=$WIDGETS_RIGHT item=widget}
                    {$widget}
                {/foreach}
            </div>
        {/if}

    </div>
</div>
{include file='footer.tpl'}