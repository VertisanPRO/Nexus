{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="ui container">
    <div class="ui padded segment">
        <h2 style="display:inline;">{$UPDATE_RESOURCE}</h2>

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
                <label>{$RELEASE_TYPE}</label>
            </div>
            <div class="field">
                <div class="ui radio checkbox">
                    <input type="radio" name="type" id="local" value="local" checked="checked" hidden>
                    <label for="local">{$ZIP_FILE}</label>
                </div>
            </div>
            <div class="field">
                <input type="file" class="inputFile" name="resourceFile" id="uploadFileButton" accept=".zip,application/zip" hidden onchange="$('#fileName').html(this.files[0].name)" />
                <label class="ui icon labeled default button" for="uploadFileButton">
                    <i class="ui cloud upload icon"></i> <span id="fileName">{$CHOOSE_FILE} ({$ZIP_ONLY})</span>
                </label>
            </div>
            
            {if $GITHUB_LINKED}
            <div class="field">
                <div class="ui radio checkbox">
                    <input type="radio" name="type" id="github" value="github" hidden>
                    <label for="github">{$GITHUB_RELEASE}</label>
                </div>
            </div>
            <div class="field">
              <select name="release" class="ui selection dropdown" id="inputRelease">
                {foreach from=$RELEASES item=release}
                <option value="{$release.id}">{$release.tag} - {$release.name}</option>
                {/foreach}
              </select>
            </div>
            {/if}
                
            <div class="field">
                <div class="ui radio checkbox">
                    <input type="radio" name="type" id="external_link" value="external_link" hidden>
                    <label for="external_link">{$EXTERNAL_LINK}</label>
                </div>
            </div>
            <div class="field">
                <input type="text" name="link" id="inputLink" placeholder="{$EXTERNAL_LINK}">
            </div>
            
            <div class="ui divider"></div>
            
            <div class="field">
                <label for="inputVersion">{$VERSION_TAG}</label>
                <input type="text" name="version" id="inputVersion" value="{$VERSION_VALUE}">
            </div>
            
            <div class="field">
                <label for="inputTitle">{$UPDATE_TITLE}</label>
                <input type="text" name="title" id="inputTitle" value="{$TITLE_VALUE}">
            </div>

            <div class="field">
                <label for="{if isset($MARKDOWN)}markdown{else}content{/if}">{$UPDATE_INFORMATION}</label>
                {if !isset($MARKDOWN)}
                    <textarea style="width:100%" name="content" id="content" rows="15">{$CONTENT_VALUE}</textarea>
                {else}
                    <textarea style="width:100%" id="markdown" name="content" rows="15">{$CONTENT_VALUE}</textarea>
                    <span class="res right floated"><i data-toggle="popover" data-content="{$MARKDOWN_HELP}" class="fa fa-question-circle text-info" aria-hidden="true"></i></span>

                {/if}
            </div>

            <div class="field">
                <input type="hidden" name="token" value="{$TOKEN}">
                <input type="submit" class="ui blue button" value="{$SUBMIT}">
            </div>

        </form>
    </div>
</div>


{include file='footer.tpl'}