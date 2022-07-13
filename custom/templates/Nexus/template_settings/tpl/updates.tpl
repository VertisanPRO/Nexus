<!-- Updates Content -->
<div class="card">
    <h3 class="card-header mb-3 text-center">{$UPDATES_PAGE}</h3>
    <div class="card-body">
        {if isset($NEW_UPDATE_NEXUS)}
            <div class="alert {if $NEW_UPDATE_URGENT_NEXUS eq true}bg-danger{else}bg-primary{/if} text-white">
                {$NEW_UPDATE_NEXUS}
                <hr />
                {$CURRENT_VERSION_NEXUS}
                <br />
                {$NEW_VERSION_NEXUS}
            </div>
            <h4>{$INSTRUCTIONS}</h4>
            <p>{$INSTRUCTIONS_VALUE}</p>
            <hr />
            <a href="{$DOWNLOAD_LINK}" class="btn btn-primary">{$DOWNLOAD}</a>
            <button class="btn btn-primary" type="button" onclick="showConfirmModal()">{$UPDATE}</button>
        {elseif isset($UPDATE_CHECK_ERROR_NEXUS)}
            <div class="alert bg-danger text-white">
                <span><i class="icon fa fa-x"></i>&nbsp;&nbsp;{$UPDATE_CHECK_ERROR_NEXUS}</span>
            </div>
            <a href="{$CHECK_AGAIN_LINK}" class="btn btn-primary">{$CHECK_AGAIN}</a>
        {else}
            <div class="alert bg-success text-white">
                <span><i class="icon fa fa-check"></i>&nbsp;&nbsp;{$UP_TO_DATE}</span>
            </div>
            <a href="{$CHECK_AGAIN_LINK}" class="btn btn-primary">{$CHECK_AGAIN}</a>
        {/if}
    </div>
</div>