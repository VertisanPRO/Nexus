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

			<div class="ui centered banner test" data-text="">
				<img class="ui centered image" src="{$BANNER}">
			</div>
			<div class="content">
				{$DESCRIPTION}
			</div>
		</div>

		<div class="ui segment">
			<div class="ui centered header">{$COMMENTS_LABEL}</div>
		</div>


		<div class="comment">
			{foreach from=$COMMENTS_LIST item=comment}
				<div class="ui segment">

					<div class="content">
						<div class="description">
							<div class="ui relaxed list">
								<div class="item">
									<img class="ui mini circular image" src="https://cravatar.eu/helmavatar/{$comment.username}/128.png"
										alt="{$OWNER_DATA.username}">
									<div class="content">
										<a class="header" data-poload="/queries/user/?id={$comment.user_id}"
											href="/profile/{$comment.username}">{$comment.username}</a>
										<p class="meta">
											{$comment.datetime}
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="content" style="margin-top:10px;">
						<div class="text">
							<h3>{$comment.content}</h3>
						</div>
					</div>
					<div class="action">
						{if {$comment.editor} == 1}
							<form action="" method="POST" class="ui form">
								<input type="hidden" name="delete_comment" value="{$comment.id}">
								<button class="ui mini button" style="margin-top: 10px;" type="submit"><i class="icon delete"></i>
									{$DELETE_COMMENTS_LABEL}</button>
							</form>
						{/if}

					</div>
				</div>

			{/foreach}


		</div>
		<div class="ui segment">
			<form action="" method="POST" class="ui form">
				<div class="field">
					<textarea name="content"></textarea>
				</div>

				<button class="ui button" type="submit"><i class="icon edit"></i>
					{$ADD_COMMENTS_LABEL}</button>

			</form>
		</div>



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