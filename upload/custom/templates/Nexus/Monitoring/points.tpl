{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="ui centered header">
	<p>{$NAME}</p>
</div>

<br>
<form id="payment_form" action="" method="POST">
	<div class="ui form">

		<div class="field">
			<select id="select_points" name="select_points" class="ui fluid dropdown" onchange="setCost(this.value)">
				<option selected value="">{$POINTS_LABEL}</option>
				{foreach from=$POINTS_DATA key=key item=points}
					<option value="{$key}">{$points.name}</option>
				{/foreach}

			</select>
		</div>
		<div class="field">
			<label for="count_points" class="ui centered header">{$POINTS_LABEL}:
			</label>
			<input oninput="setPrice(this.value)" type="number" id="count_points" name="count_points" value="1">
		</div>
		<div id="cost" class="ui centered header"></div>
		<div id="price" class="ui centered header"></div>
		<input type="hidden" name="server_id" value="{$ID}">
		<input type="hidden" name="type" value="points">

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
	var spData = {json_encode($POINTS_DATA)};

	function setPrice(count) {
		var id = $("#select_points").val();
		var price = (count * spData[id]['cost']).toFixed(2)
		document.getElementById('price').innerHTML = {json_encode($PRICE_LABEL)} + ' = ' + price + ' ' + {json_encode($DISPLAY_CURRENCY)};

	}

	function setCost(id) {
		document.getElementById('cost').innerHTML = 1 + ' ' + {json_encode($POINTS_LABEL)} + ' = ' + spData[id]['cost'] + ' ' + {json_encode($DISPLAY_CURRENCY)} + '<p>' + spData[id]['description'] + '</p>';
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