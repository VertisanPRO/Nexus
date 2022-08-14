{assign var="navbarexcludeexploded" value="/"|@explode:$NAVBAREXCLUDE}
<div class="ui secondary small menu" id="navbar" style="background: transparent !important;">
    <a class="toc item">
        <i class="sidebar icon navbar-item"></i>
    </a>
    <div class="ui container" style="justify-content: center;">
        {foreach from=$NAV_LINKS key=name item=item}
            {if isset($item.items)}
                <div class="ui pointing dropdown link">
                    <button class="ui grey tertiary button"
                        style="cursor: pointer; color: rgba(255, 255, 255, 0.6);">{$item.icon}
                        {$item.title} <i class="dropdown icon navbar-item"></i></button>
                    <div class="menu">
                        <div class="header">{$item.title}</div>
                        {foreach from=$item.items item=dropdown}
                            {if isset($dropdown.separator)}
                                <div class="divider navbar-item"></div>
                            {else}
                                <a class="item navbar-item" href="{$dropdown.link}" target="{$dropdown.target}">
                                    {$dropdown.icon}{$dropdown.title}</a>
                            {/if}
                        {/foreach}
                    </div>
                </div>
            {else}
                {if !in_array($item.title, $navbarexcludeexploded)}
                    <button class="ui grey tertiary button" onclick="location.href='{$item.link}'"
                        style="cursor: pointer; color: rgba(255, 255, 255, 0.6);">
                        {$item.icon}{$item.title}</button>
                {/if}
            {/if}
        {/foreach}
    </div>
</div>
<div class="ui secondary small menu" id="navbar" style="background: transparent !important;">
    <div class="ui container" style="justify-content: end;">
        {foreach from=$USER_SECTION key=name item=item}
            {if isset($item.items)}
                {if ($name == "account")}
                    <a class="ui mini circular image" data-toggle="popup" data-position="bottom right" id="button-{$name}"
                        style="background: transparent !important; cursor: pointer; margin-top: -55px; color: rgba(255, 255, 255, 0.6);">{$item.icon}</a>
                {else}
                    <a class="ui small default icon button" data-toggle="popup" data-position="bottom right" id="button-{$name}"
                        style="background: transparent !important; margin-top: -55px; color: rgba(255, 255, 255, 0.6);">{$item.icon}</a>
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
                    <a class="ui small primary icon button" href="{$item.link}" target="{$item.target}"
                        style="background: transparent !important; margin-top: -55px; color: rgba(255, 255, 255, 0.6);">{$item.icon}</a>
                {elseif ($name == "register")}
                    <a class="ui small default button" href="{$item.link}" target="{$item.target}"
                        style="background: transparent; margin-top: -55px; color: rgba(255, 255, 255, 0.6);">{$item.title}</a>
                {else}
                    <a class="ui small default button" href="{$item.link}" target="{$item.target}"
                        style="background: transparent; margin-top: -55px; color: rgba(255, 255, 255, 0.6);">{$item.title}</a>
                {/if}
            {/if}
        {/foreach}
    </div>
</div>