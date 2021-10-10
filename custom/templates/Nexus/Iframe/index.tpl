{include file='header.tpl'}
{include file='navbar.tpl'}


<div class="ui stackable grid">
	<div class="ui centered row">

		{if count($WIDGETS_LEFT)}
			<div class="ui six wide tablet four wide computer column">
				{foreach from=$WIDGETS_LEFT item=widget}
					{$widget}
				{/foreach}
			</div>
		{/if}

		<div
			class="ui {if count($WIDGETS_LEFT) && count($WIDGETS_RIGHT) }four wide tablet eight wide computer{elseif count($WIDGETS_LEFT) || count($WIDGETS_RIGHT)}ten wide tablet twelve wide computer{else}sixteen wide{/if} column">

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




			{foreach from=$IFRAME_LIST item=iframe}


				{$iframe.description}



				<div class="ui {if $iframe.size == '21by9'}21:9
								{elseif $iframe.size == '16by9'}16:9
								{elseif $iframe.size == '4by3'}4:3
								{elseif $iframe.size == '1by1'}1:1
								{/if} embed ">
					<iframe src="{$iframe.src}" frameborder="0"></iframe>
				</div>


				{$iframe.footer_description}

			{/foreach}



		</div>
		{if count($WIDGETS_RIGHT)}
			<div class="ui six wide tablet four wide computer column">
				{foreach from=$WIDGETS_RIGHT item=widget}
					{$widget}
				{/foreach}
			</div>
		{/if}
	</div>
</div>



{include file='footer.tpl'}