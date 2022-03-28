<!-- Navbar Content -->
<div class="card mb-3">
	<h3 class="card-header mb-3 text-center">{$NAVBAR_PAGE}</h3>
	<div class="card-body">
		<form action="" method="POST">
			<div class="form-group">
				<label for="navbarLogo">{$LOGO_LABEL}</label>
				<input type="text" class="form-control" id="inputNavbarLogo" name="navbarLogo"
					placeholder="https://example.com/img/logo.png" value="{$NAVBARLOGO}">
			</div>
			<div class="form-group">
				<label for="navbarSticky">{$NAVIGATION_MENU_LABEL}</label>
				<select id="inputNavbarSticky" class="form-control mr-sm-2" name="navbarSticky">
					<option value="0" {if $NAVBARSTICKY eq '0' } selected{/if}>{$DISABLED}</option>
					<option value="1" {if $NAVBARSTICKY eq '1' } selected{/if}>{$ENABLED}</option>
				</select>
			</div>
			<div class="form-group">
				<label for="navbarStyle">{$NAVIGATION_MENU_LABEL}</label>
				<select id="inputNavbarStyle" class="form-control mr-sm-2" name="navbarStyle">
					<option value="0" {if $NAVBARSTYLE eq '0' } selected{/if}>{$ELEGANT_LABEL}</option>
					<option value="1" {if $NAVBARSTYLE eq '1' } selected{/if}>{$DYNAMIC_LABEL}</option>
				</select>
			</div>
			<div class="form-group">
				<input type="hidden" name="token" value="{$TOKEN}">
				<button style="width: 100%; margin-top:20px;" type="submit" class="btn btn-primary"><i
						class="fas fa-save"></i>
					{$SUBMIT}</button>
			</div>
		</form>
	</div>
</div>