<!-- Options Content -->
<div class="card mb-3">
    <h3 class="card-header mb-3 text-center">{$OPTIONS_PAGE}</h3>
    <div class="card-body">
        <div class="alert bg-primary text-white">
            <h5><i class="icon fas fa-sticky-note"></i> {$NOTE}</h5>
            {$NOTE_REVIEW}
        </div>
        <form action="" method="post" enctype="multipart/form-data">
            <input type="hidden" name="sel_btn_session" value="options" />

            <label for="favicon">{$FAVICON_LABEL}</label>
            <div class="form-group">
                <div class="input-group">
                    <div class="custom-file">
                        <input type="file" name="favicon" class="custom-file-input" id="favicon" accept="image/*" onchange="$('#favicon').html(this.files[0].name)" />
                        <label for="favicon" class="custom-file-label" id="favicon">{$FAVICON}</label>
                    </div>
                    <div class="input-group-append">
                        <input type="hidden" name="token" value="{$TOKEN}" />
                        <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i></button>
                    </div>
                </div>
            </div>
        </form>

        <form action="" method="POST">
            <input type="hidden" name="sel_btn_session" value="options" />

            <label for="template_about">{$ABOUT_LABEL}</label>

            <div class="input-group">
                <input type="text" class="form-control" id="template_about" name="template_about" placeholder="{$ABOUT_PLACEHOLDER_LABEL}" value="{$TEMPLATE_ABOUT}" />
                <div class="input-group-append">
                    <input type="hidden" name="token" value="{$TOKEN}" />
                    <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i></button>
                </div>
            </div>
        </form>
    </div>
</div>
