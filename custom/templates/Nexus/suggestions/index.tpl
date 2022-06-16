{include file='header.tpl'}
{include file='navbar.tpl'}
<div class="ui container">
    <div class="ui segment">
        <div class="ui stackable grid">
            <div class="ui centered row">
                <div class="ui ten wide tablet twelve wide computer column">
                    <h1 style="display:inline;">{$SUGGESTIONS}</h1><span class="right floated">
                        <div class="ui small dropdown primary button">
                            <span class="text">{$SORT_BY} {$SORT_BY_VALUE}</span> <i class="dropdown icon"></i>
                            <div class="menu">
                                <a rel="noopener nofollow" class="item" href="{$SORT_NEWEST_LINK}">{$NEWEST}</a>
                                <a rel="noopener nofollow" class="item"
                                    href="{$SORT_RECENT_ACTIVITY_LINK}">{$RECENT_ACTIVITY}</a>
                                <a rel="noopener nofollow" class="item" href="{$SORT_LIKES_LINK}">{$LIKES}</a>
                            </div>
                        </div>
                        <a class="ui small primary button" href="{$NEW_SUGGESTION_LINK}">{$NEW_SUGGESTION}</a>
                    </span>
                    <hr>

                    {if isset($SUGGESTIONS_LIST)}
                        <table class="ui fixed single line selectable unstackable small padded res table">
                            <thead>
                                <tr>
                                    <th class="eight wide">{$SUGGESTION_TITLE}</th>
                                    <th class="three wide">{$STATS}</th>
                                    <th class="five wide">{$LAST_REPLY}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$SUGGESTIONS_LIST item=suggestion}
                                    <tr>
                                        <td>
                                            <h5 class="ui header">
                                                <div class="content">
                                                    {$suggestion.status} <a href="{$suggestion.link}">{$suggestion.title}</a>
                                                    <div class="sub header">
                                                        <span data-toggle="tooltip"
                                                            data-content="{$suggestion.created}">{$suggestion.created_rough}</span>
                                                        {$BY} <a style="{$suggestion.author_style}"
                                                            href="{$suggestion.author_link}"
                                                            data-poload="{$USER_INFO_URL}{$suggestion.author_id}">{$suggestion.author_username}</a>
                                                    </div>
                                                </div>
                                            </h5>
                                        </td>

                                        <td>
                                            <strong>{$suggestion.likes}</strong> {$LIKES}<br />
                                            <strong>{$suggestion.dislikes}</strong> {$DISLIKES}
                                        </td>

                                        <td>
                                            <h5 class="ui header">
                                                <div class="content">
                                                    <div class="sub header">
                                                        <span data-toggle="tooltip"
                                                            data-content="{$suggestion.updated}">{$suggestion.updated_rough}</span></br>
                                                        {$BY} <a style="{$suggestion.updated_by_style}"
                                                            href="{$suggestion.updated_by_link}"
                                                            data-poload="{$USER_INFO_URL}{$suggestion.updated_by_id}">{$suggestion.updated_by_username}</a>
                                                    </div>
                                                </div>
                                            </h5>
                                        </td>
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>

                        {$PAGINATION}
                    {else}
                        {$NO_SUGGESTIONS}
                    {/if}

                </div>

                <div class="ui six wide tablet four wide computer column">
                    {include file='suggestions/search.tpl'}
                    {include file='suggestions/categories.tpl'}
                    {include file='suggestions/recent_activity.tpl'}
                </div>

            </div>
        </div>
    </div>
</div>

{include file='footer.tpl'}