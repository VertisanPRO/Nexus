{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="ui stackable grid">

	<div class="twelve wide column">

		{include file='Monitoring/valid_server.tpl'}

		<div class="ui fluid card">
			<div class="content">
				<div class="header">
					<div class="ui centered header">{$NAME}</div>
				</div>
			</div>

			<div style="margin-block: 20px;" class="ui centered banner test" data-text="">
				<img class="ui centered image" src="{$BANNER}">
			</div>
		</div>
		{if isset($SERVER_STATS)}

			<div class="six ui buttons">
				<a href="" class="ui button">{$STATS_ONE_DAY}</a>
				<form action="" method="POST">
					<input type="hidden" name="month" value="0">
					<button type="submit" class="ui button">{$STATS_WEEK}</button>
				</form>
				<form action="" method="POST">
					<input type="hidden" name="month" value="1">
					<button type="submit" class="ui button">{$STATS_PER_MONTH}</button>
				</form>

				<form action="" method="POST">
					<input type="hidden" name="month" value="2">
					<button type="submit" class="ui button">{$STATS_2_MONTH}</button>
				</form>

				<form action="" method="POST">
					<input type="hidden" name="month" value="3">
					<button type="submit" class="ui button">{$STATS_3_MONTH}</button>
				</form>

				<form action="" method="POST">
					<input type="hidden" name="month" value="6">
					<button type="submit" class="ui button">{$STATS_6_MONTH}</button>
				</form>
			</div>


			{* <script type="text/javascript" src="https://audiowars.space/gigabait-chart.js"></script> *}
			<script type="text/javascript" src="{$JS_LINK}"></script>
			<script type="text/javascript">
				// DateFormat: 'H:i d.m.Y'
				GigabaitChartController(JSON.parse('{$SERVER_STATS}'), { Aspect: '700 200', AxisKeyX: 'timestamp', AxisKeyY: 'server_online', LineColor: '{$STATS_LINE_COLOR}', PointColor: '{$STATS_POINT_COLOR}', DateFormat: '{$STATS_DATE_FORMAT}', InfoBg: '{$STATS_INFO_BG_COLOR}', InfoColor: '{$STATS_INFO_TEXT_COLOR}', ShowHorizontalSegments: '{$STATS_HORISONTAL_SEGMENTS}' });
			</script>
			<div class="ui fluid card" id="statistics">
				{* <a href="{$STATISTICS_LINK}" id="link-statistics" style="width: 100%; margin-block-end: 12px;"
					class="ui button">{$HOURS24_STATISTICS_LABEL}</a> *}
				<div class="svgchart-info-content-template" style="display: none;">
					<span>{$ONLINE_LABEL}</span>: <b svg-data-type="online"></b>
					<br>
					<span>{$DATE_LABEL}</span>: <b svg-data-type="time"></b>
				</div>
			</div>
		{/if}



	</div>

	{include file='Monitoring/widgets.tpl'}


</div>














{include file='footer.tpl'}

<script>
	function copyIP(ip) {
		var servIP = document.createElement("textarea");
		document.body.appendChild(servIP);
		servIP.value = ip;
		servIP.select();
		document.execCommand("copy");
		document.body.removeChild(servIP);

		document.getElementById('copy-alert').classList.remove('hidden');
		setTimeout(function() {
			document.getElementById('copy-alert').classList.add('hidden');
		}, 3000)

	}
</script>