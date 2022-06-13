<form action='{if $PAGE_RESULT == 1}{if $WP_TYPE}{else}wiki/{/if}../{else}{/if}' method='GET' class="eight wide column">
    <div class="ui search icon input right floated" style="margin: 0">
        <div class="ui icon input">
            <input class="" type="text" name="search" id="search" value="{$SEARCH_RESULT}"
                placeholder="{$SEARCH_PLACEHOLDER}"> <!-- Add class prompt to make it beautifuler -->
            <i class="search icon"></i>
        </div>
    </div>
</form>