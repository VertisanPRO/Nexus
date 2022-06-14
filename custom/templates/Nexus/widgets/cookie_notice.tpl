<div class="ui fluid card">
    <div class="content">
        <a class="ui ribbon label" style="margin-bottom: 10px;"><i class="fa-solid fa-cookie"></i>
            {$COOKIE_NOTICE_HEADER}</a>
        <div class="description">
            <p>{$COOKIE_NOTICE_BODY}</p>
            {if $COOKIE_DECISION_MADE}
                <a class="ui fluid blue button" href="{$COOKIE_URL}">{$COOKIE_NOTICE_CONFIGURE}</a>
            {/if}
        </div>
    </div>
</div>