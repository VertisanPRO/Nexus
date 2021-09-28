	<!-- Widgetbot Content -->
	<div class="card  mb-3">
		<h3 class="card-header  mb-3 text-center">Widgetbot Integration</h3>
		<div class="card-body">

			<form action="" method="POST">
				<input type="hidden" name="sel_btn_session" value="widgetbot">


				<div class="form-group">

					<label for="widgetbot">Enable Widgetbot Integration</label>
					<select class="form-control mr-sm-2" id="widgetbot" name="widgetbot">
						<option {if $WIDGETBOT == 'true'}selected{/if} value="true">
							True</option>
						<option {if $WIDGETBOT == 'false'}selected {/if}value="false">False</option>
					</select>

				</div>


				<div class="form-group">

					<label for="discord_id1" style="margin-top:10px;">{$DISCORD_ID_LABEL}</label>
					<input type="text" class="form-control" id="discord_id1" name="discord_id" value="{$DISCORD_ID}">

				</div>


				<div class="form-group">

					<label for="channel_id1" style="margin-top:10px;">{$CHANNEL_ID_LABEL}</label>
					<input type="text" class="form-control" id="channel_id1" name="channel_id" value="{$CHANNEL_ID}">

				</div>



				<div class="form-group">
					<input type="hidden" name="token" value="{$TOKEN}">
					<button style="width: 100%; margin-top:20px;" type="submit" class="btn btn-primary"><i class="fas fa-save"></i>
						{$SUBMIT}</button>
				</div>
			</form>

		</div>
	</div>