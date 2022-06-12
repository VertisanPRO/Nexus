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
                <h3 class="ui header">{$SUBMISSIONS}</h3>

                {nocache}
                {if count($SUBMISSIONS_LIST)}
                    <table class="ui fixed single line selectable unstackable small padded res table">
                        <thead>
                            <tr>
                                <th>{$FORM}</th>
                                <th>{$UPDATED_BY}</th>
                                <th>{$STATUS}</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$SUBMISSIONS_LIST item=submission}
                                <tr>
                                    <td>{$submission.form_name}</td>
                                    <td>
                                        {if !empty($submission.updated_by_avatar)}
                                            <a href="{$submission.updated_by_profile}" style="{$submission.updated_by_style}"><img
                                                    src="{$submission.updated_by_avatar}" style="max-height:25px;max-width:25px;"
                                                    alt="{$submission.updated_by_name}" class="ui mini avatar image">
                                                {$submission.updated_by_name}</a>
                                        {else}
                                            <i class="fa fa-user"></i> {$submission.updated_by_name}:
                                        {/if}
                                        <br /><span data-toggle="tooltip"
                                            data-original-title="{$submission.reported_at_full}">{$submission.updated_at}</span>
                                    </td>
                                    <td>
                                        <h4>{$submission.status}</h4>
                                    </td>
                                    <td><a href="{$submission.link}" class="ui right floated small primary button float">{$VIEW}
                                            &raquo;</a></td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                    {$PAGINATION}
                {else}
                    {$NO_SUBMISSIONS}
                {/if}
                {/nocache}
            </div>
        </div>
    </div>
</div>

{include file='footer.tpl'}