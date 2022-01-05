<!-- Updates Content -->
<div class="card mb-3">
    <h3 class="card-header mb-3 text-center">{$NAVBAR_PAGE}</h3>
    <div class="card-body">
        <form action="" method="POST">
            <input type="hidden" name="sel_btn_session" value="options" />

            <div class="form-group">
                <label for="template_logo">{$LOGO_LABEL}</label>
                <input type="text" class="form-control" id="template_logo" name="template_logo"
                    placeholder="https://example.com/img/logo.png" value="{$TEMPLATE_LOGO}" />
            </div>

            <input type="hidden" name="sel_btn_session" value="navbar" />

            <div class="form-group">
                <label for="nav_fixed">{$NAVIGATION_MENU_LABEL}
                    <span class="badge badge-info">
                        <i class="fas fa-question-circle" data-container="body" data-toggle="popover"
                            data-placement="top" title="" data-content="{$NAVIGATION_MENU_INFO_LABEL}"
                            data-original-title="{$INFO}"></i>
                    </span>
                </label>
                <div class="input-group">
                    <select id="nav_fixed" class="form-control mr-sm-2" name="nav_fixed">
                        <option {if $NAV_FIXED=='1' }selected {/if}value="1">{$NAV_TRUE_LABEL}</option>
                        <option {if $NAV_FIXED=='0' }selected {/if}value="0">{$NAV_FALSE_LABEL}</option>
                    </select>
                </div>
            </div>

            <input type="hidden" name="sel_btn_session" value="navbar" />

            <div class="form-group">
                <label for="nav_style">{$NAVIGATION_STYLE_LABEL}</label>
                <div class="input-group">
                    <select id="nav_style" class="form-control mr-sm-2" name="nav_style">
                        <option {if $NAV_STYLE=='1' }selected {/if}value="1">{$DYNAMIC_LABEL}</option>
                        <option {if $NAV_STYLE=='0' }selected {/if}value="0">{$ELEGANT_LABEL}</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <input type="hidden" name="token" value="{$TOKEN}" />
                <button style="width: 100%; margin-top: 20px;" type="submit" class="btn btn-primary"><i
                        class="fas fa-save"></i> {$SUBMIT}</button>
            </div>
        </form>
    </div>
</div>