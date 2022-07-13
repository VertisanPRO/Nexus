{include file='header.tpl'}
{include file='navbar.tpl'}

{if isset($SUCCESS)}
	<div class="ui message icon announcement" style="border-top-style: solid; border-top-color: #5cb85c;">
		<i class="check icon" style="color: #5cb85c;"></i>
		<div class="content">
			{$SUCCESS}
		</div>
	</div>
{/if}

{if isset($ERRORS)}
	<div class="ui message icon announcement" style="border-top-style: solid; border-top-color: #d9534f;">
		<i class="x icon" style="color: #d9534f;"></i>
		<div class="content">
			{foreach from=$ERRORS item=error}
				<li>{$error}</li>
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
			<h3 class="ui header">{$MC_TITLE}</h3>
			<div class="ui segment">


				<a href="{$PAY_URL}" class="ui primary button">{$PAY}</a>
				<a href="#" class="ui right floated primary button" onclick="productModal()">{$TRANSFER_MONEY}</a>


				<br>
				<table class="ui celled table">
					<thead>
						<tr>
							<th>{$MC_ACCOUNT} </th>
							<th class="right aligned"><span class="right aligned">{$USER_DATA->mc_name}</span></th>
						</tr>
					</thead>
					<thead>
						<tr>
							<th>{$BALANCE} </th>
							<th class="right aligned"><span class="right aligned">{$USER_DATA->bal}</span></th>
						</tr>
					</thead>
				</table>
			</div>

			{if !empty($PRODUCT_LOGS)}
				<div class="ui header center aligned">{$LOG_TITLE}</div>
				{foreach from=$PRODUCT_LOGS item=log}



					<table class="ui celled table">
						<colgroup>
							<col width="50%">
							<col width="10%">
							<col width="30%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr>
								<th class="ui"><span>{if $log['status'] != 1}<i class="attention icon"></i>
										{else}<i class="check icon"></i>
										{/if}{$log['product_name']}</span></th>
								<th class="ui">
									<span>{if $log['status'] != 1}error{else}success{/if}</span>
								</th>
								<th class="ui right aligned"><span>{$log['datetime']}</span>
								</th>
								<th class="ui right aligned"><span>{$log['product_price']}</span>
								</th>

							</tr>
						</thead>
					</table>



				{/foreach}
			{/if}

		</div>
	</div>
</div>



<div class="ui modal">
	<i class="close icon"></i>
	<div class="ui center aligned header">
		{$TRANSFER_MONEY}
	</div>
	<div class="ui actions">

		<form class="ui form" action="{$BUY_LINK}" method="post">

			<div class="field">
				<div class="ui center aligned header">{$BALANCE} {$USER_DATA->bal}</div>
				<input type="number" id="trade_bal_send" name="trade_bal_send" class="form-control"
					placeholder="{$COUNT_TITLE}">
			</div>

			<div class="field">
				<div class="ui center aligned header">{$RECIPIENT}</div>
				<input class="form-control" list="users_list" name="to_user" id="to_user">

				<datalist id="users_list">
					{foreach from=$USERS_LIST item=user}
						<option value="{$user['mc_name']}">
						{/foreach}
				</datalist>
			</div>
			<div class="ui black deny button">
				{$CLOSE}
			</div>
			<input type="hidden" name="token" value="{$TOKEN}">
			<button type="submit" class="ui primary button"><i class="checkmark icon"></i>{$SUBMIT}</button>
		</form>
	</div>
</div>

{include file='footer.tpl'}

<script type="text/javascript">
	function productModal() {
		$('.ui.modal')
			.modal('show');
	}
</script>