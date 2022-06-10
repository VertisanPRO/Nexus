<!-- Connections Content -->
<div class="card mb-3">
    <h3 class="card-header mb-3 text-center">{$ADDONS_PAGE}</h3>
    <div class="card-body">
        <h3 class="text-center">{$WIDGETBOT_LABEL}</h3>
        <form action="" method="POST">
            <input type="hidden" name="sel_btn_session" value="addons" />
            <div class="form-group">
                <label for="widgetBotView">{$WIDGETBOT_LABEL} <span class="badge badge-info">
                        <i class="fas fa-question-circle" data-container="body" data-toggle="popover"
                            data-placement="top" data-content="{$WIDGETBOTVIEW_INFO_LABEL}"
                            data-original-title="{$INFO}"></i>
                    </span></label>
                <select id="inputWidgetBotView" class="form-control mr-sm-2" name="widgetBotView">
                    <option value="0" {if $WIDGETBOTVIEW eq '0' } selected{/if}>{$DISABLED}</option>
                    <option value="1" {if $WIDGETBOTVIEW eq '1' } selected{/if}>{$ENABLED}</option>
                </select>
            </div>
            {if $WIDGETBOTVIEW eq '1'}
                <div class="form-group">
                    <label for="widgetBotServerID">{$WIDGETBOTSERVERID_LABEL} <span class="badge badge-info">
                            <i class="fas fa-question-circle" data-container="body" data-toggle="popover"
                                data-placement="top" data-content="{$WIDGETBOTSERVERID_INFO_LABEL}"
                                data-original-title="{$INFO}"></i>
                        </span></label>
                    <input type="text" class="form-control" id="inputWidgetBotServerID" name="widgetBotServerID"
                        placeholder="760945720470667294" value="{$WIDGETBOTSERVERID}">
                </div>
                <div class="form-group">
                    <label for="widgetBotChannelID">{$WIDGETBOTCHANNELID_LABEL} <span class="badge badge-info">
                            <i class="fas fa-question-circle" data-container="body" data-toggle="popover"
                                data-placement="top" data-content="{$WIDGETBOTCHANNELID_INFO_LABEL}"
                                data-original-title="{$INFO}"></i>
                        </span></label>
                    <input type="text" class="form-control" id="inputWidgetBotChannelID" name="widgetBotChannelID"
                        placeholder="760945722559299668" value="{$WIDGETBOTCHANNELID}">
                </div>
                <div class="form-group">
                    <label for="widgetBotVerticalLocation">{$WIDGETBOTVERTICALLOCATION_LABEL}</label>
                    <select id="inputWidgetBotVerticalLocation" class="form-control mr-sm-2"
                        name="widgetBotVerticalLocation">
                        <option value="bottom" {if $WIDGETBOTVERTICALLOCATION eq 'bottom' } selected{/if}>
                            {$WIDGETBOTLOCATION_BOTTOM_LABEL}</option>
                        <option value="top" {if $WIDGETBOTVERTICALLOCATION eq 'top' } selected{/if}>
                            {$WIDGETBOTLOCATION_TOP_LABEL}</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="widgetBotHorizontalLocation">{$WIDGETBOTHORIZONTALLOCATION_LABEL}</label>
                    <select id="inputWidgetBotHorizontalLocation" class="form-control mr-sm-2"
                        name="widgetBotHorizontalLocation">
                        <option value="right" {if $WIDGETBOTHORIZONTALLOCATION eq 'right' } selected{/if}>
                            {$WIDGETBOTLOCATION_RIGHT_LABEL}</option>
                        <option value="left" {if $WIDGETBOTHORIZONTALLOCATION eq 'left' } selected{/if}>
                            {$WIDGETBOTLOCATION_LEFT_LABEL}</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="widgetBotColor">{$WIDGETBOTCOLOR_LABEL}</label>
                    <select id="inputWidgetBotColor" class="form-control mr-sm-2" name="widgetBotColor">
                        <option value="0" {if $WIDGETBOTCOLOR eq '0' } selected{/if}>
                            {$WIDGETBOTCOLOR_ORIGINAL_LABEL}</option>
                        <option value="1" {if $WIDGETBOTCOLOR eq '1' } selected{/if}>
                            {$WIDGETBOTCOLOR_NORMAL_LABEL}</option>
                        <option value="2" {if $WIDGETBOTCOLOR eq '2' } selected{/if}>
                            {$WIDGETBOTCOLOR_CUSTOM_LABEL}</option>
                    </select>
                </div>
                {if $WIDGETBOTCOLOR eq '2'}
                    <div class="form-group">
                        <label for="widgetBotCustomColor">{$WIDGETBOTCOLOR_CUSTOM_LABEL}</label>
                        <input type="color" class="form-control" id="inputWidgetBotCustomColor" name="widgetBotCustomColor"
                            value="{$WIDGETBOTCUSTOMCOLOR}">
                    </div>
                {/if}
            {/if}
            <div class="form-group">
                <input type="hidden" name="token" value="{$TOKEN}">
                <button type="submit" class="btn btn-primary w-100"><i class="fas fa-save"></i>
                    {$SUBMIT}</button>
            </div>
        </form>
        <hr />
        <h3 class="text-center">{$ARC_LABEL}</h3>
        <form action="" method="POST">
            <input type="hidden" name="sel_btn_session" value="addons" />
            <div class="form-group">
                <label for="arcView">{$ARC_LABEL} <span class="badge badge-info">
                        <i class="fas fa-question-circle" data-container="body" data-toggle="popover"
                            data-placement="top" data-content="{$ARCVIEW_INFO_LABEL}" data-original-title="{$INFO}"></i>
                    </span></label>
                <select id="inputArcView" class="form-control mr-sm-2" name="arcView">
                    <option value="0" {if $ARCVIEW eq '0' } selected{/if}>{$DISABLED}</option>
                    <option value="1" {if $ARCVIEW eq '1' } selected{/if}>{$ENABLED}</option>
                </select>
            </div>
            {if $ARCVIEW eq '1'}
                <div class="form-group">
                    <label for="arcURL">{$ARCURL_LABEL}</label>
                    <input type="text" class="form-control" id="inputArcURL" name="arcURL"
                        placeholder="https://arc.io/widget.min.js#9YB4rHQn" value="{$ARCURL}">
                </div>
            {/if}
            <div class="form-group">
                <input type="hidden" name="token" value="{$TOKEN}">
                <button type="submit" class="btn btn-primary w-100"><i class="fas fa-save"></i>
                    {$SUBMIT}</button>
            </div>
        </form>
    </div>
</div>