{include file='header.tpl'}
{include file='navbar.tpl'}

<style>
	.grid.container {
		margin-top: 5em;
	}

	.inputfile {
		width: 0.1px;
		height: 0.1px;
		opacity: 0;
		overflow: hidden;
		position: absolute;
		z-index: -1;
	}
</style>


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

		{include file="Monitoring/edit_menu.tpl"}
		<br>

	</div>
</div>

{if $SPONSOR == 1}
	<div class="ui centered row">

		<table id="table_color" class="ui {$TABLE_COLOR} table">


			<thead>
				<tr>
					<th colspan="6">
						<a href="">
							<div class="ui centered header">{$NAME}</div>
						</a>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<a href="">
							<span style="text-align: center; font-size: 1em; color: rgb(252, 244, 11);">
								<i class="fas fa-fan"></i>
							</span>
						</a>
					</td>

					<td>
						<a href="">
							<div class="ui banner test ad" data-text="">
								<img src="{$BANNER}">
							</div>
						</a>
					</td>

					<td>
						<a href="" class="ui button" style="width: 100%; height: 100%;">
							<span style="font-size: 1em; color: rgb(11, 252, 51);">
								<i class="fas fa-globe"></i>
							</span>
							<span>{$PLAYERS}</span>
							<p>{$ONLINE_LABEL}</p>
						</a>
					</td>

					<td>
						<a href="" class="ui button" style="width: 100%; height: 100%;">
							<span style="font-size: 1em; color: rgb(11, 252, 51);">
								<i class="fab fa-vuejs"></i>
							</span>
							<span>{$VERSIONS_LIST[$VERSION]['name']}</span>
							<p>{$VERSION_LABEL}</p>
						</a>
					</td>


					<td>
						<a href="" class="ui button" data-tooltip="Click to vote" data-inverted="" style="width: 100%; height: 100%;">
							<span style="font-size: 1em; color: rgb(11, 252, 51);">
								<i class="fas fa-thumbs-up"></i>
							</span>
							<span>{$VOTES}</span>
							<p>{$VOTES_LABEL}</p>
						</a>
					</td>


					<td>
						<a href="" class="ui button" style="width: 100%; height: 100%;">
							<span style="font-size: 1em; color: rgb(248, 252, 11);">
								<i class="fas fa-star"></i>
							</span>
							<span>{$POINTS}</span>
							<p>{$POINTS_LABEL}</p>
						</a>
					</td>

				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6">
						<a class="ui button" data-tooltip="{$COPY_CLIK}" data-inverted="" style="width: 100%;">
							<span style="text-align: center; font-size: 1em; color: rgb(11, 252, 51);">
								<i class="fas fa-gamepad"></i>
							</span>
							<p>{$IP}{if $SERVER_PORT == 25565}{else}:{$SERVER_PORT}{/if}</p>
						</a>
					</td>
				</tr>
			</tfoot>
		</table>


	</div>

	<br>
	<form action="" method="POST">
		<div class="ui form">



			<div class="field">
				<h1 class="ui centered header">{$TABLE_COLOR_LABEL}</h1>
				<select id="table_color" name="table_color" class="ui fluid dropdown" onchange="setColor(this.value)">

					<option {if $TABLE_COLOR == 'red'} selected{/if} value="red">red</option>
					<option {if $TABLE_COLOR == 'orange'} selected{/if} value="orange">orange</option>
					<option {if $TABLE_COLOR == 'yellow'} selected{/if} value="yellow">yellow</option>
					<option {if $TABLE_COLOR == 'olive'} selected{/if} value="olive">olive</option>
					<option {if $TABLE_COLOR == 'green'} selected{/if} value="green">green</option>
					<option {if $TABLE_COLOR == 'teal'} selected{/if} value="teal">teal</option>
					<option {if $TABLE_COLOR == 'blue'} selected{/if} value="blue">blue</option>
					<option {if $TABLE_COLOR == 'violet'} selected{/if} value="violet">violet</option>
					<option {if $TABLE_COLOR == 'purple'} selected{/if} value="purple">purple</option>
					<option {if $TABLE_COLOR == 'pink'} selected{/if} value="pink">pink</option>
					<option {if $TABLE_COLOR == 'grey'} selected{/if} value="grey">grey</option>
					<option {if $TABLE_COLOR == 'black'} selected{/if} value="black">black</option>
					<option {if $TABLE_COLOR == 'inverted'} selected{/if} value="inverted">inverted</option>
					<option {if $TABLE_COLOR == 'inverted red'} selected{/if} value="inverted red">inverted red</option>
					<option {if $TABLE_COLOR == 'inverted orange'} selected{/if} value="inverted orange">inverted orange</option>
					<option {if $TABLE_COLOR == 'inverted yellow'} selected{/if} value="inverted yellow">inverted yellow</option>
					<option {if $TABLE_COLOR == 'inverted olive'} selected{/if} value="inverted olive">inverted olive</option>
					<option {if $TABLE_COLOR == 'inverted green'} selected{/if} value="inverted green">inverted green</option>
					<option {if $TABLE_COLOR == 'inverted teal'} selected{/if} value="inverted teal">inverted teal</option>
					<option {if $TABLE_COLOR == 'inverted blue'} selected{/if} value="inverted blue">inverted blue</option>
					<option {if $TABLE_COLOR == 'inverted violet'} selected{/if} value="inverted violet">inverted violet</option>
					<option {if $TABLE_COLOR == 'inverted purple'} selected{/if} value="inverted purple">inverted purple</option>
					<option {if $TABLE_COLOR == 'inverted pink'} selected{/if} value="inverted pink">inverted pink</option>
					<option {if $TABLE_COLOR == 'inverted brown'} selected{/if} value="inverted brown">inverted brown</option>
					<option {if $TABLE_COLOR == 'inverted grey'} selected{/if} value="inverted grey">inverted grey</option>
				</select>
			</div>

			<br>
			<input type="hidden" name="token" value="sssssssss">
			<button style="width: 100%;" type="submit" class="ui button"><i class="fas fa-save"></i></button>




		</div>
	</form>

	<br>

	<h1 class="ui centered header">{$DISCORD_BANNER_LABEL}</h1>
	<div class="ui stackable grid">

		<div class="three column row">

			<div class="column">
			</div>

			<div class="column">

				<img id="ds_banner"
					src="https://discordapp.com/api/guilds/{$SERVER_DISCORD_ID}/widget.png?style={$DISCORD_BANNER}" alt=""
					style="border-radius: .28571429rem;width:100%;" onclick="window.location.href='{$DISCORD_INVITE}'">
			</div>

			<div class="column">
			</div>


		</div>
	</div>



	<br>
	<form action="" method="POST">
		<div class="ui form">

			<div class="field">

				<select id="discord_banner" name="discord_banner" class="ui fluid dropdown"
					onchange="setBanner(this.value, '{$SERVER_DISCORD_ID}')">
					<option {if $DISCORD_BANNER == 'banner1'} selected{/if} value="banner1">Banner 1</option>
					<option {if $DISCORD_BANNER == 'banner2'} selected{/if} value="banner2">Banner 2</option>
					<option {if $DISCORD_BANNER == 'banner3'} selected{/if} value="banner3">Banner 3</option>
					<option {if $DISCORD_BANNER == 'banner4'} selected{/if} value="banner4">Banner 4</option>
				</select>
			</div>

			<br>
			<input type="hidden" name="token" value="sssssssss">
			<button style="width: 100%;" type="submit" class="ui button"><i class="fas fa-save"></i></button>

		</div>
	</form>
{/if}




{include file='footer.tpl'}

<script>
	function setColor(color) {
		document.getElementById('table_color').classList = 'ui ' + color + ' table';
	}

	function setBanner(banner, id) {
		$("#ds_banner").attr("src", 'https://discordapp.com/api/guilds/' + id + '/widget.png?style=' + banner);

	}
</script>