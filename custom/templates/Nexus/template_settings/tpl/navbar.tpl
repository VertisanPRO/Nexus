<!-- Navbar Content -->
<div class="card mb-3">
    <h3 class="card-header mb-3 text-center">{$NAVBAR_PAGE}</h3>
    <div class="card-body">
        <form action="" method="POST">
            <input type="hidden" name="sel_btn_session" value="navbar" />
            <div class="form-group">
                <label for="navbarLogo">{$NAVBARLOGO_LABEL} <span class="badge badge-info">
                        <i class="fas fa-question-circle" data-container="body" data-toggle="popover"
                            data-placement="top" data-content="{$NAVBARLOGO_INFO_LABEL}"
                            data-original-title="{$INFO}"></i>
                    </span></label>
                <input type="text" class="form-control" id="inputNavbarLogo" name="navbarLogo"
                    placeholder="https://example.com/img/logo.png" value="{$NAVBARLOGO}">
            </div>
            <div class="form-group">
                <label for="navbarExclude">{$NAVBAREXCLUDE_LABEL} <span class="badge badge-info">
                        <i class="fas fa-question-circle" data-container="body" data-toggle="popover"
                            data-placement="top" data-content="{$NAVBAREXCLUDE_INFO_LABEL}"
                            data-original-title="{$INFO}"></i>
                    </span></label>
                <input type="text" class="form-control" id="inputNavbarExclude" name="navbarExclude"
                    placeholder="page1/page2" value="{$NAVBAREXCLUDE}">
            </div>
            {if $NAVBARSTYLE != '2'}
                <div class="form-group">
                    <label for="navbarSticky">{$NAVBARSTICKY_LABEL}</label>
                    <select id="inputNavbarSticky" class="form-control mr-sm-2" name="navbarSticky">
                        <option value="0" {if $NAVBARSTICKY eq '0' } selected{/if}>{$DISABLED}</option>
                        <option value="1" {if $NAVBARSTICKY eq '1' } selected{/if}>{$ENABLED}</option>
                    </select>
                </div>
            {/if}
            <div class="form-group">
                <label for="navbarStyle">{$NAVBARSTYLE_LABEL} <span class="badge badge-info">
                        <i class="fas fa-question-circle" data-container="body" data-toggle="popover"
                            data-placement="top" data-content="{$NAVBARSTYLE_INFO_LABEL}"
                            data-original-title="{$INFO}"></i>
                    </span></label>
                <select id="inputNavbarStyle" class="form-control mr-sm-2" name="navbarStyle">
                    <option value="0" {if $NAVBARSTYLE eq '0' } selected{/if}>{$NAVBARELEGANT_LABEL}</option>
                    <option value="1" {if $NAVBARSTYLE eq '1' } selected{/if}>{$NAVBARDYNAMIC_LABEL}</option>
                    <option value="2" {if $NAVBARSTYLE eq '2' } selected{/if}>{$NAVBARMODERN_LABEL}</option>
                </select>
            </div>
            <div class="form-group">
                <input type="hidden" name="token" value="{$TOKEN}">
                <button type="submit" class="btn btn-primary w-100"><i class="fas fa-save"></i>
                    {$SUBMIT}</button>
            </div>
        </form>
    </div>
</div>