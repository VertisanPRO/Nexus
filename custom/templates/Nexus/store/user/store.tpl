{include file='header.tpl'}
{include file='navbar.tpl'}

<h2 class="ui header">
    {$TITLE}
</h2>

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
            <ul class="list">
                {foreach from=$ERRORS item=error}
                    <li>{$error}</li>
                {/foreach}
            </ul>
        </div>
    </div>
{/if}

<div class="ui stackable grid" id="user">
    <div class="ui centered row">
        <div class="ui six wide tablet four wide computer column">
            {include file='user/navigation.tpl'}
        </div>
        <div class="ui ten wide tablet twelve wide computer column">
            <div class="ui segment">
                <h3 class="ui header">{$STORE}</h3>

                <p>{$CREDITS}: {$CURRENCY_SYMBOL}{$CREDITS_VALUE} {$CURRENCY}</p>
            </div>

            <div class="ui segment">
                <h3 class="ui header">{$MY_TRANSACTIONS}</h3>
                {nocache}
                {if count($TRANSACTIONS_LIST)}
                    <table class="ui fixed single line selectable unstackable small padded res table">
                        <thead>
                            <tr>
                                <th>{$TRANSACTION}</th>
                                <th>{$AMOUNT}</th>
                                <th>{$DATE}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$TRANSACTIONS_LIST item=transaction}
                                <tr>
                                    <td>{$transaction.transaction}</td>
                                    <td>{$transaction.currency_symbol}{$transaction.amount} {$transaction.currency}</td>
                                    <td><span data-toggle="tooltip"
                                            data-content="{$transaction.date_full}">{$transaction.date_friendly}</span></td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                {else}
                    <div class="ui info message">
                        <div class="content">
                            {$NO_TRANSACTIONS}
                        </div>
                    </div>
                {/if}
                {/nocache}
            </div>
        </div>
    </div>
</div>

{include file='footer.tpl'}