{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="ui container">
    <div class="ui padded segment">
        <h2 style="display:inline;">{$NEW_RESOURCE}</h2>

        <div class="res right floated">
            <a href="{$CANCEL_LINK}" class="ui red button" onclick="return confirm('{$CONFIRM_CANCEL}');">{$CANCEL}</a>
        </div>

        <div class="ui divider"></div>

        {if isset($ERROR)}
            <div class="ui negative message">
                {$ERROR}
            </div>
        {/if}

        <form action="" method="post" class="ui form">
            <div class="field">
                <label for="inputGitHubUsername">{$GITHUB_USERNAME} <small>{$REQUIRED}</small></label>
                <input type="text" name="github_username" id="inputGitHubUsername">
            </div>

            <div class="field">
                <label for="inputGitHubRepo">{$GITHUB_REPO_NAME} <small>{$REQUIRED}</small></label>
                <input type="text" name="github_repo" id="inputGitHubRepo">
            </div>

            <div class="field">
                <input type="hidden" name="token" value="{$TOKEN}">
                <input type="submit" class="ui blue button" value="{$SUBMIT}">
            </div>

        </form>
    </div>
</div>

{include file='footer.tpl'}