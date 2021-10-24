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

			<h2 class="ui header">{$VIEW_POLL->subject}</h2>

			<div class="ui top attached tabular menu">
				{foreach from=$VIEW_POLL_OPTIONS key=key item=opt}
					<a class="item {if $key == 0}active{/if}" data-tab="opt{$opt->id}">{$opt->name}</a>

				{/foreach}
			</div>
			{foreach from=$VIEW_POLL_OPTIONS key=key item=opt}
				<div class="ui bottom attached tab segment {if $key == 0}active{/if}" data-tab="opt{$opt->id}">

					{foreach from=$VIEW_POLL_VOTES[$opt->id] item=user}
						<span style="margin: 10px;"> {$user}, </span>

					{/foreach}
				</div>
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