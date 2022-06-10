{if isset($FRIENDS)}

	{if isset($FRIENDS.button)}
		{if ($FRIENDS.button.action == 'add_friend')}
			{assign var='FRIENDS_BUTTON_CLASS' value='ui tiny green labeled icon button'}
			{assign var='FRIENDS_BUTTON_ICON' value='<i class="plus icon"></i>'}
		{else if ($FRIENDS.button.action == 'remove_friend')}
			{assign var='FRIENDS_BUTTON_CLASS' value='ui tiny red labeled icon button'}
			{assign var='FRIENDS_BUTTON_ICON' value='<i class="times icon"></i>'}
		{else if ($FRIENDS.button.action == 'accept_request')}
			{assign var='FRIENDS_BUTTON_CLASS' value='ui tiny olive labeled icon button'}
			{assign var='FRIENDS_BUTTON_ICON' value='<i class="check icon"></i>'}
		{else if ($FRIENDS.button.action == 'cancel_request')}
			{assign var='FRIENDS_BUTTON_CLASS' value='ui tiny orange labeled icon button'}
			{assign var='FRIENDS_BUTTON_ICON' value='<i class="minus icon"></i>'}
		{/if}
	{/if}

	<h3 class="ui header" style="display: flex; align-items: center; justify-content: space-between;">
		{$FRIENDS.title}
		{if isset($FRIENDS.button)}
			<form action="" method="post" id="form-friend" style="float: right;">
				<input type="hidden" name="token" value="{$TOKEN}">
				<input type="hidden" name="action" value="{$FRIENDS.button.action}">
				<button type="submit" class="{$FRIENDS_BUTTON_CLASS}">{$FRIENDS_BUTTON_ICON} {$FRIENDS.button.text}</button>
			</form>
		{/if}
	</h3>

	{if !empty($FRIENDS.list)}
		<div class="ui stackable grid">
			<div class="ui row" style="margin-top: 1rem;">
				{foreach from=$FRIENDS.list item=$friend}
					<div class="four wide column center aligned">
						<img class="ui tiny image avatar" src="{$friend.avatar}">
						<h3 style="margin-top: 0.5rem; margin-bottom: 2rem;">
							<a style="{$friend.style}" href="{$friend.profile}">{$friend.nickname}</a>
						</h3>
					</div>
				{/foreach}
			</div>
		</div>
	{else}
		<p>{$FRIENDS.no_friends}</p>
	{/if}

{/if}