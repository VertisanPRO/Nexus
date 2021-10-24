<div class="ui fluid card" id="widget-latest-posts">
	<div class="content">
		<a class="ui {if isset($WIDGET_LABEL_COLOR)} {$WIDGET_LABEL_COLOR}{else} violet{/if} ribbon label">{if isset($MESSAGE_WIDGET_ICON)}
			{$MESSAGE_WIDGET_ICON}{else}<i class="bullhorn icon"></i>{/if} {if isset($MESSAGE_WIDGET_TITLE)}
			{$MESSAGE_WIDGET_TITLE}{else}Message Widget
			{/if}</a>
		<div class="description">
			<h3 style="
    margin-top: 10px;
">{if isset($MESSAGE_WIDGET_TITLE)} {$MESSAGE_WIDGET_TITLE}{else}Nexus TextBox{/if}</h3>
			<p>{if isset($WIDGET_TEXT)} {$WIDGET_TEXT}
				{else}Setup your custom text message in panel > Nexus > Widgets >
				Messages{/if}</p>
			<p></p>
		</div>


	</div>
</div>
</div>