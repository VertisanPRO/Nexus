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
              <li class="breadcrumb-item active">{$WG_TITLE}</li>
            </ol>
          </div>

          <!-- Update Notification -->
          {include file='includes/update.tpl'}

          <div class="card shadow mb-4">
            <div class="card-body">

              <!-- Success and Error Alerts -->
              {include file='includes/alerts.tpl'}

              {if !empty($WGPACKS)}
                <div class="table-responsive">
                  <table class="table">
                    <tbody id="sortable">
                      {foreach from=$WGPACKS item=item name=wg}
                        <tr data-id="{$item->id}">
                          <td>
                            <a href="">{$item->name}</a>
                          </td>
                          <td>
                            <div class="float-md-right">
                              <a href="" class="btn btn-success btn-sm"><i class="fas fa-edit"></i></a>
                            </div>
                          </td>
                        </tr>
                      {/foreach}
                    </tbody>
                  </table>
                </div>
              {else}
                <p>NO WIDGETS</p>
              {/if}


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