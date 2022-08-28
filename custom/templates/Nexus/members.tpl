{include file='header.tpl'}
{include file='navbar.tpl'}

<h2 class="ui header">{$MEMBERS_TITLE}</h2>

<div class="ui stackable grid">
    <div class="ui row">

        {if count($WIDGETS_LEFT)}
            <div class="ui six wide tablet four wide computer column">
                {foreach from=$WIDGETS_LEFT item=widget}
                    {$widget}
                {/foreach}
            </div>
        {/if}

        <div
            class="ui {if count($WIDGETS_LEFT) && count($WIDGETS_RIGHT) }four wide tablet eight wide computer{elseif count($WIDGETS_LEFT) || count($WIDGETS_RIGHT)}ten wide tablet twelve wide computer{else}sixteen wide{/if} column">

            <div class="ui stackable grid container">
                <div class="three wide center aligned column">
                    <a class="ui fluid secondary button" href="{$ALL_LINK}">
                        {$DISPLAY_ALL}
                    </a>
                </div>
                {foreach from=$GROUPS item=groups}
                    <div class="three wide center aligned column">
                        <a class="ui fluid secondary button" href="{$groups.link}">
                            {$groups.name}
                        </a>
                    </div>
                {/foreach}
            </div>


            <table id="example" class="ui table dataTables-users" style="width:100%">
                <thead>
                    <tr>
                        <th>{$USERNAME}</th>
                        <th>{$GROUP}</th>
                        <th>{$CREATED}</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$MEMBERS item=member}
                        <tr>
                            <td><a href="{$member.profile}"><img src="{$member.avatar}" class="ui avatar image"
                                        style="height:35px; width:35px;" alt="{$member.nickname}" /></a> <a
                                    style="{$member.style}" href="{$member.profile}">{$member.nickname}</a></td>
                            <td>{foreach from=$member.groups item=group}{$group}{/foreach}</td>
                            <td>{$member.joined}</td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>

        </div>

        {if count($WIDGETS_RIGHT)}
            <div class="ui six wide tablet four wide computer column">
                {foreach from=$WIDGETS_RIGHT item=widget}
                    {$widget}
                {/foreach}
            </div>
        {/if}

    </div>
</div>

{include file='footer.tpl'}