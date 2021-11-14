<!-- Colors Content -->
<div class="card  mb-3">
	<h3 class="card-header  mb-3 text-center">{$COLORS_PAGE}</h3>
	<div class="card-body">

		<form action="" method="POST">

			<input type="hidden" name="sel_btn_session" value="colors">

				<div class="form-group">

					<label for="template_darkmode">{$DARKMODE_LABEL}</label>
					<div class="input-group">
						<select id="template_darkmode" class="form-control mr-sm-2" name="template_darkmode">
							<option {if $TEMPLATE_DARKMODE == '1'}selected {/if}value="1">{$TRUE_LABEL}</option>
							<option {if $TEMPLATE_DARKMODE == '0'}selected {/if}value="0">{$FALSE_LABEL}</option>
						</select>
						</div>
						</div>

			<div class="form-group">

				<label for="template_color">{$TEMPLATE_COLOR_LABEL}</label>
				<input type="color" class="form-control" id="template_color" name="template_color" value="{$TEMPLATE_COLOR}">

			</div>


			<div class="form-group">

				<label for="footer_color">{$NAVBAR_COLOR_LABEL} <span class="badge badge-info"><i
								class="fas fa-question-circle" data-container="body" data-toggle="popover" data-placement="top" title="" placeholder="https://example.com/img/logo.png"
								data-content="{$COLORS_INFO_LABEL}"
								data-original-title="{$INFO_BOX_LABEL}"></i></span></label>
				<input type="color" class="form-control" id="navbar_color" name="navbar_color" value="{$NAVBAR_COLOR}">

			</div>


			<div class="form-group">

				<label for="footer_color">{$FOOTER_COLOR_LABEL}  <span class="badge badge-info"><i
								class="fas fa-question-circle" data-container="body" data-toggle="popover" data-placement="top" title="" placeholder="https://example.com/img/logo.png"
								data-content="{$COLORS_INFO_LABEL}"
								data-original-title="{$INFO_BOX_LABEL}"></i></span></label>
				<input type="color" class="form-control" id="footer_color" name="footer_color" value="{$FOOTER_COLOR}">

			</div>
			

			
			<div class="form-group">

				<label for="border_color">{$BORDER_COLOR_LABEL}</label>
				<input type="color" class="form-control" id="border_color" name="border_color" value="{$BORDER_COLOR}">

			</div>

							<div class="form-group">

					<label for="navbar_text">{$NAVBAR_TEXT_LABEL}</label>
					<div class="input-group">
						<select id="navbar_text" class="form-control mr-sm-2" name="navbar_text">
							<option {if $NAVBAR_TEXT == 'black'}selected {/if}value="black">{$BLACK_LABEL}</option>
							<option {if $NAVBAR_TEXT == 'white'}selected {/if}value="white">{$WHITE_LABEL}</option>
						</select>
						</div>
						</div>
			



			<div class="form-group">
				<input type="hidden" name="token" value="{$TOKEN}">
				<button style="width: 100%;" type="submit" class="btn btn-primary"><i class="fas fa-save"></i>
					{$SUBMIT}</button>
			</div>
		</form>

	</div>
</div>