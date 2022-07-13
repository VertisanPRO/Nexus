{include file='header.tpl'}
{include file='navbar.tpl'}
<div class="ui stackable grid">
    <div class="ui centered row">


        {if !empty($WIDGETS_LEFT)}
            <div class="ui five wide tablet four wide computer column">
                {foreach from=$WIDGETS_LEFT item=widget}
                    {$widget}
                {/foreach}
            </div>
        {/if}
        <div
            class="ui {if !empty($WIDGETS_LEFT) && !empty($WIDGETS_RIGHT) }four wide tablet eight wide computer{elseif !empty($WIDGETS_LEFT) || !empty($WIDGETS_RIGHT)}ten wide tablet twelve wide computer{else}sixteen wide{/if} column">


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


            {if $VALIDATION != true}
                <p class="ui yellow center aligned header">{$VALIDATION_INFO} {$VALIDATION_CODE}</p>
                <p class="ui yellow center aligned header">{$IS_VALIDATION}</p>
            {else}
                <p class="ui green center aligned header">{$VERIFITED}</p>
            {/if}


        </div>
        {if !empty($WIDGETS_RIGHT)}
            <div class="ui five wide tablet four wide computer column">
                {foreach from=$WIDGETS_RIGHT item=widget}
                    {$widget}
                {/foreach}
            </div>
        {/if}
    </div>
</div>


{include file='footer.tpl'}