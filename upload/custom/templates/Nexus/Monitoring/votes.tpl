{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="ui stackable grid">
	<div class="ui centered row">

		{if isset($SUCCESS)}
			<div class="ui success icon message">
				<i class="check icon"></i>
				<div class="content">
					{$SUCCESS}
				</div>
			</div>
		{/if}

		{if isset($VOTIFIER_ERROR)}
			<div class="ui warning icon message">
				<i class="x icon"></i>
				<div class="content">
					{$ERROR_VOTIFIER_CONN} ({$VOTIFIER_ERROR})
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

		<br>

	</div>
</div>


<div class="ui stackable grid">

	<div class="twelve wide column">

		<h1 class="ui centered header">{$NAME}</h1>
		<form action="" method="POST">
			<div class="ui form">

				<div class="field">
					<label>{$MC_NAME_LABEL}</label>
					<input type="text" name="mc_name">
				</div>

				<div class="field">
					<div class="{$CAPTCHA_CLASS}" data-sitekey="{$RECAPTCHA}" tabindex="4"></div>
				</div>

				<br>
				<button style="width: 100%;" type="submit" class="ui button">{$VOTE_BUTTON}</i></button>
			</div>
		</form>



		<h1 class="ui centered header">{$LAST_VOTES_LABEL}</h1>
		<table class="ui fixed table">
			<thead>
				<tr>
					<th>{$NAME_LABEL}</th>
					<th>{$VOTES_LABEL}</th>
					<th>{$DATE_LABEL}</th>
				</tr>
			</thead>
			<tbody>
				{foreach from=$VOTES_DATA item=votes}
					<tr>
						<td data-label="Name">{$votes->user_name}</td>
						<td data-label="Votes">{$votes->user_votes}</td>
						<td data-label="Data">{$votes->datetime}</td>
					</tr>
				{/foreach}
			</tbody>
		</table>

	</div>
	{include file='Monitoring/widgets.tpl'}
</div>




{include file='footer.tpl'}