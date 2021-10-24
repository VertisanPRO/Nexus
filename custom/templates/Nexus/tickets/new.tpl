{include file='header.tpl'}
{include file='navbar.tpl'}
<div class="ui container">
    <div class="ui header">
        <i class="fas fa-pencil-alt"></i>
        {$NEW_TICKET}
    </div>
    <div class="card-body">
        <form action="" method="post" class="ui form">
            <input type="hidden" name="token" value="{$TOKEN}">
            <div class="field">
                <label>{$TICKET_TITLE}</label>
                <input class="w-100 mb-2 form-control" type="text" placeholder="{$TICKET_TITLE}"
                       maxlength="64"
                       name="ticket_title" required>
            </div>
            <div class="field">
                <label>{$CATEGORIES_TITLE}</label>
                <select class="ui fluid search dropdown" name="ticket_categories[]" multiple="">
                    {if count($CATEGORIES) > 0}
                        {foreach from=$CATEGORIES item=category}
                            <option value="{$category->id}">{$category->text}</option>
                        {/foreach}
                    {/if}
                </select>
            </div>
            <div class="field">
                <label>{$YOUR_ISSUE}</label>
                <textarea class="w-100 my-2 form-control" placeholder="{$DESCRIBE_ISSUE}" maxlength="1024"
                              style="height:7rem;resize:vertical;" name="ticket_content" required></textarea>
            </div>
            <input type="submit" class="ui primary button" value="{$CREATE}">
            <a href="{$TICKETS_URL}" class="ui red button">{$CANCEL}</a>
        </form>
    </div>
</div>
{include file='footer.tpl'}

<style>
    .select2-search__field {
        width: calc(100% - 10px) !important;
    }
</style>
<script>
    $(".js-categories").select2({
        placeholder: "Categories",
    });
    $(document).ready(
        $(".dropdown").dropdown()
    );
</script>