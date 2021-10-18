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
					<div class="d-sm-flex align-items-center justify-content-between mb-12">
						<h1 class="h3 mb-0 text-gray-800">{$TITLE}</h1>
					</div>

					<!-- Update Notification -->
					{include file='includes/update.tpl'}

					<div class="card shadow mb-4">
						<!-- Success and Error Alerts -->
						{include file='includes/alerts.tpl'}
					</div>

					<hr>

					<!-- Page Content  -->
					<div class="row">
						<div class="col-sm-3">
							{include file='nexus/sittings-menu.tpl'}
						</div>

						<div class="col-sm-9">

							<div class="tab-content" id="v-pills-tabContent">


								<div
									class="tab-pane fade {if !isset($TPL_NAME_SESSION) or $TPL_NAME_SESSION == 'options'}show active{/if}"
									id="v-pills-options" role="tabpanel" aria-labelledby="v-pills-options-tab">
									{include file="nexus/options.tpl"}
								</div>


								<div class="tab-pane fade {if $TPL_NAME_SESSION == 'colors'}show active{/if}" id="v-pills-colors"
									role="tabpanel" aria-labelledby="v-pills-colors-tab">
									{include file="nexus/colors.tpl"}
								</div>
								
								<div class="tab-pane fade {if $TPL_NAME_SESSION == 'navbar'}show active{/if}" id="v-pills-navbar"
									role="tabpanel" aria-labelledby="v-pills-navbar-tab">
									{include file="nexus/navbar.tpl"}
								</div>

								<div class="tab-pane fade {if $TPL_NAME_SESSION == 'advanced'}show active{/if}" id="v-pills-advanced"
									role="tabpanel" aria-labelledby="v-pills-advanced-tab">
									{include file="nexus/advanced.tpl"}
								</div>

								<div class="tab-pane fade {if $TPL_NAME_SESSION == 'arc'}show active{/if}" id="v-pills-arc"
									role="tabpanel" aria-labelledby="v-pills-arc-tab">
									{include file="nexus/arc.tpl"}
								</div>

								<div class="tab-pane fade {if $TPL_NAME_SESSION == 'widgets'}show active{/if}" id="v-pills-widgets"
									role="tabpanel" aria-labelledby="v-pills-widgets-tab">
									{include file="nexus/widgets.tpl"}
								</div>


								<div class="tab-pane fade {if $TPL_NAME_SESSION == 'embed'}show active{/if}" id="v-pills-embed"
									role="tabpanel" aria-labelledby="v-pills-embed-tab">
									{include file="nexus/embed.tpl"}
								</div>


								<div class="tab-pane fade {if $TPL_NAME_SESSION == 'connections'}show active{/if}"
									id="v-pills-connections" role="tabpanel" aria-labelledby="v-pills-connections-tab">
									{include file="nexus/connections.tpl"}
								</div>


								<div class="tab-pane fade {if $TPL_NAME_SESSION == 'update'}show active{/if}" id="v-pills-update"
									role="tabpanel" aria-labelledby="v-pills-update-tab">
									{include file="nexus/update.tpl"}
								</div>

							</div>


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