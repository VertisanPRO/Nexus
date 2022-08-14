{include file='header.tpl'}
{include file='navbar.tpl'}

<h2 class="ui header">
    {$EDITING_POST}
</h2>

{if isset($ERRORS)}
    <div class="ui message icon announcement" style="border-top-style: solid; border-top-color: #d9534f;">
        <i class="x icon" style="color: #d9534f;"></i>
        <div class="content">
            <div class="header">{$ERROR_TITLE}</div>
            {foreach from=$ERRORS item=error}
                <li>{$error}</li>
            {/foreach}
        </div>
    </div>
{/if}

<div class="ui padded segment" id="post-edit">
    <div class="ui stackable grid">
        <div class="ui centered row">
            <div class="ui sixteen wide tablet twelve wide computer column">
                <form class="ui form" action="" method="post" id="form-post-edit">
                    <div class="field">
                        <label for="editor">{$CONTENT_LABEL}</label>
                        <textarea name="content" id="editor"></textarea>
                    </div>
                    <input type="hidden" name="token" value="{$TOKEN}">
                    <input type="submit" class="ui primary button" value="{$SUBMIT}">
                    <a class="ui negative button" href="{$CANCEL_LINK}"
                        onclick="return confirm('{$CONFIRM_CANCEL}')">{$CANCEL}</a>
                </form>
            </div>
        </div>
    </div>
</div>

{include file='footer.tpl'}