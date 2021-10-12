{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="ui container">
  <div class="ui padded segment">
	<div class="ui stackable grid">
		<div class="ui row">
			<div class="ui ten wide column">
				<h2 style="display:inline;">{$VIEWING_ALL_RELEASES}</h2>
			</div>
			<div class="ui six wide column">
				<div class="res right floated">
					<a href="{$BACK_LINK}" class="ui button">{$BACK}</a>
				</div>
			</div>
		</div>
	</div>
		<div class="ui divider"></div>
	  {foreach from=$RELEASES item=release}
		  <h4 class="ui top attached header">
			  <a href="{$release.url}">{$release.name}</a>
			  <span class="res right floated">
				  <span data-toggle="tooltip" data-content="{$release.date_full}">{$release.date}</span>
			  </span>
		  </h4>

		  <div class="ui bottom attached segment">
			  <div class="forum_post">
				  {$release.description}
			  </div>
			  <br />
			  {$release.downloads} |
			  <div class="star-rating view" style="display:inline;">
				  <span class="far fa-star" data-rating="1" style="color:gold;"></span>
				  <span class="far fa-star" data-rating="2" style="color:gold"></span>
				  <span class="far fa-star" data-rating="3" style="color:gold;"></span>
				  <span class="far fa-star" data-rating="4" style="color:gold;"></span>
				  <span class="far fa-star" data-rating="5" style="color:gold;"></span>
				  <input type="hidden" name="rating" class="rating-value" value="{$release.rating}">
			  </div>
		  </div>

	  {/foreach}

	  {$PAGINATION}

  </div>
</div>

{include file='footer.tpl'}
