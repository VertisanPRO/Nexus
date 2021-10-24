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

<form action="" method="POST">
	<div class="ui form">


		<h4 class="ui dividing centered header">{$NAME_LABEL}{$REQUIRE_LABEL}</h4>
		<div class="field">
			<input type="text" id="bbname" name="name" placeholder="{$NAME_LABEL}" value="{$NAME}">
		</div>


		<h4 class="ui dividing centered header">{$ADD_IP_INFO_LABEL}</h4>
		<div class="three fields">
			<div class="field">
				<label>{$REAL_IP_LABEL}{$REQUIRE_LABEL}</label>
				<input type="text" name="real_ip" placeholder="REAL IP" value="{$REAL_IP}">
			</div>

			<div class="field">
				<label>{$IP_DOMEN_LABEL}{$REQUIRE_LABEL}</label>
				<input type="text" name="ip" placeholder="IP" value="{$IP}">
			</div>

			<div class="field">
				<label>{$PORT_LABEL}{$REQUIRE_LABEL}</label>
				<input type="text" name="port" placeholder="Port" value="{$SERVER_PORT}">
			</div>
		</div>


		<h4 class="ui dividing centered header">{$ADD_LINK_INFO_LABEL}</h4>
		<div class="three fields">
			<div class="field">
				<label>{$DS_LABEL}</label>
				<input type="text" name="discord_invite" placeholder="Discord invite link" value="{$DISCORD_INVITE}">
			</div>

			<div class="field">
				<label>{$TS_LABEL}</label>
				<input type="text" name="team_speak" placeholder="TeamSpeak link" value="{$TEAM_SPEAK}">
			</div>

			<div class="field">
				<label>{$SITE_LABEL}</label>
				<input type="text" name="website_url" placeholder="Website Url" value="{$WEBSITE_URL}">
			</div>
		</div>


		<h4 class="ui dividing centered header">{$ADD_CATEGORY_INFO_LABEL}</h4>
		<div class="two fields">
			<div class="field">
				<label>{$VERSION_LABEL}</label>
				<select name="version" class="ui fluid dropdown">
					{foreach from=$VERSIONS_LIST item=versions}
						<option {if $VERSION == $versions.id} selected{/if} value="{$versions.id}">{$versions.name}</option>
					{/foreach}
				</select>
			</div>
			{* <div class="field">
				<label>{$VERSION_LABEL}</label>
				<select multiple name="version[]" class="ui fluid dropdown">
					{foreach from=$VERSIONS_LIST item=versions}
						<option {if isset($VERSION_LINK[$versions.id])} selected{/if} value="{$versions.id}">{$versions.name}</option>
					{/foreach}
				</select>
			</div> *}

			<div class="field">
				<label>{$CATEGORY_LABEL}</label>
				<select multiple name="category[]" class="ui fluid dropdown">
					{foreach from=$CATEGORY_LIST item=category}
						<option {if isset($CATEGORY_LINK[$category.id])} selected{/if} value="{$category.id}">{$category.name}
						</option>
					{/foreach}
				</select>
			</div>
		</div>


		<h4 class="ui dividing centered header">{$COUNTRY_LABEL}</h4>
		<div class="field">
			<select name="land" class="ui fluid dropdown">
				{foreach from=$COUNTRIES item=val}
					<option {if $LAND == $val} selected{/if} value="{$val}">{$val}</option>
				{/foreach}
			</select>
		</div>


		<h4 class="ui dividing centered header">{$DESC_LABEL}</h4>
		{if $MONITORING_EDITOR == 1}
			<div class="field">
				<textarea name="description" id="description">{$DESCRIPTION}</textarea>
			</div>
		{else}
			<div class="field">
				{if !isset($MARKDOWN)}
					<textarea name="description" id="reply">{$DESCRIPTION}</textarea>
				{else}
					<textarea name="description" id="markdown">{$DESCRIPTION}</textarea>
					<div class="meta">{$MARKDOWN_HELP}</div>
				{/if}
			</div>
		{/if}

		<br>
		<button style="width: 100%;" type="submit" class="ui button"><i class="fas fa-save"></i></button>




	</div>
</form>

{include file='footer.tpl'}