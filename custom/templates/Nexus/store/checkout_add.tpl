{include file='header.tpl'}
{include file='navbar.tpl'}
<div class="ui stackable grid">
    <div class="ui centered row">

        {if count($WIDGETS_LEFT)}
            <div class="ui six wide tablet four wide computer column">
                {foreach from=$WIDGETS_LEFT item=widget}
                    {$widget}
                {/foreach}
            </div>
        {/if}

        <div
            class="ui {if count($WIDGETS_LEFT) && count($WIDGETS_RIGHT) }four wide tablet eight wide computer{elseif count($WIDGETS_LEFT) || count($WIDGETS_RIGHT)}ten wide tablet twelve wide computer{else}sixteen wide{/if} column">
            <div class="ui segment">

                <h1 style="display:inline;">{$STORE} &raquo; {$PRODUCT_NAME}</h1>
                {include file='store/navbar.tpl'}

                {if isset($SUCCESS)}
                    <div class="ui message icon announcement" style="border-top-style: solid; border-top-color: #5cb85c;">
                        <i class="check icon" style="color: #5cb85c;"></i>
                        <div class="content">
                            {$SUCCESS}
                        </div>
                    </div>
                {/if}

                {if isset($ERRORS)}
                    <div class="ui message icon announcement" style="border-top-style: solid; border-top-color: #d9534f;">
                        <i class="x icon" style="color: #d9534f;"></i>
                        <div class="content">
                            {foreach from=$ERRORS item=error}
                                {$error}<br />
                            {/foreach}
                        </div>
                    </div>
                {/if}

                <form class="ui form" action="" method="post" id="forms">
                    <h3>{$PRODUCT_NAME}</h3>
                    <div class="ui divider"></div>

                    {foreach from=$PRODUCT_FIELDS item=field}
                        <div class="field">
                            <label for="{$field.id}">{$field.description} {if $field.required} <span
                                    class="text-danger"><strong>*</strong></span>{/if}</label>

                            {if $field.type == "1"}
                                <input type="text" name="{$field.id}" id="{$field.id}" value="{$field.value}"
                                    placeholder="{$field.description}" {if $field.required}required{/if}>
                            {elseif $field.type == "2"}
                                <select class="ui fluid dropdown" name="{$field.id}" id="{$field.id}"
                                    {if $field.required}required{/if}>
                                    {foreach from=$field.options item=option}
                                        <option value="{$option}" {if $option eq $field.value} selected{/if}>{$option}</option>
                                    {/foreach}
                                </select>
                            {elseif $field.type == "3"}
                                <textarea name="{$field.id}" id="{$field.id}"
                                    {if $field.required}required{/if}>{$field.value}</textarea>
                            {elseif $field.type == "4"}
                                <input type="number" name="{$field.id}" id="{$field.id}" value="{$field.value}"
                                    placeholder="{$field.description}" {if $field.required}required{/if}>
                            {elseif $field.type == "5"}
                                <input type="email" name="{$field.id}" id="{$field.id}" value="{$field.value}"
                                    placeholder="{$field.description}" {if $field.required}required{/if}>
                            {elseif $field.type == "6"}
                                {foreach from=$field.options item=option}
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="{$field.id}" value="{$option}"
                                                {if $field.required}required{/if}>
                                            <label>{$option}</label>
                                        </div>
                                    </div>
                                {/foreach}
                            {elseif $field.type == "7"}
                                {foreach from=$field.options item=option}
                                    <div class="field">
                                        <div class="ui checkbox">
                                            <input type="checkbox" name="{$field.id}[]" value="{$option}">
                                            <label>{$option}</label>
                                        </div>
                                    </div>
                                {/foreach}
                            {/if}
                        </div>
                    {/foreach}

                    <div class="field">
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <input type="submit" class="ui green button" value="{$CONTINUE}">
                    </div>

                </form>

            </div>
        </div>

        {if count($WIDGETS_RIGHT)}
            {if isset($LOGGED_IN_USER) && isset($SHOW_CREDITS_AMOUNT)}
                <div class="ui fluid card" id="widget-store-account">
                    <div class="content">
                        <h4 class="ui header">{$ACCOUNT}</h4>
                        <div class="description">
                            <div class="ui list">
                                <div class="item">
                                    <span class="text">{$CREDITS}</span>
                                    <div class="description right floated"><b>{$CURRENCY_SYMBOL}{$CREDITS_VALUE} {$CURRENCY}</b>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            {/if}
            <div class="ui six wide tablet four wide computer column">
                {foreach from=$WIDGETS_RIGHT item=widget}
                    {$widget}
                {/foreach}
            </div>
        {/if}

    </div>
</div>

{include file='footer.tpl'}