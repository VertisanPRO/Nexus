{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="card-body">
    {if isset($CONFIGURE)}
        <div class="ui info message">{$CONFIGURE}</div>
    {elseif isset($ERROR)}
        <div class="ui negative message">{$ERROR}</div>
    {else}
        <h2 class="ui header">
            {$STATUS}
        </h2>

        <div class="ui stackable grid">
            <div class="stretched row">
                <div class="sixteen wide mobile ten wide tablet twelve wide computer column">
                    <div class="ui padded segment">
                        {* Top voters *}
                        <h2 style="display:inline;">{$TOP_VOTERS}</h2>
                        <div class="float-right" style="display: inline; float: right;">
                            <div class="ui top right pointing dropdown small primary button">
                                <span class="text">{$ORDER}</span>
                                <i class="dropdown icon"></i>
                                <div class="menu">
                                    <a class="item" href="{$TODAY_LINK}">{$TODAY}</a>
                                    <a class="item" href="{$THIS_WEEK_LINK}">{$THIS_WEEK}</a>
                                    <a class="item" href="{$THIS_MONTH_LINK}">{$THIS_MONTH}</a>
                                    <a class="item" href="{$ALL_TIME_LINK}">{$ALL_TIME}</a>
                                </div>
                            </div>
                        </div>
                        <br /><br />
                        {if count($RESULTS)}
                            <table class="ui stackable table">
                                <colgroup>
                                    <col span="1" style="width: 40%;">
                                    <col span="1" style="width: 15%;">
                                    <col span="1" style="width: 15%">
                                    <col span="1" style="width: 15%">
                                    <col span="1" style="width: 15%">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th>{$USERNAME}</th>
                                    <th>{$DAILY_VOTES}</th>
                                    <th>{$WEEKLY_VOTES}</th>
                                    <th>{$MONTHLY_VOTES}</th>
                                    <th>{$ALL_TIME_VOTES}</th>
                                </tr>
                                </thead>
                                <tbody>
                                {foreach from=$RESULTS item=result}
                                    <tr>
                                        <td>{if $result.exists eq true}<img src="{$result.avatar}" style="max-height:25px;max-width:25px;" class="rounded-circle" alt="{$result.name}" /> <a href="{$result.profile}" style="{$result.user_style}">{$result.nickname}</a>{else}<img src="{$result.avatar}" style="max-height:25px;max-width:25px;" class="rounded-circle" alt="{$result.name}" /> {$result.name}{/if}</td>
                                        <td>{$result.daily}</td>
                                        <td>{$result.weekly}</td>
                                        <td>{$result.monthly}</td>
                                        <td>{$result.alltime}</td>
                                    </tr>
                                {/foreach}
                                </tbody>
                            </table>
                        {/if}
                    </div>
                </div>
                
                <div class="sixteen wide mobile six wide tablet four wide computer column">
                    {* Display sites *}
                    <div class="ui padded segment">
                        <h3>{$VOTE_SITES}</h3>
                        {foreach from=$VOTE_SITES_LIST item=site}
                            <a href="{$site.site}" target="_blank" rel="noopener nofollow" class="ui primary button fluid">{$site.name}</a><br />
                        {/foreach}
                    </div>
                </div>
            </div>
        </div>
    </div>
{/if}

{include file='footer.tpl'}
