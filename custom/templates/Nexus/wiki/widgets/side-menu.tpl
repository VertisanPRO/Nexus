<div class="ui segment">
    <div class="title_container" style="margin: 4px 0 8px 0;">
        <a href="{$WIKI_HOME_LINK}" class="subheader">{$SITE_NAME} {$WIKI}</a>
    </div>
    <div class="active content">
        <div class="ui fluid vertical menu" style="border: 0;">
            {foreach from=$WIKI_PAGES item=page}
                {if isset($page->getSubPages()) && !empty($page->getSubPages()) && count($page->getSubPages()) >= 1}
                    {if isset($page->isEnabled()) && $page->isEnabled() == "1" && isset($page->isVisible()) && $page->isVisible() == "1"}
                        <div class="ui accordion item">
                            <div class="{if $WP_CATID == $page->getNameID()}active {/if}title" style="padding:0;">
                                <h5 class="ui header">{if isset($page->getIcon()) && $page->getIcon()|count_characters > 0} <i
                                        class="{$page->getIcon()}" style="margin-right: 12px;"></i>{/if}{$page->getButton()} <a
                                        href="{$WIKI_HOME_LINK}{$page->getNameID()}" class="ui right floated mini black label"
                                        onmouseover='this.style.textDecoration="underline"'
                                        onmouseout='this.style.textDecoration="none"'>{count($page->getSubPagesEnabled())}</a></h5>
                            </div>
                            <div class="{if $WP_CATID == $page->getNameID()}active {/if}content">
                                <div class="ui fluid vertical" style="border: 0;">
                                    {foreach from=$page->getSubPages() item=subpage}
                                        {if isset($subpage.enabled) && $subpage.enabled == "1"}
                                            <a href="{$WIKI_HOME_LINK}{$subpage.parent}/{$subpage.nameid}" class="ui item">
                                                <h5 class="ui header">{if isset($subpage.icon) && $subpage.icon|count_characters > 0} <i
                                                        class="{$subpage.icon}" style="margin-right: 12px;"></i>{/if}{$subpage.button}</h5>
                                            </a>
                                        {/if}
                                    {/foreach}
                                </div>
                            </div>
                        </div>
                    {/if}
                {elseif $page->getParent() == "null"}
                    {if isset($page->isEnabled()) && $page->isEnabled() == "1" && isset($page->isVisible()) && $page->isVisible() == "1"}
                        <a href="{$WIKI_HOME_LINK}{$page->getNameID()}" class="item">
                            <h5 class="ui header">{if isset($page->getIcon()) && $page->getIcon()|count_characters > 0} <i
                                    class="{$page->getIcon()}" style="margin-right: 12px;"></i>{/if}{$page->getButton()}</h5>
                        </a>
                    {/if}
                {/if}
            {/foreach}
        </div>
    </div>
</div>