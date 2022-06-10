<!-- Widgets Content -->
<div class="ui fluid card" id="widget-latest-posts">
    <div class="content">
        <a class="ui {if isset($WIDGET_LABEL_COLOR)} {$WIDGET_LABEL_COLOR}{/if} ribbon label">
            {if isset($MESSAGES_WG['message_widget_icon'])}
                {$MESSAGES_WG['message_widget_icon']}
            {else}
                <i class="bullhorn icon"></i>
            {/if}
            {if isset($MESSAGES_WG['message_widget_header'])}
                {$MESSAGES_WG['message_widget_header']}
            {else}
                Message Widget
            {/if}
        </a>
        <div class="description">
            <h3 style="margin-top: 10px;">
                {if isset($MESSAGES_WG['message_widget_title'])}
                    {$MESSAGES_WG['message_widget_title']}
                {else}
                    Nexus TextBox
                {/if}
            </h3>
            <p>
                {if isset($MESSAGES_WG['message_widget_text'])}
                    {$MESSAGES_WG['message_widget_text']}
                {else}
                    Setup your custom text message in panel > Nexus > Widgets > Messages
                {/if}
            </p>
        </div>

    </div>
</div>