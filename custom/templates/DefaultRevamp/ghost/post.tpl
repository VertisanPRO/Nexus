{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="cf-full-post" style="margin-top: 2rem">
        <div class="cf-full-post-img" style="background-image: url({$post_image})"></div>
        <div class="cf-full-post-body">
            <div class="ui grid">
                <div class="left aligned twelve wide column cf-full-post-title">{$post_name}</div>
                <div class="readtime" style="margin-left: auto; margin-right: 1rem;">
                    {$post_readtime}</div>
            </div>
            <div class="ui grid">
                <a style="display: flex; align-items: center; padding-right: 0.25rem" href="{$post_author_profile}"><img
                        class="ui mini circular image" src="{$post_avatar}" alt="{$post_author}"
                        style="height: 25px; width: 25px" /></a>
                <div class="twelve wide column cf-full-post-info" style="padding-left: 0">
                    <span class="cf-full-post-author"><a class="username" style="{$post_author_styles}"
                            href="{$post_author_profile}">{$post_author}</a>
                        {$post_author_groups}</span><span class="ghost-card-content">{$post_date}</span>
                </div>
            </div>
            <div class="cf-full-post-content" style="margin-top: 1rem">
                {$post_content}
            </div>
        </div>
    </div>

    {if !empty($GHOST_POSTS)}
        <div class="cf-more-posts" style="font-size: 2rem; font-weight: 600; color: #FFF; margin-top: 3rem">{$MORE_POSTS}
        </div>
        {include file='ghost/post-list.tpl'}
    {/if}
</div>
{include file='footer.tpl'}