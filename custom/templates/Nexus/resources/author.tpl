{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="ui container">
    <div class="ui padded segment">
        <div class="ui stackable grid">
            <div class="ui row">
                <div class="twelve wide column">
                    <h1 style="display:inline">{$VIEWING_RESOURCES_BY}</h1>
                </div>
                <div class="four wide column">
                    <span class="res right floated">
                      <a href="{$BACK_LINK}" class="ui button">{$BACK}</a>
                        {if isset($NEW_RESOURCE)}
                            <a href="{$NEW_RESOURCE_LINK}" class="ui blue button">{$NEW_RESOURCE}</a>
                        {/if}
				    </span>
                </div>
            </div>

            <div class="ui divider"></div>

            <div class="ui row">
                <div class="twelve wide column">
                    {if $LATEST_RESOURCES}
                        <table class="ui fixed single line selectable unstackable small padded res table">
                            <thead>
                            <tr>
                                <th class="eight wide"><h4>{$RESOURCE}</h4></th>
                                <th class="three wide"><h4>{$STATS}</h4></th>
                                <th class="five wide"><h4>{$AUTHOR}</h4></th>
                            </tr>
                            </thead>
                            <tbody>
                            {foreach from=$LATEST_RESOURCES item=resource}
                                <tr>
                                    <td>
                                        <a href="{$resource.link}">{$resource.name}</a> <small>{$resource.version}</small><br />
                                        {$resource.description}<br />
                                        <small>{$resource.category}</small>
                                    </td>
                                    <td>
                                        <div class="star-rating view">
                                            <span class="far fa-star" data-rating="1" style="color:gold;"></span>
                                            <span class="far fa-star" data-rating="2" style="color:gold"></span>
                                            <span class="far fa-star" data-rating="3" style="color:gold;"></span>
                                            <span class="far fa-star" data-rating="4" style="color:gold;"></span>
                                            <span class="far fa-star" data-rating="5" style="color:gold;"></span>
                                            <input type="hidden" name="rating" class="rating-value" value="{$resource.rating}">
                                        </div>
                                        {$resource.views}<br />
                                        {$resource.downloads}
                                    </td>
                                    <td>
                                        <h5 class="ui image header">
                                            <img class="ui mini circular image" style="max-height:30px; max-width:30px;" src="{$resource.author_avatar}" alt="{$resource.author}">
                                            <div class="content">
                                                <a href="{$resource.author_profile}" style="{$resource.author_style}">{$resource.author}</a>
                                                <div class="sub header"><span data-toggle="tooltip" data-content="{$resource.updated_full}">{$resource.updated}</span></div>
                                            </div>
                                        </h5>
                                    </td>
                                </tr>
                            {/foreach}
                            </tbody>
                        </table>

                        {$PAGINATION}

                    {else}
                        {$NO_RESOURCES}
                    {/if}
                </div>
                <div class="four wide column">
                    {include file='resources/categories.tpl'}
                </div>
            </div>
        </div>
    </div>
</div>

{include file='footer.tpl'}