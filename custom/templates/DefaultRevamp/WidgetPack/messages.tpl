<!-- Widgets Content -->
<div class="ui fluid card" id="widget-latest-posts">
    <div class="content">
        <h4 class="ui header">
            <a class="ui {if isset($WIDGET_LABEL_COLOR)} {$WIDGET_LABEL_COLOR}{/if} header">
                {$MESSAGES_WG->get('message_widget_header', 'Message Widget')}
            </a>
        </h4>
        <div class="description">
            <h3 style="margin-top: 10px;">
                {$MESSAGES_WG->get('message_widget_title', 'Nexus TextBox')}
            </h3>
            <p>
                {$MESSAGES_WG->get('message_widget_text', 'Setup your custom text message in panel > Nexus > Widgets > Messages')}
            </p>
        </div>

    </div>
</div>