{if "HTML_CLASS"|defined}{assign var="HTMLCLASS" value=" {$smarty.const.HTML_CLASS}"}{else}{assign var="HTMLCLASS"
value=""}{/if}
{if "HTML_LANG"|defined}{assign var="HTMLLANG" value=" lang='{$smarty.const.HTML_LANG}'"}{else}{assign var="HTMLLANG"
value=" lang='en'"}{/if}
{if "HTML_RTL"|defined && $smarty.const.HTML_RTL eq true}{assign var="HTMLRTL" value=" dir='rtl'"}{else}{assign
var="HTMLRTL" value=" dir='ltr'"}{/if}
{if "LANG_CHARSET"|defined}{assign var="METACHARSET" value="{$smarty.const.LANG_CHARSET}"}{else}{assign
var="METACHARSET" value="utf-8"}{/if}
{if isset($PAGE_DESCRIPTION) && $PAGE_DESCRIPTION|count_characters > 0}{assign var="PAGEDESCRIPTION"
value="{$PAGE_DESCRIPTION}"}{else}{assign var="PAGEDESCRIPTION" value=" "}{/if}
{if isset($PAGE_KEYWORDS) && $PAGE_KEYWORDS|count_characters > 0}{assign var="PAGEKEYWORDS"
value="{$PAGE_KEYWORDS}"}{else}{assign var="PAGEKEYWORDS" value=" "}{/if}

<!DOCTYPE html>
<html{$HTMLCLASS}{$HTMLLANG}{$HTMLRTL}>
    <!-- Nexus 1.7.2 by VertisanPRO | https://github.com/VertisanPRO/nexus -->
    <head>
        <meta charset="{$METACHARSET}">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        {if $EMBEDTITLE eq '$every'}
            <title>{$TITLE} &bull; {$smarty.const.SITE_NAME}</title>
        {else}
            <title>{$EMBEDTITLE}</title>
        {/if}

        {if isset($FAVICON)}
            <link rel="shortcut icon" href="{$FAVICON}" type="image/x-icon" />
        {/if}

        {if $EMBEDTITLE eq '$every'}
            <meta name="author" content="{$TITLE} &bull; {$smarty.const.SITE_NAME}" />
        {else}
            <meta name="author" content="{$EMBEDTITLE}" />
        {/if}
        <meta name='description' content='{$EMBEDTEXT}' />
        <meta name='keywords' content='{$EMBEDKEYWORDS}' />

        {if $EMBEDTITLE eq '$every'}
            <meta property="og:title" content="{$TITLE} &bull; {$smarty.const.SITE_NAME}" />
        {else}
            <meta property="og:title" content="{$EMBEDTITLE}" />
        {/if}
        <meta property="og:type" content="website" />
        <meta property="og:url" content="{$OG_URL}" />
        <meta property="og:image" content="{$EMBEDICON}" />
        <meta property='og:description' content='{$EMBEDTEXT}' />
        <meta name="theme-color" content="{$EMBEDCOLOR}">
        <meta content="{$EMBEDCOLOR}" data-react-helmet="true" name="theme-color" />

        <!-- Twitter Card Properties -->
        {if $EMBEDTITLE eq '$every'}
            <meta name="twitter:title" content="{$TITLE} &bull; {$smarty.const.SITE_NAME}" />
        {else}
            <meta name="twitter:title" content="{$EMBEDTITLE}" />
        {/if}
        <meta name="twitter:card" content="summary" />
        <meta name="twitter:image" content="{$OG_IMAGE}" />

        {if isset($PAGE_DESCRIPTION) && $PAGE_DESCRIPTION|count_characters > 0}
            <meta name="twitter:description" content="{$PAGE_DESCRIPTION}" />
        {/if}

        {foreach from=$TEMPLATE_CSS item=css}
            {$css}
        {/foreach}

        {if $CUSTOMCSS != ''}
            <style>
                {$CUSTOMCSS}
            </style>
        {/if}

        {if $COLORSSTYLE eq '1'}
            {include file='Nexus/colors.tpl'}
        {/if}

        {if $NAVBARSTYLE eq '2'}
            {include file='Nexus/modern.tpl'}
        {/if}

        {include file='Nexus/scrollbar.tpl'}

        {if isset($ANALYTICS_ID)}
            {literal}
                <script async src="https://www.googletagmanager.com/gtag/js?id={/literal}{$ANALYTICS_ID}{literal}"></script>
                <script type="text/javascript">
                    window.dataLayer = window.dataLayer || [];

                    function gtag() { dataLayer.push(arguments); }
                    gtag('js', new Date());

                    gtag('config', '{/literal}{$ANALYTICS_ID}{literal}');
                </script>
            {/literal}
        {/if}

        {if isset($DEBUGBAR_JS)}
            {$DEBUGBAR_JS}
        {/if}

        {if $ARCVIEW eq '1'}
            <script async src="{$ARCURL}"></script>
        {/if}
    </head>

    {* Don't do ```<body{if $NEXUS_DARK_MODE} class="dark" {/if} 
    id="page-{if is_numeric($smarty.const.PAGE)}{$TITLE}{else}{$smarty.const.PAGE}{/if}">``` as it will ruin fomantic *}
    <body{if $NEXUS_DARK_MODE} class="dark" {/if} id="page-{if is_numeric($smarty.const.PAGE)}{$TITLE}{else}{$smarty.const.PAGE}{/if}">