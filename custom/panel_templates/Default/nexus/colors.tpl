<!-- Colors Content -->
<div class="card  mb-3">
	<h3 class="card-header  mb-3 text-center">Colors</h3>
	<div class="card-body">

		<form action="" method="POST">

			<input type="hidden" name="sel_btn_session" value="colors">

				<div class="form-group">

					<label for="template_darkmode">Enable Darkmode?</label>
					<div class="input-group">
						<select id="template_darkmode" class="form-control mr-sm-2" name="template_darkmode">
							<option {if $TEMPLATE_DARKMODE == '1'}selected {/if}value="1">True</option>
							<option {if $TEMPLATE_DARKMODE == '0'}selected {/if}value="0">False</option>
						</select>
						</div>
						</div>

			<div class="form-group">

				<label for="template_color">{$TEMPLATE_COLOR_LABEL}</label>
				<input type="color" class="form-control" id="template_color" name="template_color" value="{$TEMPLATE_COLOR}">

			</div>



			<div class="form-group">

				<label for="background_color">{$BACKGROUND_COLOR_LABEL}</label>
				<input type="color" class="form-control" id="background_color" name="background_color"
					value="{$BACKGROUND_COLOR}">

			</div>



			<div class="form-group">

				<label for="footer_color">{$FOOTER_BACKGROUND_COLOR_LABEL}</label>
				<input type="color" class="form-control" id="footer_color" name="footer_color" value="{$FOOTER_COLOR}">

			</div>



			<div class="form-group">

				<label for="content_color">{$CONTENT_BACKGROUND_COLOR_LABEL}</label>
				<input type="color" class="form-control" id="content_color" name="content_color" value="{$CONTENT_COLOR}">

			</div>
			
			<div class="form-group">

				<label for="border_color">Border-outline-color</label>
				<input type="color" class="form-control" id="border_color" name="border_color" value="{$BORDER_COLOR}">

			</div>
			



			<div class="form-group">
				<input type="hidden" name="token" value="{$TOKEN}">
				<button style="width: 100%;" type="submit" class="btn btn-primary"><i class="fas fa-save"></i>
					{$SUBMIT}</button>
			</div>
		</form>

	</div>
</div>