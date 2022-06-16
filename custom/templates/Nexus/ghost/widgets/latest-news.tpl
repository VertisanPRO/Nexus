<div class="ui fluid card">
    <div class="content">
        <a class="ui ribbon label" style="margin-bottom: 10px;"><i class="fa-solid fa-bell"></i>
            {$GHOST_LATEST_NEWS}</a>
        <div class="ui two column grid">
            {foreach $GHOST_LATEST_NEWS_ARRAY item=post name=ghost_latest_news_array}
                <div class="row">
                    <div class="six wide column latest-news-image" style="margin-top: 0.3rem">
                        <a href="{$post.link}">
                            <img src="{$post.image}" />
                        </a>
                    </div>
                    <div class="ten wide column">
                        <div class="latest-news-name">{$post.name}</div>
                        <div class="latest-news-date">{$post.date}</div>
                        <div class="latest-news-readtime">{$post.readtime}</div>
                    </div>
                </div>
            {/foreach}
        </div>
    </div>
</div>