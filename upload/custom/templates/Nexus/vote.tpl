{include file='header.tpl'}
{include file='navbar.tpl'}

<h2 class="ui header">{$VOTE_TITLE}</h2>

<div class="ui stackable grid">
  <div class="ui row">
    <div class="ui {if count($WIDGETS)}ten wide tablet twelve wide computer{else}sixteen wide{/if} column">
      <div class="ui segment">
		{if isset($MESSAGE_ENABLED)}
		  <div class="ui info message">
			<div class="content">
			  {$MESSAGE}
			</div>
		  </div>
		{/if}
		
		<div class="ui grid">
			{foreach from=$SITES item=site}
			  <div class="eight wide column">
				<a class="fluid ui small primary button" href="{$site.url}" target="_blank" role="button"> {$site.name}</a>
			  </div>
			{/foreach}
		</div>
	  </div>
	</div>
  
    {if count($WIDGETS)}
      <div class="ui six wide tablet four wide computer column">
        {foreach from=$WIDGETS item=widget}
          {$widget}
        {/foreach}
      </div>
    {/if}
  </div>
</div>

{include file='footer.tpl'}