{include file='header.tpl'}
{include file='navbar.tpl'}

<h2 class="ui header">
    {$VERIFY_ACCOUNT}
    <div class="sub header">{$VERIFY_ACCOUNT_HELP}</div>
</h2>

{if !isset($STEP)}
    <div class="ui padded segment" id="mcassoc-body">
        {$MCASSOC}
    </div>
{else}
    {if isset($ERROR)}
        <div class="ui message icon announcement" style="border-top-style: solid; border-top-color: #d9534f;">
            <i class="x icon" style="color: #d9534f;"></i>
            <div class="content">
                <div class="header">{$ERROR_TITLE}</div>
                {$ERROR}
                <br />
                <b><a href="{$RETRY_LINK}">{$RETRY_TEXT}</a></b>
            </div>
        </div>
    {else if isset($SUCCESS)}
        <div class="ui message icon announcement" style="border-top-style: solid; border-top-color: #5cb85c;">
            <i class="check icon" style="color: #5cb85c;"></i>
            <div class="content">
                <div class="header">{$SUCCESS_TITLE}</div>
                {$SUCCESS}
                <br />
                <b><a href="{$LOGIN_LINK}">{$LOGIN_TEXT}</a></b>
            </div>
        </div>
    {/if}
{/if}

{include file='footer.tpl'}