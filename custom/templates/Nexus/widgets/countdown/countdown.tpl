{if isset($COUNTDOWN_TITLE)}
    <div class="ui fluid card" id="widget-countdown">
        <div class="content">
            <a class="ui ribbon label" style="margin-bottom: 10px;"><i class="fa-solid fa-heading"></i>
                {$COUNTDOWN_TITLE}</a>
            <div class="center aligned description">
                {$COUNTDOWN_DESCRIPTION}
            </div>
            <pre id="countdown-value" class="center aligned countdown" data-expires="{$COUNTDOWN_EXPIRES}"></pre>
        </div>
    </div>
{/if}