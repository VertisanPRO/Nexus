<!-- Preloader Content -->
<div class="card mb-3">
    <h3 class="card-header mb-3 text-center">{$PRELOADER_PAGE}</h3>
    <div class="card-body">
        <form action="" method="POST">
            <input type="hidden" name="sel_btn_session" value="preloader" />
            <div class="form-group">
                <label for="preloaderView">{$PRELOADERVIEW_LABEL} <span class="badge badge-info">
                        <i class="fas fa-question-circle" data-container="body" data-toggle="popover"
                            data-placement="top" data-content="{$PRELOADERVIEW_INFO_LABEL}"
                            data-original-title="{$INFO}"></i>
                    </span></label>
                <select id="inputPreloaderView" class="form-control mr-sm-2" name="preloaderView">
                    <option value="0" {if $PRELOADERVIEW=='0' } selected{/if}>{$DISABLED}</option>
                    <option value="1" {if $PRELOADERVIEW=='1' } selected{/if}>{$ENABLED}</option>
                </select>
            </div>
            {if $PRELOADERVIEW eq '1'}
            <div class="form-group">
                <label for="preloaderText">{$PRELOADERTEXT_LABEL}</label>
                <input type="text" class="form-control" id="inputPreloaderText" name="preloaderText"
                    placeholder="{$PRELOADERLOADING_LABEL}" value="{$PRELOADERTEXT}">
            </div>
            <div class="form-group">
                <label for="preloaderColor">{$PRELOADERCOLOR_LABEL}</label>
                <select id="inputPreloaderColor" class="form-control mr-sm-2" name="preloaderColor">
                    <option value="red" {if $PRELOADERCOLOR=='red' } selected{/if}>{$PRELOADER_RED}</option>
                    <option value="orange" {if $PRELOADERCOLOR=='orange' } selected{/if}>{$PRELOADER_ORANGE}</option>
                    <option value="yellow" {if $PRELOADERCOLOR=='yellow' } selected{/if}>{$PRELOADER_YELLOW}</option>
                    <option value="olive" {if $PRELOADERCOLOR=='olive' } selected{/if}>{$PRELOADER_OLIVE}</option>
                    <option value="green" {if $PRELOADERCOLOR=='green' } selected{/if}>{$PRELOADER_GREEN}</option>
                    <option value="teal" {if $PRELOADERCOLOR=='teal' } selected{/if}>{$PRELOADER_TEAL}</option>
                    <option value="blue" {if $PRELOADERCOLOR=='blue' } selected{/if}>{$PRELOADER_BLUE}</option>
                    <option value="violet" {if $PRELOADERCOLOR=='violet' } selected{/if}>{$PRELOADER_VIOLET}</option>
                    <option value="purple" {if $PRELOADERCOLOR=='purple' } selected{/if}>{$PRELOADER_PURPLE}</option>
                    <option value="pink" {if $PRELOADERCOLOR=='pink' } selected{/if}>{$PRELOADER_PINK}</option>
                    <option value="brown" {if $PRELOADERCOLOR=='brown' } selected{/if}>{$PRELOADER_BROWN}</option>
                    <option value="grey" {if $PRELOADERCOLOR=='grey' } selected{/if}>{$PRELOADER_GRAY}</option>
                    <option value="black" {if $PRELOADERCOLOR=='black' } selected{/if}>{$PRELOADER_BLACK}</option>
                </select>
            </div>
            <div class="form-group">
                <label for="preloaderSpeed">{$PRELOADERSPEED_LABEL}</label>
                <select id="inputPreloaderSpeed" class="form-control mr-sm-2" name="preloaderSpeed">
                    <option value="slow" {if $PRELOADERSPEED=='slow' } selected{/if}>{$PRELOADER_SLOW}</option>
                    <option value="normal" {if $PRELOADERSPEED=='normal' } selected{/if}>{$PRELOADER_NORMAL}</option>
                    <option value="fast" {if $PRELOADERSPEED=='fast' } selected{/if}>{$PRELOADER_FAST}</option>
                </select>
            </div>
            <div class="form-group">
                <label for="preloaderStyle">{$PRELOADERSTYLE_LABEL}</label>
                <select id="inputPreloaderStyle" class="form-control mr-sm-2" name="preloaderStyle">
                    <option value="normal" {if $PRELOADERSTYLE=='normal' } selected{/if}>{$PRELOADER_NORMAL}</option>
                    <option value="double" {if $PRELOADERSTYLE=='double' } selected{/if}>{$PRELOADER_DOUBLE}</option>
                    <option value="elastic" {if $PRELOADERSTYLE=='elastic' } selected{/if}>{$PRELOADER_ELASTIC}</option>
                </select>
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