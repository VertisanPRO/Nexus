<div class="ui top attached menu">
    <a class="active item" href="{$HOME_URL}">
        {$HOME}
    </a>
    {foreach from=$CATEGORIES item=category}
        {if $category.subCategories != null && count($category.subCategories)}
            <div class="ui pointing dropdown link item">
                <span class="text">{$category.name}</span>
                <i class="dropdown icon"></i>
                <div class="menu">
                    {foreach from=$category.subCategories item=subcategory}
                        <a class="item" href="{$subcategory.link}">{$subcategory.name}</a>
                    {/foreach}
                </div>
            </div>
        {else}
            <a class="item" href="{$category.link}">{$category.name}</a>
        {/if}
    {/foreach}
</div>
