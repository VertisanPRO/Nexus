<div class="ui stackable three column grid" style="background-image:url('{$BANNER_IMAGE}'); padding: 50px;">
    <div class="column" style="text-align: center; margin-top: 2.8rem; display: none;" id="mobnavbar">
        <div class="ui steps">
            <div class="step" style="background: transparent; color: white; flex-direction: row;">
                {if $DISCORDVIEW eq '1'}
                <i class="discord icon" onclick="dsInvite('{$DISCORD_SERVER['link']}')"></i>
                {/if}
                {if $DISCORDVIEW eq '1'}
                {if $MINECRAFTVIEW eq '1'}
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                {/if}
                {/if}
                {if $MINECRAFTVIEW eq '1'}
                <i class="signal icon" onclick="copy('#ip')"></i>
                {/if}
            </div>
        </div>
    </div>
    {if $DISCORDVIEW eq '1'}
    <div onclick="dsInvite('{$DISCORD_SERVER['link']}')" id="pcnavbar" class="column"
        style="text-align: center; margin-top: 2.8rem;">
        <div class="ui steps">
            <div class="step" style="background: transparent;color: white;">
                <i class="discord icon"></i>
                <div class="content">
                    <div class="title">{$DISCORD_SERVER['name']}</div>
                    <div class="ui vertical white animated button">
                        <div class="hidden content">
                            <div class="description" style="color: white;"><strong>Click to join</strong></div>
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
    {else}
    <div class="column" id="pcnavbar"></div>
    {/if}
    <div class="column" style="text-align: center;">
        <div class="ui medium image" href="/" target="_blank">
            <img onclick="window.location.href='/'"
                src="{if isset($TEMPLATE_LOGO)} {$TEMPLATE_LOGO}{else}https://namelessmc.com/uploads/resources_icons/162.png{/if}"
                style="cursor:pointer; display: unset; max-width: 100%; height: auto;">
        </div>
    </div>
    {if $MINECRAFTVIEW eq '1'}
    <div class="column" style="text-align: center; margin-top: 2rem;" id="pcnavbar">
        <div class="ui steps">
            <div class="step" style="background: transparent; color: white;">
                <i class="signal icon"></i>
                <div class="content" class="ui text shape">
                    <div class="title">{$MINECRAFTDOMAIN}</div>
                    {if $MINECRAFTSTYLE eq '1'}
                    <div id="minecraftdesc" style="color: white;"></div>
                    {/if}
                    <div class="ui vertical white animated button" onclick="copy('#ip')">
                        <div class="hidden content">
                            <div class="description" style="color: white;"><strong>Click to copy</strong></div>
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
    {/if}
</div>
{include file='Nexus/navbar/navbar_normal.tpl'}