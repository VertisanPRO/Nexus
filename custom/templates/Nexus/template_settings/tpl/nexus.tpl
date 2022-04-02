<!-- Page Content  -->
<div class="row">
  <div class="col-sm-3">
    {include file="{$TPL_PATH}sittings-menu.tpl"}
  </div>
  <div class="col-sm-9">
    <div class="tab-content" id="v-pills-tabContent">
      <div class="tab-pane fade {if !isset($TPL_NAME_SESSION) or $TPL_NAME_SESSION == 'options'}show active{/if}"
        id="v-pills-options" role="tabpanel" aria-labelledby="v-pills-options-tab">
        {include file="{$TPL_PATH}options.tpl"}
      </div>
      <div class="tab-pane fade {if $TPL_NAME_SESSION == 'colors'}show active{/if}" id="v-pills-colors" role="tabpanel"
        aria-labelledby="v-pills-colors-tab">
        {include file="{$TPL_PATH}colors.tpl"}
      </div>
      <div class="tab-pane fade {if $TPL_NAME_SESSION == 'navbar'}show active{/if}" id="v-pills-navbar" role="tabpanel"
        aria-labelledby="v-pills-navbar-tab">
        {include file="{$TPL_PATH}navbar.tpl"}
      </div>
      <div class="tab-pane fade {if $TPL_NAME_SESSION == 'arc'}show active{/if}" id="v-pills-arc" role="tabpanel"
        aria-labelledby="v-pills-arc-tab">
        {include file="{$TPL_PATH}arc.tpl"}
      </div>
      <div class="tab-pane fade {if $TPL_NAME_SESSION == 'widgets'}show active{/if}" id="v-pills-widgets"
        role="tabpanel" aria-labelledby="v-pills-widgets-tab">
        {include file="{$TPL_PATH}widgets.tpl"}
      </div>
      <div class="tab-pane fade {if $TPL_NAME_SESSION == 'embed'}show active{/if}" id="v-pills-embed" role="tabpanel"
        aria-labelledby="v-pills-embed-tab">
        {include file="{$TPL_PATH}embed.tpl"}
      </div>
      <div class="tab-pane fade {if $TPL_NAME_SESSION == 'connections'}show active{/if}" id="v-pills-connections"
        role="tabpanel" aria-labelledby="v-pills-connections-tab">
        {include file="{$TPL_PATH}connections.tpl"}
      </div>
      <div class="tab-pane fade {if $TPL_NAME_SESSION == 'update'}show active{/if}" id="v-pills-update" role="tabpanel"
        aria-labelledby="v-pills-update-tab">
        {include file="{$TPL_PATH}update.tpl"}
      </div>
    </div>
  </div>
</div>