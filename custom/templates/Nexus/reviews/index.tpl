{include file='header.tpl'}
{include file='navbar.tpl'}
{include file="reviews/review_modal.tpl"}

<style>
    .remove_icon_button,
    .unlist_icon_button,
    .unapprove_icon_button,
    .approve_icon_button,
    .restore_icon_button {
        cursor: pointer;
    }

    .remove_icon_button:hover {
        color: #FF673B;
    }

    .unlist_icon_button:hover {
        color: #FFBB3B;
    }

    .approve_icon_button:hover {
        color: #8BDE28;
    }

    .unapprove_icon_button:hover {
        color: #D73C12;
    }

    .restore_icon_button:hover {
        color: #3CB4D1;
    }

    .ui.ok:hover {
        background-color: transparent !important;
        color: white !important;
    }

    .ui.feed>.event>.label+.content {
        margin: 0.5em 0 0.5em 0.4em !important;
    }

    .ui.statistic>.label,
    .ui.statistics .statistic>.label {
        color: unset !important;
    }
</style>

<h2 class="ui text header" id="reviews_keyword">
    {$REVIEWS_KEYWORD}
</h2>

<div class="ui segments"
    style="margin: auto !important; -webkit-box-shadow: none !important; box-shadow: none !important; border: 0 !important;">
    <div class="ui segment" style="background: transparent !important;">
        {if $AMOUNT <= 0}
            {include file="reviews/reviews_header_menu.tpl"}
            <div class="ui segments"
                style="width: 60% !important; margin: 1em auto !important; -webkit-box-shadow: none !important; box-shadow: none !important; border: 0 !important;">
                <div class="ui center aligned segment">
                    {$NO_REVIEWS}
                </div>
            </div>
        {else}
            <div class="ui centered">
                <div class="ui statistics">
                    <div class="yellow statistic" style="flex-grow: 1;">
                        <div class="value">
                            <i class="star icon"></i>{$AVERAGE_SCORE}
                        </div>
                        <div class="label">
                            {$REVIEWS_OUT_OF}
                        </div>
                    </div>
                </div>
            </div>
            {include file="reviews/reviews_header_menu.tpl"}
            {include file="reviews/reviews_container.tpl"}
        {/if}
    </div>
</div>

<div class="ui basic modal review_actions_modal">
    <!-- Remove section -->
    <div class="ui icon header review_actions_modal_remove">
        <i class="trash alternate icon"></i>
        {$REVIEWS_ACTIONS_TITLE_PLACEHOLDER|replace:'X': {$REVIEWS_REMOVE|ucfirst} }
    </div>
    <div class="content review_actions_modal_remove">
        {$REVIEWS_ACTIONS_PLACEHOLDER|replace:'X': {$REVIEWS_REMOVE} }
    </div>

    <!-- Unlist section -->
    <div class="ui icon header review_actions_modal_unlist">
        <i class="eye slash icon"></i>
        {$REVIEWS_ACTIONS_TITLE_PLACEHOLDER|replace:'X': {$REVIEWS_UNLIST|ucfirst} }
    </div>
    <div class="content review_actions_modal_unlist">
        {$REVIEWS_ACTIONS_PLACEHOLDER|replace:'X': {$REVIEWS_UNLIST} }
    </div>

    <!-- Approve section -->
    <div class="ui icon header review_actions_modal_approve">
        <i class="check slash icon"></i>
        {$REVIEWS_ACTIONS_TITLE_PLACEHOLDER|replace:'X': {$REVIEWS_APPROVE|ucfirst} }
    </div>
    <div class="content review_actions_modal_approve">
        {$REVIEWS_ACTIONS_PLACEHOLDER|replace:'X': {$REVIEWS_APPROVE} }
    </div>

    <!-- Unapprove section -->
    <div class="ui icon header review_actions_modal_unapprove">
        <i class="remove slash icon"></i>
        {$REVIEWS_ACTIONS_TITLE_PLACEHOLDER|replace:'X': {$REVIEWS_UNAPPROVE|ucfirst} }
    </div>
    <div class="content review_actions_modal_unapprove">
        {$REVIEWS_ACTIONS_PLACEHOLDER|replace:'X': {$REVIEWS_UNAPPROVE} }
    </div>

    <!-- Restore section -->
    <div class="ui icon header review_actions_modal_restore">
        <i class="undo icon"></i>
        {$REVIEWS_ACTIONS_TITLE_PLACEHOLDER|replace:'X': {$REVIEWS_RESTORE|ucfirst} }
    </div>
    <div class="content review_actions_modal_restore">
        {$REVIEWS_ACTIONS_PLACEHOLDER|replace:'X': {$REVIEWS_RESTORE} }
    </div>

    <!-- Actions -->
    <div class="actions">
        <div class="ui white basic cancel inverted button">
            <i class="remove icon"></i>
            {$NO_PLACEHOLDER}
        </div>
        <div class="ui ok inverted button">
            <i class="checkmark icon"></i>
            {$YES_PLACEHOLDER}
        </div>
    </div>
</div>

{include file='footer.tpl'}

<script>
    {include file='reviews/js/scripts.js'}
</script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>