{include file='header.tpl'}
{include file='navbar.tpl'}
{if isset($SUCCESS)}
    <div class="ui message icon announcement" style="border-top-style: solid; border-top-color: #5cb85c;">
        <i class="check icon" style="color: #5cb85c;"></i>
        <div class="content">
            <div class="header">{$SUCCESS_TITLE}</div>
            {$SUCCESS}
        </div>
    </div>
{/if}

{if isset($ERRORS)}
    <div class="ui message icon announcement" style="border-top-style: solid; border-top-color: #d9534f;">
        <i class="x icon" style="color: #d9534f;"></i>
        <div class="content">
            <div class="header">{$ERRORS_TITLE}</div>
            <ul class="list">
                {foreach from=$ERRORS item=error}
                    <li>{$error}</li>
                {/foreach}
            </ul>
        </div>
    </div>
{/if}
<div class="ui stackable grid">

    <div class="ui ten wide tablet twelve wide computer column">
        <div class="ui segment">
            <h2 class="ui header">{$DONATE}</h2>
            <hr>

            {if isset($CONTENT)}
                <p>{$CONTENT}</p>
            {/if}

            <form class="ui form" id="payment_form" action="{$PROCESS_URL}" method="POST">
                <div class="field">
                    <label for="amount">{$AMOUNT} ({$CURRENCY})</label>
                    <input type="number" min="{$MIN_AMOUNT}" name="amount" id="amount" value="10" placeholder="10">
                </div>
                <div class="field">
                    <label for="amount">{$DONATE_AS}</label>
                    <select class="ui selection dropdown" name="anonymous" id="anonymous">
                        {if $LOGGED_IN_USER}
                            <option value="0">{$LOGGED_IN_USER.nickname}</option>
                        {/if}
                        <option value="1">{$ANONYMOUS}</option>
                    </select>
                </div>
                <div class="field">
                    <input type="submit" class="ui fluid positive button" value="PayPal" />
                </div>
            </form>

        </div>
    </div>

    <div class="ui six wide tablet four wide computer column">
        <div class="ui segment">
            <h2 class="ui header" style="display:inline;">{$LATEST_DONATIONS}</h2>
            <hr>
            <div class="description">
                {foreach from=$LATEST_DONATIONS_LIST item=donator}
                    <div class="ui relaxed list">
                        <div class="item">
                            <img class="ui mini circular image" src="{$donator.avatar_url}" alt="{$donator.username}">
                            <div class="content">
                                <a class="header" href="{$donator.profile_url}" data-toggle="popup"
                                    data-position="top left">{$donator.username}</a>
                                <p>${$donator.amount} {$donator.currency}</br><span data-toggle="tooltip"
                                        data-content="{$donator.date}">{$donator.date_rough}</span></p>
                            </div>
                        </div>
                    </div>
                {/foreach}
            </div>

        </div>
    </div>

</div>

{include file='footer.tpl'}