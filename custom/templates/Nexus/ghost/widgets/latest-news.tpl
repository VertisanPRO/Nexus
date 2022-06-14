<div class="card">
    <div class="card-header header-theme">{$GHOST_LATEST_NEWS}</div>
    <div class="card-body">
        {foreach $GHOST_LATEST_NEWS_ARRAY item=post name=ghost_latest_news_array}
            <a href="{$post.link}">
                <div class="d-flex{if !$smarty.foreach.ghost_latest_news_array.last} mb-3{/if}">
                    <div class="latest-news-image"><img src="{$post.image}" /></div>
                    <div class="ml-3 flex-grow-1">
                        <div class="latest-news-name">{$post.name}</div>
                        <div class="latest-news-date">{$post.date}</div>
                        <div class="latest-news-readtime">{$post.readtime}</div>
                    </div>
                </div>
            </a>
        {/foreach}
    </div>
</div>