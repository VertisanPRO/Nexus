<!-- Widgets Content -->
<div class="ui fluid card" id="widget-latest-posts">
    <div class="content">
        <h4 class="ui header">
            <a target="_blank" href="{$IFRAME_WG->get('iframe_widget_header_url', '#')}">
                {$IFRAME_WG->get('iframe_widget_header', 'Iframe Widget')}
            </a>
        </h4>
        <div class="description">
            <iframe style="width: 100%;" title="{$IFRAME_WG->get('iframe_widget_header', '#')}"
                src="{$IFRAME_WG->get('iframe_widget_url', '#')}">
            </iframe>
        </div>
    </div>
</div>