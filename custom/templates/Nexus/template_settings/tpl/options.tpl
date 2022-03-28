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
				<label for="aboutFooter">{$ABOUT_LABEL}</label>
				<input type="text" name="aboutFooter" class="form-control" id="inputAboutFooter"
					placeholder="{$ABOUT_PLACEHOLDER_LABEL}" value="{$ABOUTFOOTER}">
			</div>
			<div class="form-group">
				<input type="hidden" name="token" value="{$TOKEN}">
				<button style="width: 100%;" type="submit" class="btn btn-primary"><i class="fas fa-save"></i>
					{$SUBMIT}</button>
			</div>
		</form>
	</div>
</div>