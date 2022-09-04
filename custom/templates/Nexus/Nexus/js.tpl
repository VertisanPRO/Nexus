{if $MINECRAFTVIEW eq '1'}
    <script type="text/javascript">
        var url = "https://api.minetools.eu/ping/{$MINECRAFTIP}{if $MINECRAFTPORT != '25565'}/{$MINECRAFTPORT}{/if}";

        $.getJSON(url, function(r) {
            if (r.error) {
                $('#minecraftplayers').html(serverOffline);
                return false;
            }
            $('#minecraftplayers').html((/§(.+?)/gi, '') + playersOnline + ': ' + r.players.online);
            {if $MINECRAFTSTYLE eq '1'}
                $('#minecraftdesc').html(r.description.replace(/§(.+?)/gi, ''));
            {/if}
        });
    </script>
{/if}

{if $WIDGETBOTVIEW eq '1'}
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@widgetbot/crate@3" async defer>
        new Crate({
            server: '{$WIDGETBOTSERVERID}',
            channel: '{$WIDGETBOTCHANNELID}',
            location: ['{$WIDGETBOTVERTICALLOCATION}', '{$WIDGETBOTHORIZONTALLOCATION}'],
            {if $WIDGETBOTCOLOR eq '0'}
            {elseif $WIDGETBOTCOLOR eq '1'}
                {if $NEXUS_DARK_MODE eq '1' }
                    color: '#303030',
                {else}
                    color: '#e0e1e2',
                {/if}
            {elseif $WIDGETBOTCOLOR eq '2'}
                color: '{$WIDGETBOTCUSTOMCOLOR}',
            {/if}
        });
    </script>
{/if}