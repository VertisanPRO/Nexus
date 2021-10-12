{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="ui container">
    <div class="ui padded segment">
        <h2 style="display:inline;">{$PURCHASING_RESOURCE}</h2>
        <div class="res right floated">
            <a href="{$CANCEL_LINK}" onclick="return confirm('{$CONFIRM_CANCEL}');" class="ui yellow button">{$CANCEL}</a>
        </div>

        <div class="ui divider"></div>

        {if isset($ERROR)}
            <div class="ui negative message">{$ERROR}</div>
        {/if}

        {$PRE_PURCHASE_INFO}

        <div class="ui divider"></div>

        <form action="" method="post" class="ui form">
            <input type="hidden" name="token" value="{$TOKEN}">
            <input type="hidden" name="action" value="agree">
            <input type="submit" class="ui blue button" value="{$PURCHASE}">
        </form>
    </div>
</div>

{include file='footer.tpl'}
