<!-- Colors Content -->
<div class="card mb-3">
  <h3 class="card-header mb-3 text-center">{$COLORS_PAGE}</h3>
  <div class="card-body">
    <form action="" method="POST">
      <div class="form-group">
        <label for="darkMode">{$DARKMODE_LABEL}</label>
        <select id="inputDarkMode" class="form-control mr-sm-2" name="darkMode">
          <option value="0" {if $DARKMODE eq '0' } selected{/if}>{$DISABLED}</option>
          <option value="1" {if $DARKMODE eq '1' } selected{/if}>{$ENABLED}</option>
        </select>
      </div>
      <div class="form-group">
        <label for="primaryColor">{$PRIMARYCOLOR_LABEL}</label>
        <input type="color" class="form-control" id="inputPrimaryColor" name="primaryColor" value="{$PRIMARYCOLOR}">
      </div>
      <div class="form-group">
        <label for="navbarColor">{$NAVBARCOLOR_LABEL} <span class="badge badge-info"><i class="fas fa-question-circle"
              data-container="body" data-toggle="popover" data-placement="top" data-content="{$COLORS_INFO_LABEL}"
              data-original-title="{$INFO}"></i></span></label>
        <input type="color" class="form-control" id="inputNavbarColor" name="navbarColor" value="{$NAVBARCOLOR}">
      </div>
      <div class="form-group">
        <label for="footerColor">{$FOOTERCOLOR_LABEL} <span class="badge badge-info"><i class="fas fa-question-circle"
              data-container="body" data-toggle="popover" data-placement="top" data-content="{$COLORS_INFO_LABEL}"
              data-original-title="{$INFO}"></i></span></label>
        <input type="color" class="form-control" id="inputFooterColor" name="footerColor" value="{$FOOTERCOLOR}">
      </div>
      <div class="form-group">
        <label for="outlineColor">{$OUTLINECOLOR_LABEL}</label>
        <input type="color" class="form-control" id="inputOutlineColor" name="outlineColor" value="{$OUTLINECOLOR}">
      </div>
      <div class="form-group">
        <label for="navbarTextColor">{$NAVBARTEXTCOLOR_LABEL}</label>
        <select id="inputNavbarTextColor" class="form-control mr-sm-2" name="navbarTextColor">
          <option value="0" {if $NAVBARTEXTCOLOR eq '0' } selected{/if}>{$NAVBARTEXTBLACK_LABEL}</option>
          <option value="1" {if $NAVBARTEXTCOLOR eq '1' } selected{/if}>{$NAVBARTEXTWHITE_LABEL}</option>
        </select>
      </div>
      <div class="form-group">
        <input type="hidden" name="token" value="{$TOKEN}">
        <button type="submit" class="btn btn-primary w-100"><i class="fas fa-save"></i>
          {$SUBMIT}</button>
      </div>
    </form>
  </div>
</div>