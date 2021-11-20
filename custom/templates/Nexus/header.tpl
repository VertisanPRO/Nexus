{if "HTML_CLASS"|defined}{assign var="HTMLCLASS" value=" {$smarty.const.HTML_CLASS}"}{/if}
{if "HTML_LANG"|defined}{assign var="HTMLLANG" value=" lang='{$smarty.const.HTML_LANG}'"}{else}{assign var="HTMLLANG"
value=" lang='en'"}{/if}
{if "HTML_RTL"|defined && $smarty.const.HTML_RTL eq true}{assign var="HTMLRTL" value=" dir='rtl'"}{/if}
{if "LANG_CHARSET"|defined}{assign var="METACHARSET" value="{$smarty.const.LANG_CHARSET}"}{else}{assign
var="METACHARSET" value="utf-8"}{/if}
{if isset($PAGE_DESCRIPTION) && $PAGE_DESCRIPTION|count_characters > 0}{assign var="PAGEDESCRIPTION"
value="{$PAGE_DESCRIPTION}"}{else}{assign var="PAGEDESCRIPTION" value=" "}{/if}
{if isset($PAGE_KEYWORDS) && $PAGE_KEYWORDS|count_characters > 0}{assign var="PAGEKEYWORDS"
value="{$PAGE_KEYWORDS}"}{else}{assign var="PAGEKEYWORDS" value=" "}{/if}

<!DOCTYPE html>
<html{$HTMLCLASS}{$HTMLLANG}{$HTMLRTL}>

	<head>

		<link rel="shortcut icon"
			href="{if isset($FAVICON)}{$FAVICON}{else}https://cdn.resourcemc.net/zAsa7/rIBOyeRU58.png/raw{/if}">

		<meta charset="{$METACHARSET}">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

		<title>{$TITLE} • {$smarty.const.SITE_NAME}</title>

		{if isset($FAVICON)}
		<link rel="shortcut icon" href="{$FAVICON}" type="image/x-icon" />
		{/if}

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

		<meta name="author" content="{$TITLE} • {$smarty.const.SITE_NAME}">
		<meta name="description"
			content="{if isset($OPAL_META_HEADING)}{$OPAL_META_DESCRIPTION}{else}We are an online platform to help users around the world connect through NamelessMC powered forums.{/if}">
		<meta name="keywords"
			content="{if isset($OPAL_META_KEYWORDS)}{$OPAL_META_KEYWORDS}{else}Minecraft, Minecraft Sever, Forums, NamelessMC{/if}">

		<meta name="theme-color" content="{if isset($OPAL_META_HEADING)}{$OPAL_META_COLOR}{else}#46d0e6{/if}">
		<meta property="author" content="{$TITLE} &bull; {$smarty.const.SITE_NAME}" />
		<meta property="og:title" content="{if isset($OPAL_META_HEADING)}{$OPAL_META_HEADING}{else}Home{/if}">
		<meta property="og:type" content="website">
		<meta property="og:url" content="{$OG_URL}">
		<meta property="og:image"
			content="{if isset($OPAL_META_IMAGE)}{$OPAL_META_IMAGE}{else}https://i.imgur.com/e6YHD.gif{/if}">
		<meta property="og:description"
			content="{if isset($OPAL_META_HEADING)}{$OPAL_META_DESCRIPTION}{else}We are an online platform to help users around the world connect through NamelessMC powered forums.{/if}">



		<!-- Twitter Card Properties -->
		<meta name="twitter:title" content="{$TITLE} &bull; {$smarty.const.SITE_NAME}" />
		<meta name="twitter:card" content="summary" />
		<meta name="twitter:image" content="{$OG_IMAGE}" />

		{if isset($PAGE_DESCRIPTION) && $PAGE_DESCRIPTION|count_characters > 0}
		<meta name="twitter:description" content="{$PAGE_DESCRIPTION}" />
		{/if}

		{foreach from=$TEMPLATE_CSS item=css}
		{$css}
		{/foreach}

		{if isset($ANALYTICS_ID)}
		{literal}
		<script async src="https://www.googletagmanager.com/gtag/js?id={/literal}{$ANALYTICS_ID}{literal}"></script>
		<script>
			window.dataLayer = window.dataLayer || [];
			function gtag() { dataLayer.push(arguments); }
			gtag('js', new Date());

			gtag('config', '{/literal}{$ANALYTICS_ID}{literal}');
		</script>
		{/literal}
		{/if}
	</head>

	<body{if $DEFAULT_REVAMP_DARK_MODE} class="dark" {/if}
		id="page-{if is_numeric($smarty.const.PAGE)}{$TITLE}{else}{$smarty.const.PAGE}{/if}">