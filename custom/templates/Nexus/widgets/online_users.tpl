<div class="ui fluid card" id="widget-online-users">
	<div class="content">
		<a class="ui {if isset($WIDGET_LABEL_COLOR)} {$WIDGET_LABEL_COLOR}{else} violet{/if} ribbon label" style="margin-bottom: 10px;"><i
				class="fas fa-users"></i> {$ONLINE_USERS}</a>
		<div class="description">
			{if isset($ONLINE_USERS_LIST)}
				{foreach from=$ONLINE_USERS_LIST name=online_users_arr item=user}
					<a class="ui image label" href="{$user.profile}" data-poload="{$USER_INFO_URL}{$user.id}">
						<img src="{$user.avatar}" alt="{$user.username}">{$user.nickname}
					</a>
				{/foreach}
			{else}
				{$NO_USERS_ONLINE}
			{/if}
		</div>
	</div>
	<div class="extra content">
		{$TOTAL_ONLINE_USERS}
	</div>
</div>