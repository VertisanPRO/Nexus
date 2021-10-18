{include file='header.tpl'}
{include file='navbar.tpl'}

<h2 class="ui header">
    {$STORE}
</h2>

<div class="ui stackable grid">
    <div class="ui centered row">
        <div class="ui sixteen wide column">
            <div class="ui padded segment">

                {include file='craftingstore/parts/nav.tpl'}

                <div class="ui bottom attached segment">
                    {$CONTENT}
                </div>
            </div>
        </div>
    </div>
</div>

{include file='footer.tpl'}