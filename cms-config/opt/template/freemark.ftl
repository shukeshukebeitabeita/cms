<#ftl strip_whitespace=true>

<#macro contextPath>rc.contextPath</#macro>

<#macro ckeywords >
<#if c.meta_keywords?exists>
<meta name="keywords" content="${c.meta_keywords!''}" />
<#else>
<meta name="keywords" content="${c.tag!''}" />
</#if>
</#macro>
<#macro cdescription>
<#if c.meta_description?exists>
<meta name="description" content="${c.meta_description!''}" />
<#else>
<meta name="description" content="${c.title!''}" />
</#if>
</#macro>
<#macro ctitle>
<#if c.meta_title?exists>
<title>${c.meta_title!''}</title>
<#else>
<title>${c.title!''}</title>
</#if>
</#macro>
<#macro cmeta>
<@ctitle />
<@ckeywords />
<@cdescription />
</#macro>