{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="ui container" style="padding-bottom:300px;">
  <div class="ui segment">
	<h2 style="display:inline;">{$EDITING_SUGGESTION}</h2>
	<hr>
				
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
		 
	<form class="ui large form" action="" method="post">
	  <div class="field">
	    <label for="titleLabel">{$SUGGESTION_TITLE} <span style="color:red"><strong>*</strong></span></label>
		<input type="text" name="title" placeholder="Title" value="{$TITLE_VALUE}">
	  </div>
	  <div class="field">
	    <label for="categoryLabel">{$CATEGORY} <span style="color:red"><strong>*</strong></span></label>
		<select name="category" id="category">
		  {foreach from=$CATEGORIES item=item}
		    <option value="{$item.id}" {if $CATEGORY_VALUE == $item.id}selected{/if}>{$item.name}</option>
		  {/foreach}
		</select>
	  </div>
	  <div class="field">
	    <label for="statusLabel">{$STATUS} </label>
		<select name="status" id="status">
		  {foreach from=$STATUSES item=item}
		    <option value="{$item.id}" {if $STATUS_VALUE == $item.id}selected{/if}>{$item.name}</option>
		  {/foreach}
		</select>
	  </div>
	  <div class="field">
	    <label for="contentLabel">{$CONTENT} <span style="color:red"><strong>*</strong></span></label>
		<textarea style="width:100%" name="content" placeholder="Content" id="editor" rows="15">{$CONTENT_VALUE}</textarea>
	  </div>
	  <input type="hidden" name="token" value="{$TOKEN}">
	  <input type="submit" class="ui primary button" value="{$SUBMIT}">
	  <a class="ui negative button" href="{$CANCEL_LINK}">{$CANCEL}</a>
	</form>
  </div>  
</div>

{include file='footer.tpl'}