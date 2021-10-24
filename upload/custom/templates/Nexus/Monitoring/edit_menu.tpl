<div class="ui inverted{if !isset($VIEW_SERVER_URL)} four {else} five {/if}item menu">
	<a href="{$DESC_URL}" class="{if !isset($ROUTE)}active {/if}item">
		{$DESC_LABEL}
	</a>
	<a href="{$BANNER_URL}" class="{if $ROUTE == 'banner'}active {/if}item">
		{$BANNER_LABEL}
	</a>
	<a href="{$REWARD_URL}" class="{if $ROUTE == 'reward'}active {/if}item">
		{$REWARD_LABEL}
	</a>
	<a href="{$SPONSOR_URL}" class="{if $ROUTE == 'sponsor'}active {/if}item">
		{$SPONSOR_LABEL}
	</a>
	{if isset($VIEW_SERVER_URL)}
		<a href="{$VIEW_SERVER_URL}" class="item">
			{$GO_TO_SERVER_LABEL}
		</a>
	{/if}
</div>