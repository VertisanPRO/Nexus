<style>
    .ui.ribbon.label {
        background: {$PRIMARYCOLOR} !important;
        border-color: {$PRIMARYCOLOR} !important;
        color: #fff;
    }

    .ui.ribbon.label:hover {
        background: {$PRIMARYCOLOR} !important;
        border-color: {$PRIMARYCOLOR} !important;
        color: #fff;
    }

    .ui.small.default.icon.button {
        background-color: {$PRIMARYCOLOR} !important;
        color: #fff;
        text-shadow: none;
        background-image: none;
    }

    .label {
        background-color: {$PRIMARYCOLOR} !important;
        color: #fff !important;
    }

    .ui.small.primary.icon.button {
        background-color: #2185d0;
    }

    .ui.primary.button,
    .ui.primary.buttons,
    .button,
    .ui.primary.icon.button {
        background-color: {$PRIMARYCOLOR};
        color: #fff;
        text-shadow: none;
        background-image: none;
    }

    a {
        color: {$PRIMARYCOLOR};
    }

    .ui.header {
        border: none;
        margin: calc(2rem - .14285714em) 0 1rem;
        padding: 0 0;
        font-family: Lato, 'Helvetica Neue', Arial, Helvetica, sans-serif;
        font-weight: 700;
        line-height: 1.28571429em;
        text-transform: none;
        color: {$PRIMARYCOLOR} !important;
    }

    {if $OUTLINECOLOR != '#000000'}
        .ui.segment:not(.ui.inverted.segment) {
            box-shadow: 0 1px 3px 0 {$OUTLINECOLOR}, 0 0 0 1px {$OUTLINECOLOR}, 0 0 0 1px {$OUTLINECOLOR}, 0 0 0 1px {$OUTLINECOLOR} !important;
        }

        .ui.card,
        .ui.cards>.card {
            box-shadow: 0 1px 3px 0 {$OUTLINECOLOR}, 0 0 0 1px {$OUTLINECOLOR} !important;
        }

    {/if}

    #navbar {
        background: {if $NAVBARCOLOR eq '#000000'}{$PRIMARYCOLOR}{else}{$NAVBARCOLOR}{/if};
    }

    #footer {
        background: {if $FOOTERCOLOR eq '#000000'}{$PRIMARYCOLOR}{else}{$FOOTERCOLOR}{/if};
    }

    {if $NAVBARTEXTCOLOR != '0'}
        .navbar-item {
            color: {if $NAVBARTEXTCOLOR eq '1'}black{else}white{/if} !important;
        }

    {/if}
/*
 * 	[ GHOST MODULE ]
 */

 .post-card-large,
 .post-card-medium,
 .post-card-small,
 .cf-full-post {
     background: {if $DARKMODE eq '1'}{if $NEXUS_DARK_MODE}rgba(255, 255, 255, 0.03){else}white{/if}{else}{if $NEXUS_DARK_MODE}rgba(255, 255, 255, 0.03){else}white{/if}{/if} !important;
 }

 .ghost-readtime,
 .readtime {
     color: {if $DARKMODE eq '1'}{if $NEXUS_DARK_MODE}white{else}#303030{/if}{else}{if $NEXUS_DARK_MODE}white{else}#303030{/if}{/if} !important;
     background-color: {if $DARKMODE eq '1'}{if $NEXUS_DARK_MODE}rgba(255, 255, 255, 0.03){else}rgba(247, 247, 247, 1){/if}{else}{if $NEXUS_DARK_MODE}rgba(255, 255, 255, 0.03){else}rgba(247, 247, 247, 1){/if}{/if} !important;
 }
 .ghost-card-content {
     color: {if $DARKMODE eq '1'}{if $NEXUS_DARK_MODE}white{else}#303030{/if}{else}{if $NEXUS_DARK_MODE}white{else}#303030{/if}{/if} !important;
 }

 .cf-full-post-title {
     color: {$PRIMARYCOLOR};
 }
 .cf-more-posts,
 .cf-full-post-content {
     color: {if $DARKMODE eq '1'}{if $NEXUS_DARK_MODE}white{else}#303030{/if}{else}{if $NEXUS_DARK_MODE}white{else}#303030{/if}{/if} !important;
 }
</style>