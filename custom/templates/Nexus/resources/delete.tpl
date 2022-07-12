{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="ui container">
    <div class="ui segment">
        <div style="text-align: center;">
            <h4>{$CONFIRM_DELETE_RESOURCE}</h4>
        </div>

        {if isset($ERRORS)}
            <div class="ui negative message">
                {foreach from=$ERRORS item=error}
                    {$error}<br />
                {/foreach}
            </div>
        {/if}

        <br />

        <form action="" method="post">
            <div style="text-align: center;">
                <input type="hidden" name="token" value="{$TOKEN}">
                <a class="ui yellow button" href="{$CANCEL_LINK}">{$CANCEL}</a>
                <input type="submit" class="ui red button" value="{$DELETE}">
            </div>
        </form>
    </div>
</div>

{include file='footer.tpl'}