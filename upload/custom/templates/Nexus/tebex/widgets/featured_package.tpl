<div class="ui fluid card" id="widget-featured-package">
    <div class="content">
        <h4 class="ui header">{$FEATURED_PACKAGE}</h4>
        <div class="ui card">
            {if $PACKAGE.image}
                <div class="image">
                    {if $PACKAGE.sale_active}
                        <span class="ui right ribbon red label">
                            {$SALE}
                        </span>
                    {/if}
                    <img src="{$PACKAGE.image}" alt="{$PACKAGE.name}">
                </div>
            {/if}
            <div class="center aligned content">
                <span class="header">{$PACKAGE.name}</span>
                <div class="ui divider"></div>
                {if $PACKAGE.sale_active}
                    <span style="color: #dc3545;text-decoration:line-through;">{$CURRENCY}{$PACKAGE.price}</span>
                {/if}
                {$CURRENCY}{$PACKAGE.real_price}
            </div>
            <a class="ui bottom attached blue button" href="{$PACKAGE.link}">
                {$VIEW} &raquo;
            </a>
        </div>
    </div>
</div>