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
                                                <span class="text"># {$item.name}</span>
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

        <div class="ui four wide tablet eight wide computer column" id="socialize_post_list">

            {if isset($CHANNEL_ID_VIEW)}
                <div class="ui message icon announcement" style="border-top-style: solid; border-top-color: #0275d8;">
                    <i class="comments outline icon" style="color: #0275d8;"></i>
                    <div class="content">
                        <div class="header">{$LANG.channel_view_title}</div>
                        {$LANG.channel_view_desc} <b>{$CHANNEL_ID_VIEW}</b>
                    </div>
                </div>
            {/if}


            <div class="ui message icon announcement" id="socializeUploadingIndicator"
                style="border-top-style: solid; border-top-color: #0275d8; display:none;">
                <i class="notched circle loading icon" style="color: #0275d8;"></i>
                <div class="content">
                    <div class="header">Please wait!</div>
We're creating and uploading media content for your post, if files are bigger size it may take
                    some minutes.
                </div>
            </div>


            {if $POSTS != null && count($POSTS)}
            {if $USERINFO.userposts.status == 'POST_PUBLISHED'}
            <div class="ui message icon announcement" style="border-top-style: solid; border-top-color: #5cb85c;">
                <i class="check icon" style="color: #5cb85c;"></i>
                <div class="content">
                    <div class="header">{$LANG.success_post_published_title}</div>
                    {$LANG.success_post_published_title}
                </div>
            </div>
            {/if}

            <div id="postsSection">
                {foreach from=$POSTS item=item}

                <div class="ui fluid card socialize-post" id="socialize-post-{$item.id}">
                    <div class="content">
                        <div class="header">
                            <h5 class="ui image header">
                                <img class="ui circular image" src="{$item.authorAvatar}">
                                <div class="content">
                                    <a style="font-size:18px;{$item.authorStyle}"
                                        href="/profile/{$item.authorUsername}/"
                                        data-poload="/queries/user/?id={$item.authorId}">{$item.authorUsername}</a>
                                    <div class="sub header" data-toggle="tooltip" data-content="{$item.time}">
                                        {$item.timeAgo} </div>
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
                        <span id="ctag-{$item.channel}" class="ui ribbon label"
                            style="margin-top:5px;margin-bottom:5px;">
                            {$item.channel_name}
                        </span>
                        {/if}


                        <div class="description">
                            <p>{$item.content}</p>
                            {$totalImages=0}
                            {foreach from=$item.images item=image}
                            {if $totalImages >= 2}
                            <br />
                            <a href="/socialize/post?id={$item.id}">
                                <div class="ui message">
                                    <p>{$LANG.post_total_media_content|replace:'{x}':{count($item.images)}}</p>
                                </div>
                            </a>
                            {break}
                            {/if}
                            {if $image.ext != 'mp4'}
                            <img class="mediaFile" src="{$image.url_media}{$image.normal_name}{$image.ext}" alt=""><br>
                            {else}
                            <video class="mediaFile" loop="true" autoplay="autoplay" controls muted style="">
                                <source src="{$image.url_media}{$image.normal_name}{$image.ext}" type="video/mp4">
                                {$LANG.video_no_support}
                            </video><br>
                            {/if}
                            {$totalImages=$totalImages+1}
                            {/foreach}
                        </div>
                    </div>
                    <div class="extra content">

                        {if $USERINFO.loggeduser.loggedin == 'true'}
                        {if $item.ownPost == true}
                        <a onclick="likePost(this, {$item.id}, {$item.authorId}, 1)" style="cursor: not-allowed;"
                            class="soc-like {if $item.isLiked == true}active{/if} no_selection">
                            <button class="ui compact labeled icon {if $item.isLiked == true}red{/if} button"
                                style="cursor: not-allowed;">
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
                        <a onclick="return false;" class="soc-like">
                            <button class="ui compact labeled icon {if $item.isLiked == true}red{/if} button"
                                style="cursor: not-allowed;">
                                <i class="heart icon"></i>
                                <span>{$item.likesCount}</span>
                            </button>
                        </a>
                        {/if}

                        <a href="/socialize/post?id={$item.id}" class="soc-comment no_selection">
                            <span>
                                <button class="ui compact labeled icon button">
                                    <i class="comment icon"></i>
                                    {$item.commentsCount}
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
            </div>
            <br />
            {if {$PAGE_LOAD_MORE} == true && empty($CHANNEL_ID_VIEW)}
            <a href="/socialize/home?page={$PAGE}" class="ui button blue fluid">Next page</a>
            {/if}

            {else}
            <div class="ui message icon announcement" style="border-top-style: solid; border-top-color: #f0ad4e;">
                <i class="exclamation icon" style="color: #f0ad4e;"></i>
                <div class="content">
                    <div class="header">{$LANG.warning_no_posts_found_title}</div>
                    {$LANG.warning_no_posts_found_desc}
                </div>
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
                            {if $USERINFO.loggeduser.havePostPerm == true}
                            <div class="new-post-button">
                                <button id="newPostButton" class="ui mini button positive fluid" type="button"
                                    name="button" style="" data-toggle="modal" data-target="#newSocializePost"><i
                                        class="fas fa-plus"></i>
                                    {$LANG.new_post_button}</button>
                            </div>
                            {/if}
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

<div class="ui small modal" id="newSocializePost">
    <div class="header">
        {$LANG.creating_new_post_title}
    </div>
    <div class="content">
        <form class="ui form" action="" method="post" id="newSocializePostForm" enctype="multipart/form-data">

            <h5 class="ui image header">
                <img class="ui circular image" src="{$USERINFO.loggeduser.avatar}">
                <div class="content">
                    <a style="font-size:18px;{$USERINFO.loggeduser.style}"
                        onclick="return false;">{$USERINFO.loggeduser.username}</a>
                    <!-- <div class="sub header" data-toggle="tooltip" data-content=""></div> -->
                </div>
            </h5>

            {if $POST_TYPE == 5 || $POST_TYPE == 1}
            <div class="field">
                <textarea id="newSocializePostInput" style="resize:none;" rows="6" name="content"
                    placeholder="{$LANG.creating_new_post_placeholder}"></textarea>
            </div>
            {/if}
            {if $POST_TYPE != 5}
            <div class="field">
                <div>
                    <label for="file" class="ui icon button fluid">
                        <i class="file icon"></i>
                        <span id="socializeMediaNum">0</span> {$LANG.file_selected}</label>
                    <input type="file" id="file" name="mediaFiles[]" multiple style="display:none">
                </div>
            </div>
            {/if}
            <script type="text/javascript">
            </script>

            {if $CHANNELS_ENABLED == 1}
            <div class="field">
                <select class="ui dropdown" name="channel">
                    <option value="">{$LANG.Channel}</option>
                    {foreach $CHANNELS as $item}
                    <option value="{$item.id}">{$item.name}</option>
                    {/foreach}
                </select>
            </div>
            {/if}

            <div class="field">
                <select class="ui dropdown" name="optionVisibility">
                    <option value="">{$LANG.sett_visibility_post}</option>
                    <option value="1">{$LANG.sett_opt_everyone}</option>
                    <option value="2">{$LANG.sett_opt_loggedin}</option>
                </select>
            </div>
            <div class="field">
                <select class="ui dropdown" name="optionComment">
                    <option value="">{$LANG.sett_comment_post}</option>
                    <option value="1">{$LANG.sett_opt_loggedin}</option>
                    <option value="2">{$LANG.sett_opt_disabled_comments}</option>
                </select>
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

{include file='footer.tpl'}