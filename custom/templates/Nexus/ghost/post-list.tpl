<div class="ghost-list">
    {foreach $GHOST_POSTS item=post}
        <div class="{$post.card_size}">
            <div class="ghost-card-img">
                <a href="{$post.link}"><img src="{$post.image}" alt="{$post.name}" loading="lazy"></a>
            </div>
            <div class="ghost-card-body">
                <div class="ghost-card-title"><a href="{$post.link}">{$post.name}</a></div>
                <div class="ghost-card-content">{$post.content}</div>
                {if $post.card_size == "post-card-large"}
                    <div class="ui grid"  style="margin-top: 1rem">
                        <div class="left floated right aligned three wide column">
                          <a href="{$post.author_profile}"><img src="{$post.avatar}" alt="{$post.author}"
                                style="height: 40px; width: 40px" /></a>
                        </div>
                        <div class="center floated left aligned seven wide column">
                          <div class="full-post-info">
                            <div class="full-post-author"><a style="{$post.author_styles}"
                                    href="{$post.author_profile}">{$post.author}</a>
                            </div>
                            <div>{$post.date}</div>
                          </div>
                        </div>
                        <div class="right floated center aligned six wide column">
                            <div class="ghost-readtime">{$post.readtime}</div>
                        </div>
                    </div>
                {/if}
            {if $post.card_size !== "post-card-large"}
                <div class="ui grid" style="margin-top: 1rem">
                    <div class="left floated right aligned three wide column">
                      <a href="{$post.author_profile}"><img src="{$post.avatar}" alt="{$post.author}"
                            style="height: 40px; width: 40px" /></a>
                    </div>
                    <div class="center floated left aligned six wide column">
                      <div class="full-post-info">
                        <div class="full-post-author"><a style="{$post.author_styles}"
                                href="{$post.author_profile}">{$post.author}</a>
                        </div>
                        <div>{$post.date}</div>
                      </div>
                    </div>
                    <div class="right floated center aligned seven wide column">
                      <div class="ghost-readtime">{$post.readtime}</div>
                    </div>
                </div>
            {/if}
            </div>
        </div>
    {/foreach}
</div>