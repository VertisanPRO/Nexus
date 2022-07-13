{include file='header.tpl'}
{include file='navbar.tpl'}

<h2 class="ui header">
    {$TITLE}
</h2>

{if isset($SUCCESS)}
    <div class="ui message icon announcement" style="border-top-style: solid; border-top-color: #5cb85c;">
        <i class="check icon" style="color: #5cb85c;"></i>
        <div class="content">
            <div class="header">{$SUCCESS_TITLE}</div>
            {$SUCCESS}
        </div>
    </div>
{/if}

{if isset($ERRORS)}
    <div class="ui message icon announcement" style="border-top-style: solid; border-top-color: #d9534f;">
        <i class="x icon" style="color: #d9534f;"></i>
        <div class="content">
            {foreach from=$ERRORS item=error}
                <li>{$error}</li>
            {/foreach}
        </div>
    </div>
{/if}

<div class="ui stackable grid" id="user">
    <div class="ui centered row">
        <div class="ui six wide tablet four wide computer column">
            {include file='user/navigation.tpl'}
        </div>
        <div class="ui ten wide tablet twelve wide computer column">
            <div class="ui segment">
                <h3 class="ui header">{$SUBMISSIONS}</h3>

                <div class="ui grid">
                    <div class="three column row">
                        <div class="column">{$FORM_X}</div>
                        <div class="column">{$CURRENT_STATUS_X}</div>
                        <div class="column">{$LAST_UPDATED} <span class="float-right" data-toggle="tooltip"
                                data-original-title="{$LAST_UPDATED_DATE}">{$LAST_UPDATED_FRIENDLY}</span></div>
                    </div>
                </div>

                <div class="ui segment">
                    <a href="{$USER_PROFILE}" style="{$USER_STYLE}" target="_blank"><img src="{$USER_AVATAR}"
                            class="ui mini avatar image" style="max-width:25px;max-height:25px;" alt="{$USER}" />
                        {$USER}</a>:
                    <span class="pull-right" data-toggle="tooltip"
                        data-original-title="{$CREATED_DATE}">{$CREATED_DATE_FRIENDLY}</span>

                    <hr>

                    {foreach from=$ANSWERS item=answer}
                        <strong>{$answer.question}</strong>
                        {if $answer.field_type != 10}
                            <p>{$answer.answer}</p>
                        {else}
                            <p><a href="{$PATH_TO_UPLOADS}{$answer.answer}" target="_blank">{$answer.answer}</a></p>
                        {/if}
                    {/foreach}
                </div>


                <h5>{$COMMENTS_TEXT}</h5>
                {if count($COMMENTS)}
                    {foreach from=$COMMENTS item=comment}
                        <div class="ui segment">
                            {if !empty($comment.avatar)}
                                <a href="{$comment.avatar}" style="{$comment.style}" target="_blank"><img src="{$comment.avatar}"
                                        class="ui mini avatar image" style="max-height:25px;max-width:25px;"
                                        alt="{$comment.username}" /> {$comment.username}</a>:
                            {else}
                                <i class="fa fa-user"></i> {$comment.username}:
                            {/if}
                            <span class="pull-right" data-toggle="tooltip"
                                data-original-title="{$comment.date}">{$comment.date_friendly}</span>
                            <hr>
                            {$comment.content}
                        </div>
                    {/foreach}
                {else}
                    {$NO_COMMENTS}
                {/if}

                {if $CAN_COMMENT}
                    </br>
                    <form class="ui form" action="" method="post">
                        <div class="field">
                            <textarea name="content" rows="5" placeholder="{$NEW_COMMENT}"></textarea>
                        </div>
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <input type="submit" value="{$SUBMIT}" class="ui primary button">
                    </form>
                {/if}

            </div>
        </div>
    </div>
</div>

{include file='footer.tpl'}