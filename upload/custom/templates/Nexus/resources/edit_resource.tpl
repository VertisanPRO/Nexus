{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="ui container">
    <div class="ui padded segment">
        <h3>{$EDITING_RESOURCE}</h3>

        {if isset($ERRORS)}
            <div class="ui negative message">
                {foreach from=$ERRORS item=error}
                    {$error}<br />
                {/foreach}
            </div>
        {/if}

        <form action="" method="post" class="ui form">
            <div class="field">
                <label for="inputTitle">{$NAME}</label>
                <input type="text" id="inputTitle" name="title" placeholder="{$NAME}" value="{$RESOURCE_NAME}">
            </div>
            
            <div class="field">
                <label for="inputShort_description">{$SHORT_DESCRIPTION}</label>
                <input type="text" id="inputShort_description" name="short_description" placeholder="{$SHORT_DESCRIPTION}" value="{$RESOURCE_SHORT_DESCRIPTION}">
            </div>

            {if isset($MARKDOWN)}
                <div class="field">
                    <label for="markdown">{$DESCRIPTION}</label>
                    <textarea style="width:100%" id="markdown" name="description" rows="20"></textarea>
                    <span class="res right floated"><i data-toggle="popover" data-placement="top" data-html="true" data-content="{$MARKDOWN_HELP}" class="fa fa-question-circle text-info" aria-hidden="true"></i></span>
                </div>
            {else}
                <div class="field">
                    <label for="editor">{$DESCRIPTION}</label>
                    <textarea name="description" id="editor" rows="3">{$RESOURCE_DESCRIPTION}</textarea>
                </div>
            {/if}

            <div class="field">
                <label for="inputContributors">{$CONTRIBUTORS}</label>
                <input type="text" name="contributors" id="inputContributors" placeholder="{$CONTRIBUTORS}" value="{$RESOURCE_CONTRIBUTORS}">
            </div>

            {if isset($PRICE)}
                <div class="field" id="priceFormGroup">
                    <label for="inputPrice">{$PRICE}</label>
                    <div class="ui right labeled input">
                        <input type="number" step="0.01" min="0.01" id="inputPrice" name="price" value="{$RESOURCE_PRICE}">
                        <div class="ui basic label">
                            {$CURRENCY}
                        </div>
                    </div>
                </div>
            {/if}

            <input type="hidden" name="token" value="{$TOKEN}">
            <input type="submit" class="ui blue button" value="{$SUBMIT}">
            <a class="ui red button" href="{$CANCEL_LINK}" onclick="return confirm('{$CONFIRM_CANCEL}')">{$CANCEL}</a>
        </form>
    </div>
</div>

{include file='footer.tpl'}
