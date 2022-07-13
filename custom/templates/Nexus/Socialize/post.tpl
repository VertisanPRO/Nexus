{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="ui stackable grid">
    <div class="ui centered row">
        {if $TRENDING_STATUS == 1 || $TOP_USERS_STATUS == 1}
            <div class="ui six wide tablet four wide computer column">
                {if $TRENDING_STATUS == 1}
                    <div class="ui fluid card" id="">
                        <div class="content">
                            <a class="ui ribbon label" style="margin-bottom: 10px;"><i class="fa-solid fa-fire"></i>
                                {$LANG.trending_title}</a>
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
                {/if}
                {if $TOP_USERS_STATUS == 1}
                    <div class="ui fluid card" id="">
                        <div class="content">
                            <a class="ui ribbon label" style="margin-bottom: 10px;"><i class="fa-solid fa-medal"></i>
                                {$LANG.top_users_title}</a>
                            <div class="description">
                                <div class="ui list">
                                    {foreach from=$TOPUSERS item=item}
                                        <div class="item">
                                            <span class="text">{$item.type}</span>
                                            <div class="description right floated">
                                                <a href="/profile/{$item.authorUsername}/"
                                                    data-poload="/queries/user/?id={$item.authorId}"
                                                    style="{$item.authorStyle}"><b>{$item.authorUsername}</b></a>
                                            </div>
                                        </div>
                                    {/foreach}
                                </div>
                            </div>
                        </div>
                    </div>
                {/if}

                {if $CHANNELS_ENABLED == 1}
                    <div class="ui fluid card" id="">
                        <div class="content">
                            <a class="ui ribbon label" style="margin-bottom: 10px;"><i class="fa-solid fa-comment-dots"></i>
                                Channels</a>
                            <div class="description">
                                <div class="ui list">
                                    <div class="item">
                                        <a href="/socialize/home" class="ui mini button blue fluid" type="button"
                                            name="button"><i class="fas fa-home"></i></a>
                                        <div class="description right floated"><b></b></div>
                                    </div>
                                    {foreach $CHANNELS as $item}
                                        <div class="item">
                                            # <a href="/socialize/home?channel_id={$item.id}"><span
                                                    class="text">{$item.name}</span></a>
                                            <div class="description right floated"><b>{$item.posts_count}</b></div>
                                        </div>
                                    {/foreach}
                                </div>
                            </div>
                        </div>
                    </div>
                {/if}

            </div>
        {/if}
        <div class="ui four wide tablet eight wide computer column">

            <a href="/socialize/home" class="ui mini button blue fluid"><i class="fas fa-home"></i></a>

            {foreach from=$POSTS item=item}
                <div class="ui fluid card socialize-post" id="socialize-post-{$item.id}">
                    <div class="content">
                        <div class="header">
                            <h5 class="ui image header">
                                <img class="ui circular image" src="{$item.authorAvatar}">
                                <div class="content">
                                    <a style="font-size:18px;{$item.authorStyle}" href="/profile/{$item.authorUsername}/"
                                        data-poload="/queries/user/?id={$item.authorId}">{$item.authorUsername}</a>
                                    <div class="sub header" data-toggle="tooltip" data-content="{$item.time}">
                                        {$item.timeAgo}</div>
                                </div>
                            </h5>
                        </div>
                        {if $CHANNELS_ENABLED == 1}
                            <style>
                                #ctag-{$item.channel}{
                                background: {$item.channel_color} !important;
                                color: {$item.channel_text_color} !important;

                                }

                                #ctag-{$item.channel}.ribbon.label::after{
                                border-right-color: {$item.channel_color} !important;
                                filter: brightness(85%) !important;
                                }

                                    {}
                            </style>
                            <span id="ctag-{$item.channel}" class="ui ribbon label" style="margin-top:5px;margin-bottom:5px;">
                                {$item.channel_name}
                            </span>
                        {/if}
                        <div class="description">
                            <p>{$item.content}</p>
                            {foreach from=$item.images item=image}
                                {if $image.ext != 'mp4'}
                                    <img class="mediaFile" src="{$image.url_media}{$image.normal_name}{$image.ext}" alt=""><br><br>
                                {else}
                                    <video loop="true" autoplay="autoplay" controls muted style="">
                                        <source class="mediaFile" src="{$image.url_media}{$image.normal_name}{$image.ext}"
                                            type="video/mp4">
                                        {$LANG.video_no_support}
                                    </video><br><br>
                                {/if}
                            {/foreach}
                        </div>
                    </div>
                    <div class="extra content">
                        {if $USERINFO.loggeduser.loggedin == 'true'}
                            {if $item.ownPost == true}
                                <a onclick="likePost(this, {$item.id}, {$item.authorId}, 1)" style="cursor: not-allowed;"
                                    class="soc-like {if $item.isLiked == true}active{/if} no_selection">
                                    <button class="ui compact labeled icon {if $item.isLiked == true}red{/if} button">
                                        <i class="heart icon"></i>
                                        <span>{$item.likesCount}</span>
                                    </button>
                                </a>
                            {else}
                                <a onclick="likePost(this, {$item.id}, {$item.authorId}, 0)" style=""
                                    class="soc-like {if $item.isLiked == true}active{/if} no_selection">
                                    <button class="ui compact labeled icon {if $item.isLiked == true}red{/if} button">
                                        <i class="heart icon"></i>
                                        <span>{$item.likesCount}</span>
                                    </button>
                                </a>
                            {/if}
                        {else}
                            <a onclick="return false;" style="cursor: not-allowed;" class="soc-like no_selection">
                                <button class="ui compact labeled icon {if $item.isLiked == true}red{/if} button">
                                    <i class="heart icon"></i>
                                    <span>{$item.likesCount}</span>
                                </button>
                            </a>
                        {/if}

                        <a data-toggle="modal" data-target="#likeListPost" onclick="return 0;" style="" class="soc-like">
                            <span>
                                <button class="ui compact labeled icon button">
                                    <i class="list icon"></i>
                                    <span>Likes</span>
                                </button>
                            </span>
                        </a>

                        {if $USERINFO.loggeduser.canDeletePost == 'true' or $item.ownPost == true}
                            <a onclick="return deletePost({if $USERINFO.loggeduser.canDeletePost == 'true'}1{else}0{/if}, {$item.id})"
                                class="soc-comment no_selection">
                                <span>
                                    <button class="ui compact icon button" style="float:right;">
                                        <i class="trash icon"></i>
                                    </button>
                                </span>
                            </a>
                        {/if}

                    </div>
                </div>
            {/foreach}
            {if {$POSTS[0].settingsComments} == 2}
                <div class="ui message icon announcement" style="border-top-style: solid; border-top-color: #d9534f;">
                    <i class="x icon" style="color: #d9534f;"></i>
                    <div class="content">
                        <div class="header">{$LANG.comments_disabled_title}}</div>
                        {$LANG.comments_disabled_desc}
                    </div>
                </div>
            {/if}
            {if $USERINFO.loggeduser.loggedin == 'true' && {$POSTS[0].settingsComments} != 2}
                <div class="ui fluid card" id="socialize-post-comment">
                    <div class="content">
                        <div class="header">
                            <h5 class="ui image header">
                                <img class="ui circular image" src="{$USERINFO.loggeduser.avatar}">
                                <div class="content">
                                    <span
                                        style="font-size:18px;{$USERINFO.loggeduser.style}">{$USERINFO.loggeduser.username}</span>
                                </div>
                            </h5>
                        </div>

                        {if $USERINFO.loggeduser.haveCommentPerm == true}
                            <div class="description">
                                <form class="ui form" action="" method="post" id="newSocializeCommentForm">
                                    <div class="field">
                                        <textarea id="socializeComment" style="resize:none;width:100%;height:8rem"
                                            name="content" rows="2"></textarea>
                                    </div>
                                    <input type="hidden" name="token" id="formtoken" value="{$USERINFO.loggeduser.token}">
                                    <input type="hidden" name="comment" value="1">
                                    <input type="hidden" name="action" value="newComment">
                                </form>
                            </div>
                            <div class="sub header" style="justify-content:space-around;display:flex;font-size:16px;">
                                <a onclick="submitComment()"
                                    class="ui mini button positive fluid"><span>{$LANG.comment_button_submit}</span></a>
                            </div>
                        {else}
                            <p style="margin-top:6px;">{$LANG.no_perm_comment}</p>
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
                                    <a class="author" href="/profile/{$item.authorUsername}/"
                                        data-poload="/queries/user/?id={$item.authorId}"
                                        style="{$item.authorStyle}">{$item.authorUsername}</a>
                                    <div class="metadata">
                                        <span class="date" data-toggle="tooltip"
                                            data-content="{$item.time}">{$item.timeAgo}</span>
                                    </div>
                                    <div class="text forum_post">
                                        {$item.content}
                                    </div>
                                    {if $USERINFO.loggeduser.canDeleteComment == 'true' || $item.ownComment == 'true'}
                                        <div class="actions">
                                            <a
                                                onclick="return deleteComment({$item.id}, {if $USERINFO.loggeduser.canDeleteComment == 'true'}1{else}0{/if})">{$LANG.delete}</a>
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
                                <img class="ui tiny circular image" src="{$USERINFO.loggeduser.avatar}"
                                    style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">
                                <h2 class="ui header" style="margin-top:6px;">
                                    <a href="/profile/{$USERINFO.loggeduser.username}/"
                                        data-poload="/queries/user/?id={$USERINFO.loggeduser.id}"
                                        style="{$USERINFO.loggeduser.style}">{$USERINFO.loggeduser.username}</a>

                                </h2>
                                <a href="/socialize/home" class="ui mini button blue fluid"><i class="fas fa-home"></i></a>
                            </center>
                        {/if}
                    </div>
                </div>
            </div>
            {if $USERINFO.loggeduser.loggedin == 'true' && $USER_STATS_STATUS == 1}
                <div class="ui fluid card">
                    <div class="content">
                        <a class="ui ribbon label" style="margin-bottom: 10px;"><i class="fa-solid fa-chart-bar"></i>
                            {$LANG.stats_title}</a>
                        <div class="description">
                            <div class="ui list">
                                <div class="item">
                                    <span class="text"><i class="far fa-paper-plane"></i>
                                        {$LANG.stats_total_published_posts}</span>
                                    <div class="description right floated"><b>{$USERINFO.loggeduser.totalPosts}</b></div>
                                </div>
                                <div class="item">
                                    <span class="text"><i class="far fa-comment"></i>
                                        {$LANG.stats_total_commented_posts}</span>
                                    <div class="description right floated"><b>{$USERINFO.loggeduser.totalCommentedPosts}</b>
                                    </div>
                                </div>
                                <div class="item">
                                    <span class="text"><i class="far fa-heart"></i> {$LANG.stats_total_liked_posts}</span>
                                    <div class="description right floated"><b>{$USERINFO.loggeduser.totalLikes}</b></div>
                                </div>
                                <div class="item">
                                    <span class="text"><i class="far fa-heart"></i>
                                        {$LANG.stats_total_received_likes}</span>
                                    <div class="description right floated"><b>{$USERINFO.loggeduser.totalReceivedLikes}</b>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            {/if}
        </div>
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
                    <a class="ui image label" href="/profile/{$item.authorUsername}/"
                        data-poload="/queries/user/?id={$item.authorId}">
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