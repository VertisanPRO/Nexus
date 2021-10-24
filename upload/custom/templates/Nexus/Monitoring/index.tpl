{include file='header.tpl'}
{include file='navbar.tpl'}
<style>
	.field {
		width: 100% !important;
		min-width: 20vh !important;
		max-width: 1000vh !important;
	}
</style>
<div id="copy-alert" class="ui hidden black mini message">
	Copied
</div>

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


		<form class="ui form" action="" method="POST">
			<div class="five fields">

				<div class="field">
					<label for="sort">{$SORT_LABEL}</label>
					<select name="sort" class="ui fluid dropdown">
						<option {if !isset($SORT)} selected{/if} value="0"> {$NONE_LABEL} </option>
						<option {if $SORT=='votes' } selected{/if} value="votes"> {$VOTES_LABEL} </option>
						<option {if $SORT=='points' } selected{/if} value="points"> {$POINTS_LABEL} </option>
						<option {if $SORT=='players' } selected{/if} value="players"> {$PLAYERS_LABEL} </option>
						<option {if $SORT=='datetime' } selected{/if} value="datetime"> {$NEW_LABEL} </option>
					</select>
				</div>

				<div class="field">
					<label for="country">{$COUNTRY_LABEL}</label>
					<select name="country" class="ui fluid dropdown">
						<option {if !isset($COUNTRY_VAL)} selected{/if} value="1">{$ALL_LABEL}</option>
						{foreach from=$COUNTRY_LIST item=country}
							<option {if $COUNTRY_VAL==$country.val} selected{/if} value="{$country.val}">{$country.val}</option>
						{/foreach}
					</select>
				</div>

				<div class="field">
					<label for="versions">{$VERSION_LABEL}</label>
					<select name="versions" class="ui fluid dropdown">
						<option {if !isset($VERSIONS)} selected{/if} value="0">{$ALL_LABEL}</option>
						{foreach from=$VERSIONS_LIST item=versions}
							<option {if $VERSIONS==$versions.id} selected{/if} value="{$versions.id}">{$versions.name}</option>
						{/foreach}
					</select>
				</div>

				<div class="field">
					<label for="category">{$CATEGORY_LABEL}</label>
					<select name="category" class="ui fluid dropdown">
						<option {if !isset($CATEGORY)} selected{/if} value="0">{$ALL_LABEL}</option>
						{foreach from=$CATEGORY_LIST item=category}
							<option {if $CATEGORY=={$category.id}} selected{/if} value="{$category.id}">{$category.name}</option>
						{/foreach}
					</select>
				</div>


				<div class="field">
					<label for="search">{$SEARCH_LABEL}</label>
					<input type="hidden" name="search" value="search">
					<button type="submit" class="ui button" value=""><i class="fas fa-search"></i></button>
				</div>
			</div>

		</form>



	</div>

	<div class="ui centered row">
		{if count($SPONSOR_SERVERS)}
			<h1 class="ui centered header" style="color: {$MC_SERVERS_SPONSORS_LABEL_COLOR};">{$SPONSOR_SERVERS_LABEL}</h1>
			{foreach from=$SPONSOR_SERVERS item=server}
				<table class="ui {$server.table_color} table">


					<thead>
						<tr>
							<th colspan="6">
								<a href="{$server.view_link}">
									<div class="ui centered header">{$server.name}</div>
								</a>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 100px; text-align: center;">
								<a href="{$server.view_link}">

									{if !empty($server.icon)}
										<img src="{$server.icon}">
									{else}
										<span style="text-align: center; font-size: 1em; color: rgb(252, 244, 11);">
											<i class="fas fa-fan"></i>
										</span>
									{/if}
								</a>
							</td>

							<td>
								<a href="{$server.view_link}">
									<div class="ui centered banner test ad" data-text="">
										<img src="{$server.banner}">
									</div>
								</a>
							</td>

							<td style="width: 150px;">
								<a href="{$server.view_link}" class="ui button" style="width: 100%; height: 100%;">
									{if $server.players < '0' } {$STATUS_COLOR='rgb(250, 7, 7);' } {$STATUS_SERVER_LABEL=$OFFLINE_LABEL}
									{else} {$STATUS_COLOR='rgb(11, 252, 51);' } {$STATUS_SERVER_LABEL=$ONLINE_LABEL} 
									{/if} <span
										style="font-size: 1em; color: {$STATUS_COLOR}">
										<i class="fas fa-globe"></i>
									</span>
									<span>{$server.players}</span>
									<p>{$STATUS_SERVER_LABEL}</p>
								</a>
							</td>

							<td style="width: 150px;">
								<a href="{$server.view_link}" class="ui button" style="width: 100%; height: 100%;">
									<span style="font-size: 1em; color: rgb(11, 252, 51);">
										<i class="fab fa-vuejs"></i>
									</span>
									<span>{$VERSIONS_LIST[$server.version]['name']}</span>
									<p>{$VERSION_LABEL}</p>
								</a>
							</td>


							<td style="width: 150px;">
								<a href="{$server.votes_link}" class="ui button" data-tooltip="Click to vote" data-inverted=""
									style="width: 100%; height: 100%;">
									<span style="font-size: 1em; color: rgb(11, 252, 51);">
										<i class="fas fa-thumbs-up"></i>
									</span>
									<span>{$server.votes}</span>
									<p>{$VOTES_LABEL}</p>
								</a>
							</td>


							<td style="width: 150px;">
								<a href="{$server.points_link}" class="ui button" style="width: 100%; height: 100%;">
									<span style="font-size: 1em; color: rgb(248, 252, 11);">
										<i class="fas fa-star"></i>
									</span>
									<span>{$server.points}</span>
									<p>{$POINTS_LABEL}</p>
								</a>
							</td>

						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="6">
								<a class="ui button" data-tooltip="{$COPY_CLIK}" data-inverted="" style="width: 100%;"
									onclick="copyIP('{$server.ip}{if $server.port == 25565}{else}:{$server.port}{/if}')">
									<span style="text-align: center; font-size: 1em; color: rgb(11, 252, 51);">
										<i class="fas fa-gamepad"></i>
									</span>
									<p>{$server.ip}{if $server.port == 25565}{else}:{$server.port}{/if}</p>
								</a>
							</td>
						</tr>
					</tfoot>
				</table>
				<input type="hidden" value="{$n++}">
			{/foreach}
		{/if}

		{if count($SERVERS)}
			<h1 class="ui centered header" style="color: {$MC_SERVERS_LABEL_COLOR};">{$MC_SERVERS_LABEL}</h1>
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
					<tbody>
						<tr>
							<td style="width: 100px; text-align: center;">
								<a href="{$server.view_link}">
									{if $server.sponsor == 1}
										{if !empty($server.icon)}
											<img src="{$server.icon}">
										{else}
											<span style="text-align: center; font-size: 1em; color: rgb(252, 244, 11);">
												{if $server.n == 1}<i class="fas fa-crown"></i>{else}{$server.n}. &nbsp &nbsp{/if}
											</span>
										{/if}
									{else}
										<span style="text-align: center; font-size: 1em; color: rgb(252, 244, 11);">
											{if $server.n == 1}<i class="fas fa-crown"></i>{else}{$server.n}. &nbsp &nbsp{/if}
										</span>
									</a>
								{/if}
							</td>

							<td>
								<a href="{$server.view_link}">
									<div class="ui centered banner test ad" data-text="">
										<img src="{$server.banner}">
									</div>
								</a>
							</td>

							<td style="width: 150px;">
								<a href="{$server.view_link}" class="ui button" style="width: 100%; height: 100%;">
									{if $server.players < '0' } {$STATUS_COLOR='rgb(250, 7, 7);' } {$STATUS_SERVER_LABEL=$OFFLINE_LABEL}
									{else} {$STATUS_COLOR='rgb(11, 252, 51);' } {$STATUS_SERVER_LABEL=$ONLINE_LABEL} 
									{/if} <span
										style="font-size: 1em; color: {$STATUS_COLOR}">
										<i class="fas fa-globe"></i>
									</span>
									<span>{$server.players}</span>
									<p>{$STATUS_SERVER_LABEL}</p>
								</a>
							</td>

							<td style="width: 150px;">
								<a href="{$server.view_link}" class="ui button" style="width: 100%; height: 100%;">
									<span style="font-size: 1em; color: rgb(11, 252, 51);">
										<i class="fab fa-vuejs"></i>
									</span>
									<span>{$VERSIONS_LIST[$server.version]['name']}</span>
									<p>{$VERSION_LABEL}</p>
								</a>
							</td>


							<td style="width: 150px;">
								<a href="{$server.votes_link}" class="ui button" data-tooltip="Click to vote" data-inverted=""
									style="width: 100%; height: 100%;">
									<span style="font-size: 1em; color: rgb(11, 252, 51);">
										<i class="fas fa-thumbs-up"></i>
									</span>
									<span>{$server.votes}</span>
									<p>{$VOTES_LABEL}</p>
								</a>
							</td>


							<td style="width: 150px;">
								<a href="{$server.points_link}" class="ui button" style="width: 100%; height: 100%;">
									<span style="font-size: 1em; color: rgb(248, 252, 11);">
										<i class="fas fa-star"></i>
									</span>
									<span>{$server.points}</span>
									<p>{$POINTS_LABEL}</p>
								</a>
							</td>


						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="6">
								<a class="ui button" data-tooltip="{$COPY_CLIK}" data-inverted="" style="width: 100%;"
									onclick="copyIP('{$server.ip}{if $server.port == 25565}{else}:{$server.port}{/if}')">
									<span style="text-align: center; font-size: 1em; color: rgb(11, 252, 51);">
										<i class="fas fa-gamepad"></i>
									</span>
									<p>{$server.ip}{if $server.port == 25565}{else}:{$server.port}{/if}</p>
								</a>
							</td>
						</tr>
					</tfoot>

				</table>
			{/foreach}
		{/if}



		{$PAGINATION}





	</div>
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


	window.addEventListener('DOMContentLoaded', function() {
		var form = document.querySelector('.ui.form');
		var links = document.querySelectorAll('.ui.mini.pagination.menu a');

		for (var i = 0; i < links.length; i++) {
			links[i].addEventListener('click', function(event) {
				event.preventDefault();

				form.action = event.target.href;
				form.action = event.target.href.replace(/\?p\=1$/, '');
				form.submit();
			});
		}
	});
</script>