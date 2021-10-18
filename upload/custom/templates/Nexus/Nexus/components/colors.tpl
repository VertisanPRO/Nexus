<style>
	.ui.stackable.three.column.grid {
		background: linear-gradient(90deg, rgb(41, 117, 286) 0%, rgb(2, 117, 216) 100%);
		background-size: cover;
		background-position: center;
		background-repeat: no-repeat;
		margin-bottom: 0px;
		border-radius: 0;
		color: #fff;
	}

	.ui.image img,
	.ui.image svg {
		max-width: 100%;
		height: auto;
	}

	.ui.secondary.menu {
		background: #7e31e3;
		padding: 0px;
		margin: 0;
	}

	.p {
		font-family: 'Kanit', sans-serif;
	}

	body.pushable>.pusher {
		background: {if isset($BACKGROUND_COLOR)}{$BACKGROUND_COLOR}{else}white{/if};
	}

	.ui.fluid.card {
		width: 100%;
		max-width: 9999px;
		background: {if isset($CONTENT_COLOR)}{$CONTENT_COLOR}{else}white{/if};
	}

	.ui.segment:last-child {
		margin-bottom: 0;
		background: {if isset($CONTENT_COLOR)}{$CONTENT_COLOR}{else}white{/if};
	}

	.ui.padded.segment {
		padding: 1.5em;
		background: {if isset($CONTENT_COLOR)}{$CONTENT_COLOR}{else}white{/if};
	}

	.fa,
	.fas {
		font-weight: 900;
		margin-right: 4px;
	}

	.ui.primary.button,
	.ui.primary.buttons .button {
		background-color: {if isset($TEMPLATE_COLOR)} {$TEMPLATE_COLOR}{else} #7e31e3{/if};
		color: #fff;
		text-shadow: none;
		background-image: none;
	}

	a {
		color: {if isset($TEMPLATE_COLOR)} {$TEMPLATE_COLOR}{else} #7e31e3{/if};
		text-decoration: none;
	}
.ui.violet.label, .ui.violet.labels .label {
    background-color: {if isset($TEMPLATE_COLOR)} {$TEMPLATE_COLOR}{else} #7e31e3{/if}!important;
    border-color: #2185d0!important;
    color: #fff!important;
}
.ui.violet.ribbon.label {
    border-color: {if isset($TEMPLATE_COLOR)} {$TEMPLATE_COLOR}{else} #7e31e3{/if}!important;
}
.ui.header {
    border: none;
    margin: calc(2rem - .14285714em) 0 1rem;
    padding: 0 0;
    font-family: Lato,'Helvetica Neue',Arial,Helvetica,sans-serif;
    font-weight: 700;
    line-height: 1.28571429em;
    text-transform: none;
    color: {if isset($TEMPLATE_COLOR)} {$TEMPLATE_COLOR}{else} #7e31e3{/if}!important;
}
    .ui.card, .ui.cards>.card {
        box-shadow: 0 1px 3px 0 {if isset($BORDER_COLOR)}{$BORDER_COLOR}{else}{$TEMPLATE_COLOR}{/if}, 0 0 0 1px {if isset($BORDER_COLOR)}{$BORDER_COLOR}{else}{$TEMPLATE_COLOR}{/if} !important;
    }
    .ui.segment {
        box-shadow: 0 1px 3px 0 {if isset($BORDER_COLOR)}{$BORDER_COLOR}{else}{$TEMPLATE_COLOR}{/if}, 0 0 0 1px {if isset($BORDER_COLOR)}{$BORDER_COLOR}{else}{$TEMPLATE_COLOR}{/if}, 0 0 0 1px {if isset($BORDER_COLOR)}{$BORDER_COLOR}{else}{$TEMPLATE_COLOR}{/if}, 0 0 0 1px {if isset($BORDER_COLOR)}{$BORDER_COLOR}{else}{$TEMPLATE_COLOR}{/if} !important;
    }
</style>