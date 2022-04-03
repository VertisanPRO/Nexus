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

<div class="pusher">
  <div id="wrapper">
    <div class="ui secondary small menu" style="background: {if $NAVBARCOLOR eq '#000000'}
      {$PRIMARYCOLOR}{else}{$NAVBARCOLOR}{/if};" id="navbar">
      <div class="ui container">
        {foreach from=$NAV_LINKS key=name item=item}
        {if isset($item.items)}
        <div class="ui pointing dropdown link item">
          <span class="text">{$item.icon} {$item.title}</span> <i class="dropdown icon"></i>
          <div class="menu">
            <div class="header">{$item.title}</div>
            {foreach from=$item.items item=dropdown}
            {if isset($dropdown.separator)}
            <div class="divider"></div>
            {else}
            <a class="item" href="{$dropdown.link}" target="{$dropdown.target}">{$dropdown.icon} {$dropdown.title}</a>
            {/if}
            {/foreach}
          </div>
        </div>
        {else}
        <a class="item{if isset($item.active)} active{/if}" href="{$item.link}" target="{$item.target}">{$item.icon}
          {$item.title}</a>
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
              <a class="item" href="{$dropdown.link}" target="{$dropdown.target}">{$dropdown.icon} {$dropdown.title}</a>
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

    {if $NAVBARSTYLE eq '0'}
    {include file='Nexus/components/navbar/elegant.tpl'}
    {else}
    {include file='Nexus/components/navbar/dynamic.tpl'}
    {/if}

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