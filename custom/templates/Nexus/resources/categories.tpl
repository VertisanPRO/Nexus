<div class="ui fluid vertical menu">
    <div class="header item">{$CATEGORIES_TITLE}</div>
    {foreach from=$CATEGORIES item=item}
        <a class="item{if isset($item.active)} active{/if}" href="{$item.link}">{$item.name} ({$item.count})</a>
    {/foreach}
</div>
