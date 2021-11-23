<!-- Arc Content -->
<div class="card mb-3">
    <h3 class="card-header mb-3 text-center">{$ARC_PAGE}</h3>
    <div class="card-body">
        <form action="" method="POST">
            <input type="hidden" name="sel_btn_session" value="arc" />

            <div class="form-group">
                <label for="arc_info">{$ARC_INFO_1}</label>
                <a href="https://arc.io">Arc</a><label for="arc_info">. {$ARC_INFO_2}</label>
                <label for="arc_info">{$ARC_INFO_3}</label>
                <label for="arc_info">{$ARC_INFO_4}</label>
                <label for="arc_info">{$ARC_INFO_5}</label>
            </div>

            <div class="form-group">
                <label for="arc">{$ARC_LABEL}</label>
                <select class="form-control mr-sm-2" id="arc" name="arc">
                    <option {if $ARC=='true' }selected{/if} value="true">{$TRUE_LABEL}</option>
					<option {if $ARC=='false' }selected {/if}value="false">{$FALSE_LABEL}</option>
                </select>
            </div>

            <div class="form-group">
                <label for="arc_id1" style="margin-top: 10px;">{$ARC_URL_LABEL}</label>
                <input type="text" class="form-control" id="arc_id1" name="arc_id" placeholder="https://arc.io/widget.min.js#9YB4rHQn" value="{$ARC_ID}" />
            </div>

            <div class="form-group">
                <input type="hidden" name="token" value="{$TOKEN}" />
                <button style="width: 100%; margin-top: 20px;" type="submit" class="btn btn-primary"><i class="fas fa-save"></i> {$SUBMIT}</button>
            </div>
        </form>
    </div>
</div>
