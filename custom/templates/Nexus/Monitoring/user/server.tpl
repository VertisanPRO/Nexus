{include file='header.tpl'}
{include file='navbar.tpl'}

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

<div class="ui stackable grid">
	<div class="ui centered row">
		<div class="ui six wide tablet four wide computer column">
			{include file='user/navigation.tpl'}
		</div>
		<div class="ui ten wide tablet twelve wide computer column">

			{if count($SERVERS)}
				{foreach from=$SERVERS item=server}
					<table class="ui {if $server.sponsor == 1} {$server.table_color}{/if} table">


						<thead>
							<tr>
								<th colspan="6">
									<a href="{$server.view_link}">
										<div class="ui centered header">{$server.name}</div>
									</a>
								</th>
							</tr>
						</thead>
					</table>
				{/foreach}
			{else}
				<div class="ui header">{$NO_USER_SERVERS}</div>
			{/if}

		</div>
	</div>
</div>



{include file='footer.tpl'}