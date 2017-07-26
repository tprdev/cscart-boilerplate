<!DOCTYPE html>
<html {hook name="index:html_tag"}{/hook} lang="{$smarty.const.CART_LANGUAGE}" dir="{$language_direction}">
<head>
{capture name="page_title"}
    {hook name="index:title"}
    {if $page_title}
        {$page_title}
    {else}
        {foreach from=$breadcrumbs item=i name="bkt"}
            {if !$smarty.foreach.bkt.first}{$i.title|strip_tags}{if !$smarty.foreach.bkt.last} :: {/if}{/if}
        {/foreach}
        {if !$skip_page_title && $location_data.title}{if $breadcrumbs|count > 1} - {/if}{$location_data.title}{/if}
    {/if}
    {/hook}
{/capture}
<title>{$smarty.capture.page_title|strip|trim nofilter}</title>
{include file="meta.tpl"}
<link href="{$logos.favicon.image.image_path|fn_query_remove:'t'}" rel="shortcut icon" type="{$logos.favicon.image.absolute_path|fn_get_mime_content_type}" />

{include file="common/styles.tpl"}

{if "DEVELOPMENT"|defined && $smarty.const.DEVELOPMENT == true}
<script type="text/javascript" data-no-defer>
window.onerror = function(errorMessage) {
    document.write('<div data-ca-debug="1" style="border: 2px solid red; margin: 2px;">' + errorMessage + '</div>');
};
</script>
{/if}
<!--[if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/es5-shim/4.1.9/es5-shim.min.js"></script><![endif]-->
{hook name="index:head_scripts"}{/hook}

	<link rel="stylesheet" href="/design/themes/bfa/css/bfa.min.css">

</head>

<body class="dispatch-{$runtime.controller}-{$runtime.mode}{if $runtime.action}-{$runtime.action}{/if}">
    {hook name="index:body"}
        {if $runtime.customization_mode.live_editor}
            {include file="common/toolbar.tpl" title=__("on_site_live_editing") href="customization.disable_mode?type=live_editor"}
            <div class="live-editor-wrapp"></div>
        {/if}

        <div class="page" id="tygh_container">

        <div id="ajax_overlay" class="ajax-overlay"></div>
        <div id="ajax_loading_box" class="ajax-loading-box"></div>

        {include file="common/notification.tpl"}

        <main class="page-container" role="main" id="tygh_main_container">
            {hook name="index:content"}
                {render_location}
            {/hook}
        <!--tygh_main_container--></main>

        {hook name="index:footer"}{/hook}
        <!--tygh_container--></div>

        {include file="common/scripts.tpl"}

        {if $runtime.customization_mode.design}
            {include file="backend:common/template_editor.tpl"}
        {/if}
        {if $runtime.customization_mode.theme_editor}
            {include file="backend:common/theme_editor.tpl"}
        {/if}
    {/hook}
</body>

</html>
