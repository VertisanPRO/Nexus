{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="ui stackable grid">

	<div class="twelve wide column">

		{include file='Monitoring/valid_server.tpl'}

		<div class="ui fluid card">
			<div class="content">
				<div class="header">
					<div class="ui centered header">{$NAME}</div>
				</div>
			</div>

			<div class="ui centered banner test" data-text="">
				<img class="ui centered image" src="{$BANNER}">
			</div>
			<div class="content">

			</div>
		</div>

		<div class="ui fluid card">

			<div class="content">
				<div class="ui centered header">{$PLAYERS_LIST_LABEL}</div>
				<div class="description">
					<div class="ui horizontal list">

						{foreach from=$PLAYERS_LIST item=item key=key name=name}
							<div class="item">
								<img class="ui mini circular image" src="https://cravatar.eu/helmavatar/{$item['name']}/64.png"
									alt="{$item['name']}">
								<div class="content">
									<a class="header">{$item['name']}</a>
								</div>
							</div>
						{/foreach}

					</div>
				</div>
			</div>

		</div>



	</div>

	{include file='Monitoring/widgets.tpl'}
</div>














{include file='footer.tpl'}


<script>
	function copyIP(ip) {
		var servIP = document.createElement("textarea");
		document.body.appendChild(servIP);
		servIP.value = ip;
		servIP.select();
		document.execCommand("copy");
		document.body.removeChild(servIP);

		document.getElementById('copy-alert').classList.remove('hidden');
		setTimeout(function() {
			document.getElementById('copy-alert').classList.add('hidden');
		}, 3000)

	}
</script>