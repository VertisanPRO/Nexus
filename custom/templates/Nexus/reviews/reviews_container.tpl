{if {$REVIEWS_ARRAY|@count} <= 0} <div class="ui center aligned segment" id="no_reviews_container">
        <p class="ui medium text">{$NO_REVIEWS}</p>
        </div>

    {elseif {$REVIEWS_ARRAY|@count} >= 1}
        <div class="ui center aligned segment" id="filter_no_reviews_container" style="display: none !important;">
            <p class="ui small text">{$NO_CRITERIA}</p>
        </div>
        <div class="ui stackable stretched four column padded grid" id="reviews_container">
            {foreach from=$REVIEWS_ARRAY item=review}
                <div class="column" data-value="{$review.type_name}" data-date="{$review.date}">
                    <div class="ui card centered">
                        <div class="extra content"
                            style="{if $COLOURED_TYPES == '1'}border-top-style: solid; border-top-color: #{$review.type_color} !important;{/if} font-weight: bold !important;">
                            {$review.type_icon}
                            {if $review.type_link != NULL}
                                <a href="{$review.type_link}">{$review.type_title}</a>
                            {else}
                                {$review.type_title}
                            {/if}
                        </div>
                        <div class="content">
                            <div class="header user_information">
                                <a href=" {$review.user_profile}">
                                    <div class="ui feed">
                                        <div class="event">
                                            <div class="label">
                                                <img src="{$review.avatar}">
                                            </div>
                                            <div class="content">
                                                {$review.user_name}
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="meta">{$review.dateAgo}</div>
                            <div class="description">
                                <div class="ui star rating disabled review_stars" data-rating="{$review.stars}"
                                    data-max-rating="5"></div>
                                <p><b>{$review.title}</b></p>
                                <p>{$review.description}</p>
                            </div>
                        </div>
                        <div class="extra content">
                            <span class="left floated">
                                <i class="like icon like_button {if isset($LOGGED) && in_array($review.id, $REVIEWS_LIKED)}active{/if}"
                                    id="{$review.id}"></i>
                                <span class="text likes_counter" value="{$review.id}">{$review.likes}</span>
                            </span>
                            {if isset($LOGGED)}
                                <span class="right floated">
                                    {if $IS_ADMIN || $IS_MODERATOR && $APPROVE_REVIEWS == 1}
                                        <i class="check icon review_actions approve_icon_button" id="{$review.id}"
                                            {if $review.approved == "1"}style="display:none;" {/if}></i>
                                        <i class="remove icon review_actions unapprove_icon_button" id="{$review.id}"
                                            {if $review.approved == "1" || $review.status == "0"}style="display:none;" {/if}></i>
                                    {/if}
                                    {if $IS_ADMIN || ($IS_MODERATOR && $DELETE_REVIEWS == 1) || ($review.user_id == $USER_ID && $DELETE_OWN_REVIEWS == 1)}
                                        <i class="eye slash icon review_actions unlist_icon_button" id="{$review.id}"
                                            {if $review.status != "2"}style="display:none;" {/if}></i>
                                    {/if}
                                    {if $IS_ADMIN || ($IS_MODERATOR && $RESTORE_REVIEWS == 1)}
                                        <i class="undo icon review_actions restore_icon_button" id="{$review.id}"
                                            {if $review.status == "2" || $review.approved == "0" }style="display:none;" {/if}></i>
                                    {/if}
                                    {if $IS_ADMIN || $IS_MODERATOR && $HARD_DELETE_REVIEWS == 1}
                                        <i class="trash icon review_actions remove_icon_button" id="{$review.id}"></i>
                                    {/if}
                                </span>
                            {/if}
                        </div>
                        {if $review.status != 2 && $STATUS_REVIEW == 1}
                            <div class="extra content status_review">
                                {if $review.approved == 0 && $review.status == 0}
                                    {$REVIEWS_APPROVED_PLACEHOLDER}
                                {elseif $review.approved == 1 && $review.status == 1 || $review.status == 0 }
                                    {$REVIEWS_UNLISTED_PLACEHOLDER}
                                {elseif $review.approved == 0 && $review.status == 1}
                                    {$REVIEWS_WAITING_FOR_PLACEHOLDER}
                                {/if}
                            </div>
                        {/if}
                    </div>
                </div>
            {/foreach}
        </div>
{/if}