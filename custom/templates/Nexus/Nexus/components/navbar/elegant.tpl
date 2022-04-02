{if $MINECRAFTSTYLE eq '0'}
{include file='Nexus/components/status/simple.tpl'}
{else}
{include file='Nexus/components/status/advanced.tpl'}
{/if}

<div class="ui stackable three column grid"
  style="background-image:url('{$BANNER_IMAGE}'); padding: 45px; margin-top:0px!important; border-bottom-left-radius: 85% 20%; border-bottom-right-radius: 85% 20%;">
  {if $DISCORDVIEW eq '1'}
  <div onclick="dsInvite('{$DISCORD_SERVER['link']}')" class="column" style="text-align: center; margin-top: 5rem;">
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
  <div class="column"></div>
  {/if}
  <div class="column" style="text-align: center;">
    <div class="ui medium image" href="/" target="_blank">
      <img onclick="window.location.href='/'"
        src="{if isset($TEMPLATE_LOGO)} {$TEMPLATE_LOGO}{else}https://namelessmc.com/uploads/resources_icons/162.png{/if}"
        style="cursor:pointer; display: unset; max-width: 100%; height: auto;">
    </div>
  </div>
  {if $MINECRAFTVIEW eq '1'}
  <div class="column"
    onclick="copyIP('{$MINECRAFTIP}{if ($MINECRAFTPORT != 25565)}:{$MINECRAFTPORT}{/if}')"
    style="text-align: center; margin-top: 2rem;">
    <div class="ui steps">
      <div class="step" style="background: transparent; color: white;">
        <i class="signal icon"></i>
        <div class="content" id="copied-ip" class="ui text shape" id="copy-ip">
          <div class="title">{if ($MINECRAFTDOMAIN eq '')} game.mc-tensa.com{else}{$MINECRAFTDOMAIN}{/if}</div>
          {if $MINECRAFTSTYLE == 'false'}
          <div class="description" style="color: white;">
            <div id="mc_description"></div>
          </div>
          {/if}
          <div class="ui vertical white animated button">
            <div class="hidden content">
              <div class="description" style="color: white;"><strong>Click to copy</strong></div>
            </div>
            <div class="visible content">
              <div class="description" style="color: white;"><strong>
                  <div id="playercounter">Loading ...</div>
                </strong></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  {/if}
</div>

<script>
  function dsInvite(link) {
    if (link !== '') {
      window.open(link);
    }
    return false;
  }

  {if $DARKMODE eq '1'}
  $(function () {
    $('#copied-ip').click(function () {
      $('body').toast({
        showIcon: 'keyboard',
        message: 'Copied!',
        class: 'black',
        progressUp: true,
        displayTime: 2000,
        classProgress: 'white',
        showProgress: 'bottom',
        pauseOnHover: false,
      });
    })
  });
  {else}
  $(function () {
    $('#copied-ip').click(function () {
      $('body').toast({
        showIcon: 'keyboard',
        message: 'Copied!',
        class: 'white',
        progressUp: true,
        displayTime: 2000,
        classProgress: 'black',
        showProgress: 'bottom',
        pauseOnHover: false,
      });
    })
  });
  {/if}

  function copyIP(ip) {
    var servIP = document.createElement("textarea");
    document.body.appendChild(servIP);
    servIP.value = ip;
    servIP.select();
    document.execCommand("copy");
    document.body.removeChild(servIP);
  }
</script>