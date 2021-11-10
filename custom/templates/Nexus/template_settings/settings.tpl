<form action="" method="POST">
	<label for="favicon">{$FAVICON_LABEL}</label>
	    <div class="form-group">
            <div class="input-group">
				<div class="custom-file">
				    <input type="file" name="favicon" class="custom-file-input" id="favicon" accept="image/*"
						onchange="$('#favicon').html(this.files[0].name)">
					<label for="favicon" class="custom-file-label" id="favicon"></label>
				</div>
				<div class="input-group-append">
					<input type="hidden" name="token" value="{$TOKEN}">
					<button type="submit" class="btn btn-primary"><i class="fas fa-save"></i></button>
				</div>
			</div>
        </div>
</form>

<form action="" method="POST">
    <input type="hidden" name="sel_btn_session" value="options">
        <div class="form-group">
            <label for="template_about">{$ABOUT_LABEL}</label>
            <input type="text" class="form-control" id="template_about" name="template_about"
				placeholder="{$ABOUT_PLACEHOLDER_LABEL}" value="{$TEMPLATE_ABOUT}">
        </div>
        <div class="form-group">
		    <input type="hidden" name="token" value="{$TOKEN}">
			<button style="width: 100%;" type="submit" class="btn btn-primary"><i class="fas fa-save"></i>
				{$SUBMIT}</button>
			</div>
</form>