{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="ui stackable grid">
    <div class="ui centered row">

        {if count($WIDGETS_LEFT)}
            <div class="ui six wide tablet four wide computer column">
                {foreach from=$WIDGETS_LEFT item=widget}
                    {$widget}
                {/foreach}
            </div>
        {/if}

        <div
            class="ui {if count($WIDGETS_LEFT) && count($WIDGETS_RIGHT) }four wide tablet eight wide computer{elseif count($WIDGETS_LEFT) || count($WIDGETS_RIGHT)}ten wide tablet twelve wide computer{else}sixteen wide{/if} column">

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
                        <ul class="list">
                            {foreach from=$ERRORS item=error}
                                <li>{$error}</li>
                            {/foreach}
                        </ul>
                    </div>
                </div>
            {/if}


            <div class="ui relaxed centered grid" style="margin-bottom: 2rem">


                {* Category *}
                <div class="ui centered aligned" style="margin-top: 2rem">
                    <a class="ui green button{if !isset($SELECT_CATEGORY_ID)} active{/if}" id="cat"
                        href="{$ALL_LINK}">{$SHOW_ALL}</a>

                    {foreach from=$CATEGORY_LIST item=category}
                        <a class="ui green button{if $SELECT_CATEGORY_ID === $category.id} active{/if}"
                            id="cat{$category.id}" href="{$category.link}">{$category.name}</a>

                    {/foreach}
                </div>

                <div class="ui four column centered row" style="margin-top: 2rem">

                    <div class="ui medium images">

                        {$i = 1}
                        {foreach from=$VIDEO_LIST item=video}

                            <div class="ui image rounded" onclick="videoModal({$i})">
                                <h3 class="ui header">{$video.name}</h3>
                                <img class="rounded" src="http://img.youtube.com/vi/{$video.code}/mqdefault.jpg">
                            </div>

                            <div class="ui longer modal {$i} inverted">



                                <div class="content" style="background-color: #303030">
                                    <div class="ui header centered aligned">{$video.name}
                                    </div>

                                    <div class="ui embed" data-url="https://youtube.com/embed/{$video.code}"
                                        data-placeholder="http://img.youtube.com/vi/{$video.code}/mqdefault.jpg"
                                        data-icon="youtube">
                                    </div>

                                    <div class="actions" style="margin-top: 2rem">
                                        <div class="ui center aligned description">{$video.description}</div>
                                    </div>
                                </div>
                            </div>
                            {$i++}
                        {/foreach}
                    </div>

                </div>
            </div>
            {$PAGINATION}


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

<script>
    $('.ui.embed').embed();

    function videoModal(id) {
        $('.ui.longer.modal.' + id)
            .modal('show');
    }
</script>