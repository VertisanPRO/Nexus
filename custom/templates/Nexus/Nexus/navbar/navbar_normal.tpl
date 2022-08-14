{assign var="navbarexcludeexploded" value="/"|@explode:$NAVBAREXCLUDE}
<div class="ui {if $NAVBARSTICKY eq '1'}sticky{/if} secondary small menu" id="navbar">
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
                    <a class="item{if isset($item.active)} active{/if} navbar-item" href="{$item.link}"
                        target="{$item.target}">{$item.icon}
                        {$item.title}</a>
                {/if}
            {/if}
        {/foreach}
        <a class="toc item">
            <i class="sidebar icon navbar-item"></i>
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