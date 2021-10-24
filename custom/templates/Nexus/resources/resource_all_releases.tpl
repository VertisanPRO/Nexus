{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="ui container">
  <div class="ui padded segment">
	<div class="ui stackable grid">
		<div class="ui row">
			<div class="ui ten wide column">
				<div class="description">
					<div class="ui relaxed list">
						<div class="item">
							<img class="ui rounded centered image" src="{$RESOURCE_ICON}" alt="{$RESOURCE_NAME}" style="max-height:64; max-width:64px;">
							<div class="content">
								<h2 class="header" style="display: block;">{$VIEWING_ALL_RELEASES}</h2>
								<span>[{$RELEASE_TAG}] {$RESOURCE_SHORT_DESCRIPTION}</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="ui six wide column">
				<div class="res right floated">
					<a href="{$BACK_LINK}" class="ui button">{$BACK}</a>
				</div>
			</div>
		</div>

		<div class="ui divider"></div>
	  <div class="ui row">
	    <div class="twelve wide column">
		<div class="ui tabular menu">
            		<a class="item" href="{$OVERVIEW_LINK}">{$OVERVIEW_TITLE}</a>
            		<a class="item active" href="{$OTHER_RELEASES_LINK}">{$RELEASES_TITLE}</a>
            		<a class="item" href="{$VERSIONS_LINK}">{$VERSIONS_TITLE}</a>
            		<a class="item" href="{$REVIEWS_LINK}">{$REVIEWS_TITLE}</a>
        	</div>
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
	    <div class="four wide column">
		  <div class="ui aligned segment">
			  <h4 class="ui header">{$RESOURCE}</h4>
			  <div class="ui divider"></div>
              
              <div class="description">
                <div class="ui list">
                  <div class="item">
                    <span class="text">{$VIEWS}</span>
                    <div class="description right floated"><b>{$VIEWS_VALUE}</b></div>
                  </div>
                  <div class="item">
                    <span class="text">{$TOTAL_DOWNLOADS}</span>
                    <div class="description right floated"><b>{$TOTAL_DOWNLOADS_VALUE}</b></div>
                  </div>
                  <div class="item">
                    <span class="text">{$FIRST_RELEASE}</span>
                    <div class="description right floated"><b>{$FIRST_RELEASE_DATE}</b></div>
                  </div>
                  <div class="item">
                    <span class="text">{$LAST_RELEASE}</span>
                    <div class="description right floated"><b>{$LAST_RELEASE_DATE}</b></div>
                  </div>
                  <div class="item">
                    <span class="text">{$CATEGORY}</span>
                    <div class="description right floated"><b>{$CATEGORY_VALUE}</b></div>
                  </div>
                  <div class="item">
                    <span class="text">{$RATING}</span>
                    <div class="description right floated">
                      <div class="star-rating view">
                        <span class="far fa-star" data-rating="1" style="color:gold;"></span>
                        <span class="far fa-star" data-rating="2" style="color:gold"></span>
                        <span class="far fa-star" data-rating="3" style="color:gold;"></span>
                        <span class="far fa-star" data-rating="4" style="color:gold;"></span>
                        <span class="far fa-star" data-rating="5" style="color:gold;"></span>
                        <input type="hidden" name="rating" class="rating-value" value="{$RATING_VALUE}">
                      </div>
                    </div>
                  </div>
                </div>
              </div>

		  </div>
		  
		  <div class="ui aligned segment">
			  <h4 class="ui header">{$RELEASE_VERSION}</h4>
			  <div class="ui divider"></div>
              
              <div class="description">
                <div class="ui list">
                  <div class="item">
                    <span class="text">{$DOWNLOADS}</span>
                    <div class="description right floated"><b>{$RELEASE_DOWNLOADS}</b></div>
                  </div>
                  <div class="item">
                    <span class="text">{$RELEASE}</span>
                    <div class="description right floated"><b>{$RELEASE_DATE_FULL}</b></div>
                  </div>
                  <div class="item">
                    <span class="text">{$RATING}</span>
                    <div class="description right floated">
                      <div class="star-rating view">
                        <span class="far fa-star" data-rating="1" style="color:gold;"></span>
                        <span class="far fa-star" data-rating="2" style="color:gold"></span>
                        <span class="far fa-star" data-rating="3" style="color:gold;"></span>
                        <span class="far fa-star" data-rating="4" style="color:gold;"></span>
                        <span class="far fa-star" data-rating="5" style="color:gold;"></span>
                        <input type="hidden" name="rating" class="rating-value" value="{$RELEASE_RATING}">
                      </div>
                    </div>
                  </div>
                </div>
              </div>

		  </div>
		  
		  <div class="ui aligned segment">
            <h4 class="ui header">{$AUTHOR}</h4>
			<div class="ui divider"></div>
            
            <center>
			<a href="{$AUTHOR_PROFILE}"><img src="{$AUTHOR_AVATAR}" class="ui rounded centered image" alt="{$AUTHOR_NICKNAME}" style="max-height:80px; max-width:80px;" /></a><br />
			<a href="{$AUTHOR_PROFILE}" style="{$AUTHOR_STYLE}">{$AUTHOR_NICKNAME}</a>
			<div class="ui divider"></div>

			<a href="{$AUTHOR_RESOURCES}">&raquo; {$VIEW_OTHER_RESOURCES}</a>
            </center>
		  </div>
	    </div>
	  </div>
	</div>
  </div>
</div>

{include file='footer.tpl'}
