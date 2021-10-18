{if $NAV_STYLE != '1'}
	{include file='Nexus/components/navbar/elegant.tpl'}
{else}
	{include file='Nexus/components/navbar/dynamic.tpl'}
{/if}

{if $TEMPLATE_DARKMODE != '1'}

{else}
	{include file='Nexus/components/dm.tpl'}
{/if}
