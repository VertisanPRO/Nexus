<form action='{if $PAGE_RESULT == 1}{if $WP_TYPE}{else}wiki/{/if}../{else}{/if}' method ='GET' class="eight wide column" style="margin-right: 1rem; width: 50%!important">
    <div class="ui search icon input right floated" style="margin: 0 margin-bottom: 1rem">
        <div class="ui icon input right aligned" style="margin: 0">
            <input class="" type="text" name="search" id="search" value="{$SEARCH_RESULT}" placeholder="{$SEARCH_PLACEHOLDER}" style="margin: 0"> <!-- Add class prompt to make it beautifuler -->
            <i class="search icon"></i>
        </div>
    </div>
</form>