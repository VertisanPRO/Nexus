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
    {$item.title}</a>
  {/if}
  {/foreach}
</div>

{if $NAVBARSTYLE eq '0'}
{include file='Nexus/components/navbar/elegant.tpl'}
{elseif $NAVBARSTYLE eq '1'}
{include file='Nexus/components/navbar/dynamic.tpl'}
{else}
{include file='Nexus/components/navbar/modern.tpl'}
{/if}

<div class="pusher">
  <div id="wrapper">
    <div class="ui container" id="context">
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
          <a href="{$UPDATE_LINK}">
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
        <div class="ui {if $ANNOUNCEMENT->icon} icon {/if} message announcement" id="announcement-{$ANNOUNCEMENT->id}"
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