</div>
</div>
<html>

<body>
	<style type="text/css">
		body {
			-webkit-font-smoothing: antialiased;
			-moz-font-smoothing: grayscale;
		}

		.ui.footer.segment {
			margin: 5em 0em 0em;
			padding: 5em 0em;
		}
	</style>


	<div class="ui blue inverted vertical footer segment" style="padding:2rem;">
		<div class="ui center aligned container">
			<div class="ui stackable inverted divided grid">
				<div class="five wide column">
					<h4><span class="item">&copy; {$SITE_NAME} {'Y'|date}</span></h4>
					<div class="ui inverted link list">
						<span class="item">Powered By <a href="https://namelessmc.com">NamelessMC</a></span>
						{* We kindly ask to not remove the copyright *}
						<span class="item">Template By <a href="https://discord.gg/RJfCxC2W3e" target="_blank"
								rel="nofollow noopener">Gigabait Development</a></span>
						{if $PAGE_LOAD_TIME}
						<span class="item" id="page_load"></span>
						{/if}
					</div>
				</div>
				<div class="three wide column">
					<h4>{$FOOTER_LINKS_TITLE}</h4>
					<div class="ui inverted link list">
						{foreach from=$FOOTER_NAVIGATION key=name item=item}
						{if isset($item.items)}
						<div class="ui pointing dropdown link item">
							<span class="text">{$item.icon} {$item.title}</span> <i class="dropdown icon"></i>
							<div class="menu">
								<div class="header">{$item.title}</div>
								{foreach from=$item.items item=dropdown}
								<a class="item" href="{$dropdown.link}" target="{$dropdown.target}">{$dropdown.icon}
									{$dropdown.title}</a>
								{/foreach}
							</div>
						</div>
						{else}
						<a class="item" href="{$item.link}" target="{$item.target}">{$item.icon} {$item.title}</a>
						{/if}
						{/foreach}
						<a class="item" href="{$TERMS_LINK}">{$TERMS_TEXT}</a>
						<a class="item" href="{$PRIVACY_LINK}">{$PRIVACY_TEXT}</a>
					</div>
				</div>
				<div class="three wide column">
					<h4>{$FOOTER_SOCIAL_TITLE}</h4>
					<div class="ui inverted link list">
						{foreach from=$SOCIAL_MEDIA_ICONS item=icon}
						<a class="item" href="{$icon.link}">{$icon.text}</a>
						{/foreach}
					</div>
				</div>
				<div class="five wide column">
					<h4>About</h4>
					<p>
						{if isset($TEMPLATE_ABOUT)} {$TEMPLATE_ABOUT}{else}We are an online platform to help users
						around the world connect through NamelessMC powered forums. {/if}
					</p>
				</div>
			</div>
		</div>

		<style>
			.ui.inverted.blue.segment {
				background-color: {if ("{$FOOTER_COLOR}"==="#000000")}{$TEMPLATE_COLOR}{else}{$FOOTER_COLOR}{/if} !important;
				color: #fff !important;
			}
		</style>


		{if isset($GLOBAL_WARNING_TITLE)}
		<div class="ui medium modal" id="modal-acknowledge">
			<div class="header">
				{$GLOBAL_WARNING_TITLE}
			</div>
			<div class="content">
				{$GLOBAL_WARNING_REASON}
			</div>
			<div class="actions">
				<a class="ui positive button"
					href="{$GLOBAL_WARNING_ACKNOWLEDGE_LINK}">{$GLOBAL_WARNING_ACKNOWLEDGE}</a>
			</div>
		</div>
		{/if}

		{foreach from=$TEMPLATE_JS item=script}
		{$script}
		{/foreach}

		{if isset($NEW_UPDATE) && ($NEW_UPDATE_URGENT != true)}
		<script src="{$TEMPLATE.path}/js/core/update.js"></script>
		{/if}

		{if !isset($EXCLUDE_END_BODY)}
</body>

</html>
{/if}

{if $ARC == 'true'}
<script async src="{$ARC_ID}"></script>
</script>
{/if}