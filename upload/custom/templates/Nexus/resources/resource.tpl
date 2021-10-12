{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="ui container">
  <div class="ui padded segment">
    <div class="ui stackable grid">
	    <div class="ui row">
		    <div class="ui ten wide column">
			    <h2 style="display:inline;">{$VIEWING_RESOURCE}</h2> {$RELEASE_TAG}
		    </div>
		    <div class="ui six wide column">
			    <div class="res right floated">
				    {if isset($CAN_UPDATE)}
					    <a href="{$UPDATE_LINK}" class="ui blue button">{$UPDATE}</a>
				    {/if}
				    <a href="{$BACK_LINK}" class="ui button">{$RESOURCE_INDEX}</a>
			    </div>
		    </div>
	    </div>
	    <div class="ui divider"></div>

	  <div class="ui row">
	    <div class="twelve wide column">
	      <div class="forum_post">
	        {$DESCRIPTION}
	      </div>

		  <br />{if $HAS_CONTRIBUTORS eq 1}{$CONTRIBUTORS} {$RESOURCE_CONTRIBUTORS}{/if}

		  <div class="ui divider"></div>

		  {if isset($LOG_IN_TO_DOWNLOAD)}
			  <button disabled class="ui blue disabled button">{$LOG_IN_TO_DOWNLOAD}</button>
		  {/if}
		  {if isset($DOWNLOAD_URL)}
			  <a href="{$DOWNLOAD_URL}" class="ui blue button" target="_blank">{$DOWNLOAD}</a>
		  {elseif isset($PURCHASE_FOR_PRICE)}
			  <a {if isset($PURCHASE_LINK)}href="{$PURCHASE_LINK}" {else}disabled {/if}class="ui blue{if !isset($PURCHASE_LINK)} disabled{/if} button">{$PURCHASE_FOR_PRICE}</a>
		  {elseif isset($PAYMENT_PENDING)}
			  <button type="button" disabled class="ui blue button">{$PAYMENT_PENDING}</button>
		  {/if}

		  <span class="pull-right">
			{if isset($CAN_EDIT)}<a href="{$EDIT_LINK}" class="ui button">{$EDIT}</a>{/if}
			{if isset($MODERATION) && count($MODERATION)}
				<div class="ui top right pointing dropdown small primary button" tabindex="0">
				<span class="text">{$MODERATION_TEXT}</span>
					<i class="dropdown icon"></i>
					<div class="menu" tabindex="-1">
						<div class="header">{$MODERATION_TEXT}</div>
					    {foreach from=$MODERATION item=item}
						  <a class="item" href="{$item.link}">{$item.title}</a>
					    {/foreach}
					</div>
				</div>
			{/if}
		    <a href="{$OTHER_RELEASES_LINK}" class="ui teal button">{$OTHER_RELEASES}</a>
		  </span>

		</div>

		<div class="four wide column">
		  <div class="ui center aligned segment">
			  {$RESOURCE}
			  <div class="ui divider"></div>

		    <div class="card-body">
				<div class="star-rating view">
				  <span class="far fa-star" data-rating="1" style="color:gold;"></span>
				  <span class="far fa-star" data-rating="2" style="color:gold"></span>
				  <span class="far fa-star" data-rating="3" style="color:gold;"></span>
				  <span class="far fa-star" data-rating="4" style="color:gold;"></span>
				  <span class="far fa-star" data-rating="5" style="color:gold;"></span>
				  <input type="hidden" name="rating" class="rating-value" value="{$RATING}">
				</div>
			    {$VIEWS}<br />
			    {$DOWNLOADS}
			</div>
		  </div>
		  <br />
		  <div class="ui center aligned segment">
			{$AUTHOR}
			<div class="ui divider"></div>

			<a href="{$AUTHOR_PROFILE}"><img src="{$AUTHOR_AVATAR}" class="ui rounded centered image" alt="{$AUTHOR_NICKNAME}" style="max-height:80px; max-width:80px;" /></a><br />
			<a href="{$AUTHOR_PROFILE}" style="{$AUTHOR_STYLE}">{$AUTHOR_NICKNAME}</a>
			<div class="ui divider"></div>

			<a href="{$AUTHOR_RESOURCES}">&raquo; {$VIEW_OTHER_RESOURCES}</a>
			</div>
		  </div>
		</div>
	  </div>

	  <div class="ui divider"></div>

	  <h3>{$REVIEWS}</h3>

	  {if count($COMMENT_ARRAY)}
	    {foreach from=$COMMENT_ARRAY item=comment}
		  <div class="ui segment">
			  {$comment.content}
			  {if isset($DELETE_REVIEW)}
				  <br /><br /><span class="res right floated"><a href="{$comment.delete_link}" onclick="return confirm('{$CONFIRM_DELETE_REVIEW}');">{$DELETE_REVIEW}</a></span><br />
			  {/if}
			  <hr />
		      <div class="star-rating view" style="display:inline;">
		        <span class="far fa-star" data-rating="1" style="color:gold;"></span>
		        <span class="far fa-star" data-rating="2" style="color:gold"></span>
		        <span class="far fa-star" data-rating="3" style="color:gold;"></span>
		        <span class="far fa-star" data-rating="4" style="color:gold;"></span>
		        <span class="far fa-star" data-rating="5" style="color:gold;"></span>
		        <input type="hidden" name="rating" class="rating-value" value="{$comment.rating}">
		      </div> | {$comment.release_tag} | <span data-toggle="tooltip" data-content="{$comment.date_full}">{$comment.date}</span>
			  <span class="res right floated">
			    <a href="{$comment.user_profile}"><img class="ui avatar image" src="{$comment.user_avatar}" style="height:25px;width:25px;display:inline;" alt="{$comment.username}" /></a> <a href="{$comment.user_profile}" style="{$comment.user_style}">{$comment.username}</a>
			  </span>
		  </div>
		  <br />
		{/foreach}
		{$PAGINATION}
	  {else}
	    <p>{$NO_REVIEWS}</p>
	  {/if}

	  {if $CAN_REVIEW == true && !isset($PAYMENT_PENDING) && !isset($PURCHASE_FOR_PRICE)}
	  <h4>{$NEW_REVIEW}</h4>
	  <form action="" method="post" class="ui form">
	    <div class="form-group">
		  <div class="star-rating set">
		    <span class="far fa-star" data-rating="1" style="color:gold;"></span>
		    <span class="far fa-star" data-rating="2" style="color:gold"></span>
		    <span class="far fa-star" data-rating="3" style="color:gold;"></span>
		    <span class="far fa-star" data-rating="4" style="color:gold;"></span>
		    <span class="far fa-star" data-rating="5" style="color:gold;"></span>
		    <input type="hidden" name="rating" class="rating-value" value="0">
		  </div>
		</div>
		<br />
	    <div class="form-group">
		  {if !isset($MARKDOWN)}
		  <textarea style="width:100%" name="content" id="editor" rows="15"></textarea>
		  {else}
		  <textarea class="form-control" style="width:100%" id="markdown" name="content" rows="20"></textarea>
		  <span class="pull-right"><i data-toggle="popover" data-placement="top" data-html="true" data-content="{$MARKDOWN_HELP}" class="fa fa-question-circle text-info" aria-hidden="true"></i></span>
		  {/if}
	    </div>
		<br />
		<div class="form-group">
		  <input type="hidden" name="token" value="{$TOKEN}">
		  <input type="submit" class="ui blue button" value="{$SUBMIT}">
		</div>
	  </form>
	  {/if}

    </div>
  </div>
</div>

{include file='footer.tpl'}
