<!-- Arc Content -->
<div class="card mb-3">
    <h3 class="card-header mb-3 text-center">{$ARC_PAGE}</h3>
    <div class="card-body">
        <label for="arc_info">{$ARC_INFO_1}</label>
        <a href="https://arc.io">Arc</a><label for="arc_info">. {$ARC_INFO_2}</label>
        <label for="arc_info">{$ARC_INFO_3}</label>
        <label for="arc_info">{$ARC_INFO_4}</label>
        <label for="arc_info">{$ARC_INFO_5}</label>
        <hr />
        <form action="" method="POST">
            <div class="form-group">
                <label for="arcView">{$ARC_LABEL}</label>
                <select id="inputArcView" class="form-control mr-sm-2" name="arcView">
                    <option value="0" {if $ARCVIEW eq '0' } selected{/if}>{$DISABLED}</option>
                    <option value="1" {if $ARCVIEW eq '1' } selected{/if}>{$ENABLED}</option>
                </select>
            </div>
            {if $ARCVIEW eq '1'}
            <div class="form-group">
                <label for="arcURL">{$ARC_URL_LABEL}</label>
                <input type="text" class="form-control" id="inputArcURL" name="arcURL"
                    placeholder="https://arc.io/widget.min.js#9YB4rHQn" value="{$ARCURL}">
            </div>
            {/if}
            <div class="form-group">
                <input type="hidden" name="token" value="{$TOKEN}">
                <button style="width: 100%; margin-top:20px;" type="submit" class="btn btn-primary"><i
                        class="fas fa-save"></i>
                    {$SUBMIT}</button>
            </div>
        </form>
    </div>
</div>