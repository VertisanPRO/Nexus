<div class="ui fluid card" id="widget-new-resources">
    <div class="content">
        <a class="ui ribbon label" style="margin-bottom: 10px;"><i class="fa-solid fa-star"></i>
            {$TOP_RESOURCES_TILTE}</a>
        <div class="description">
            {if count($TOP_RESOURCES)}
                {foreach from=$TOP_RESOURCES item=resource}
                    <div class="ui relaxed list">
                        <div class="item">
                            <img class="ui mini circular image" src="{$resource.icon}" />
                            <div class="content">
                                <a class="header" href="{$resource.link}" data-toggle="popup"
                                    data-position="top left">{$resource.name}</a>
                                <div class="ui wide popup">
                                    <h4 class="ui header">{$resource.short_description}</h4>
                                    {$BY|capitalize} <a href="{$resource.creator_profile}"
                                        style="{$resource.creator_style}">{$resource.creator_username}</a> |
                                    {$resource.released_full}
                                </div>
                                <a href="{$resource.creator_profile}" style="{$resource.creator_style}"
                                    data-poload="{$USER_INFO_URL}{$resource.creator_id}">{$resource.creator_username}</a>
                                &middot;
                                <div class="star-rating view" style="display:inline;">
                                    <span class="far fa-star" data-rating="1" style="color:gold;"></span>
                                    <span class="far fa-star" data-rating="2" style="color:gold"></span>
                                    <span class="far fa-star" data-rating="3" style="color:gold;"></span>
                                    <span class="far fa-star" data-rating="4" style="color:gold;"></span>
                                    <span class="far fa-star" data-rating="5" style="color:gold;"></span>
                                    <input type="hidden" name="rating" class="rating-value" value="{$resource.rating}">
                                </div>
                            </div>
                        </div>
                    </div>
                {/foreach}
            {else}
                {$NO_TOP_RESOURCES}
            {/if}
        </div>
    </div>
</div>