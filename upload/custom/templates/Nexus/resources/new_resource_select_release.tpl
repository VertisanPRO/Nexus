{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="ui container">
  <div class="ui padded segment">
	  <h2 style="display:inline;">{$NEW_RESOURCE}</h2>
	  
	  <div class="res right floated">
		<a href="{$CANCEL_LINK}" class="ui red button" onclick="return confirm('{$CONFIRM_CANCEL}');">{$CANCEL}</a>
	  </div>
	  <div class="ui divider"></div>

	  {if isset($ERROR)}
	  <div class="ui negative message">
	    {$ERROR}
	  </div>
	  {/if}
	  
	  <form action="" method="post" class="ui form">
	    <div class="field">
		  <label for="inputRelease">{$SELECT_RELEASE}</label>
		  <select name="release" class="ui selection dropdown" id="inputRelease">
		    {foreach from=$RELEASES item=release}
			<option value="{$release.id}">{$release.tag} - {$release.name}</option>
			{/foreach}
		  </select>
		</div>
		
		<div class="field">
		  <input type="hidden" name="token" value="{$TOKEN}">
		  <input type="submit" class="ui blue button" value="{$SUBMIT}">
		</div>
		
	  </form>
  </div>
</div>

{include file='footer.tpl'}