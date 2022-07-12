{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="ui padded segment">
    <div class="ui stackable grid">
        <div class="ui row">
            <div class="ui ten wide column">
                <div class="description">
                    <div class="ui relaxed list">
                        <div class="item">
                            <img class="ui rounded centered image" src="{$RESOURCE_ICON}" alt="{$RESOURCE_NAME}"
                                style="max-height:64; max-width:64px;">
                            <div class="content">
                                <h2 class="header" style="display: block;">{$VIEWING_RESOURCE}</h2>
                                <span>[{$RELEASE_TAG}] {$RESOURCE_SHORT_DESCRIPTION}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ui six wide column">
                <div class="res right floated">
                    {if isset($CAN_UPDATE)}
                        <a href="{$UPDATE_LINK}" class="ui blue button">{$UPDATE}</a>
                    {/if}
                    <a href="{$BACK_LINK}" class="ui button">{$RESOURCE_INDEX}</a>
                </div>
            </div>
        </div>
        <div class="ui divider"></div>

        <div class="ui row">
            <div class="twelve wide column">
                <div class="ui tabular menu">
                    <a class="item active" href="{$OVERVIEW_LINK}">{$OVERVIEW_TITLE}</a>
                    <a class="item" href="{$OTHER_RELEASES_LINK}">{$RELEASES_TITLE}</a>
                    <a class="item" href="{$VERSIONS_LINK}">{$VERSIONS_TITLE}</a>
                    <a class="item" href="{$REVIEWS_LINK}">{$REVIEWS_TITLE}</a>
                </div>
                <div class="forum_post">
                    {$DESCRIPTION}
                </div>

                <br />{if $HAS_CONTRIBUTORS eq 1}{$CONTRIBUTORS}{/if}

                <div class="ui divider"></div>

                {if isset($LOG_IN_TO_DOWNLOAD)}
                    <button disabled class="ui blue disabled button">{$LOG_IN_TO_DOWNLOAD}</button>
                {/if}
                {if isset($DOWNLOAD_URL)}
                    <a href="{$DOWNLOAD_URL}" class="ui blue button" target="_blank">{$DOWNLOAD}</a>
                {elseif isset($PURCHASE_FOR_PRICE)}
                    <a {if isset($PURCHASE_LINK)}href="{$PURCHASE_LINK}" 
                    {else}disabled
                            {/if}class="ui blue{if !isset($PURCHASE_LINK)} disabled{/if} button">{$PURCHASE_FOR_PRICE}</a>
                    {elseif isset($PAYMENT_PENDING)}
                        <button type="button" disabled class="ui blue button">{$PAYMENT_PENDING}</button>
                    {/if}

                    <span class="pull-right">
                        {if isset($CAN_EDIT)}
                            <a href="{$EDIT_LINK}" class="ui button">{$EDIT}</a>
                            <a data-toggle="modal" data-target="#modal-icon-upload" class="ui button">{$CHANGE_ICON}</a>
                            <div class="ui small modal" id="modal-icon-upload">
                                <div class="header">
                                    {$CHANGE_ICON}
                                </div>
                                <div class="content">
                                    <form action="{$CHANGE_ICON_ACTION}" method="post" enctype="multipart/form-data"
                                        class="ui form" id="form-resource-icon">
                                        <div class="field">
                                            <input type="file" name="file" id="uploadFileButton" hidden
                                                onchange="$('#fileName').html(this.files[0].name)" />
                                            <label class="ui icon labeled default button" for="uploadFileButton">
                                                <i class="ui cloud upload icon"></i> <span id="fileName">{$UPLOAD_ICON}</span>
                                            </label>
                                        </div>
                                        <input type="hidden" name="token" value="{$TOKEN}">
                                        <input type="hidden" name="resource_id" value="{$RESOURCE_ID}" />
                                    </form>
                                </div>
                                <div class="actions">
                                    <a class="ui negative button">{$CANCEL}</a>
                                    <a class="ui positive button" onclick="$('#form-resource-icon').submit();">{$SUBMIT}</a>
                                </div>
                            </div>
                        {/if}
                        {if isset($MODERATION) && count($MODERATION)}
                            <div class="ui pointing dropdown small primary button upward" tabindex="0">
                                <a class="text">{$MODERATION_TEXT}</a>
                                <i class="dropdown icon"></i>
                                <div class="menu" tabindex="-1">
                                    <div class="header">{$MODERATION_TEXT}</div>
                                    {foreach from=$MODERATION item=item}
                                        <a class="item" href="{$item.link}">{$item.title}</a>
                                    {/foreach}
                                </div>
                            </div>
                        {/if}
                        <a href="{$OTHER_RELEASES_LINK}" class="ui teal button">{$OTHER_RELEASES}</a>
                    </span>

                </div>

                <div class="four wide column">
                    <div class="ui aligned segment">
                        <h4 class="ui header">{$RESOURCE}</h4>
                        <div class="ui divider"></div>

                        <div class="description">
                            <div class="ui list">
                                <div class="item">
                                    <span class="text">{$VIEWS}</span>
                                    <div class="description right floated"><b>{$VIEWS_VALUE}</b></div>
                                </div>
                                <div class="item">
                                    <span class="text">{$TOTAL_DOWNLOADS}</span>
                                    <div class="description right floated"><b>{$TOTAL_DOWNLOADS_VALUE}</b></div>
                                </div>
                                <div class="item">
                                    <span class="text">{$FIRST_RELEASE}</span>
                                    <div class="description right floated"><b>{$FIRST_RELEASE_DATE}</b></div>
                                </div>
                                <div class="item">
                                    <span class="text">{$LAST_RELEASE}</span>
                                    <div class="description right floated"><b>{$LAST_RELEASE_DATE}</b></div>
                                </div>
                                <div class="item">
                                    <span class="text">{$CATEGORY}</span>
                                    <div class="description right floated"><b>{$CATEGORY_VALUE}</b></div>
                                </div>
                                <div class="item">
                                    <span class="text">{$RATING}</span>
                                    <div class="description right floated">
                                        <div class="star-rating view">
                                            <span class="far fa-star" data-rating="1" style="color:gold;"></span>
                                            <span class="far fa-star" data-rating="2" style="color:gold"></span>
                                            <span class="far fa-star" data-rating="3" style="color:gold;"></span>
                                            <span class="far fa-star" data-rating="4" style="color:gold;"></span>
                                            <span class="far fa-star" data-rating="5" style="color:gold;"></span>
                                            <input type="hidden" name="rating" class="rating-value" value="{$RATING_VALUE}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="ui aligned segment">
                        <h4 class="ui header">{$RELEASE_VERSION}</h4>
                        <div class="ui divider"></div>

                        <div class="description">
                            <div class="ui list">
                                <div class="item">
                                    <span class="text">{$DOWNLOADS}</span>
                                    <div class="description right floated"><b>{$RELEASE_DOWNLOADS}</b></div>
                                </div>
                                <div class="item">
                                    <span class="text">{$RELEASE}</span>
                                    <div class="description right floated"><b>{$RELEASE_DATE_FULL}</b></div>
                                </div>
                                <div class="item">
                                    <span class="text">{$RATING}</span>
                                    <div class="description right floated">
                                        <div class="star-rating view">
                                            <span class="far fa-star" data-rating="1" style="color:gold;"></span>
                                            <span class="far fa-star" data-rating="2" style="color:gold"></span>
                                            <span class="far fa-star" data-rating="3" style="color:gold;"></span>
                                            <span class="far fa-star" data-rating="4" style="color:gold;"></span>
                                            <span class="far fa-star" data-rating="5" style="color:gold;"></span>
                                            <input type="hidden" name="rating" class="rating-value"
                                                value="{$RELEASE_RATING}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="ui aligned segment">
                        <h4 class="ui header">{$AUTHOR}</h4>
                        <div class="ui divider"></div>

                        <center>
                            <a href="{$AUTHOR_PROFILE}"><img src="{$AUTHOR_AVATAR}" class="ui rounded centered image"
                                    alt="{$AUTHOR_NICKNAME}" style="max-height:80px; max-width:80px;" /></a><br />
                            <a href="{$AUTHOR_PROFILE}" style="{$AUTHOR_STYLE}">{$AUTHOR_NICKNAME}</a>
                            <div class="ui divider"></div>

                            <a href="{$AUTHOR_RESOURCES}">&raquo; {$VIEW_OTHER_RESOURCES}</a>
                        </center>
                    </div>
                </div>
            </div>
        </div>

        <div class="ui divider"></div>

        <h3>{$REVIEWS}</h3>

        {if count($COMMENT_ARRAY)}
            {foreach from=$COMMENT_ARRAY item=comment}
                <div class="ui segment">
                    {$comment.content}
                    {if isset($DELETE_REVIEW)}
                        <br /><br /><span class="res right floated"><a href="{$comment.delete_link}"
                                onclick="return confirm('{$CONFIRM_DELETE_REVIEW}');">{$DELETE_REVIEW}</a></span><br />
                    {/if}
                    <hr />
                    <div class="star-rating view" style="display:inline;">
                        <span class="far fa-star" data-rating="1" style="color:gold;"></span>
                        <span class="far fa-star" data-rating="2" style="color:gold"></span>
                        <span class="far fa-star" data-rating="3" style="color:gold;"></span>
                        <span class="far fa-star" data-rating="4" style="color:gold;"></span>
                        <span class="far fa-star" data-rating="5" style="color:gold;"></span>
                        <input type="hidden" name="rating" class="rating-value" value="{$comment.rating}">
                    </div> | {$comment.release_tag} | <span data-toggle="tooltip"
                        data-content="{$comment.date_full}">{$comment.date}</span>
                    <span class="res right floated">
                        <a href="{$comment.user_profile}"><img class="ui avatar image" src="{$comment.user_avatar}"
                                style="height:25px;width:25px;display:inline;" alt="{$comment.username}" /></a> <a
                            href="{$comment.user_profile}" style="{$comment.user_style}">{$comment.username}</a>
                    </span>
                </div>
                <br />
            {/foreach}
            {$PAGINATION}
        {else}
            <p>{$NO_REVIEWS}</p>
        {/if}

        {if $CAN_REVIEW == true && !isset($PAYMENT_PENDING) && !isset($PURCHASE_FOR_PRICE)}
            <h4>{$NEW_REVIEW}</h4>
            {if isset($ERROR)}
                <div class="ui negative message">
                    {$ERROR}
                </div>
            {/if}
            <form action="" method="post" class="ui form">
                <div class="form-group">
                    <div class="star-rating set">
                        <span class="far fa-star" data-rating="1" style="color:gold;"></span>
                        <span class="far fa-star" data-rating="2" style="color:gold"></span>
                        <span class="far fa-star" data-rating="3" style="color:gold;"></span>
                        <span class="far fa-star" data-rating="4" style="color:gold;"></span>
                        <span class="far fa-star" data-rating="5" style="color:gold;"></span>
                        <input type="hidden" name="rating" class="rating-value" value="0">
                    </div>
                </div>
                <br />
                <div class="form-group">
                    <textarea style="width:100%" name="content" id="editor" rows="15"></textarea>
                </div>
                <br />
                <div class="form-group">
                    <input type="hidden" name="token" value="{$TOKEN}">
                    <input type="submit" class="ui blue button" value="{$SUBMIT}">
                </div>
            </form>
        {/if}
    </div>

    {include file='footer.tpl'}