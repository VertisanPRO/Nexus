<!-- Colors Content -->
<div class="card  mb-3">
  <h3 class="card-header  mb-3 text-center">{$COLORS_PAGE}</h3>
  <div class="card-body">

    <form action="" method="POST">
        <div class="form-group">

          <label for="darkMode">{$DARKMODE_LABEL}</label>
            <select id="inputDarkMode" class="form-control mr-sm-2" name="darkMode">
              <option value="0"{if $DARKMODE eq '0'} selected{/if}>{$DISABLED}</option>
              <option value="1"{if $DARKMODE eq '1'} selected{/if}>{$ENABLED}</option>
            </select>
          </div>

      <div class="form-group">

        <label for="primaryColor">{$TEMPLATE_COLOR_LABEL}</label>
        <input type="color" class="form-control" id="inputPrimaryColor" name="primaryColor" value="{$PRIMARYCOLOR}">

      </div>


      <div class="form-group">

        <label for="footer_color">{$NAVBAR_COLOR_LABEL} <span class="badge badge-info"><i
                class="fas fa-question-circle" data-container="body" data-toggle="popover" data-placement="top" title="" placeholder="https://example.com/img/logo.png"
                data-content="{$COLORS_INFO_LABEL}"
                data-original-title="{$INFO}"></i></span></label>
        <input type="color" class="form-control" id="navbar_color" name="navbar_color" value="{$NAVBAR_COLOR}">

      </div>


      <div class="form-group">

        <label for="footer_color">{$FOOTER_COLOR_LABEL}  <span class="badge badge-info"><i
                class="fas fa-question-circle" data-container="body" data-toggle="popover" data-placement="top" title="" placeholder="https://example.com/img/logo.png"
                data-content="{$COLORS_INFO_LABEL}"
                data-original-title="{$INFO}"></i></span></label>
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
              <option {if $NAVBAR_TEXT == 'black'}selected {/if}value="black">Black</option>
              <option {if $NAVBAR_TEXT == 'white'}selected {/if}value="white">White</option>
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