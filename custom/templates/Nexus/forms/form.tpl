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
                <h2 class="ui header">{$TITLE}</h2>
                <hr>

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
                                <li>{$error}</li>
                            {/foreach}
                        </div>
                    </div>
                {/if}

                {if isset($CONTENT)}
                    {$CONTENT}
                    </br></br>
                {/if}

                <form class="ui form" action="" method="post" id="forms" enctype="multipart/form-data">
                    {foreach from=$FIELDS item=field}
                        <div class="field">
                            {if $field.type == 5}
                                <hr />
                            {elseif $field.type == 4}
                                {', '|implode:$field.options}
                            {else}
                                <label for="{$field.id}">{$field.name} {if $field.required} <span
                                        class="text-danger"><strong>*</strong></span>{/if}
                                    {if $field.info}
                                        <div class="ui icon mini blue button" data-tooltip="{$field.info}" data-position="top left"
                                            data-inverted="" data-variation="mini">
                                            <i class="question circle icon"></i>
                                        </div>
                                    {/if}
                                </label>
                            {/if}
                            {if $field.type == "1"}
                                <input type="text" name="{$field.id}" id="{$field.id}" value="{$field.value}"
                                    placeholder="{$field.name}" {if $field.required}required{/if}>
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
                            {elseif $field.type == "6"}
                                <input type="number" name="{$field.id}" id="{$field.id}" value="{$field.value}"
                                    placeholder="{$field.name}" {if $field.required}required{/if}>
                            {elseif $field.type == "7"}
                                <input type="email" name="{$field.id}" id="{$field.id}" value="{$field.value}"
                                    placeholder="{$field.name}" {if $field.required}required{/if}>
                            {elseif $field.type == "8"}
                                {foreach from=$field.options item=option}
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="{$field.id}" value="{$option}"
                                                {if $field.required}required{/if}>
                                            <label>{$option}</label>
                                        </div>
                                    </div>
                                {/foreach}
                            {elseif $field.type == "9"}
                                {foreach from=$field.options item=option}
                                    <div class="field">
                                        <div class="ui checkbox">
                                            <input type="checkbox" name="{$field.id}[]" value="{$option}">
                                            <label>{$option}</label>
                                        </div>
                                    </div>
                                {/foreach}
                            {elseif $field.type == "10"}
                                <div class="field">
                                    <input type="file" class="inputFile" name="{$field.id}" id="uploadFileButton{$field.id}"
                                        value="{$field.value}" hidden
                                        onchange="$('#fileName{$field.id}').html(this.files[0].name);" />
                                    <label class="ui icon labeled default button" for="uploadFileButton{$field.id}">
                                        <i class="ui cloud upload icon"></i> <span
                                            id="fileName{$field.id}">{$CHOOSE_FILE}</span>
                                    </label>
                                </div>
                            {/if}
                        </div>
                    {/foreach}

                    {if $CAPTCHA}
                        <div class="field">
                            {$CAPTCHA}
                        </div>
                    {/if}

                    <input type="hidden" name="token" value="{$TOKEN}">
                    <input type="submit" class="ui primary button" value="{$SUBMIT}">
                </form>
            </div>
        </div>

        {if count($WIDGETS_RIGHT)}
            <div class="ui six wide tablet four wide computer column">
                {foreach from=$WIDGETS_RIGHT item=widget}
                    {$widget}
                {/foreach}
            </div>
        {/if}

    </div>
</div>

{include file='footer.tpl'}