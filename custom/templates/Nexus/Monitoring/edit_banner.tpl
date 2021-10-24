{include file='header.tpl'}
{include file='navbar.tpl'}

<style>
	.grid.container {
		margin-top: 5em;
	}

	.inputfile {
		width: 0.1px;
		height: 0.1px;
		opacity: 0;
		overflow: hidden;
		position: absolute;
		z-index: -1;
	}
</style>


<div class="ui stackable grid">
	<div class="ui centered row">

		{if isset($SUCCESS)}
			<div class="ui success icon message">
				<i class="check icon"></i>
				<div class="content">
					{$SUCCESS}
				</div>
			</div>
		{/if}

		{if isset($ERRORS)}
			<div class="ui negative icon message">
				<i class="x icon"></i>
				<div class="content">
					{foreach from=$ERRORS item=error}
						{$error}<br />
					{/foreach}
				</div>
			</div>
		{/if}

		{include file="Monitoring/edit_menu.tpl"}
		<br>

	</div>
</div>


<div class="ui centered banner test ad" data-text="">
	<img src="{$BANNER}">
</div>



<form action="" method="post" enctype="multipart/form-data">

	<div class="ui middle aligned center aligned grid container">

		<input type="file" (change)="fileEvent($event)" class="inputfile" name="banner" id="banner" />
		<label for="banner" class="ui huge green right floated button">
			<i class="ui upload icon"></i>
			{$SELECT_BANNER_BUTTON}
		</label>
	</div>
	<br>

	<div class="ui middle aligned center aligned grid container">

		<input type="hidden" name="banner" id="banner" value="banner">
		<button type="submit" class="ui button">{$UPLOAD_BUTTON}</button>

	</div>

</form>





{include file='footer.tpl'}