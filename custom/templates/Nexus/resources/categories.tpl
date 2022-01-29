<div class="ui fluid vertical menu">
    <div class="header item">
        <h3>{$CATEGORIES_TITLE}</h3>
    </div>
    <div class="ui divider" style="margin-top: 0"></div>
    {foreach from=$CATEGORIES item=item}
        <a class="item{if isset($item.active)} active{/if}" href="{$item.link}">{$item.name} ({$item.count})</a>
    {/foreach}
</div>
