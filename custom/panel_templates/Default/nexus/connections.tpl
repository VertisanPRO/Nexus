<!-- Connections Content -->
<div class="card  mb-3">
	<h3 class="card-header  mb-3 text-center">Connections</h3>
	<div class="card-body">

		<form action="" method="POST">

			<input type="hidden" name="sel_btn_session" value="connections">

			<div class="form-group">

				<label for="opal_mcserver_name" style="margin-top:5px">Server Domain</label>
				<div class="input-group">
					<input type="text-area" class="form-control" id="opal_mcserver_name" name="opal_mcserver_name"
						value="{$OPAL_MCSERVER_NAME}" placeholder="MC.HYPIXEL.NET">
					<div class="input-group-append">
						<input type="hidden" name="token" value="{$TOKEN}">
					</div>
				</div>

			</div>

			<div class="form-group">

				<label for="opal_mcserver_ip" style="margin-top:10px">IP Address</label>
				<div class="input-group">
					<input type="text-area" class="form-control" id="opal_mcserver_ip" name="opal_mcserver_ip"
						value="{$OPAL_MCSERVER_IP}" placeholder="MC.HYPIXEL.NET">
					<div class="input-group-append">
						<input type="hidden" name="token" value="{$TOKEN}">
					</div>
				</div>

			</div>

			<div class="form-group">

				<label for="opal_mcserver_port" style="margin-top:10px">Server Port</label>
				<div class="input-group">
					<input type="text-area" class="form-control" id="opal_mcserver_port" name="opal_mcserver_port"
						value="{$OPAL_MCSERVER_PORT}" placeholder="25565">
					<div class="input-group-append">
						<input type="hidden" name="token" value="{$TOKEN}">
					</div>
				</div>

			</div>


			<div class="form-group">

				<label for="opal_mcserver_style" style="margin-top:10px;">Style</label>
				<select class="form-control mr-sm-2" id="opal_mcserver_style" name="opal_mcserver_style">
					<option {if $OPAL_MCSERVER_STYLE == 'true'}selected {/if}value="true">Simple</option>
					<option {if $OPAL_MCSERVER_STYLE == 'false'}selected {/if}value="false">Advanced</option>
				</select>
			</div>



			<div class="form-group">
				<button type="submit" class="btn btn-primary" style="width:100%; margin-top: 10px; margin-bottom: 20px;"><i
						class="fas fa-save"></i> Save</button>
			</div>


		
		<hr>
		<h3 style="text-align:center;">Discord</h3>

				<div class="form-group">

					<label for="discord_id">{$DISCORD_ID_LABEL}</label>
					<input type="text" class="form-control" id="discord_id" name="discord_id" value="{$DISCORD_ID}">

				</div>
				
			<div class="form-group">
				<button type="submit" class="btn btn-primary" style="width:100%; margin-top: 10px; margin-bottom: 20px;"><i
						class="fas fa-save"></i> Save</button>
			</div>
			
		</form>

	</div>
</div>