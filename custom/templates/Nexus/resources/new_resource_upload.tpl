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

        <form action="" method="post" enctype="multipart/form-data" class="ui form">
            <div class="field">
                <input type="file" class="inputFile" name="resourceFile" id="uploadFileButton"
                    accept=".zip,application/zip" hidden onchange="$('#fileName').html(this.files[0].name)" />
                <label class="ui icon labeled default button" for="uploadFileButton">
                    <i class="ui cloud upload icon"></i> <span id="fileName">{$CHOOSE_FILE} ({$ZIP_ONLY})</span>
                </label>
            </div>

            <div class="field">
                <label for="inputVersion">{$VERSION_TAG}</label>
                <input type="text" name="version" id="inputVersion" value="1.0.0">
            </div>

            <div class="field">
                <input type="hidden" name="token" value="{$TOKEN}">
                <input type="submit" class="ui blue button" value="{$SUBMIT}">
            </div>

        </form>
    </div>
</div>

{include file='footer.tpl'}