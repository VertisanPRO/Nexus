{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="ui container">
    <div class="ui padded segment">
        <h2 style="display:inline;">{$PURCHASING_RESOURCE}</h2>

        <div class="ui divider"></div>

        <div class="ui blue message">{$PURCHASE_CANCELLED}</div>

        <div class="ui divider"></div>

        <a href="{$BACK_LINK}" class="ui blue button">{$BACK}</a>
    </div>
</div>

{include file='footer.tpl'}