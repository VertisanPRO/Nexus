<style>
	.main-wrapper {
		width: 90%;
		max-width: 900px;
		margin: 3em auto;
		text-align: center;
	}

	.bdg {
		position: relative;
		margin: 1.5em 3em;
		width: 4em;
		height: 6.2em;
		border-radius: 10px;
		display: inline-block;
		top: 0;
		transition: all 0.2s ease;
	}

	.bdg:before,
	.bdg:after {
		position: absolute;
		width: inherit;
		height: inherit;
		border-radius: inherit;
		background: inherit;
		content: "";
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		margin: auto;
	}

	.bdg:before {
		transform: rotate(60deg);
	}

	.bdg:after {
		transform: rotate(-60deg);
	}

	.bdg:hover {
		top: -4px;
	}

	.bdg .circle {
		/* width: 60px; */
		height: 60px;
		position: absolute;
		background: #fff;
		z-index: 10;
		border-radius: 50%;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		margin: auto;
	}

	.bdgsmall .circlesmall {
		/* width: 60px; */
		height: 60px;
		position: absolute;
		background: #fff;
		z-index: 10;
		border-radius: 50%;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		margin: auto;
	}

	.bdgsmall {
		position: relative;
		border-radius: 50%;
		margin: 1.5em 3em;
		width: 0em;
		height: 0em;
		border-radius: 10px;
		display: inline-block;
		top: 0;
		transition: all 0.2s ease;
	}

	.bdgsmall .circlesmall i.fa {
		font-size: 2em;
		margin-top: 8px;
	}

	.bdg .circle i.fa {
		font-size: 2em;
		margin-top: 8px;
	}

	.bdg .font {
		display: inline-block;
		margin-top: 1em;
	}

	.bdg .ribbon {
		position: absolute;
		border-radius: 4px;
		padding: 5px 5px 4px;
		width: 100px;
		z-index: 11;
		color: #fff;
		bottom: 12px;
		left: 50%;
		margin-left: -50px;
		height: 25px;
		font-size: 14px;
		box-shadow: 0 1px 2px rgba(0, 0, 0, 0.27);
		text-shadow: 0 2px 2px rgba(0, 0, 0, 0.1);
		text-transform: uppercase;
		background: linear-gradient(to bottom right, #555 0%, #333 100%);
		cursor: default;
	}
</style>

<div class="item">
	<div class="content">
		<div class="header" class="ui basic button" onclick="badgesModal({$reply.user_id})">{$BDG_TITLE}</div>
		<div class="right floated description" onclick="badgesModal({$reply.user_id})">
			{if empty($USER_BDG_COUNT[$reply.user_id]['count'])}0{else}{$USER_BDG_COUNT[$reply.user_id]['count']}{/if}
		</div>
	</div>
</div>
<div class="item">
	<div class="content centred">
		<div class="mini ui top attached positive button" onclick="badgesModal({$reply.user_id})"><i
				class="fas fa-shield-alt"></i></div>
	</div>
</div>

<div class=" ui basic modal userbadges {$reply.user_id}">
	<div class="ui icon header">
		{$BDG_TITLE} {$reply.username}
	</div>
	<div class="content">

		<div class="main-wrapper">
			{foreach from=$USER_BADGES_LIST item=$badges}
				{if $badges.user_id == $reply.user_id}
					<div class="bdg"
						style="background: linear-gradient(to bottom right, {$badges.bdg_color} 0%, {$badges.bdg_color} 100%); color: {$badges.bdg_color};">
						>
						<div class="circle"> {$badges.bdg_icon}</div>
						<div class="ribbon">{$badges.bdg_ribbon}</div>
					</div>
				{/if}
			{/foreach}
		</div>
	</div>
	<div class="actions">
		<div class="ui red basic cancel inverted button">
			<i class="remove icon"></i>
		</div>
	</div>
</div>

<script>
	function badgesModal(id) {
		$('.ui.basic.modal.userbadges.' + id)
			.modal('show');
	}
</script>