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

    body.dark .fluid.ui.small.primary.button,
    .header:not(.ui.message.icon.announcement .content .header):not(.ui.fluid.card .content .ui .dividing.header),
    .cf-home-title,
    .left.aligned.twelve.wide.column.cf-full-post-title {
        color: {$PRIMARYCOLOR} !important;
    }
</style>