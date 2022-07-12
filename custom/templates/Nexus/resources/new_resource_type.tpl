{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="ui container">
    <div class="ui padded segment">
        <h2 style="display:inline;">{$NEW_RESOURCE}</h2>

        <div class="res right floated">
            <a href="{$CANCEL_LINK}" class="ui red button" onclick="return confirm('{$CONFIRM_CANCEL}');">{$CANCEL}</a>
        </div>
        <div class="ui divider"></div>

        {if isset($ERROR)}
            <div class="ui negative message">
                {$ERROR}
            </div>
        {/if}

        {if isset($NO_PAYMENT_EMAIL)}
            <div class="ui yellow message">
                {$NO_PAYMENT_EMAIL}
            </div>
        {/if}

        <form action="" method="post" class="ui form">
            <div class="field">
                <label for="inputType">{$TYPE}</label>
                <select class="ui selection dropdown" name="type" id="inputType">
                    <option value="free">{$FREE_RESOURCE}</option>
                    <option value="premium">{$PREMIUM_RESOURCE}</option>
                </select>
            </div>

            <div class="field" id="priceFormGroup">
                <label for="inputPrice">{$PREMIUM_RESOURCE_PRICE}</label>
                <div class="ui right labeled input">
                    <input type="number" step="0.01" min="0.01" id="inputPrice" name="price" value="{$PRICE}">
                    <div class="ui basic label">
                        {$CURRENCY}
                    </div>
                </div>
            </div>

            <div class="form-group">
                <input type="hidden" name="token" value="{$TOKEN}">
                <input type="submit" class="ui blue button" value="{$SUBMIT}">
            </div>

        </form>
    </div>
</div>

{include file='footer.tpl'}