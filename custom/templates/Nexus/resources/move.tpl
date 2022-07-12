{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="ui container">
    <div class="ui padded segment">
        <h3>{$MOVE_RESOURCE}</h3>

        {if !isset($NO_CATEGORIES)}
            <form action="" method="post" class="ui form">
                <div class="field">
                    <label for="InputCategory">{$MOVE_TO}</label>
                    <select class="ui selection dropdown" name="category_id" id="InputCategory">
                        {foreach from=$CATEGORIES item=category}
                            <option value="{$category->id}">{$category->name|escape}</option>
                        {/foreach}
                    </select>
                </div>

                <div class="form-group">
                    <input type="hidden" name="token" value="{$TOKEN}">
                    <input type="submit" class="ui blue button" value="{$SUBMIT}">
                    <a class="ui red button" href="{$CANCEL_LINK}"
                        onclick="return confirm('{$CONFIRM_CANCEL}')">{$CANCEL}</a>
                </div>
            </form>
        {else}
            <div class="ui negative message">{$NO_CATEGORIES}</div>
        {/if}
    </div>
</div>

{include file='footer.tpl'}