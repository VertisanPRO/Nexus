<div class="ghost-list">
    {foreach $GHOST_POSTS item=post}
        <div class="{$post.card_size}">
            <div class="ghost-card-img">
                <a href="{$post.link}"><img src="{$post.image}" alt="{$post.name}" loading="lazy"></a>
            </div>
            <div class="ghost-card-body">
                <div class="ghost-card-title"><a class="a" href="{$post.link}">{$post.name}</a></div>
                <div class="ghost-card-content">{$post.content}</div>
                {if $post.card_size == "post-card-large"}
                    <div class="ui compact aligned stackable grid"  style="margin-top: 1rem">
                        <div class="right aligned sixteen wide mobile tablet right aligned three wide computer column">
                          <a href="{$post.author_profile}"><img class="ui mini circular centered mobile tablet right floated computer image" src="{$post.avatar}" alt="{$post.author}"
                                style="height: 40px; width: 40px" /></a>
                        </div>
                        <div class="left aligned sixteen wide mobile tablet left aligned seven wide computer column">
                          <div class="full-post-info">
                            <div class="full-post-author">
								<a style="{$post.author_styles}"
                                    href="{$post.author_profile}">{$post.author}</a>
                            </div>
                            <div class="ghost-card-content">{$post.date}</div>
                          </div>
                        </div>
                        <div class="center aligned sixteen wide mobile tablet right floated center aligned six wide computer column">
                            <div class="ghost-readtime">{$post.readtime}</div>
                        </div>
                    </div>
                {/if}
            {if $post.card_size !== "post-card-large"}
                <div class="ui compact aligned grid" style="margin-top: 1rem">
                    <div class="right aligned  three wide column">
                      <a href="{$post.author_profile}"><img class="ui mini circular right floated image" src="{$post.avatar}" alt="{$post.author}"
                            style="height: 40px; width: 40px" /></a>
                    </div>
                    <div class="left floated left aligned eight wide column">
                      <div class="full-post-info">
                        <div class="full-post-author"><a style="{$post.author_styles}"
                                href="{$post.author_profile}">{$post.author}</a>
                        </div>
                        <div class="ghost-card-content">{$post.date}</div>
                      </div>
                    </div>
                    <div class="right floated center aligned five wide column">
                      <div class="ghost-readtime">{$post.readtime}</div>
                    </div>
                </div>
            {/if}
            </div>
        </div>
    {/foreach}
</div>