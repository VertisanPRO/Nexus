<!-- Options Content -->
<div class="card mb-3">
    <h3 class="card-header mb-3 text-center">{$OPTIONS_PAGE}</h3>
    <div class="card-body">
        <div class="alert bg-primary text-white">
            <h5><i class="icon fas fa-sticky-note"></i> {$NOTE}</h5>
            {$NOTE_REVIEW}
        </div>
        <form action="" method="POST">
            <input type="hidden" name="sel_btn_session" value="options" />
            <div class="form-group">
                <label for="footerAbout">{$FOOTERABOUT_LABEL}</label>
                <input type="text" name="footerAbout" class="form-control" id="inputFooterAbout"
                    placeholder="{$FOOTERABOUT_PLACEHOLDER_LABEL}" value="{$FOOTERABOUT}">
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-6">
                        <label for="customCSS">{$CUSTOMCSS_LABEL} <span class="badge badge-info"><i
                                    class="fas fa-question-circle" data-container="body" data-toggle="popover"
                                    data-placement="top" data-content="{$CUSTOMCSS_INFO_LABEL}"
                                    data-original-title="{$INFO}"></i></span></label>
                        <textarea name="customCSS" style="height: 150px;" class="form-control"
                            id="inputCustomCSS">{$CUSTOMCSS}</textarea>
                    </div>
                    <div class="col-md-6">
                        <label for="customJS">{$CUSTOMJS_LABEL} <span class="badge badge-info"><i
                                    class="fas fa-question-circle" data-container="body" data-toggle="popover"
                                    data-placement="top" data-content="{$CUSTOMJS_INFO_LABEL}"
                                    data-original-title="{$INFO}"></i></span></label>
                        <textarea name="customJS" style="height: 150px;" class="form-control"
                            id="inputCustomJS">{$CUSTOMJS}</textarea>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <input type="hidden" name="token" value="{$TOKEN}">
                <button type="submit" class="btn btn-primary w-100"><i class="fas fa-save"></i>
                    {$SUBMIT}</button>
            </div>
        </form>
    </div>
</div>