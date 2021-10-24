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


<div class="ui top attached tabular menu">
	<a class="item active" data-tab="votifier">{$VOTIFIER_LABEL}</a>
	<a class="item" data-tab="rcon">{$RCON_LABEL}</a>
	<a class="item" data-tab="web_hook">{$WEB_HOOK_LABEL}</a>
</div>


<div class="ui bottom attached tab segment active" data-tab="votifier">

	<form action="" method="POST">
		<div class="ui form">

			<div class="field">
				<label>{$ENABLE_VOTIFIER}</label>
				<select name="votifier_status" class="ui fluid dropdown">
					<option {if $VOTIFIER_STATUS == 1} selected{/if} value="1">true</option>
					<option {if $VOTIFIER_STATUS == 2} selected{/if} value="2">false</option>
				</select>
			</div>

			<div class="field">
				<label>{$IP_VOTIFIER}</label>
				<input type="text" name="votifier_ip_port" placeholder="0.0.0.0:25258" value="{$VOTIFIER_IP_PORT}">
			</div>

			<div class="field">
				<label>{$KEY_VOTIFIER}</label>
				<textarea rows="3" name="votifier_key" placeholder="The public key is hidden from view"></textarea>
			</div>

			<br>
			<button style="width: 100%;" type="submit" class="ui button"><i class="fas fa-save"></i></button>
		</div>
	</form>


</div>



<div class="ui bottom attached tab segment" data-tab="rcon">

	<form action="" method="POST">
		<div class="ui form">

			<div class="field">
				<label>{$ENABLE_RCON}</label>
				<select name="rcon_status" class="ui fluid dropdown">
					<option {if $RCON_STATUS == 1} selected{/if} value="1">true</option>
					<option {if $RCON_STATUS == 2} selected{/if} value="2">false</option>
				</select>
			</div>

			<div class="field">
				<label>{$IP_RCON}</label>
				<input type="text" name="rcon_ip_port" placeholder="0.0.0.0:25258" value="{$RCON_IP_PORT}">
			</div>

			<div class="field">
				<label>{$PASS_RCON}</label>
				<input type="password" name="rcon_password" value="{$RCON_PASSWORD}">
			</div>

			<div class="field">
				<label>{$CMD_RCON}</label>
				<textarea rows="3" name="rcon_cmd" placeholder="lp user %username% parent set vip">{$RCON_CMD}</textarea>
			</div>

			<br>
			<button style="width: 100%;" type="submit" class="ui button"><i class="fas fa-save"></i></button>
		</div>
	</form>


</div>

<div class="ui bottom attached tab segment" data-tab="web_hook">

	<form action="" method="POST">
		<div class="ui form">

			<div class="field">
				<label>{$ENABLE_WEBHOOK}</label>
				<select name="webhook_status" class="ui fluid dropdown">
					<option {if $WEBHOOK_STATUS == 1} selected{/if} value="1">true</option>
					<option {if $WEBHOOK_STATUS == 2} selected{/if} value="2">false</option>
				</select>
			</div>

			<div class="field">
				<label>{$URL_WEBHOOK}</label>
				<input type="text" name="webhook_url" placeholder="url" value="{$WEBHOOK_URL}">
			</div>

			<div class="field">
				<label>{$NAME_WEBHOOK}</label>
				<input type="text" name="webhook_name" placeholder="The name to be displayed on Discord"
					value="{$WEBHOOK_NAME}">
			</div>

			<div class="field">
				<label>{$BOT_NAME_WEBHOOK}</label>
				<input type="text" name="webhook_bot_name" placeholder="Bot name" value="{$WEBHOOK_BOT_NAME}">
			</div>

			<div class="field">
				<label>{$AVATAR_WEBHOOK}</label>
				<input type="text" name="webhook_avatar_url"
					placeholder="https://ru.gravatar.com/userimage/158930532/7994bc02b95937b9a2801ff0d37ee3a9.png?size=200"
					value="{$WEBHOOK_AVATAR_URL}">
			</div>

			<div class="field">
				<label>{$CONTENT_WEBHOOK}</label>
				<textarea rows="3" name="webhook_content"
					placeholder="set %username% to insert username">{$WEBHOOK_CONTENT}</textarea>
			</div>

			<br>
			<button style="width: 100%;" type="submit" class="ui button"><i class="fas fa-save"></i></button>
		</div>
	</form>


</div>




{include file='footer.tpl'}

<script>
	$('.menu .item')
		.tab();
</script>