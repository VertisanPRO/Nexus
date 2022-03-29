<!-- Options Content -->
<div class="card mb-3">
    <h3 class="card-header mb-3 text-center">{$OPTIONS_PAGE}</h3>
    <div class="card-body">
        <div class="alert bg-primary text-white">
            <h5><i class="icon fas fa-sticky-note"></i> {$NOTE}</h5>
            {$NOTE_REVIEW}
        </div>
        <form action="" method="POST">
            <div class="form-group">
                <label for="footerView">View about in footer?</label>
                <select id="inputFooterView" class="form-control mr-sm-2" name="footerView">
                    <option value="0" {if $FOOTERVIEW eq '0' } selected{/if}>{$DISABLED}</option>
                    <option value="1" {if $FOOTERVIEW eq '1' } selected{/if}>{$ENABLED}</option>
                </select>
            </div>
            {if $FOOTERVIEW eq '1'}
            <div class="form-group">
                <label for="footerAbout">{$ABOUT_LABEL}</label>
                <input type="text" name="footerAbout" class="form-control" id="inputFooterAbout"
                    placeholder="{$ABOUT_PLACEHOLDER_LABEL}" value="{$FOOTERABOUT}">
            </div>
            {/if}
            <div class="form-group">
                <input type="hidden" name="token" value="{$TOKEN}">
                <button style="width: 100%;" type="submit" class="btn btn-primary"><i class="fas fa-save"></i>
                    {$SUBMIT}</button>
            </div>
        </form>
    </div>
</div>