{include file='header.tpl'} 
{include file='navbar.tpl'}
    <div class="ui grid">
    <div class="ui sixteen wide mobile twelve wide tablet twelve wide computer column">
        <div class="ui segments">
            <div class="ui segment header">
                <div class="ui grid">
                    <div class="eight wide column" style="margin-left: 1rem; margin-top: 0.25rem; width: 45%!important">
                        <div class="ui breadcrumb" style="margin-left: 1rem">
                            <a href="{$WIKI_HOME_LINK}" class="section">{$WIKI}</a>
                            <div class="divider"> / </div>
                            <div class="active section">{$SEARCH_RESULTS_LANG} {$SEARCH_RESULT}</div>
                        </div>
                    </div>
                    {include file='wiki/widgets/search-box.tpl'}
                </div>
            </div>
            
            <div class="ui segment context" style="padding: 28px">
                <div class="ui middle aligned divided list">
  
                    {if $SEARCH_RESULTS|@count <= 0}
                        {$SEARCH_NO_RESULTS}
                    {else}
                       {foreach from=$SEARCH_RESULTS item=result}
                            <div class="item" style="padding: .5em">
                                <div class="right floated content">
                                    <a href="../wiki/{$result->nameid}" class="ui button">View</a>
                                </div>
                                <i class="{$result->icon} ui avatar image"></i>
                                <!-- <img class="ui avatar image"> <h5 class="ui header">{if isset($result->icon) && $result->icon|count_characters > 0} <i class="{$result->icon}"></i>{/if}</h5> -->
                                <div class="content">
                                    {$result->button}
                                </div>
                            </div>
                        {/foreach}     
                    {/if}
                </div>
            </div>
        </div>
    </div>
    <div class="ui sixteen wide mobile four wide tablet four wide computer column" style="padding-top: 0">
        {include file='wiki/widgets/side-menu.tpl'}
    </div>  
</div>
{include file='footer.tpl'}
<script src="{$TEMPLATE.path}/js/wiki/scripts.js"></script>