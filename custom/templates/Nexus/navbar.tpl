{assign var="navbarexcludeexploded" value="/"|@explode:$NAVBAREXCLUDE}
{if $PRELOADERVIEW eq '1'}
    <div class="preloader">
        <div
            class="ui active {if $PRELOADERSPEED eq 'normal'}{else}{$PRELOADERSPEED}{/if} {if $PRELOADERSTYLE eq 'normal'}{else}{$PRELOADERSTYLE}{/if} {$PRELOADERCOLOR} large inverted loader">
        </div>
        <h3 style="margin-top: 100px;"><span class="ui inverted {$PRELOADERCOLOR} text">{$PRELOADERTEXT}</span></h3>
    </div>
{/if}

<div class="ui vertical inverted sidebar menu left" id="toc">
    <div class="item">
        <h3>{$SITE_NAME}</h3>
    </div>
    {foreach from=$NAV_LINKS key=name item=item}
        {if isset($item.items)}
            <div class="item" style="color:{$PRIMARYCOLOR} !important">{$item.title} <div style="float: right;">{$item.icon}
                </div>
            </div>
            <div class="sidebar menu left">
                {foreach from=$item.items item=dropdown}
                    <a class="item" href="{$dropdown.link}" target="{$dropdown.target}">{$dropdown.title} <div
                            style="float: right;">{$dropdown.icon}</div></a>
                {/foreach}
            </div>
        {else}
            {if !in_array($item.title, $navbarexcludeexploded)}
                <a class="item{if isset($item.active)} active{/if}" href="{$item.link}" target="{$item.target}">
                    {$item.icon}{$item.title}</a>
            {/if}
        {/if}
    {/foreach}
</div>

{if $NAVBARSTYLE eq '0'}
    {include file='Nexus/navbar/elegant.tpl'}
{elseif $NAVBARSTYLE eq '1'}
    {include file='Nexus/navbar/dynamic.tpl'}
{else}
    {include file='Nexus/navbar/modern.tpl'}
{/if}

<div class="pusher">
    <div id="wrapper">
        <br />
        <div class="ui container" id="context">
            <div class="ui message icon announcement" style="border-top-style: solid; border-top-color: #d9534f;"
                id="ie-message">
                <i class="exclamation triangle icon" style="color: #d9534f;"></i>
                <div class="content">
                    <div class="header">{$INTERNET_EXPLORER_HEADER}</div>
                    {$INTERNET_EXPLORER_INFO}
                </div>
            </div>

            {if isset($NEW_UPDATE)}
                {if $NEW_UPDATE_URGENT eq true}
                    <div class="ui message icon announcement" style="border-top-style: solid; border-top-color: #d9534f;"
                        id="update-message">
                    {else}
                        <div class="ui message icon announcement" style="border-top-style: solid; border-top-color: #0275d8;"
                            id="update-message">
                            <i class="close icon"></i>
                        {/if}
                        <a href="{$NAMELESS_UPDATE_LINK}">
                            <i class="download icon" style="color: {if $NEW_UPDATE_URGENT eq true}#d9534f
                            {else}#0275d8;{/if}"></i>
                        </a>
                        <div class="content">
                            <div class="header">{$NEW_UPDATE}</div>
                            <ul class="list">
                                <li>{$CURRENT_VERSION}</li>
                                <li>{$NEW_VERSION}</li>
                            </ul>
                        </div>
                    </div>
                {/if}

                {if isset($NEW_UPDATE_NEXUS)}
                    {if $NEW_UPDATE_URGENT_NEXUS eq true}
                        <div class="ui message icon announcement" style="border-top-style: solid; border-top-color: #d9534f;"
                            id="update-message">
                        {else}
                            <div class="ui message icon announcement"
                                style="border-top-style: solid; border-top-color: #0275d8;" id="update-message">
                                <i class="close icon"></i>
                            {/if}
                            <a href="{$UPDATE_LINK_NEXUS}">
                                <i class="download icon" style="color: {if $NEW_UPDATE_URGENT_NEXUS eq true}#d9534f
                                {else}#0275d8;{/if}"></i>
                            </a>
                            <div class="content">
                                <div class="header">{$NEW_UPDATE_NEXUS}</div>
                                <ul class="list">
                                    <li>{$CURRENT_VERSION_NEXUS}</li>
                                    <li>{$NEW_VERSION_NEXUS}</li>
                                </ul>
                            </div>
                        </div>
                    {/if}

                    {if !empty($ANNOUNCEMENTS)}
                        {foreach from=$ANNOUNCEMENTS item=$ANNOUNCEMENT}
                            <div class="ui {if $ANNOUNCEMENT->icon} icon {/if} message announcement"
                                id="announcement-{$ANNOUNCEMENT->id}"
                                style="border-top-style: solid; border-top-color:{$ANNOUNCEMENT->background_colour};">
                                {if $ANNOUNCEMENT->closable}
                                    <i class="close icon"></i>
                                {/if}
                                {if $ANNOUNCEMENT->icon}
                                    <i class="{$ANNOUNCEMENT->icon} icon" style="color: {$ANNOUNCEMENT->background_colour};"></i>
                                {/if}
                                <div class="content">
                                    <div class="header">{$ANNOUNCEMENT->header}</div>
                                    <p>{$ANNOUNCEMENT->message|escape}</p>
                                </div>
                            </div>
                        {/foreach}
                    {/if}

                    {if isset($MUST_VALIDATE_ACCOUNT)}
                        <div class="ui message icon announcement"
                            style="border-top-style: solid; border-top-color: #0275d8;">
                            <i class="info icon" style="color: #0275d8; margin-left: 0.5rem;"></i>
                            <div class="content">
                                {$MUST_VALIDATE_ACCOUNT}
                            </div>
                        </div>
                    {/if}

                    {if isset($MAINTENANCE_ENABLED)}
                        <div class="ui message icon announcement"
                            style="border-top-style: solid; border-top-color: #f0ad4e;">
                            <i class="exclamation icon" style="color: #f0ad4e;"></i>
                            <div class="content">
                                {$MAINTENANCE_ENABLED}
                            </div>
                        </div>
{/if}