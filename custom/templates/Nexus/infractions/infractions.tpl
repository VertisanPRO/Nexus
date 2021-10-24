{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="ui container">
  <div class="ui padded segment">
    <h2 style="display:inline;">{$INFRACTIONS}</h2>
	
	{if isset($INFRACTIONS_LIST)}
			<table class="ui fixed single line selectable unstackable small padded res table">
				<colgroup>
					<col span="1" style="width: 20%;">
					<col span="1" style="width: 15%;">
					<col span="1" style="width: 15%">
					<col span="1" style="width: 20%">
					<col span="1" style="width: 30%">
					<!--<col span="1" style="width: 10%">-->
				</colgroup>

				<thead>
				<tr>
					<th>{$USERNAME}</th>
					<th>{$STAFF_MEMBER}</th>
					<th>{$ISSUED}</th>
					<th>{$ACTION}</th>
					<th>{$REASON}</th>
					<!--<th></th>-->
				</tr>
				</thead>

				<tbody>
                {foreach from=$INFRACTIONS_LIST item=infraction}
					<tr>
						<td><img style="max-height:30px; max-width:30px;" class="ui avatar image" src="{$infraction.avatar}"> <a href="{if !empty($infraction.profile)}{$infraction.profile}{else}#{/if}" style="{$infraction.username_style}">{$infraction.username}</a></td>
						<td><img style="max-height:30px; max-width:30px;" class="ui avatar image" src="{$infraction.staff_member_avatar}"> <a href="{if !empty($infraction.staff_member_link)}{$infraction.staff_member_link}{else}#{/if}" style="{$infraction.staff_member_style}">{$infraction.staff_member}</a></td>
						<td><span data-toggle="tooltip" title="{$infraction.issued_full}">{$infraction.issued}</span></td>
						<td>
                            {if $infraction.action_id == 1 || $infraction.action_id == 2}
								<span class="ui red label">{$infraction.action}</span>
                            {elseif $infraction.action_id == 3 || $infraction.action_id == 4}
								<span class="ui yellow label">{$infraction.action}</span>
                            {elseif $infraction.action_id == 5}
								<span class="ui yellow label">{$infraction.action}</span>
                            {elseif $infraction.action_id == 6}
								<span class="ui grey label">{$infraction.action}</span>
                            {else}
								<span class="ui label">{$infraction.action}</span>
                            {/if}

                            {if $infraction.action_id lte 4 || $infraction.action_id eq 6}
                                {if $infraction.revoked == 1}
									<span data-toggle="tooltip" title="{$infraction.expires_full}" class="badge badge-success">{$infraction.revoked_full}</span>
                                {else}
									<span data-toggle="tooltip" title="{$infraction.expires_full}" class="badge badge-danger">{$infraction.revoked_full}</span>
                                {/if}
                            {/if}
						</td>
						<td>{$infraction.reason}</td>
						<!--<td><a href="{$infraction.view_link}" class="ui small blue button">{$VIEW} &raquo;</a></td>-->
					</tr>
                {/foreach}
				</tbody>
			</table>

	  {$PAGINATION}	
	{else}
		<br /><br /><div class="alert alert-info">{$NO_INFRACTIONS}</div>
	{/if}
  </div>
</div>

{include file='footer.tpl'}