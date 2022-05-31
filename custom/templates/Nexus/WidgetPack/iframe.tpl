<!-- Widgets Content -->
<div class="ui fluid card" id="widget-latest-posts">
  <div class="content">
    <a class="ui {if isset($WIDGET_LABEL_COLOR)} {$WIDGET_LABEL_COLOR}{/if} ribbon label">
      {if isset($IFRAME_WG['iframe_widget_icon'])}
        {$IFRAME_WG['iframe_widget_icon']}
      {else}
        <i class="bullhorn icon"></i>
      {/if}
      {if isset($IFRAME_WG['iframe_widget_header'])}
        {$IFRAME_WG['iframe_widget_header']}
      {/if}
    </a>
    <div class="description">
      <iframe title="{if isset($IFRAME_WG['iframe_widget_header'])}{$IFRAME_WG['iframe_widget_header']}{/if}" src="{if isset($IFRAME_WG['iframe_widget_url'])}{$IFRAME_WG['iframe_widget_url']}{/if}">
      </iframe>
    </div>
  </div>
</div>
