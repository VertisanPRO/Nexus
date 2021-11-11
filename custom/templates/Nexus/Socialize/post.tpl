<script type="text/javascript" src="/core/assets/plugins/prism/prism.js"></script>
<script type="text/javascript" src="/core/assets/plugins/tinymce/tinymce.min.js"></script>

{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="ui stackable grid">
  <div class="ui centered row">
    <div class="ui six wide tablet four wide computer column">
      <div class="ui fluid card" id="">
        <div class="content">
          <h4 class="ui header"><i class="fas fa-fire"></i> {$LANG.trending_title}</h4>
          <div class="description">
            <div class="ui list">
              {if $TRENDING == 'Empty'}
              {$LANG.top_rending_undefined}
              {else}
              {foreach from=$TRENDING item=item}
              <div class="item">
                <span class="text">{$item.name}</span>
                <div class="description right floated"><b>{$item.value}</b></div>
              </div>
              {/foreach}
              {/if}
            </div>
          </div>
        </div>
      </div>

      <div class="ui fluid card" id="">
        <div class="content">
          <h4 class="ui header"><i class="fas fa-medal"></i> {$LANG.top_users_title}</h4>
          <div class="description">
            <div class="ui list">
              {foreach from=$TOPUSERS item=item}
                <div class="item">
                  <span class="text">{$item.type}</span>
                  <div class="description right floated">
                    <a href="/profile/{$item.authorUsername}/" data-poload="/queries/user/?id={$item.authorId}" style="{$item.authorStyle}"><b>{$item.authorUsername}</b></a>
                  </div>
                </div>
              {/foreach}
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="ui four wide tablet eight wide computer column">

      <a href="/socialize/home" class="ui mini button blue fluid"><i class="fas fa-home"></i></a>

      {foreach from=$POSTS item=item}
      <div class="ui fluid card socialize-post" id="socialize-post-{$item.id}">
        <div class="content">
          <div class="header">
            <h5 class="ui image header">
              <img class="ui circular image" src="{$item.authorAvatar}">
              <div class="content">
                <a style="font-size:18px;{$item.authorStyle}" href="/profile/{$item.authorUsername}/" data-poload="/queries/user/?id={$item.authorId}">{$item.authorUsername}</a>
                <div class="sub header" data-toggle="tooltip" data-content="{$item.time}">{$item.timeAgo}</div>
              </div>
            </h5>
          </div>

            <div class="description">
              <p>{$item.content}</p>
            </div>
          </div>
        <div class="extra content">
          <div class="sub header" style="justify-content:space-around;display:flex;font-size:16px;">

              <a data-toggle="modal" data-target="#likeListPost" onclick="return 0;" style="" class="soc-like"><span> <i class="fas fa-grin-hearts"></i></span></a>


              {if $USERINFO.loggeduser.loggedin == 'true'}
                {if $item.ownPost == true}
                  <a onclick="likePost(this, {$item.id}, {$item.authorId}, 1)" style="" class="soc-like {if $item.isLiked == true}active{/if} no_selection"><span>{$item.likesCount} <i class="{if $item.isLiked == true}fas {else} far{/if} fa-heart"></i></span></a>
                {else}
                <a onclick="likePost(this, {$item.id}, {$item.authorId}, 0)" style="" class="soc-like {if $item.isLiked == true}active{/if} no_selection"><span>{$item.likesCount} <i class="{if $item.isLiked == true}fas {else} far{/if} fa-heart"></i></span></a>
                {/if}
              {else}
                <a onclick="return false;" style="cursor: not-allowed;" class="soc-like no_selection"><span>{$item.likesCount} <i class="{if $item.isLiked == true}fas {else} far{/if} fa-heart"></i></span></a>
              {/if}

              {if $USERINFO.loggeduser.canDeletePost == 'true' or $item.ownPost == true}
                  <a onclick="return deletePost({if $USERINFO.loggeduser.canDeletePost == 'true'}1{else}0{/if}, {$item.id})" class="soc-comment no_selection"><span><i class="far fa-trash-alt"></i></span></a>
              {/if}
          </div>
        </div>
      </div>
      {/foreach}
      {if $USERINFO.loggeduser.loggedin == 'true'}
      <div class="ui fluid card" id="socialize-post-comment">
        <div class="content">
          <div class="header">
            <h5 class="ui image header">
              <img class="ui circular image" src="{$USERINFO.loggeduser.avatar}">
              <div class="content">
                <span style="font-size:18px;{$USERINFO.loggeduser.style}">{$USERINFO.loggeduser.username}</span>
              </div>
            </h5>
          </div>

          {if $USERINFO.loggeduser.haveCommentPerm == true}
            <div class="description">
              <form class="ui form" action="" method="post" id="newSocializeCommentForm">
                <div class="field">
                  <textarea id="socializeComment" style="resize:none;width:100%;height:8rem" name="content" rows="2"></textarea>
                </div>
                <input type="hidden" name="token" id="formtoken" value="{$USERINFO.loggeduser.token}">
                <input type="hidden" name="comment" value="1">
                <input type="hidden" name="action" value="newComment">
              </form>
            </div>
            <div class="sub header" style="justify-content:space-around;display:flex;font-size:16px;">
                <a onclick="submitComment()" class="ui mini button positive fluid"><span>{$LANG.comment_button_submit}</span></a>
            </div>
            {else}
            You have no permission to comment.
            {/if}
          </div>
      </div>
      {/if}
      {if count($POSTCOMMENTS)}
      <div class="ui fluid card" id="socialize-post-{$item.id}" style="padding: 0 1em;">
      {foreach from=$POSTCOMMENTS item=item}
        <div class="ui threaded comments" id="socialize-post-comment-{$item.id}" style="margin: 0.5em 0;">
           <div class="comment">
              <a class="ui circular image avatar">
              <img style="height:2.5em;" src="{$item.authorAvatar}" alt="nUKEmAN4" />
              </a>
              <div class="content">
                 <a class="author" href="/profile/{$item.authorUsername}/" data-poload="/queries/user/?id={$item.authorId}" style="{$item.authorStyle}">{$item.authorUsername}</a>
                 <div class="metadata">
                    <span class="date" data-toggle="tooltip" data-content="{$item.time}">{$item.timeAgo}</span>
                 </div>
                 <div class="text forum_post">
                    {$item.content}
                 </div>
                 {if $USERINFO.loggeduser.canDeleteComment == 'true' || $item.ownComment == 'true'}
                 <div class="actions">
                   <a onclick="return deleteComment({$item.id}, {if $USERINFO.loggeduser.canDeleteComment == 'true'}1{else}0{/if})">{$LANG.delete}</a>
                 </div>
                 {/if}
              </div>
           </div>
        </div>
      {/foreach}
    </div>
    {/if}

    </div>
    <div class="ui six wide tablet four wide computer column">
      <div class="ui fluid card">
        <div class="content">
          <div class="description">
            {if $USERINFO.loggeduser.loggedin == 'false'}
              <center>
                <p>{$LANG.login_warning}</p>
                <a class="ui small default button" href="/login/" target="">{$LANG.login_btn}</a>
                <a class="ui small primary button" href="/register/" target="">{$LANG.register_btn}</a>
              </center>
            {else}
              <center>
                  <img class="ui tiny circular image" src="{$USERINFO.loggeduser.avatar}" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">
                  <h2 class="ui header" style="margin-top:6px;">
                    <a href="/profile/{$USERINFO.loggeduser.username}/" data-poload="/queries/user/?id={$USERINFO.loggeduser.id}" style="{$USERINFO.loggeduser.style}">{$USERINFO.loggeduser.username}</a>

                  </h2>
                  {if $USERINFO.loggeduser.havePostPerm == true}
                  <div class="new-post-button">
                    <button id="newPostButton" class="ui mini button positive fluid" type="button" name="button" style="" data-toggle="modal" data-target="#newSocializePost"><i class="fas fa-plus"></i> {$LANG.new_post_button}</button>
                  </div>
                  {/if}
              </center>
            {/if}
          </div>
        </div>
      </div>
      {if $USERINFO.loggeduser.loggedin == 'true'}
      <div class="ui fluid card">
        <div class="content">
          <h4 class="ui header"><i class="fas fa-chart-bar"></i> {$LANG.stats_title}</h4>
          <div class="description">
            <div class="ui list">
                <div class="item">
                  <span class="text"><i class="far fa-paper-plane"></i></span> {$LANG.stats_total_published_posts}</span>
                  <div class="description right floated"><b>{$USERINFO.loggeduser.totalPosts}</b></div>
                </div>
              <div class="item">
                <span class="text"><i class="far fa-comment"></i> {$LANG.stats_total_commented_posts}</span>
                <div class="description right floated"><b>{$USERINFO.loggeduser.totalCommentedPosts}</b></div>
              </div>
              <div class="item">
                <span class="text"><i class="far fa-heart"></i></span> {$LANG.stats_total_liked_posts}</span>
                <div class="description right floated"><b>{$USERINFO.loggeduser.totalLikes}</b></div>
              </div>
              <div class="item">
                <span class="text"><i class="far fa-heart"></i></span> {$LANG.stats_total_received_likes}</span>
                <div class="description right floated"><b>{$USERINFO.loggeduser.totalReceivedLikes}</b></div>
              </div>
            </div>
          </div>
        </div>
      </div>
      {/if}
    </div>
  </div>
</div>

<div class="ui small modal" id="newSocializePost">
  <div class="header">
     {$LANG.creating_new_post_title}
  </div>
  <div class="content">
    <form class="ui form" action="" method="post" id="newSocializePostForm">
      <div class="field">
        <textarea id="newSocializePostInput" style="resize:none;"rows="6" name="content" placeholder="{$LANG.creating_new_post_placeholder}"></textarea>
      </div>
      <input type="hidden" name="token" id="formtoken" value="{$USERINFO.loggeduser.token}">
      <input type="hidden" name="post" value="1">
      <input type="hidden" name="action" value="newPost">
    </form>
  </div>
  <div class="actions" style="text-align: center;">
    <a class="ui negative button" style="">{$LANG.cancel_btn}</a>
    <button class="ui positive button" type="button" name="button" onclick="submitPost()">{$LANG.post_btn}</button>
  </div>
</div>

<div class="ui small modal" id="likeListPost">
  <div class="header">
     {$LANG.liked_by_post}
  </div>

  <div class="content">
      <div class="description" id="likeListPostContent">
        {if $LIKEDLIST.error == 1}
          <p>{$LIKEDLIST.message}</p>
        {/if}
        {if $LIKEDLIST.error != 1}
          {foreach from=$LIKEDLIST item=item}
          <a class="ui image label" href="/profile/{$item.authorUsername}/" data-poload="/queries/user/?id={$item.authorId}">
            <img src="{$item.authorAvatar}" alt="{$item.authorUsername}">{$item.authorUsername}
          </a>
          {/foreach}
        {/if}
      </div>
    </div>

  <div class="actions" style="text-align: center;">
    <a class="ui negative button" style="">{$LANG.close_btn}</a>
  </div>
</div>


{include file='footer.tpl'}
