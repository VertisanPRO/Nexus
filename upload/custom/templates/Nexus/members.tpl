{include file='header.tpl'}
{include file='navbar.tpl'}

<h2 class="ui header">{$MEMBERS_TITLE}</h2>

<div class="ui stackable grid">
  <div class="ui row">
    <div class="ui {if count($WIDGETS)}ten wide tablet twelve wide computer{else}sixteen wide{/if} column">
	
	  <div class="ui segment">
		<div class="ui secondary  menu">
		  <a class="item" href="{$ALL_LINK}">
			{$DISPLAY_ALL}
		  </a>
		  {foreach from=$GROUPS item=groups}
			<a class="item" href="{$groups.link}">
			  {$groups.name}
			</a>
		  {/foreach}
		</div>
	
		<table id="example" class="ui table dataTables-users" style="width:100%">
		  <thead>
			<tr>
			  <th>{$USERNAME}</th>
			  <th>{$GROUP}</th>
			  <th>{$CREATED}</th>
			</tr>
		  </thead>
		  <tbody>
			{foreach from=$MEMBERS item=member}
			  <tr>
			    <td><a href="{$member.profile}"><img src="{$member.avatar}" class="ui avatar image" style="height:35px; width:35px;" alt="{$member.nickname}" /></a> <a style="{$member.style}" href="{$member.profile}">{$member.nickname}</a></td>
				<td>{foreach from=$member.groups item=group}{$group}{/foreach}</td>
				<td>{$member.joined}</td>
			  </tr>
			{/foreach}
		  </tbody>
		</table>
	  </div>
	
	</div>
    {if count($WIDGETS)}
      <div class="ui six wide tablet four wide computer column">
        {foreach from=$WIDGETS item=widget}
          {$widget}
        {/foreach}
      </div>
    {/if}
	
  </div>
</div>

{include file='footer.tpl'}