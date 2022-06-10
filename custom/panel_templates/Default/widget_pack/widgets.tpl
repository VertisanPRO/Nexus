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
                        <form method="POST"><button type="submit" name="update_widgets_pack"
                                class="btn btn-success">{$WG_UPDATE_LABEL}</button></form>
                        <br />
                        <button type="button" data-toggle="modal" data-target="#createModal" name="create_widget_new"
                            class="btn btn-success">{$WG_CREATE_LABEL}</button>
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

                            <div class="table-responsive">
                                <table class="table">
                                    <tbody id="sortable">
                                        {foreach from=$WGPACKS item=item name=wg}
                                            <tr data-id="{$item['pack']->id}">
                                                <td>
                                                    <a href="{$EDIT_URL}?id={$item['pack']->id}">{$item['pack']->name}</a>
                                                </td>
                                                <td>
                                                    <div class="float-md-right">
                                                        <a href="{$EDIT_URL}?id={$item['pack']->id}"
                                                            class="btn btn-success btn-sm"><i class="fas fa-edit"></i></a>
                                                        <a href="{$SETTING_URL}?action=edit&w={$item['widget']->id}"
                                                            class="btn btn-success btn-sm"><i
                                                                class="fa-solid fa-gear"></i></a>
                                                        <button onclick="setRemoveID('{$item['pack']->id}')"
                                                            data-toggle="modal" data-target="#removeModal"
                                                            class="btn btn-danger btn-sm"><i
                                                                class="fa-solid fa-trash"></i></button>
                                                    </div>
                                                </td>
                                            </tr>
                                        {/foreach}
                                    </tbody>
                                </table>
                            </div>


                        </div>
                    </div>

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
    <script>
        function setRemoveID(id) {
            document.getElementById('remove_wg_modal').value = id;
        }
    </script>

</body>

<!-- Modal -->
<div class="modal fade" id="createModal" tabindex="-1" role="dialog" aria-labelledby="createModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="createModalLabel">{$WG_CREATE_LABEL}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post">
                <div class="modal-body">
                    <input class="form-control" name="class_name" type="text" value="" placeholder="Name">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{$CLOSE}</button>
                    <button type="submit" name="create_wg" class="btn btn-primary">{$SUBMIT}</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="removeModal" tabindex="-1" role="dialog" aria-labelledby="removeModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="removeModalLabel">{$WG_CREATE_LABEL}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post">
                <div class="modal-body">
                    {$WG_REMOVE_LABEL}
                    <input class="form-control" id="remove_wg_modal" name="wg_id" type="hidden">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{$CLOSE}</button>
                    <button type="submit" name="remove_wg" class="btn btn-primary">{$SUBMIT}</button>
                </div>
            </form>
        </div>
    </div>
</div>


</html>