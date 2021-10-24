<!-- Advanced content -->
<div class="card  mb-3">
	<h3 class="card-header  mb-3 text-center">{$ADVANCED_PAGE}</h3>
	<div class="card-body">

		<p style="margin-bottom:10px;color:red;"><i class="fas fa-exclamation-triangle"></i> {$ADV_WARNING} <i class="fas fa-exclamation-triangle"></i></p>
		<hr>
		<form action="" method="POST">

			<input type="hidden" name="sel_btn_session" value="advanced">

			<div class="form-group">

				<label for="nav_height">{$ADV_NAV_LABEL}</label>
				<div class="input-group">
					<input type="number" class="form-control" id="nav_height" name="nav_height" value="{$NAV_HEIGHT}">
				</div>

			</div>




			<input type="hidden" name="sel_btn_session" value="advanced">

			<div class="form-group">

				<label for="container_width">{$ADV_CONTAINER_LABEL}</label>
				<div class="input-group">
					<input type="number" class="form-control" id="container_width" name="container_width"
						value="{$ADV_CONTAINER}">
				</div>

			</div>




			<input type="hidden" name="sel_btn_session" value="advanced">

			<div class="form-group">

				<label for="margin_top">{$ADV_MARGIN_TOP_LABEL}</label>
				<div class="input-group">
					<input type="number" class="form-control" id="margin_top" name="margin_top" value="{$MARGIN_TOP}">

				</div>

			</div>



			<input type="hidden" name="sel_btn_session" value="advanced">

			<div class="form-group">

				<label for="margin_bottom">{$ADV_MARGIN_BOTTOM_LABEL}</label>
				<div class="input-group">
					<input type="number" class="form-control" id="margin_bottom" name="margin_bottom" value="{$MARGIN_BOTTOM}">
				</div>

			</div>

			<input type="hidden" name="sel_btn_session" value="advanced">

			<div class="form-group">

				<label for="navbar_size">{$ADV_NAV_SIZE_LABEL}</label>
				<div class="input-group">

					<select class="form-control mr-sm-2" id="navbar_size" name="navbar_size">
						<option {if $NAVBAR_SIZE == 'mini'}selected {/if}value="mini">{$MINI_LABEL}</option>
						<option {if $NAVBAR_SIZE == 'tiny'}selected {/if}value="tiny">{$TINY_LABEL}</option>
						<option {if $NAVBAR_SIZE == 'small'}selected {/if}value="small">{$SMALL_LABEL}</option>
						<option {if $NAVBAR_SIZE == 'large'}selected {/if}value="large">{$LARGE_LABEL}</option>
						<option {if $NAVBAR_SIZE == 'huge'}selected {/if}value="huge">{$HUGE_LABEL}</option>
						<option {if $NAVBAR_SIZE == 'massive'}selected {/if}value="massive">{$MASSIVE_LABEL}</option>
					</select>
				</div>
			</div>
			<div class="input-group-append">
				<input type="hidden" name="token" value="{$TOKEN}">
				<button style="width: 100%; margin-top:20px;" type="submit" class="btn btn-primary"><i class="fas fa-save"></i>
					{$SUBMIT}</button>
			</div>
		</form>
	</div>
</div>