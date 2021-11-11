<div class="ui fluid card" id="widget-countdown">
    <div class="content">
    {if isset($COUNTDOWN_TITLE)}
    	<a class="ui {if isset($WIDGET_LABEL_COLOR)} {$WIDGET_LABEL_COLOR}{else} violet{/if} ribbon label" style="margin-bottom: 10px;"><i
			class="far fa-clock"></i> {$COUNTDOWN_TITLE}</a>

            <div class="center aligned description">
                {$COUNTDOWN_DESCRIPTION}
            </div>

            <pre id="countdown-value" class="center aligned countdown" data-expires="{$COUNTDOWN_EXPIRES}"></pre>
        {else}
            <div class="ui info message">
                {$NO_COUNTDOWN_AVAILABLE}
            </div>
        {/if}
    </div>
</div>
