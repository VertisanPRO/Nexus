<style>

    body.pushable>.pusher {
        background: #222!important;
        color: #FFFF!important;
    }
    .ui.fluid.card {
        background: #303030!important;
        color: #FFFF!important;
    }
    .ui.card>:first-child, .ui.cards>.card>:first-child {
        background: #303030;
        color: #FFFF!important;
    }
    .ui.padded.segment {
        background: #303030!important;
        color: #FFFF!important;
    }
    .ui.attached:not(.message)+.ui.attached.segment:not(.top) {
        background: #303030!important;  
        color: #FFFF!important;
    }
    .ui.segment {
        background: #303030!important; 
        color: #FFFF!important;
    }
    .ui.menu.fluid, .ui.vertical.menu.fluid {
        background: #303030!important;
        color: #FFFF!important;
    }
    
    
    .ui.card>.content p:last-child, .ui.cards>.card>.content p:last-child {
        color: white!important;
    }
    h2.ui.header .sub.header {
        color: white!important;   
    }
    .ui.card>.extra, .ui.cards>.card>.extra {
        color: white!important;
    }
    .ui.list .list>.item:first-child, .ui.list>.item:first-child, ol.ui.list li:first-child, ul.ui.list li:first-child {
        color: white!important;
    }
    .p {
        color: white!important;
    }
    .b {
        color: white!important;
    }
    .a {
        color: white!important;
    }
    .ui.card>.content>.description, .ui.cards>.card>.content>.description {
        color: white!important;
    }
    [id*="widget"] .item .description * {
        color: white!important;
    }
    .ui.card .meta, .ui.cards>.card .meta {
        color: white!important;
    }
    .ui.tabular.menu .item {
        color: #979797!important;
    }
    .ui.mini.menu {
    background: #303030;
    }
    .ui.mini.pagination.menu .item:first-child, .ui.mini.pagination.menu .item:last-child {
    padding-top: .5rem;
    color: white!important;
    }
    .ui.pagination.menu .active.item {
        color: white!important;
    }
    .ui.padded.table td, .ui.padded.table th {
    padding-top: .5rem;
    color: white!important;
    background: #303030;
    }
    h5.ui.header .sub.header {
    font-size: .92857143rem;
    color: white;
    }
    .ui.breadcrumb .icon.divider {
    font-size: .85714286em;
    vertical-align: baseline;
    color: white;
    }
    .ui.action.input:not([class*="left action"])>input {
    border-top-right-radius: 0!important;
    border-bottom-right-radius: 0!important;
    background: #303030!important;
    }
    .ui.list .list>.item .header, .ui.list>.item .header {
        color: white;
    }
    .ui.list .list>.item .description, .ui.list>.item .description {
        color: white;
    }
    .ui.relaxed.list:not(.horizontal)>.item:not(:last-child) {
    color: #666666!important;
    }
    .ui.secondary.menu .ui.popup a:not([href]) {
    color: black!important;
    }
    .ui.list .list>.item>i.icon, .ui.list>.item>i.icon {
        color: white!important;
    }
    .ui.vertical.menu>.active.item:first-child {
    color: white;
    }
    .ui.vertical.menu .item {
        color: {if isset($TEMPLATE_COLOR)}{$TEMPLATE_COLOR}{else}white{/if}!important;
    }
    .ui.form .field>label {
        color: white!important;
    }
    .ui.horizontal.divider {
        color: white;
    }
    .ui.checkbox label, .ui.checkbox+label {
        color: white;
    }
    .ui.card>.content>.header:not(.ui), .ui.cards>.card>.content>.header:not(.ui) {
        color: {if isset($TEMPLATE_COLOR)}{$TEMPLATE_COLOR}{else}white{/if}!important;
    }
    
    
    
    .ui.card, .ui.cards>.card {
        box-shadow: 0 1px 3px 0 {if isset($BORDER_COLOR)}{$BORDER_COLOR}{else}{$TEMPLATE_COLOR}{/if}, 0 0 0 1px {if isset($BORDER_COLOR)}{$BORDER_COLOR}{else}{$TEMPLATE_COLOR}{/if} !important;
    }
    .ui.segment {
        box-shadow: 0 1px 3px 0 {if isset($BORDER_COLOR)}{$BORDER_COLOR}{else}{$TEMPLATE_COLOR}{/if}, 0 0 0 1px {if isset($BORDER_COLOR)}{$BORDER_COLOR}{else}{$TEMPLATE_COLOR}{/if}, 0 0 0 1px {if isset($BORDER_COLOR)}{$BORDER_COLOR}{else}{$TEMPLATE_COLOR}{/if}, 0 0 0 1px {if isset($BORDER_COLOR)}{$BORDER_COLOR}{else}{$TEMPLATE_COLOR}{/if} !important;
    }
</style>