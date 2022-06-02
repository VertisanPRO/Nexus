<!-- Widgets Content -->
<div class="ui fluid card" id="widget-latest-posts">
  <div class="content">
    <h4 class="ui header">
      <a target="_blank"
        href="{if isset($IFRAME_WG['iframe_widget_header_url'])}{$IFRAME_WG['iframe_widget_header_url']}{/if}">
        {if isset($IFRAME_WG['iframe_widget_header'])}
          {$IFRAME_WG['iframe_widget_header']}
        {else}
          Iframe Widget
        {/if}
      </a>
    </h4>
    <div class="description">
      <iframe style="width: 100%;"
        title="{if isset($IFRAME_WG['iframe_widget_header'])}{$IFRAME_WG['iframe_widget_header']}{/if}"
        src="{if isset($IFRAME_WG['iframe_widget_url'])}{$IFRAME_WG['iframe_widget_url']}{/if}">
      </iframe>
    </div>
  </div>
</div>