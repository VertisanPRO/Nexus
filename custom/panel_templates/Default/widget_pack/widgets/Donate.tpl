{include file='header.tpl'}

<body id="page-top">
 
  <!-- Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    {include file='sidebar.tpl'}

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main content -->
      <div id="content">

        <!-- Topbar -->
        {include file='navbar.tpl'}

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">{$WG_TITLE}</h1>
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
              <li class="breadcrumb-item"><a href="{$BACK_URL}">{$WG_TITLE}</a></li>
              <li class="breadcrumb-item active">{$WG->name}</li>
            </ol>
          </div>

          <!-- Update Notification -->
          {include file='includes/update.tpl'}

          <div class="card shadow mb-4">
            <div class="card-body">

              <!-- Success and Error Alerts -->
              {include file='includes/alerts.tpl'}

              <h4 class="text-center">{$D_WG_LABEL}</h4>
              <form action="" method="POST">

                <div class="form-group">
                  <label for="donate_title_label">{$D_TITLE_LABEL}</label>
                  <input type="text" class="form-control" id="donate_title_label" name="donate_title_label"
                    value="{if isset($DONATE_TITLE_LABEL)}{$DONATE_TITLE_LABEL}{/if}" />
                </div>
                <div class="form-group">
                  <label for="donate_widget_email">{$D_EMAIL_LABEL}</label>
                  <input type="text" class="form-control" id="donate_widget_email" name="donate_widget_email"
                    value="{if isset($DONATE_WIDGET_EMAIL)}{$DONATE_WIDGET_EMAIL}{/if}" />
                </div>
                <div class="form-group">
                  <label for="donate_first_amount">{$D_FIRST_AMOUNT_LABEL}</label>
                  <input type="text" class="form-control" id="donate_first_amount" name="donate_first_amount"
                    value="{if isset($DONATE_FIRST_AMOUNT)}{$DONATE_FIRST_AMOUNT}{/if}" />
                </div>

                <div class="form-group">
                  <label for="donate_second_amount">{$D_SECOND_AMOUNT_LABEL}</label>
                  <input type="text" class="form-control" id="donate_second_amount" name="donate_second_amount"
                    value="{if isset($DONATE_SECOND_AMOUNT)}{$DONATE_SECOND_AMOUNT}{/if}" />
                </div>


                <div class="form-group">
                  <label for="donate_third_amount">{$D_THIRD_AMOUNT_LABEL}</label>
                  <input type="text" class="form-control" id="donate_third_amount" name="donate_third_amount"
                    value="{if isset($DONATE_THIRD_AMOUNT)}{$DONATE_THIRD_AMOUNT}{/if}" />
                </div>

                <div class="form-group">
                  <label for="donate_widget_icon">{$D_WG_ICON_LABEL}</label>
                  <input type="text" class="form-control" id="donate_widget_icon" name="donate_widget_icon"
                    placeholder='<i class="fas fa-hand-holding-usd"></i>'
                    value="{if isset($DONATE_WIDGET_ICON)}{$DONATE_WIDGET_ICON|escape:'html'}{/if}" />
                </div>

                <div class="form-group">
                  <input type="hidden" name="token" value="{$TOKEN}" />
                  <button style="width: 100%; margin-top: 20px;" type="submit" name="wg_save" class="btn btn-primary"><i
                      class="fas fa-save"></i></button>
                </div>
              </form>


            </div>
          </div>

          <!-- Spacing -->
          <div style="height:1rem;"></div>

          <!-- End Page Content -->
        </div>

        <!-- End Main Content -->
      </div>

      {include file='footer.tpl'}

      <!-- End Content Wrapper -->
    </div>

    <!-- End Wrapper -->
  </div>

  {include file='scripts.tpl'}

</body>

</html>