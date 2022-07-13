{include file='header.tpl'}
{include file='navbar.tpl'}
<div class="ui stackable grid">
    <div class="ui centered row">

        {if isset($WIDGETS_LEFT) && count($WIDGETS_LEFT)}
            <div class="ui six wide tablet four wide computer column">
                {foreach from=$WIDGETS_LEFT item=widget}
                    {$widget}
                {/foreach}
            </div>
        {/if}

        <div
            class="ui {if count($WIDGETS_LEFT) && count($WIDGETS_RIGHT) }four wide tablet eight wide computer{elseif count($WIDGETS_LEFT) || count($WIDGETS_RIGHT)}ten wide tablet twelve wide computer{else}sixteen wide{/if} column">

            <h2 class="ui header">{$TITLE}</h2>

            {if isset($SUCCESS)}
                <div class="ui message icon announcement" style="border-top-style: solid; border-top-color: #5cb85c;">
                    <i class="check icon" style="color: #5cb85c;"></i>
                    <div class="content">
                        {$SUCCESS}
                    </div>
                </div>
            {/if}

            {if isset($ERRORS)}
                <div class="ui message icon announcement" style="border-top-style: solid; border-top-color: #d9534f;">
                    <i class="x icon" style="color: #d9534f;"></i>
                    <div class="content">
                        {foreach from=$ERRORS item=error}
                            <li>{$error}</li>
                        {/foreach}
                    </div>
                </div>
            {/if}

            <div class="ui top attached button"><i class="fa fa-shopping-basket"></i> {$CATEGORIES}</div>
            <div class="ui centered grid button pointing menu">
                {foreach from=$CATEGORIES_LIST item=category}
                    <form action="" method="post">
                        <button type="submit" name="id" value="{$category.id}"
                            class="{if $ACTIVE_CATEGORY == $category.id}active {/if}ui green item button">{$category.name}</button>
                    </form>
                {/foreach}
            </div>

            <div class="ui center aligned header">{$CATEGORY_DESCRIPTION}</div>



            <div class="ui four doubling centered cards">
                {foreach from=$PRODUCT_LIST item=product}
                    <div class="ui card">
                        <div class="image">
                            <img src="{$product.img}">
                        </div>
                        <div class="ui content">
                            <div class="ui center aligned header">{$product.name}</div>
                            <div class="ui center aligned description">
                                <strong>{$product.price} {$CURRENCY}</strong>
                            </div>
                        </div>
                        <button type="button" class="ui button" onclick="productModal({$product.id})">{$INFO}</button>

                    </div>



                    <div class="ui modal {$product.id}">

                        <i class="close icon"></i>
                        <div class="ui center aligned header">
                            {$product.name}
                            <strong id="new_price{$product.id}">{$product.price}</strong> <strong>
                                {$CURRENCY}</strong>
                        </div>
                        <div class="image content">
                            <div class="ui description">
                                <p>{$product.description}</p>
                            </div>
                        </div>
                        <div class="ui actions">

                            <form class="ui form" action="{$BUY_LINK}" method="post">
                                <div class="fields">
                                    <div class="field">
                                        <div class="ui black deny button">
                                            {$CLOSE}
                                        </div>
                                    </div>
                                    <input type="hidden" name="product_id" value="{$product.id}">
                                    <input type="hidden" name="token" value="{$TOKEN}">
                                    {if $product.type === 2}
                                        <div class="ui field">
                                            <input type="number"
                                                oninput="calc(this.value, '{$product.eco_count}', '{$product.id}', '{$product.price}')"
                                                placeholder="{$COUNT_TITLE}" id="product_count" name="product_count" value="1">
                                        </div>
                                        <span id="eco_info{$product.id}"></span>

                                    {/if}
                                    {if ($VALIDATION != 1)}
                                        <div class="ui field">
                                            <input type="text" required placeholder="{$NICKNAME}" id="user_name"
                                                name="user_name">
                                        </div>
                                    {/if}
                                    <div class="field">
                                        <button type="submit" class="ui primary button"><i
                                                class="checkmark icon"></i>{$TO_BUY}</button>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>







                {/foreach}

            </div>



        </div>

        {if count($WIDGETS_RIGHT)}
            <div class="ui six wide tablet four wide computer column">
                {foreach from=$WIDGETS_RIGHT item=widget}
                    {$widget}
                {/foreach}
            </div>
        {/if}

    </div>
</div>

{include file='footer.tpl'}
<script type="text/javascript">
    function productModal(id) {
        $('.ui.modal.' + id)
            .modal('show');
    }
</script>