<div class="ui floating labeled icon dropdown button review_filter">
    <i class="filter icon"></i>
    <span class="text">{$REVIEWS_FILTER}</span>
    <div class="menu">
        <div class="ui icon search input">
            <i class="search icon"></i>
            <input type="text" placeholder="{$REVIEWS_SEARCH_PLACEHOLDER}">
        </div>
        <div class="divider"></div>
        <div class="header">
            <i class="tags icon"></i>
            {$REVIEWS_BY_FILTER}
        </div>
        <div class="scrolling menu">
            <div class="item" id="reset" data-value="reset" style="font-weight: bold !important;">
                <i class="fas fa-broom"></i>
                <span style="margin-left: .7em !important;">
                    {$REVIEWS_RESET_PLACEHOLDER}
                </span>
            </div>
            {if {$TYPES|@count} >= 1}
                {foreach from=$TYPES item=type}
                    <div class="item" data-value="{$type->name_id}">
                        <div class="inner_container"
                            style="{if $COLOURED_TYPES == '1'}color: #{$type->color} !important;{/if} font-weight: bold !important;">
                            {$type->icon}
                            <span style="margin-left: .7em !important;">
                                {$type->title}
                            </span>
                        </div>
                    </div>
                {/foreach}
            {/if}
        </div>
    </div>
</div>

<div class="ui floating dropdown labeled search icon button review_sort">
    <i class="sort icon"></i>
    <span class="text" style="cursor: pointer">{$REVIEWS_SORT}</span>
    <div class="menu">
        <div class="item" data-value="date_desc">{$REVIEWS_DATE_NEWEST_PLACEHOLDER}</div>
        <div class="item" data-value="date_asc">{$REVIEWS_DATE_OLDEST_PLACEHOLDER}</div>
        <div class="item" data-value="rating_desc">{$REVIEWS_RATING_HIGHEST_PLACEHOLDER}</div>
        <div class="item" data-value="rating_asc">{$REVIEWS_RATING_LOWEST_PLACEHOLDER}</div>
        <div class="item" data-value="likes_desc">{$REVIEWS_LIKES_HIGHEST_PLACEHOLDER}</div>
        <div class="item" data-value="likes_asc">{$REVIEWS_LIKES_LOWEST_PLACEHOLDER}</div>
    </div>
</div>
<button class="ui right floated button {if $LOGGED != 'true'}disabled{/if}" id="feedback_button"><i class="plus icon"
style="margin: auto !important;"></i></button>