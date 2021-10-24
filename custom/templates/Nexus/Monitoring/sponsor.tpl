{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="ui centered header">{$SPONSOR_LABEL}: <p>{$NAME}</p>
</div>

<br>
<form id="payment_form" action="" method="POST">
	<div class="ui form">

		<div class="field">
			<select id="select_sponsor" name="select_sponsor" class="ui fluid dropdown" onchange="setCost(this.value)">
				<option selected value="">{$SPONSOR_LABEL}</option>
				{foreach from=$SPONSORS_DATA key=key item=sponsor}
					<option value="{$key}">{$sponsor.name}</option>
				{/foreach}

			</select>
		</div>
		<div id="cost" class="ui centered header"></div>
		<input type="hidden" name="server_id" value="{$ID}">
		<input type="hidden" name="type" value="sponsor">

		<br>
		{foreach from=$PAYMENT_LIST item=payment}
			{if $payment.enabled == 1}
				<div class="field">
					<input onclick="{$payment.name}()" class="ui positive button" type="submit" value="{$payment.name}"
						style="width: 100%;">
				</div>

			{/if}

		{/foreach}

	</div>
</form>

{include file='footer.tpl'}

<script>
	var spData = {json_encode($SPONSORS_DATA)};

	function setCost(id) {
		document.getElementById('cost').innerHTML = {json_encode($PRICE_LABEL)} + ' ' + spData[id]['cost'] + ' ' + {json_encode($DISPLAY_CURRENCY)} + '<p>' + spData[id]['description'] + '</p>';
	}



	function PayPal() {
		document.getElementById('payment_form').action = {json_encode($PAYPAL_PROCESS_URL)};
	}

	function WebMoney() {
		document.getElementById('payment_form').action = {json_encode($WEBMONEY_PROCESS_URL)};
	}

	function Enot() {
		document.getElementById('payment_form').action = {json_encode($ENOT_PROCESS_URL)};
	}

	function FreeKassa() {
		document.getElementById('payment_form').action = {json_encode($FREEKASSA_PROCESS_URL)};
	}

	function UnitPay() {
		document.getElementById('payment_form').action = {json_encode($UNITPAY_PROCESS_URL)};
	}
</script>