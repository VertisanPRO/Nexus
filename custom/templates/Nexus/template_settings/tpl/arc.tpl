<!-- Arc Content -->
<div class="card mb-3">
    <h3 class="card-header mb-3 text-center">{$ARC_PAGE}</h3>
    <div class="card-body">
        <form action="" method="POST">
            <div class="form-group">
                <label for="arcView">{$ARCVIEW_LABEL} <span class="badge badge-info">
                        <i class="fas fa-question-circle" data-container="body" data-toggle="popover"
                            data-placement="top" data-content="{$ARCVIEW_INFO_LABEL}" data-original-title="{$INFO}"></i>
                    </span></label>
                <select id="inputArcView" class="form-control mr-sm-2" name="arcView">
                    <option value="0" {if $ARCVIEW eq '0' } selected{/if}>{$DISABLED}</option>
                    <option value="1" {if $ARCVIEW eq '1' } selected{/if}>{$ENABLED}</option>
                </select>
            </div>
            {if $ARCVIEW eq '1'}
            <div class="form-group">
                <label for="arcURL">{$ARCURL_LABEL}</label>
                <input type="text" class="form-control" id="inputArcURL" name="arcURL"
                    placeholder="https://arc.io/widget.min.js#9YB4rHQn" value="{$ARCURL}">
            </div>
            {/if}
            <div class="form-group">
                <input type="hidden" name="token" value="{$TOKEN}">
                <button type="submit" class="btn btn-primary w-100"><i
                        class="fas fa-save"></i>
                    {$SUBMIT}</button>
            </div>
        </form>
    </div>
</div>