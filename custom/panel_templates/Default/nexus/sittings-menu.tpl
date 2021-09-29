<div class="card  mb-3">
	<h3 class="card-header  mb-3 text-center">Navigation</h3>
	<div class="card-body">

		<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">

			<a class="nav-link {if !isset($TPL_NAME_SESSION) or $TPL_NAME_SESSION == 'options'}active{/if}"
				id="v-pills-options-tab" data-toggle="pill" href="#v-pills-options" role="tab" aria-controls="v-pills-options"
				aria-selected="true"><i class="fas fa-cog"></i> Options</a>

			<a class="nav-link {if $TPL_NAME_SESSION == 'colors'}active{/if}" id="v-pills-colors-tab" data-toggle="pill"
				href="#v-pills-colors" role="tab" aria-controls="v-pills-colors" aria-selected="false"><i
					class="fas fa-paint-brush"></i> Colors</a>
					
			<a class="nav-link {if $TPL_NAME_SESSION == 'navbar'}active{/if}" id="v-pills-navbar-tab" data-toggle="pill"
				href="#v-pills-navbar" role="tab" aria-controls="v-pills-navbar" aria-selected="false"><i class="fas fa-compass"></i> Navbar</a>
				
			<a class="nav-link {if $TPL_NAME_SESSION == 'connections'}active{/if}" id="v-pills-connections-tab"
				data-toggle="pill" href="#v-pills-connections" role="tab" aria-controls="v-pills-connections"
				aria-selected="false"><i class="fas fa-signal"></i> Connections</a>

			<a class="nav-link {if $TPL_NAME_SESSION == 'advanced'}active{/if}" id="v-pills-advanced-tab" data-toggle="pill"
				href="#v-pills-advanced" role="tab" aria-controls="v-pills-advanced" aria-selected="false"><i
					class="fas fa-cogs"></i> Advanced</a>

			<a class="nav-link {if $TPL_NAME_SESSION == 'arc'}active{/if}" id="v-pills-arc-tab" data-toggle="pill"
				href="#v-pills-arc" role="tab" aria-controls="v-pills-arc" aria-selected="false"><i
					class="fas fa-dot-circle"></i> Arc</a>

			<a class="nav-link {if $TPL_NAME_SESSION == 'widgets'}active{/if}" id="v-pills-widgets-tab" data-toggle="pill"
				href="#v-pills-widgets" role="tab" aria-controls="v-pills-widgets" aria-selected="false"><i
					class="fas fa-th-large"></i> Widgets</a>

			<a class="nav-link {if $TPL_NAME_SESSION == 'meta'}active{/if}" id="v-pills-meta-tab" data-toggle="pill"
				href="#v-pills-meta" role="tab" aria-controls="v-pills-meta" aria-selected="false"><i class="fas fa-link"></i>
				Embed</a>


			<a class="nav-link {if $TPL_NAME_SESSION == 'update'}active{/if}" id="v-pills-update-tab" data-toggle="pill"
				href="#v-pills-update" role="tab" aria-controls="v-pills-update" aria-selected="false"><i
					class="fas fa-cloud-download-alt"></i> Updates</a>

			<a class="nav-link" href="https://template.mubeen.eu/discord" target="_blank"><i class="fas fa-life-ring"></i>
				Support</a>

			<style>
				.nav-link {
					color: #979797;
				}
			</style>

		</div>
	</div>
</div>