<div class="ui vertical inverted sidebar menu left" id="toc">
    <div class="item">
        <h3>{$SITE_NAME}</h3>
    </div>
    {foreach from=$NAV_LINKS key=name item=item}
        {if isset($item.items)}
            <div class="item">
                <div class="header">{$item.title} <span class="icon">{$item.icon}</span></div>
                <div class="menu">
                    {foreach from=$item.items item=dropdown}
                        <a class="item" href="{$dropdown.link}" target="{$dropdown.target}">{$dropdown.icon} {$dropdown.title}</a>
                    {/foreach}
                </div>
            </div>
        {else}
            <a class="item{if isset($item.active)} active{/if}" href="{$item.link}" target="{$item.target}">{$item.icon}
                {$item.title}
            </a>
        {/if}
    {/foreach}
</div>

<div class="pusher">
    <div id="wrapper">
        <div class="ui secondary {$DEFAULT_REVAMP_NAVBAR_EXTRA_CLASSES} small menu" id="navbar">
            <div class="ui container">
                {foreach from=$NAV_LINKS key=name item=item}
                    {if isset($item.items)}
                        <div class="ui dropdown item">
                            {$item.icon} {$item.title}
                            <i class="dropdown icon"></i>
                            <div class="menu">
                                <div class="header">{$item.title}</div>
                                {foreach from=$item.items item=dropdown}
                                    {if isset($dropdown.separator)}
                                        <div class="divider"></div>
                                    {else}
                                        <a class="item" href="{$dropdown.link}" target="{$dropdown.target}">
                                            {$dropdown.icon} {$dropdown.title}
                                        </a>
                                    {/if}
                                {/foreach}
                            </div>
                        </div>
                    {else}
                        <a class="item{if isset($item.active)} active{/if}" href="{$item.link}" target="{$item.target}">
                            {$item.icon} {$item.title}
                        </a>
                    {/if}
                {/foreach}
                <a class="toc item">
                    <i class="sidebar icon"></i>
                </a>
                <div class="right menu">
                    {foreach from=$USER_SECTION key=name item=item}
                        {if isset($item.items)}
                            {if ($name == "account")}
                                <a class="ui medium image label" data-toggle="popup" data-position="bottom right"
                                    id="button-{$name}">{$item.icon} {$item.title}</a>
                            {else}
                                <a class="ui small default icon button" data-toggle="popup" data-position="bottom right"
                                    id="button-{$name}">{$item.icon}</a>
                            {/if}
                            <div class="ui wide basic popup">
                                <h4 class="ui header">{$item.title}</h4>
                                <div class="ui relaxed link list" id="list-{$name}">
                                    {foreach from=$item.items item=dropdown}
                                        {if isset($dropdown.separator)}
                                            <div class="ui divider"></div>
                                        {else}
                                            {if isset($dropdown.action)}
                                                <a class="item" href="#" data-link="{$dropdown.link}" data-action="{$dropdown.action}">
                                                    {$dropdown.icon} {$dropdown.title}
                                                </a>
                                            {else}
                                                <a class="item" href="{$dropdown.link}" target="{$dropdown.target}">
                                                    {$dropdown.icon} {$dropdown.title}
                                                </a>
                                            {/if}
                                        {/if}
                                    {/foreach}
                                </div>
                                {if !empty($item.meta)}
                                    <div class="ui link list">
                                        <div class="ui divider"></div>
                                        <a class="item" href="{$item.link}">{$item.meta}</a>
                                    </div>
                                {/if}
                            </div>
                        {else}
                            {if ($name == "panel")}
                                <a class="ui small primary icon button" href="{$item.link}" target="{$item.target}">{$item.icon}</a>
                            {elseif ($name == "register")}
                                <a class="ui small primary button" href="{$item.link}" target="{$item.target}">{$item.title}</a>
                            {else}
                                <a class="ui small default button" href="{$item.link}" target="{$item.target}">{$item.title}</a>
                            {/if}
                        {/if}
                    {/foreach}
                </div>
            </div>
        </div>

        <div class="ui stackable three column grid"
            style="background:url('{$BANNER_IMAGE}') no-repeat center center / cover; padding: 45px; margin-top:0px!important; border-bottom-left-radius: 85% 20%; border-bottom-right-radius: 85% 20%;">
            <div class="column" style="text-align: center; margin-top: 2.8rem; display: none;" id="mobnavbar">
                <div class="ui steps">
                    <div class="step" style="background: transparent; color: white; flex-direction: row;">
                        <i class="discord icon" onclick="window.location.href = '{$DISCORD_SERVER['link']}'"></i>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        <i class="signal icon" onclick="copy('#ip')"></i>
                    </div>
                </div>
            </div>
            <div onclick="window.location.href = '{$DISCORD_SERVER['link']}'" id="pcnavbar" class="column"
                style="text-align: center; margin-top: 2.8rem;">
                <div class="ui steps">
                    <div class="step" style="background: transparent;color: white;">
                        <i class="discord icon"></i>
                        <div class="content">
                            <div class="title">{$DISCORD_SERVER['name']}</div>
                            <div class="ui vertical white animated button">
                                <div class="hidden content">
                                    <div class="description" style="color: white;"><strong>Click to Join</strong>
                                    </div>
                                </div>
                                <div class="visible content">
                                    <div class="description" style="color: white;"><strong>Members Online:
                                            {$DISCORD_SERVER['members']}</strong></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            {* Uncomment line below if Discord Widget is disabled *}
            {* <div class="column" id="pcnavbar"></div> *}
            <div class="column" style="text-align: center;">
                <div class="ui medium image" href="/" target="_blank">
                    <img onclick="window.location.href='/'" src="{$LOGO}" alt="logo"
                        style="cursor:pointer; display: unset; max-width: 100%; height: auto;">
                </div>
            </div>
            <div class="column" style="text-align: center; margin-top: 2rem;" id="pcnavbar">
                <div class="ui steps">
                    <div class="step" style="background: transparent; color: white;">
                        <i class="signal icon"></i>
                        <div class="content" class="ui text shape">
                            <div class="title">!!minecraft domain!!</div>
                            {* Uncomment line below for description *}
                            {* <div id="minecraftdesc" style="color: white;"></div> *}
                            <div class="ui vertical white animated button" onclick="copy('#ip')">
                                <div class="hidden content">
                                    <div class="description" style="color: white;">
                                        <strong>{$CLICK_TO_COPY}</strong>
                                    </div>
                                </div>
                                <div class="visible content">
                                    <div class="description" style="color: white;"><strong>
                                            <div id="minecraftplayers">Loading...</div>
                                        </strong></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ui container">
            <div class="ui negative icon message" id="ie-message">
                <i class="exclamation triangle icon"></i>
                <div class="content">
                    <div class="header">
                        {$INTERNET_EXPLORER_HEADER}
                    </div>
                    <p>{$INTERNET_EXPLORER_INFO}</p>
                </div>
            </div>

            {if isset($NEW_UPDATE)}
                {if $NEW_UPDATE_URGENT eq true}
                    <div class="ui negative icon message" id="update-message">
                    {else}
                        <div class="ui info icon message" id="update-message">
                            <i class="close icon"></i>
                        {/if}
                        <a href="{$NAMELESS_UPDATE_LINK}">
                            <i class="download icon"></i>
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

                {if !empty($ANNOUNCEMENTS)}
                    {foreach from=$ANNOUNCEMENTS item=$ANNOUNCEMENT}
                        <div class="ui {if $ANNOUNCEMENT->icon} icon {/if} message announcement"
                            id="announcement-{$ANNOUNCEMENT->id}"
                            style="background-color:{$ANNOUNCEMENT->background_colour}; color:{$ANNOUNCEMENT->text_colour}">
                            {if $ANNOUNCEMENT->closable}
                                <i class="close icon"></i>
                            {/if}
                            {if $ANNOUNCEMENT->icon}
                                <i class="{$ANNOUNCEMENT->icon} icon"></i>
                            {/if}
                            <div class="content">
                                <div class="header">{$ANNOUNCEMENT->header}</div>
                                <p>{$ANNOUNCEMENT->message|escape}</p>
                            </div>
                        </div>
                    {/foreach}
                {/if}

                {if isset($MUST_VALIDATE_ACCOUNT)}
                    <div class="ui message">
                        {$MUST_VALIDATE_ACCOUNT}
                    </div>
                {/if}

                {if isset($MAINTENANCE_ENABLED)}
                    <div class="ui warning message">
                        <i class="close icon"></i>
                        {$MAINTENANCE_ENABLED}
                    </div>
{/if}