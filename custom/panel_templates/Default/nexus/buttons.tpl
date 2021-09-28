	<!-- Buttons Content -->
	<div class="card  mb-3">
		<h3 class="card-header  mb-3 text-center">Buttons</h3>
		<div class="card-body">

			<form action="" method="POST">

				<input type="hidden" name="sel_btn_session" value="buttons">


				<div class="form-group">

					<label for="index_button_location">{$INDEX_BUTTON_LOCATION_LABEL}</label>
					<select class="form-control mr-sm-2" id="index_button_location" name="index_button_location">
						<option {if $INDEX_BUTTON_LOCATION == 'right'}selected {/if}value="right">Right</option>
						<option {if $INDEX_BUTTON_LOCATION == 'left'}selected {/if}value="left">Left</option>
						<option {if $INDEX_BUTTON_LOCATION == 'disabled'}selected {/if}value="disabled">Disabled
						</option>
					</select>

				</div>



				<div class="form-group">

					<label for="index_button_icon">{$INDEX_BUTTON_ICON_LABEL}</label>
					<input type="text" class="form-control" id="index_button_icon" name="index_button_icon"
						value="{$INDEX_BUTTON_ICON}">

				</div>



				<div class="form-group">

					<label for="index_button_text">{$INDEX_BUTTON_TEXT_LABEL}</label>
					<input type="text" class="form-control" id="index_button_text" name="index_button_text"
						value="{$INDEX_BUTTON_TEXT}">

				</div>


				<div class="form-group">

					<label for="index_button_url">Button Url</label>
					<input type="text" class="form-control" id="index_button_url" name="index_button_url"
						value="{$INDEX_BUTTON_URL}">

				</div>

				<div class="form-group">
					<input type="hidden" name="token" value="{$TOKEN}">
					<button style="width: 100%;" type="submit" class="btn btn-primary"><i class="fas fa-save"></i>
						{$SUBMIT}</button>
				</div>

			</form>

		</div>
	</div>