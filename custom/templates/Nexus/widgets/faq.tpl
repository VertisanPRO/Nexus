<style>
    body.dark .ui.styled.accordion {
        background: #1c1c1c;
    }

    body.dark .ui.styled.accordion a {
        color: #4183c4;
    }

    body.dark .ui.styled.accordion .active.title {
        color: #d4d4d4;
    }

    body.dark .ui.styled.accordion .title {
        color: #a1a1a1;
    }

    body.dark .ui.styled.accordion .title:hover {
        color: #d4d4d4;
    }

    body.dark .ui.segment {
        color: white;
    }
</style>
<div class="ui fluid card" id="widget-faq">
    <div class="content">
        <a class="ui ribbon label" style="margin-bottom: 10px;"><i class="fa-solid fa-circle-info"></i>
            {$FAQ} ({$AMOUNT})</a>
        <div class="description">
            {if isset($QUESTIONS) && count($QUESTIONS)}
                <div class="ui segments"
                    style="width: 100% !important; margin: auto !important; -webkit-box-shadow: none !important; box-shadow: none !important; border: 0 !important;">
                    <div class="ui segment" style="padding: 0 !important; background: transparent !important;">
                        <div class="ui styled fluid accordion">
                            {foreach from=$QUESTIONS item=q}
                                {if isset($q->enabled) && $q->enabled == "1"}
                                    <a href="{$q->original_link}">
                                        <div class="{if $q->nameid == $ACTIVE || $q->id == $ACTIVE}active {/if}title">
                                            <i class="dropdown icon"></i>
                                            {$q->question}
                                        </div>
                                    </a>
                                {/if}
                            {/foreach}
                        </div>
                    </div>
                </div>
            {else}
                {$NO_QUESTIONS_FOUND}
            {/if}
        </div>
    </div>
    <div class="extra content">
        <a href="{$FAQ_LINK}">
            <button class="fluid ui button">{$WIDGET_BUTTON}</button>
        </a>
    </div>
</div>