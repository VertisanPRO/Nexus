{include file='header.tpl'}
{include file='navbar.tpl'}

<h2 class="ui header">
    {$FORGOT_PASSWORD}
    <div class="sub header">{$FORGOT_PASSWORD_INSTRUCTIONS}</div>
</h2>

{if isset($ERROR)}
    <div class="ui message icon announcement" style="border-top-style: solid; border-top-color: #d9534f;">
        <i class="x icon" style="color: #d9534f;"></i>
        <div class="content">
            <div class="header">{$ERROR_TITLE}</div>
            {$ERROR}
        </div>
    </div>
{else if isset($SUCCESS)}
    <div class="ui message icon announcement" style="border-top-style: solid; border-top-color: #5cb85c;">
        <i class="check icon" style="color: #5cb85c;"></i>
        <div class="content">
            <div class="header">{$SUCCESS_TITLE}</div>
            {$SUCCESS}
        </div>
    </div>
{/if}

<div class="ui padded segment" id="forgot-password">
    <div class="ui stackable grid">
        <div class="ui centered row">
            <div class="ui sixteen wide tablet ten wide computer column">
                <form class="ui form" action="" method="post" id="form-forgot-password">
                    <div class="field">
                        <label for="inputEmail">{$EMAIL_ADDRESS}</label>
                        <input type="email" id="inputEmail" name="email" placeholder="{$EMAIL_ADDRESS}" tabindex="1">
                    </div>
                    <input type="hidden" name="token" value="{$TOKEN}">
                    <input type="submit" class="ui primary button" value="{$SUBMIT}" tabindex="2">
                </form>
            </div>
        </div>
    </div>
</div>

{include file='footer.tpl'}