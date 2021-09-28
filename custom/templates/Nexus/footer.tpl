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
						{if $PAGE_LOAD_TIME}
							<span class="item" id="page_load"></span>
						{/if}
						<span class="item">Powered By <a href="https://namelessmc.com">NamelessMC</a></span>
						<span class="item">Template By <a href="https://lectrichost.com" target="_blank" rel="nofollow noopener">Mubeen</a>, <a href="https://tensa.co.ua" target="_blank" rel="nofollow noopener">xGIGABAITx</a> & <a href="https://padow.ru" target="_blank" rel="nofollow noopener">PadowYT2</a></span>
					</div>
				</div>
				<div class="seven wide column">
					<h4>{$ABOUT_LABEL}</h4>
					<p>
						{if isset($TEMPLATE_ABOUT)} {$TEMPLATE_ABOUT}{else}We are an online platform to help users around the world connect through NamelessMC powered forums. {/if}
					</p>
				</div>
				<div class="three wide column">
					<h4>Links</h4>
					<div class="ui inverted link list">
						<a class="item" href="/contact">Contact Us</a>
						<a class="item" href="{$TERMS_LINK}">{$TERMS_TEXT}</a>
						<a class="item" href="{$PRIVACY_LINK}">{$PRIVACY_TEXT}</a>
					</div>
				</div>
			</div>

<style id=color_in_footer>
    .ui.inverted.blue.segment {
        background_color: #!important;
        color: #fff !important;
    }
</style>

<script>
    var element = document.getElementById("color_in_footer");
    if ("{$FOOTER_COLOR}" == "#000000") {
        element.style.background_color = "{$TEMPLATE_COLOR}";
    }
    else {
        element.style.background_color = "{$FOOTER_COLOR}";
    }
</script>


{if isset($GLOBAL_WARNING_TITLE)}
	<div class="ui medium modal" id="modal-acknowledge">
		<div class="header">
			{$GLOBAL_WARNING_TITLE}
		</div>
		<div class="content">
			{$GLOBAL_WARNING_REASON}
		</div>
		<div class="actions">
			<a class="ui positive button" href="{$GLOBAL_WARNING_ACKNOWLEDGE_LINK}">{$GLOBAL_WARNING_ACKNOWLEDGE}</a>
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