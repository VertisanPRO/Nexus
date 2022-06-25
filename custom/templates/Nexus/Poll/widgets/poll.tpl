<style>
    label.field.select-proc {
        background-color: rgba(74, 74, 74, 0.53);
    }

    label.field:hover {
        cursor: pointer;
        background: rgba(74, 74, 74, 0.53);
    }

    label.field {
        transition: all 250ms ease-out;
        padding: 1px 10px !important;
        border-radius: 3px;
    }

    label.field.select-proc label,
    label.field:hover label {
        color: white !important;
        transition: all 250ms ease-out;
    }
</style>

{foreach from=$POLL_DATA item=item key=key}
    <div class="ui fluid card" id="widget-online-staff">
        <div class="content">
            <h4 class="ui header"><a
                    href="{$VIEW_URL}{$POLL_DATA[$key]['poll']['id']}">{$POLL_DATA[$key]['poll']['subject']}</a></h4>
            <div class="description">
                {if isset($NO_LOGIN_TEXT)}
                    <p>{$NO_LOGIN_TEXT}</p>
                {/if}
                <form id="pollFrm" action="" method="post" name="pollFrm">
                    <div class="ui form">
                        <div class="grouped fields">
                            {foreach from=$POLL_DATA[$key]['options'] item=opt}
                                <label class="field">
                                    <input class="radio-select" style="display: none;" id="radio{$opt['id']}" type="radio"
                                        value="{$opt['id']}" name="voteOpt">
                                    <label style="pointer-events: none" for="radio{$opt['id']}">{$opt['name']}</label>
                                    <div style="margin-bottom: 6px;" class="ui small indicating progress"
                                        data-value="{$POLL_RESULT[$key][$opt['id']]}" data-total="{$TOTAL_VOTES[$key]}"
                                        id="process{$opt['id']}">
                                        <div class="bar">
                                            <div class="progress"></div>
                                        </div>
                                    </div>
                                </label>
                                <input type="hidden" id="proc" value="{$opt['id']}">
                            {/foreach}
                            <input type="hidden" name="pollID" value="{$POLL_DATA[$key]['poll']['id']}">
                            <input style="width: 100%;" type="submit" name="voteSubmit" class="mini ui green button"
                                value="{$VOTE_LABEL}">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

{/foreach}




<script>
    window.onload = function() {
        var options = JSON.parse('{$POLL_OPTIONS}');
        options.forEach(function(elem) {
            var progress = '#process' + elem.id;
            $(progress)
                .progress();
        });
        $('.radio-select').on('change', function(event) {
            $('.radio-select').parent().removeClass('select-proc');
            $(event.target).parent().addClass('select-proc');
            //console.debug(event);
        })
    };
</script>