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

              <h4 class="text-center">{$I_WG_LABEL}</h4>
              <form action="" method="POST">
                <div class="form-group">
                  <label for="iframe_widget_header">{$I_WG_HEADER_LABEL}</label>
                  <input type="text" class="form-control" id="iframe_widget_header" name="iframe_widget_header"
                    value="{if isset($IFRAME_WIDGET_HEADER)}{$IFRAME_WIDGET_HEADER}{/if}" />
                </div>
                <div class="form-group">
                  <label for="iframe_widget_header_url">{$I_WG_HEADER_URL_LABEL}</label>
                  <input type="text" class="form-control" id="iframe_widget_header_url" name="iframe_widget_header_url"
                    value="{if isset($IFRAME_WIDGET_HEADER_URL)}{$IFRAME_WIDGET_HEADER_URL}{/if}" />
                </div>
                <div class="form-group">
                  <label for="iframe_widget_url">{$I_WG_URL_LABEL}</label>
                  <input type="text" class="form-control" id="iframe_widget_url" name="iframe_widget_url"
                    value="{if isset($IFRAME_WIDGET_URL)}{$IFRAME_WIDGET_URL}{/if}" />
                </div>

                <div class="form-group">
                  <label for="iframe_widget_icon">{$I_WG_ICON_LABEL}</label>
                  <input type="text" class="form-control" id="iframe_widget_icon" name="iframe_widget_icon"
                    placeholder='<i class="fas fa-hand-holding-usd"></i>'
                    value="{if isset($IFRAME_WIDGET_ICON)}{$IFRAME_WIDGET_ICON|escape:'html'}{/if}" />
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