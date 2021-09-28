	<!-- Updates Content -->
	<div class="card">
		<div class="card-body">
			<h3 class="card-header  mb-3 text-center">Navbar</h3>


			<form action="" method="POST">

				<input type="hidden" name="sel_btn_session" value="options">


				<div class="form-group">

					<label for="template_logo">Logo URL</label>
					<input type="text" class="form-control" id="template_logo" name="template_logo"
						placeholder="https://example.com/img/logo.png" value="{$TEMPLATE_LOGO}">

				</div>

				<input type="hidden" name="sel_btn_session" value="navbar">

				<div class="form-group">

					<label for="nav_fixed">Fixed navigation menu?</label>
					<div class="input-group">
						<select id="nav_fixed" class="form-control mr-sm-2" name="nav_fixed">
							<option {if $NAV_FIXED == '1'}selected {/if}value="1">True</option>
							<option {if $NAV_FIXED == '0'}selected {/if}value="0">False</option>
						</select>
						</div>
						</div>
						
				<input type="hidden" name="sel_btn_session" value="navbar">

				<div class="form-group">

					<label for="nav_style">Navigation Style</label>
					<div class="input-group">
						<select id="nav_style" class="form-control mr-sm-2" name="nav_style">
							<option {if $NAV_STYLE == '1'}selected {/if}value="1">Dynamic</option>
							<option {if $NAV_STYLE == '0'}selected {/if}value="0">Elegant</option>
						</select>

						<div class="input-group-append">
							<input type="hidden" name="token" value="{$TOKEN}">
							<button type="submit" class="btn btn-primary"><i class="fas fa-save"></i></button>
						</div>
					</div>
				</div>

			</form>

		</div>
	</div>