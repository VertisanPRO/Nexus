<div class="four wide column">

	<div class="ui fluid card">
		<div class="content">
			<div class="description">
				<div class="ui relaxed list">
					<div class="item">
						<img class="ui mini circular image" src="{$OWNER_DATA.avatar}" alt="{$OWNER_DATA.username}">
						<div class="content">
							<a class="header" data-poload="/queries/user/?id={$OWNER_DATA.id}"
								href="{$OWNER_DATA.profile}">{$OWNER_DATA.username}</a>
							<span class="meta">
								{$OWNER_LABEL}
							</span>
						</div>
					</div>
					<a href="{$VIEW_LINK}" style="width: 100%; margin-block-end: 12px;"
						class="ui button">{$GO_TO_SERVER_LABEL}</a>
					<a href="{$PLAYERS_LINK}" style="width: 100%; margin-block-end: 12px;"
						class="ui button">{$PLAYERS_LIST_LABEL}</a>
					<a href="{$VOTES_LINK}" style="width: 100%; margin-block-end: 12px;"
						class="ui button">{$VOTE_FOR_SERVER_LABEL}</a>
					<a href="{$POINTS_LINK}" style="width: 100%; margin-block-end: 12px;"
						class="ui button">{$POINT_FOR_SERVER_LABEL}</a>


					{if $OWNER == 1}
						<a href="{$EDIT_LINK}" style="width: 100%; margin-block-end: 12px;" class="ui button">{$EDIT_LABEL}</a>
					{/if}
				</div>
			</div>
		</div>
	</div>

	{if isset($SERVER_STATS) and $STATS_PAGE != 1}
		{* <script type="text/javascript" src="https://audiowars.space/gigabait-chart.js"></script> *}
		<script type="text/javascript" src="{$JS_LINK}"></script>
		<script type="text/javascript">
			// DateFormat: 'H:i d.m.Y'
			GigabaitChartController(JSON.parse('{$SERVER_STATS}'), { Aspect: '207 86', AxisKeyX: 'timestamp', AxisKeyY:
			'server_online', LineColor: '{$STATS_LINE_COLOR}', PointColor: '{$STATS_POINT_COLOR}',
			DateFormat: '{$STATS_DATE_FORMAT}', InfoBg: '{$STATS_INFO_BG_COLOR}', InfoColor:
			'{$STATS_INFO_TEXT_COLOR}', ShowHorizontalSegments: '{$STATS_HORISONTAL_SEGMENTS}' });
		</script>
		<div class="ui fluid card" id="statistics">
			<a href="{$STATISTICS_LINK}" id="link-statistics" style="width: 100%; margin-block-end: 12px;"
				class="ui button">{$HOURS24_STATISTICS_LABEL}</a>
			<div class="svgchart-info-content-template" style="display: none;">
				<span>{$ONLINE_LABEL}</span>: <b svg-data-type="online"></b>
				<br>
				<span>{$DATE_LABEL}</span>: <b svg-data-type="time"></b>
			</div>
		</div>
	{/if}

	{if $SPONSOR == 1}
		{if isset($SERVER_DISCORD_ID)}
			<section>
				<img src="https://discordapp.com/api/guilds/{$SERVER_DISCORD_ID}/widget.png?style={$DISCORD_BANNER}" alt=""
					style="border-radius: .28571429rem;width:100%;" onclick="window.location.href='{$DISCORD_INVITE}'">
			</section>
		{/if}
	{/if}

	<div class="ui fluid card">

		<div class="ui button" data-tooltip="{$COPY_CLIK}" data-inverted="" style="width: 100%;"
			onclick="copyIP('{$IP}{if $SERVER_PORT == 25565}{else}:{$SERVER_PORT}{/if}')">
			{if isset($ICON)}
				<img src="{$ICON}">
			{else}
				<span style="text-align: center; font-size: 1em; color: rgb(11, 252, 51);">
					<i class="fas fa-gamepad"></i>
				</span>
			{/if}

			<p>{$IP}{if $SERVER_PORT == 25565}{else}:{$SERVER_PORT}{/if}</p>
		</div>
	</div>



	<div class="ui fluid card">
		<div class="ui button" style="width: 100%">

			{if $PLAYERS < '0'}
				{$STATUS_COLOR = 'rgb(250, 7, 7);'}
				{$STATUS_SERVER_LABEL = $OFFLINE_LABEL}
			{else}
				{$STATUS_COLOR = 'rgb(11, 252, 51);'}
				{$STATUS_SERVER_LABEL = $ONLINE_LABEL}
			{/if}

			<span style="font-size: 1em; color: {$STATUS_COLOR}">
				<i class="fas fa-globe"></i>
			</span>
			<span>{$PLAYERS}</span>
			<p>{$STATUS_SERVER_LABEL}</p>
		</div>


		<div class="ui button" style="width: 100%">
			<span style="font-size: 1em; color: rgb(11, 252, 51);">
				<i class="fas fa-child"></i>
			</span>
			<span>{$MAX_ONLINE}</span>
			<p>{$ONLINE_RECORD_LABEL}</p>
		</div>

	</div>



	<div class="ui fluid card">

		<a href="{$VOTES_LINK}" class="ui button" style="width: 100%;">
			<span style="font-size: 1em; color: rgb(11, 252, 51);">
				<i class="fas fa-thumbs-up"></i>
			</span>
			<span>{$VOTES}</span>
			<p>{$VOTES_LABEL}</p>
		</a>

		<a href="{$POINTS_LINK}" class="ui button" style="width: 100%;">
			<span style="font-size: 1em; color: rgb(248, 252, 11);">
				<i class="fas fa-star"></i>
			</span>
			<span>{$POINTS}</span>
			<p>{$POINTS_LABEL}</p>
		</a>
	</div>


	<div class="ui fluid card">
		<div class="ui button" style="width: 100%;">
			<span>{$VERSION_LABEL}:</span><br>
			<span style="font-size: 1em; color: rgb(11, 252, 51);">
				<i class="fab fa-vuejs"></i>
			</span>
			<span>{$VERSIONS_LIST[$VERSION]['name']}</span>
		</div>
	</div>

	<div class="ui fluid card">

		<div class="ui button" style="width: 100%;">
			<span style="font-size: 1em; color: rgb(11, 252, 51);">
				<i class="fas fa-copyright"></i>
			</span>
			<span>{$CATEGORY_LABEL}:</span><br>
			{foreach from=$CATEGORY_LINK key=key item=cat}

				<span>{$cat->name}, </span>

			{/foreach}
		</div>
	</div>


	<div class="ui fluid card">


		{if !empty($WEBSITE_URL)}
			<a href="{$WEBSITE_URL}" target="_blank" class="ui button" style="width: 100%;">
				<span style="font-size: 1em; color: rgb(11, 252, 51);">
					<i class="fas fa-link"></i>
				</span>
				<span>{$SITE_LABEL}</span>
			</a>
		{/if}

		{if $SPONSOR != 1}
			{if !empty($DISCORD_INVITE)}
				<a href="{$DISCORD_INVITE}" target="_blank" class="ui button" style="width: 100%;">
					<span style="font-size: 1em; color: rgb(11, 252, 51);">
						<i class="fab fa-discord"></i>
					</span>
					<span>{$DS_LABEL}</span>
				</a>
			{/if}
		{/if}

		{if !empty($TEAM_SPEAK)}
			<a href="{$TEAM_SPEAK}" target="_blank" class="ui button" style="width: 100%;">
				<span style="font-size: 1em; color: rgb(11, 252, 51);">
					<i class="fab fa-teamspeak"></i>
				</span>
				<span>{$TS_LABEL}</span>
			</a>
		{/if}
	</div>


	<div class="ui fluid card">

		{if !empty($LAND)}
			{foreach key=code item=name from=$COUNTRIES}
				{if $LAND == $name}
					<a class="ui button" style="width: 100%;">
						<span>{$COUNTRY_LABEL}:</span><br>
						<span>
							<i class=""><img src="https://github.com/yammadev/flag-icons/raw/master/png/{$code}.png?raw=true"></i> {$LAND}
						</span>
					</a>
				{/if}
			{/foreach}
		{/if}

		{if !empty($DATETIME)}
			<a class="ui button" style="width: 100%;">
				<p>{$SERVER_REGISTERED_LABEL}</p>
				<span style="font-size: 1em; color: rgb(11, 252, 51);">
					<i class="fas fa-calendar-alt"></i>
				</span>
				<span>{$DATETIME}</span>
			</a>
		{/if}

	</div>

	<div class="ui fluid card">
		<div class="content">
			<div class="description">
				<div class="ui centered header">{$SHARE_LABEL}</div>
				<div class="ui relaxed list">
					<div id="share-buttons">

						<!-- Buffer -->
						<a href="https://bufferapp.com/add?url={$THIS_URL}&amp;text={$NAME}" target="_blank">
							<img class="ui mini image" src="https://simplesharebuttons.com/images/somacro/buffer.png" alt="Buffer" />
						</a>

						<!-- Digg -->
						<a href="http://www.digg.com/submit?url={$THIS_URL}" target="_blank">
							<img class="ui mini image" src="https://simplesharebuttons.com/images/somacro/diggit.png" alt="Digg" />
						</a>

						<!-- Email -->
						<a href="mailto:?Subject={$NAME}&amp;Body=I%20saw%20this%20and%20thought%20of%20you!%20 {$THIS_URL}">
							<img class="ui mini image" src="https://simplesharebuttons.com/images/somacro/email.png" alt="Email" />
						</a>

						<!-- Facebook -->
						<a href="http://www.facebook.com/sharer.php?u={$THIS_URL}" target="_blank">
							<img class="ui mini image" src="https://simplesharebuttons.com/images/somacro/facebook.png"
								alt="Facebook" />
						</a>

						<!-- LinkedIn -->
						<a href="http://www.linkedin.com/shareArticle?mini=true&amp;url={$THIS_URL}" target="_blank">
							<img class="ui mini image" src="https://simplesharebuttons.com/images/somacro/linkedin.png"
								alt="LinkedIn" />
						</a>


						<!-- Print -->
						<a href="javascript:;" onclick="window.print()">
							<img class="ui mini image" src="https://simplesharebuttons.com/images/somacro/print.png" alt="Print" />
						</a>

						<!-- Reddit -->
						<a href="http://reddit.com/submit?url={$THIS_URL}&amp;title={$NAME}" target="_blank">
							<img class="ui mini image" src="https://simplesharebuttons.com/images/somacro/reddit.png" alt="Reddit" />
						</a>

						<!-- StumbleUpon-->
						<a href="http://www.stumbleupon.com/submit?url={$THIS_URL}&amp;title={$NAME}" target="_blank">
							<img class="ui mini image" src="https://simplesharebuttons.com/images/somacro/stumbleupon.png"
								alt="StumbleUpon" />
						</a>

						<!-- Tumblr-->
						<a href="http://www.tumblr.com/share/link?url={$THIS_URL}&amp;title={$NAME}" target="_blank">
							<img class="ui mini image" src="https://simplesharebuttons.com/images/somacro/tumblr.png" alt="Tumblr" />
						</a>

						<!-- Twitter -->
						<a href="https://twitter.com/share?url={$THIS_URL}&amp;text={$NAME}&amp;hashtags=simplesharebuttons"
							target="_blank">
							<img class="ui mini image" src="https://simplesharebuttons.com/images/somacro/twitter.png"
								alt="Twitter" />
						</a>

						<!-- VK -->
						<a href="http://vkontakte.ru/share.php?url={$THIS_URL}" target="_blank">
							<img class="ui mini image" src="https://simplesharebuttons.com/images/somacro/vk.png" alt="VK" />
						</a>

						<!-- Yummly -->
						<a href="http://www.yummly.com/urb/verify?url={$THIS_URL}&amp;title={$NAME}" target="_blank">
							<img class="ui mini image" src="https://simplesharebuttons.com/images/somacro/yummly.png" alt="Yummly" />
						</a>

					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="copy-alert" class="ui hidden black mini message">
		Copied
	</div>


</div>
{* 
<script>
alert('{$STATS_INFO_TEXT_COLOR}')
console.log('{$STATS_INFO_TEXT_COLOR}')
</script> *}