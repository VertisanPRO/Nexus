{include file='header.tpl'} 
{include file='navbar.tpl'}
    <div class="ui grid">
    <div class="ui sixteen wide mobile twelve wide tablet twelve wide computer column">
        <div class="ui segments">
            <div class="ui segment header">
                <div class="ui grid">
                    <div class="eight wide column" style="margin: auto">
                        <div class="ui breadcrumb" style="margin-left: 1rem; margin-bottom: 1rem">
                            {if $PAGE_RESULT == 0}
                                <a href="{$WIKI_HOME_LINK}" class="section">{$WIKI}</a>
                            {elseif $PAGE_RESULT == 1}
                                {if $WP_TYPE}
                                    <a href="{$WIKI_HOME_LINK}" class="section">{$WIKI}</a>
                                    <div class="divider"> / </div>
                                    <a href="../{$WP_CATID}" class="active section">{$WP_PARENT}</a>
                                    <div class="divider"> / </div>
                                    <a href="{$WP_NAMEID}" class="active section">{$WP_TITLE}</a>
                                {else}
                                    <a href="{$WIKI_HOME_LINK}" class="section">{$WIKI}</a>
                                    <div class="divider"> / </div>
                                    <a href="{$WP_NAMEID}" class="active section">{$WP_TITLE}</a>
                                {/if}
                            {elseif $PAGE_RESULT == 2}
                            <a href="{$WIKI_HOME_LINK}" class="section">{$WIKI}</a>
                            {/if} 
                        </div>
                    </div>
                    {include file='wiki/widgets/search-box.tpl'}
                </div>
            </div>
            <div class="ui segment context" style="padding: 28px">
                {if $PAGE_RESULT == 0}
                    {$HOME_PAGE_CONTEXT}
                {elseif $PAGE_RESULT == 1}
                    {$WP_CONTEXT}
                    <hr style ="margin-top: 1rem;
                        margin-bottom: 1rem;
                        border: 0;
                        border-top: 1px solid rgba(0,0,0,.1);">

                        {if isset($LIKEABLE) && $LIKEABLE == '1'}
                            <div class="ui left labeled button" tabindex="0">
                                <a class="ui basic label" id="likes_counter" data-tooltip="{$WHO_LIKED}" data-variation="wide">
                                    {$WP_LIKES}
                                </a>
                                <div class="ui icon button {if isset($LIKED) && $LIKED == 'true'}primary{/if} {if !isset($LOGGED)}disabled{/if} {if isset($LIKED) && $LIKED == 'true'}unlike{elseif !isset($LIKED) || $LIKED == 'false'}like{/if}" id="like" aria-pressed="false" data-id="{$WP_NAMEID}">
                                    <i class="thumbs up icon"></i>
                                </div>   
                      
                            </div>
                        {/if}

                        <div class="ui left labeled button" tabindex="0">
                            <a class="ui basic label">
                                {$WP_VIEWS}
                            </a>
                            <div class="ui icon button">
                                <i class="eye icon"></i>
                            </div>
                        </div>

                        {if isset($PANEL)}
                            <a href="/panel/wiki/?action=edit&id={$WP_ID}" target="_blank">
                                <button class="ui primary button"><i class="edit icon"></i> Edit</button>
                            </a>
                        {/if}
                {elseif $PAGE_RESULT == 2}
                    {$WP_404_MESSAGE}
                {/if}
            </div>
        </div>
    </div>

    <div class="ui mini modal">
        <div class="header">{$ALL_LIKES} {$WP_TITLE}</div>
        <div class="list content">
            <div class="description">
                {if {$LIKES|@count} == 0}
                    {$NO_LIKES_MESSAGE}
                {elseif {$LIKES|@count} >= 1}
                    <ul>
                        {foreach from=$LIKES item=liker}
                            <li>{$liker->username}</li>
                        {/foreach}
                    </ul>
                {/if}
            </div>
        </div>
    </div>

    <div class="ui sixteen wide mobile four wide tablet four wide computer column">
        {include file='wiki/widgets/side-menu.tpl'}
    </div>  
</div>
{include file='footer.tpl'}
<script src="{$TEMPLATE.path}/js/wiki/scripts.js"></script>
<script src="{$TEMPLATE.path}/js/wiki/reactions.js"></script>
