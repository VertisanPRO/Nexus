{include file='header.tpl'}
{include file='navbar.tpl'}

<h2 class="ui header">
    {$TITLE}
</h2>

<div class="ui stackable grid" id="user">
    <div class="ui centered row">
        <div class="ui six wide tablet four wide computer column">
            {include file='user/navigation.tpl'}
        </div>
        <div class="ui ten wide tablet twelve wide computer column">
            <div class="ui segment">
                <h3 class="ui header" style="display:inline">{$RESOURCES}</h3>

                <div class="ui right floated">
                    <a href="{$MY_RESOURCES_LINK}" class="ui blue button">{$MY_RESOURCES}</a>
                </div>

                <div class="ui divider"></div>

                {if isset($SUCCESS)}
                    <div class="ui positive message">
                        {$SUCCESS}
                    </div>
                {/if}
                {if isset($ERROR)}
                    <div class="ui negative message">
                        {$ERROR}
                    </div>
                {/if}

                <div class="ui top attached tabular menu">
                    <a class="item active" data-tab="first">{$SETTINGS}</a>
                    <a class="item" data-tab="second">{$PURCHASED_RESOURCES}</a>
                    <a class="item" data-tab="third">{$MANAGE_LICENSES}</a>
                </div>
                <div class="ui bottom attached tab segment active" data-tab="first">
                    <form action="" method="post" class="ui form">
                        <div class="field">
                            <label for="inputPaypalEmail" style="display:inline">{$PAYPAL_EMAIL_ADDRESS}</label> <span class="ui small blue icon label" data-toggle="tooltip" data-title="{$INFO}" data-content="{$PAYPAL_EMAIL_ADDRESS_INFO}"><i class="fa fa-question-circle"></i></span><br/>
                            <input type="text" id="inputPaypalEmail" name="paypal_email" placeholder="{$PAYPAL_EMAIL_ADDRESS}" value="{$PAYPAL_EMAIL_ADDRESS_VALUE}">
                        </div>
                        <div class="field">
                            <input type="hidden" name="token" value="{$TOKEN}">
                            <input type="submit" class="ui blue button" value="{$SUBMIT}">
                        </div>
                    </form>
                </div>
                <div class="ui bottom attached tab segment" data-tab="second">
                    {if count($PURCHASED_RESOURCES_VALUE)}
                        <table class="ui fixed single line selectable unstackable small padded res table">
                            <tbody>
                            {foreach from=$PURCHASED_RESOURCES_VALUE item=resource}
                                <tr>
                                    <td class="eight wide">
                                        <a href="{$resource.link}">{$resource.name}</a> <small>{$resource.latest_version}</small>
                                    </td>
                                    <td class="eight wide">
                                        <div class="res right floated">
                                            <a href="{$resource.author_link}" style="{$resource.author_style}"><img src="{$resource.author_avatar}" class="ui avatar image" style="max-height:25px;max-width:25px;" alt="{$resource.author_username}"/> {$resource.author_nickname}</a>
                                        </div>
                                    </td>
                                </tr>
                            {/foreach}
                            </tbody>
                        </table>
                    {else}
                        <div class="ui blue message">{$NO_PURCHASED_RESOURCES}</div>
                    {/if}
                </div>
                <div class="ui bottom attached tab segment" data-tab="third">
                    {if count($PREMIUM_RESOURCES)}
                        {$SELECT_RESOURCE}
                        <table class="ui fixed single line selectable unstackable small padded res table">
                            <tbody>
                            {foreach from=$PREMIUM_RESOURCES item=resource}
                                <tr>
                                    <td class="eight wide">
                                        <a href="{$resource.link}">{$resource.name}</a> <small>{$resource.latest_version}</small>
                                    </td>
                                    <td class="eight wide">
                                        <div class="res right floated">
                                            {$resource.license_count}
                                        </div>
                                    </td>
                                </tr>
                            {/foreach}
                            </tbody>
                        </table>
                    {else}
                        <div class="ui blue message">{$NO_PREMIUM_RESOURCES}</div>
                    {/if}
                </div>
            </div>
        </div>
    </div>
</div>
{include file='footer.tpl'}