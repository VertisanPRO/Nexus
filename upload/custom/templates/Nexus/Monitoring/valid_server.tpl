{if isset($SUCCESS)}
	<div class="ui success icon message">
		<i class="check icon"></i>
		<div class="content">
			{$SUCCESS}
		</div>
	</div>
{/if}

{if isset($ERRORS)}
	<div class="ui negative icon message">
		<i class="x icon"></i>
		<div class="content">
			{foreach from=$ERRORS item=error}
				{$error}<br />
			{/foreach}
		</div>
	</div>
{/if}

{if $SERVER_STATUS == 10}
	<div class="ui negative icon message">
		<i class="x icon"></i>
		<div class="content">
			{$SERVER_ALERT}
			<form action="" method="POST">
				<input type="hidden" name="valid_server_id" value="{$ID}">
				<input type="submit" class="ui button" value="{$SERVER_CONFIRM}">
			</form>
		</div>
	</div>

{/if}