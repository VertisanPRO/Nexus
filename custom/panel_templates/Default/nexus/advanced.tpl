<!-- Advanced content -->
<div class="card  mb-3">
	<h3 class="card-header  mb-3 text-center">Advanced</h3>
	<div class="card-body">

		<p style="margin-bottom:10px;color:red;"><i class="fas fa-exclamation-triangle"></i> Only make changes if you know
			what you are doing! <i class="fas fa-exclamation-triangle"></i></p>
		<hr>
		<form action="" method="POST">

			<input type="hidden" name="sel_btn_session" value="advanced">

			<div class="form-group">

				<label for="nav_height">{$NAV_HEIGHT_LABEL}</label>
				<div class="input-group">
					<input type="number" class="form-control" id="nav_height" name="nav_height" value="{$NAV_HEIGHT}">
					<div class="input-group-append">
						<input type="hidden" name="token" value="{$TOKEN}">
						<button type="submit" class="btn btn-primary"><i class="fas fa-save"></i></button>
					</div>
				</div>

			</div>

		</form>

		<form action="" method="POST">

			<input type="hidden" name="sel_btn_session" value="advanced">

			<div class="form-group">

				<label for="container_width">Container Width in %</label>
				<div class="input-group">
					<input type="number" class="form-control" id="container_width" name="container_width"
						value="{$CONTAINER_WIDTH}">
					<div class="input-group-append">
						<input type="hidden" name="token" value="{$TOKEN}">
						<button type="submit" class="btn btn-primary"><i class="fas fa-save"></i></button>
					</div>
				</div>

			</div>

		</form>

		<form action="" method="POST">

			<input type="hidden" name="sel_btn_session" value="advanced">

			<div class="form-group">

				<label for="margin_top">Margin Top</label>
				<div class="input-group">
					<input type="number" class="form-control" id="margin_top" name="margin_top" value="{$MARGIN_TOP}">
					<div class="input-group-append">
						<input type="hidden" name="token" value="{$TOKEN}">
						<button type="submit" class="btn btn-primary"><i class="fas fa-save"></i></button>
					</div>

				</div>

			</div>

		</form>

		<form action="" method="POST">

			<input type="hidden" name="sel_btn_session" value="advanced">

			<div class="form-group">

				<label for="margin_bottom">Margin Bottom</label>
				<div class="input-group">
					<input type="number" class="form-control" id="margin_bottom" name="margin_bottom" value="{$MARGIN_BOTTOM}">
					<div class="input-group-append">
						<input type="hidden" name="token" value="{$TOKEN}">
						<button type="submit" class="btn btn-primary"><i class="fas fa-save"></i></button>
					</div>

				</div>

			</div>

		</form>

		<form action="" method="POST">

			<input type="hidden" name="sel_btn_session" value="advanced">

			<div class="form-group">

				<label for="navbar_size">Navbar Size</label>
				<div class="input-group">

					<select class="form-control mr-sm-2" id="navbar_size" name="navbar_size">
						<option {if $NAVBAR_SIZE == 'mini'}selected {/if}value="mini">Mini</option>
						<option {if $NAVBAR_SIZE == 'tiny'}selected {/if}value="tiny">Tiny</option>
						<option {if $NAVBAR_SIZE == 'small'}selected {/if}value="small">Small</option>
						<option {if $NAVBAR_SIZE == 'large'}selected {/if}value="large">Large</option>
						<option {if $NAVBAR_SIZE == 'huge'}selected {/if}value="huge">Huge</option>
						<option {if $NAVBAR_SIZE == 'massive'}selected {/if}value="massive">Massive</option>
					</select>

					<div class="input-group-append">
						<input type="hidden" name="token" value="{$TOKEN}">
						<button type="submit" class="btn btn-primary"><i class="fas fa-save"></i></button>
					</div>
				</div>

			</div>

		</form>


		<!-- META content -->
		<!-- SOON content -->

	</div>
</div>