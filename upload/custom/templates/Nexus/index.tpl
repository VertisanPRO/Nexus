{include file='header.tpl'}
{include file='navbar.tpl'}

{if isset($HOME_SESSION_FLASH)}
	<div class="ui success icon message">
		<i class="check icon"></i>
		<div class="content">
			<div class="header">{$SUCCESS_TITLE}</div>
			{$HOME_SESSION_FLASH}
		</div>
	</div>
{/if}

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:wght@500&family=Kanit:ital@0;1&display=swap"
	rel="stylesheet">


{if isset($HOME_SESSION_ERROR_FLASH)}
	<div class="ui error icon message">
		<i class="x icon"></i>
		<div class="content">
			<div class="header">{$ERROR_TITLE}</div>
			{$HOME_SESSION_ERROR_FLASH}
		</div>
	</div>
{/if}

<div class="ui stackable grid">
	<div class="ui centered row">
		{if count($WIDGETS_LEFT)}
			<div class="ui six wide tablet four wide computer column">
				{foreach from=$WIDGETS_LEFT item=widget}
					{$widget}
				{/foreach}
			</div>
		{/if}
    <div class="ui {if count($WIDGETS_LEFT) && count($WIDGETS_RIGHT) }four wide tablet eight wide computer{elseif count($WIDGETS_LEFT) || count($WIDGETS_RIGHT)}ten wide tablet twelve wide computer{else}sixteen wide{/if} column">
        {if $NEWS != null && count($NEWS)}
            {foreach from=$NEWS item=item}
            <div class="ui fluid card" id="news-post">
                <div class="content">
                <div class="header">
                    {if isset($item.label)}{$item.label}{/if}
                    <a href="{$item.url}" data-toggle="popup">{$item.title}</a>
                    <div class="ui popup wide transition hidden">
                    <h4 class="ui header">{$item.title}</h4>
                    {$BY|capitalize} <a style="{$item.author_style}" href="{$item.author_url}">{$item.author_name}</a> | {$item.date}
                    </div>
                </div>
                <div class="meta" data-toggle="tooltip" data-content="{$item.date}">
                    {$item.time_ago}
                </div>
                <div class="description forum_post">
                    {$item.content}
                </div>
                </div>
                <div class="extra content">
                <div class="right floated author">
                    <img class="ui avatar image" src="{$item.author_avatar}" alt="{$item.author_name}"> <a style="{$item.author_style}" href="{$item.author_url}" data-poload="{$USER_INFO_URL}{$item.author_id}">{$item.author_name}</a>
                </div>
                <a class="ui mini primary button" href="{$item.url}">
                    {$READ_FULL_POST}
                </a>
                </div>
            </div>
            {/foreach}
        {/if}
    </div>
		{if count($WIDGETS_RIGHT)}
			<div class="ui six wide tablet four wide computer column">
				{foreach from=$WIDGETS_RIGHT item=widget}
					{$widget}
				{/foreach}
			</div>
		{/if}
	</div>
</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>

<div class="ui modal">
	<i class="close icon"></i>
	<div class="ui padded segment" id="login">
    display: block;
    margin-left: auto;
    margin-right: auto;
    margin-top: 10px;
">
			<div class="ui centered row" style="
    margin-top: -30px;
">
				<div class="ui sixteen wide tablet ten wide computer column">
					<form class="ui form" action="" method="post" id="form-login">
						{if isset($EMAIL)}
							<div class="field">
								<label>{$EMAIL}</label>
								<input type="email" name="email" id="email" value="{$USERNAME_INPUT}" placeholder="{$EMAIL}" tabindex="1">
							</div>
						{else}
							<div class="field">
								<label>{$USERNAME}</label>
								<input type="text" name="username" id="username" value="{$USERNAME_INPUT}" placeholder="{$USERNAME}"
									tabindex="1">
							</div>
						{/if}
						<div class="field">
							<label>{$PASSWORD}</label>
							<input type="password" name="password" id="password" placeholder="{$PASSWORD}" tabindex="2">
						</div>
						<div class="inline field">
							<div class="ui checkbox">
								<input type="checkbox" name="remember" id="remember" value="1" tabindex="3">
								<label for="remember">{$REMEMBER_ME}</label>
							</div>
						</div>
						{if isset($RECAPTCHA)}
							<div class="field">
								<div class="{$CAPTCHA_CLASS}" data-sitekey="{$RECAPTCHA}" tabindex="4"></div>
							</div>
						{/if}
						<input type="hidden" name="token" value="{$FORM_TOKEN}">
						<input type="submit" class="ui primary button" style="
    width: 100%;
" value="{$SIGN_IN}" tabindex="5">
						<a class="ui negative button right floated" style="margin-top: -77px;"
							href="{$FORGOT_PASSWORD_URL}">{$FORGOT_PASSWORD}</a>
					</form>
					<div class="ui horizontal divider">{$NOT_REGISTERED_YET}</div>
					<div class="ui center aligned">
						<a class="ui large positive button" href="{$REGISTER_URL}">{$REGISTER}</a>
					</div>
				</div>
			</div>
		</div>
{include file='footer.tpl'}