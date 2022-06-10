<!-- Embed Content -->
<div class="card mb-3">
    <h3 class="card-header mb-3 text-center">{$EMBED_PAGE}</h3>
    <div class="card-body">
        <form action="" method="POST">
            <input type="hidden" name="sel_btn_session" value="embed" />
            <div class="form-group">
                <label for="embedTitle">{$EMBEDTITLE_LABEL} <span class="badge badge-info"><i
                            class="fas fa-question-circle" data-container="body" data-toggle="popover"
                            data-placement="top" data-content="{$EMBEDTITLE_INFO_LABEL}"
                            data-original-title="{$INFO}"></i></span></label>
                <input type="text" name="embedTitle" class="form-control" id="inputEmbedTitle"
                    placeholder="{$smarty.const.SITE_NAME}" value="{$EMBEDTITLE}">
            </div>
            <div class="form-group">
                <label for="embedText">{$EMBEDTEXT_LABEL}</label>
                <input type="text" name="embedText" class="form-control" id="inputEmbedText" value="{$EMBEDTEXT}">
            </div>
            <div class="form-group">
                <label for="embedColor">{$EMBEDCOLOR_LABEL}</label>
                <input type="color" class="form-control" id="inputEmbedColor" name="embedColor" value="{$EMBEDCOLOR}">
            </div>
            <div class="form-group">
                <label for="embedIcon">{$EMBEDICON_LABEL} <span class="badge badge-info"><i
                            class="fas fa-question-circle" data-container="body" data-toggle="popover"
                            data-placement="top" data-content="{$EMBEDICON_INFO_LABEL}"
                            data-original-title="{$INFO}"></i></span></label>
                <input type="text" name="embedIcon" class="form-control" id="inputEmbedIcon"
                    placeholder="https://example.com/img/logo.png" value="{$EMBEDICON}">
            </div>
            <div class="form-group">
                <label for="embedKeywords">{$EMBEDKEYWORDS_LABEL} <span class="badge badge-info"><i
                            class="fas fa-question-circle" data-container="body" data-toggle="popover"
                            data-placement="top" data-content="{$EMBEDKEYWORDS_INFO_LABEL}"
                            data-original-title="{$INFO}"></i></span></label>
                <input type="text" name="embedKeywords" class="form-control" id="inputEmbedKeywords"
                    value="{$EMBEDKEYWORDS}">
            </div>
            <div class="form-group">
                <input type="hidden" name="token" value="{$TOKEN}">
                <button type="submit" class="btn btn-primary w-100"><i class="fas fa-save"></i>
                    {$SUBMIT}</button>
            </div>
        </form>
        <div class="card shadow mb-4 embed-preview">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">{$EMBEDPREVIEW_LABEL}</h6>
            </div>
            <div class="card-body ">
                <div class="message">
                    <div class="name-box">
                        <img src="https://i.imgur.com/B8B0Zrc.png"
                            style="width: 52px;height: 52px;border-radius: 3.14vh;" />
                        <h2 class="name">Nexus {$EMBEDTEMPLATE_LABEL}</h2>
                        <span class="bot-tag">{$EMBEDBOT_LABEL}</span>
                        <p class="date">27/09/2022</p>
                    </div>
                    <div class="content-box">
                        <p class="content">{$EMBEDMESSAGEPREVIEW_LABEL}</p>
                        <div class="embed-box">
                            {if $EMBEDTITLE eq '$every'}
                                <p class="title link" onclick="window.open('/')">{$TITLE} &bull; {$smarty.const.SITE_NAME}
                                </p>
                            {else}
                                <p class="title link" onclick="window.open('/')">{$EMBEDTITLE}</p>
                            {/if}
                            <p class="description">
                                {$EMBEDTEXT}
                            </p>
                            <img src="{$EMBEDICON}" alt="Error: Failed to load image" class="thumbnail-picture" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    * {
        margin: 0;
        padding: 0;
    }

    .screen-size-error-container,
    .screen-size-error {
        display: none;
    }

    .link {
        color: #00b0f4;
        cursor: pointer;
        font-family: "Whitney";
    }

    .link:hover {
        text-decoration: underline;
    }

    .message {
        width: fit-content;
        height: fit-content;
    }

    .name-box {
        display: flex;
    }

    .profile-picture {
        width: 50px;
        height: 50px;
        border-radius: 50%;
    }

    .name {
        font-weight: normal;
        margin-top: 1px;
        margin-left: 1rem;
        font-size: 1.1rem;
        font-family: "Whitney";
    }

    .bot-tag {
        position: relative;
        background-color: #7289da;
        height: min-content;
        padding: 0.17rem;
        border-radius: 4px;
        font-size: 0.7rem;
        color: white;
        top: 4px;
        left: 4px;
    }

    .date {
        color: grey;
        font-size: 0.8rem;
        margin-top: 6px;
        margin-left: 13px;
        font-weight: 500;
        font-family: "Whitney";
    }

    .content-box {
        position: relative;
        top: -25px;
        left: 66.5px;
    }

    .embed-box {
        background-color: #161c25;
        margin-top: -10px;
        width: 135%;
        height: 145px;
        border-left: 5px solid {if isset($EMBEDCOLOR)}{$EMBEDCOLOR}{else}#46d0e6{/if};
        border-radius: 4px;
        position: relative;
    }

    .author {
        position: absolute;
        margin-top: 10px;
        margin-left: 6px;
        color: #ffffff;
    }

    .author-picture {
        width: 26px;
        height: 26px;
        border-radius: 50%;
    }

    .author-name {
        color: #ffffff;
        font-weight: normal;
        top: -26px;
        left: 35px;
        font-size: 1rem;
        position: relative;
        width: min-content;
        margin-right: 0;
    }

    .thumbnail-picture {
        width: 100px;
        height: 100px;
        border-radius: 5px;
        right: 15px;
        top: 15px;
        position: absolute;
    }

    .title {
        position: relative;
        font-weight: lighter;
        top: 14px;
        left: 10px;
    }

    .description {
        position: relative;
        top: 0px;
        left: 10px;
        color: hsla(0, 0%, 100%, 0.6);
        font-size: 14px;
        font-weight: 500;
        max-width: 360px;
    }

    @media screen and (max-width: 1024px) {
        .embed-preview {
            display: none !important;
        }
    }
</style>