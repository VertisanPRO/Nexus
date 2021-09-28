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
    
	<div class="ui {if count($WIDGETS_LEFT) && count($WIDGETS_RIGHT) }four wide tablet eight wide computer{elseif count($WIDGETS_LEFT) || count($WIDGETS_RIGHT)}ten wide tablet twelve wide computer{else}sixteen wide{/if} column">
	
	  <h2 class="ui header">{$TITLE}</h2>
	  <hr>
			
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
			
	  <form class="ui form" action="" method="post">
		{foreach from=$FIELDS item=field}
		  <div class="field">
			  {if $field.type == 5}
				  <hr />
			  {elseif $field.type == 4}
				  {', '|implode:$field.options}
			  {else}
				  <label for="{$field.id}">{$field.name} {if $field.required} <span class="text-danger"><strong>*</strong></span>{/if}</label>
			  {/if}
			{if $field.type == "1"}
			<input type="text" name="{$field.id}" id="{$field.id}" placeholder="{$field.name}">
			{elseif $field.type == "2"}
			<select name="{$field.id}" id="{$field.id}">
			  {foreach from=$field.options item=option}
			  <option value="{$option}">{$option}</option>
			  {/foreach}
			</select>
			{elseif $field.type == "3"}
			<textarea name="{$field.id}" id="{$field.id}"></textarea>
            {elseif $field.type == "6"}
            <input type="number" name="{$field.id}" id="{$field.id}" placeholder="{$field.name}">
			{/if}
		  </div>
		{/foreach}
		<input type="hidden" name="token" value="{$TOKEN}">
		<input type="submit" class="ui primary button" value="{$SUBMIT}">
	  </form>
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