		{if isset($STORE_PLAYER)}
		  <span class="right floated">
			<form class="ui form" action="" method="post">
			  <div class="ui labeled button" tabindex="0">
				<div class="ui label">
				  {$STORE_PLAYER}
				</div>
				<input type="hidden" name="token" value="{$TOKEN}">
				<input type="hidden" name="type" value="store_logout">
				<input type="submit" class="ui red button" value="{$LOGOUT}">
                {if count($SHOPPING_CART_PRODUCTS)}
                  <a href="{$CHECKOUT_LINK}" class="ui blue label">
                    {$X_ITEMS_FOR_Y}
				  </a>
                {else}
                  <a class="ui blue disabled label">
                    {$X_ITEMS_FOR_Y}
				  </a>
                {/if}
			  </div>
			</form>
		  </span>
		{/if}

        <div class="ui top attached menu">
           {foreach from=$CATEGORIES item=category}
            {if isset($category.subcategories) && count($category.subcategories)}
              <div class="ui pointing dropdown link item">
                <span class="text">{$category.title}</span>
                <i class="dropdown icon"></i>
                <div class="menu">
                  <a class="{if $category.active}active {/if}item" href="{$category.url}">{$category.title}</a>
                  {foreach from=$category.subcategories item=subcategory}
                    <a class="{if $subcategory.active}active {/if}item" href="{$subcategory.url}">{$subcategory.title}</a>
                  {/foreach}
                </div>
              </div>
            {else}
              <a class="{if $category.active}active {/if}item" href="{$category.url}">
               {$category.title}
              </a>
            {/if}
          {/foreach}
        </div>