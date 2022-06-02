<!-- Widgets Content -->
<div class="ui fluid card" id="widget-latest-posts">
  <div class="content">
    <a target="_blank" href="{$IFRAME_WG->get('iframe_widget_header_url', '#')}"
      class="ui {if isset($WIDGET_LABEL_COLOR)} {$WIDGET_LABEL_COLOR}{/if} ribbon label">
      {$IFRAME_WG->get('iframe_widget_icon', '<i class="bullhorn icon"></i>')}
      {$IFRAME_WG->get('iframe_widget_header', 'Iframe Widget')}
    </a>
    <div class="description">
      <iframe style="width: 100%;" title="{$IFRAME_WG->get('iframe_widget_header', '#')}"
        src="{$IFRAME_WG->get('iframe_widget_url', '#')}"></iframe>
    </div>
  </div>
</div>