{include file='header.tpl'} {include file='navbar.tpl'}

<h2 class="ui header">{$WIKI}</h2>

{* Success messages *}
{if isset($SESSION_SUCCESS_POST)}
    <div class="ui message icon announcement" style="border-top-style: solid; border-top-color: #5cb85c;">
        <i class="check icon" style="color: #5cb85c;"></i>
        <div class="content">
            <div class="header">{$SUCCESS}</div>
            {$SESSION_SUCCESS_POST}
        </div>
    </div>
{/if}


<div class="ui stackable padded grid">

    {if count($PAGES)}
        {* Display side wiki page menu *}
        <div class="ui sixteen wide tablet four wide computer column identifiera">

            <div id="stickybar">

                <div class="ui padded segment" style="max-height: 400px; overflow-y: auto;">

                    <div class="ui vertical following fluid accordion large text menu">

                        {* Loop through all pages*}
                        {foreach from=$PAGES item=page}

                            {if !empty($page.subpages)}

                                {* if a category has children make the dropdown*}
                                <div class="item">
                                    <div id="onhoveranim" class="title acc-{$page.id}">
                                        <i class="dropdown icon"></i>
                                        <b>{if isset($page.icon) && $page.icon|count_characters > 0}{$page.icon}
                                            {/if}{$page.name}</b>
                                    </div>

                                    <div class="content menu acc-{$page.id}">

                                        {foreach from=$page.subpages item=subpage}
                                            <a id="wikiproitem" class="item{if ($subpage->id) == ($ACTIVE_WIKI_PAGE)} active{/if}"
                                                data-tab="id-{$subpage->id}">
                                                <strong><span
                                                        style="padding-left: 10px; font-weight: lighter;">{if isset($subpage->icon) && $subpage->icon|count_characters > 0}{$subpage->icon}
                                                        {/if}{$subpage->name}</span></strong>
                                            </a>
                                        {/foreach}
                                    </div>
                                </div>

                            {else}
                                {* If page has no children *}
                                <a id="wikiproitem" class="item{if ($page.id) == ($ACTIVE_WIKI_PAGE)} active{/if}"
                                    data-tab="id-{$page.id}">{if isset($page.icon) && $page.icon|count_characters > 0}{$page.icon}
                                    {/if}{$page.name}</a>
                            {/if}
                        {/foreach}
                    </div>
                </div>

                {* Add left widgets below side menu *}
                {if count($WIDGETS_LEFT)}

                    {$WIDGETS_LEFT[0]}

                    {if count($WIDGETS_LEFT) > 1}
                        Sorry, you can only display 1 left widget due to the sticky sidebar. Otherwise there will be page scrolling
                        issues.
                        Try moving some widgets to the right side! Also make sure your widget is not too long, such as the Discord
                        widget.
                    {/if}

                {/if}

            </div>

        </div>


        {* Page content and last edited container *}
        <div
            class="ui {if count($WIDGETS_RIGHT) } sixteen wide tablet eight wide computer{else}sixteen wide tablet twelve wide computer{/if} column">

            {* Page content container*}
            <div class="ui padded segment contentidentifier">

                {* Create a content tab for each page *}
                {foreach from=$PAGES item=page}
                    {if empty($page.subpages)}
                        {* Add Content *}
                        <div class="ui tab{if ($page.id) == ($ACTIVE_WIKI_PAGE)} active{/if}" id="id-{$page.id}"
                            data-tab="id-{$page.id}">
                            <div class="forum_post">
                                {$page.content}
                            </div>

                            <br />

                            {* Add Link and Edit button *}
                            <div style="text-align:left">
                                <div class="tooltip">
                                    <button class="ui primary button" style="margin-left: 5px; margin-right: 5px"
                                        onclick="myFunction('{$BASE_URL}{$page.url}','{$page.id}', '{$COPIED}')"
                                        onmouseout="outFunc('{$page.id}', '{$COPY_PAGE_URL}')">
                                        <span class="tooltiptext" id="myTooltip-{$page.id}">{$COPY_PAGE_URL}</span>
                                        <i class="fas fa-chain"></i> {$LINK}
                                    </button>
                                </div>
                                <div class="toast-{$page.id}" id="toast">{$COPIED}: {$BASE_URL}{$page.url}</div>
                                {if {$page.can_edit}}
                                    <button class="ui primary button" onclick="window.location.href='{$page.edit_url}'"><i
                                            class="fas fa-edit fa-fw"></i> {$EDIT}</button>
                                {/if}
                            </div>
                        </div>
                    {/if}

                    {if !empty($page.subpages)}
                        {* Create a content tab for each sub page *}
                        {foreach from=$page.subpages item=subpage}
                            {* Add Content *}
                            <div class="ui tab{if ($subpage->id) == ($ACTIVE_WIKI_PAGE)} active{/if}" id="id-{$subpage->id}"
                                data-tab="id-{$subpage->id}">
                                <div class="forum_post">
                                    {$subpage->content}
                                </div>

                                <br />

                                {* Add Link and Edit button *}
                                <div style="text-align:left">
                                    <div class="tooltip">
                                        <button class="ui primary button" style="margin-left: 5px; margin-right: 5px"
                                            onclick="myFunction('{$BASE_URL}{$subpage->url}','{$subpage->id}', '{$COPIED}')"
                                            onmouseout="outFunc('{$subpage->id}', '{$COPY_PAGE_URL}')">
                                            <span class="tooltiptext" id="myTooltip-{$subpage->id}">{$COPY_PAGE_URL}</span>
                                            <i class="fas fa-chain"></i> {$LINK}
                                        </button>
                                    </div>
                                    <div class="toast-{$subpage->id}" id="toast">{$COPIED}: {$BASE_URL}{$subpage->url}</div>

                                    {if {$subpage->can_edit}}
                                        <button class="ui primary button" onclick="window.location.href='{$subpage->edit_url}'"><i
                                                class="fas fa-edit fa-fw"></i> {$EDIT}</button>
                                    {/if}
                                </div>
                            </div>
                        {/foreach}
                    {/if}
                {/foreach}
            </div>


            {* Add the last edited box *}
            {foreach from=$PAGES item=page}

                {* Pages *}
                {if empty($page.subpages)}
                    <div class="ui tab{if ($page.id) == ($ACTIVE_WIKI_PAGE)} active{/if}" id="id-{$page.id}"
                        data-tab="id-{$page.id}">
                        {if isset($page.editor)}
                            <div class="ui grid">
                                <div
                                    class="ui {if count($WIDGETS_RIGHT) } sixteen wide tablet eight wide computer{else}sixteen wide tablet six wide computer{/if} column">
                                    <div class="ui segment">
                                        <img class="ui avatar image left floated" src="{$page.editor.avatar}"
                                            alt="{$page.editor.username}">
                                        <a class="header" data-toggle="popup"
                                            style="color: {$LAST_EDITED_MESSAGE_COLOUR}">{$LAST_EDITED_BY}</a>
                                        <div class="ui wide popup">
                                            <h4 class="ui header">{$THIS_PAGE_WAS_LAST_EDITED}</h4>
                                            {$BY|capitalize} <a style="{$page.editor.user_style}"
                                                href="{$page.editor.profile}">{$page.editor.username}</a>
                                            | {$page.editor.post_date}
                                        </div>
                                        <div class="description">
                                            <a style="{$page.editor.user_style}" href="{$page.editor.profile}"
                                                data-poload="{$USER_INFO_URL}{$page.editor.id}">{$page.editor.username}</a>
                                            &middot; <span data-toggle="tooltip"
                                                data-content="{$page.editor.post_date}">{$page.editor.date_friendly}</span>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        {/if}
                    </div>
                {/if}

                {* Sub pages *}
                {if !empty($page.subpages)}
                    {foreach from=$page.subpages item=subpage}
                        <div class="ui tab{if ($subpage->id) == ($ACTIVE_WIKI_PAGE)} active{/if}" id="id-{$subpage->id}"
                            data-tab="id-{$subpage->id}">
                            {if isset($subpage->editor)}
                                <div class="ui grid">
                                    <div
                                        class="ui {if count($WIDGETS_RIGHT) } sixteen wide tablet eight wide computer{else}sixteen wide tablet six wide computer{/if} column">
                                        <div class="ui segment">
                                            <img class="ui avatar image left floated" src="{$subpage->editor.avatar}"
                                                alt="{$subpage->editor.username}">
                                            <a class="header" data-toggle="popup"
                                                style="color: {$LAST_EDITED_MESSAGE_COLOUR}">{$LAST_EDITED_BY}</a>
                                            <div class="ui wide popup">
                                                <h4 class="ui header">{$THIS_PAGE_WAS_LAST_EDITED}</h4>
                                                {$BY|capitalize} <a style="{$subpage->editor.user_style}"
                                                    href="{$subpage->editor.profile}">{$subpage->editor.username}</a>
                                                | {$subpage->editor.post_date}
                                            </div>
                                            <div class="description">
                                                <a style="{$subpage->editor.user_style}" href="{$subpage->editor.profile}"
                                                    data-poload="{$USER_INFO_URL}{$subpage->editor.id}">{$subpage->editor.username}</a>
                                                &middot; <span data-toggle="tooltip"
                                                    data-content="{$subpage->editor.post_date}">{$subpage->editor.date_friendly}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            {/if}
                        </div>
                    {/foreach}
                {/if}

            {/foreach}
        </div>

    {else}
        {* If can't view any pages *}

        {* Add left widgets*}
        {if count($WIDGETS_LEFT)}
            <div class="ui sixteen wide tablet four wide computer column">
                {foreach from=$WIDGETS_LEFT item=widget}
                    {$widget}
                {/foreach}
            </div>
        {/if}
        {* Add message *}
        <div
            class="ui {if count($WIDGETS_LEFT) && count($WIDGETS_RIGHT) }sixteen wide tablet eight wide computer{elseif count($WIDGETS_LEFT) || count($WIDGETS_RIGHT)}sixteen wide tablet twelve wide computer{else}sixteen wide{/if} column">
            <div class="ui segment">
                {$NO_PAGES_AVAILABLE}
            </div>
        </div>
    {/if}


    {* Right side widgets *}
    {if count($WIDGETS_RIGHT)}

        <div class="ui sixteen wide tablet four wide computer column">

            {if count($WIDGETS_RIGHT) > 1}
                {* Disable sticky for right widgets if more than 1 to prevent scrolling issues *}
                {foreach from=$WIDGETS_RIGHT item=widget}
                    {$widget}
                {/foreach}
            {else}
                {* Enable sticky right hand side widgets *}
                <div id="rightsidewidgets">
                    {foreach from=$WIDGETS_RIGHT item=widget}
                        {$widget}
                    {/foreach}
                </div>
            {/if}
        </div>
    {/if}

</div>

{include file='footer.tpl'}