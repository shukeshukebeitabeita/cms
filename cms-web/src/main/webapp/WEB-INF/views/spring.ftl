<#ftl strip_whitespace=true>
<#--
 * spring.ftl
 *
 * This file consists of a collection of FreeMarker macros aimed at easing
 * some of the common requirements of web applications - in particular
 * handling of forms.
 *
 * Spring's FreeMarker support will automatically make this file and therefore
 * all macros within it available to any application using Spring's
 * FreeMarkerConfigurer.
 * 
 * To take advantage of these macros, the "exposeSpringMacroHelpers" property
 * of the FreeMarker class needs to be set to "true". This will expose a
 * RequestContext under the name "springMacroRequestContext", as needed by
 * the macros in this library.
 *
 * @author Darren Davison
 * @author Juergen Hoeller
 * @since 1.1
 -->

<#--
 * message
 *
 * Macro to translate a message code into a message.
 -->
<#macro message code>${springMacroRequestContext.getMessage(code)}</#macro>

<#--
 * messageText
 *
 * Macro to translate a message code into a message,
 * using the given default text if no message found.
 -->
<#macro messageText code, text>${springMacroRequestContext.getMessage(code, text)}</#macro>

<#--
 * url
 *
 * Takes a relative URL and makes it absolute from the server root by
 * adding the context root for the web application.
 -->
<#macro url relativeUrl>${springMacroRequestContext.getContextPath()}${relativeUrl}</#macro>

<#--
 * bind
 *
 * Exposes a BindStatus object for the given bind path, which can be
 * a bean (e.g. "person") to get global errors, or a bean property
 * (e.g. "person.name") to get field errors. Can be called multiple times
 * within a form to bind to multiple command objects and/or field names.
 *
 * This macro will participate in the default HTML escape setting for the given
 * RequestContext. This can be customized by calling "setDefaultHtmlEscape"
 * on the "springMacroRequestContext" context variable, or via the
 * "defaultHtmlEscape" context-param in web.xml (same as for the JSP bind tag).
 * Also regards a "htmlEscape" variable in the namespace of this library.
 *
 * Producing no output, the following context variable will be available
 * each time this macro is referenced (assuming you import this library in
 * your templates with the namespace 'spring'):
 *
 *   spring.status : a BindStatus instance holding the command object name,
 *   expression, value, and error messages and codes for the path supplied
 *
 * @param path : the path (string value) of the value required to bind to.
 *   Spring defaults to a command name of "command" but this can be overridden
 *   by user config.
 -->
<#macro bind path>
    <#if htmlEscape?exists>
        <#assign status = springMacroRequestContext.getBindStatus(path, htmlEscape)>
    <#else>
        <#assign status = springMacroRequestContext.getBindStatus(path)>
    </#if>
    <#-- assign a temporary value, forcing a string representation for any
    kind of variable.  This temp value is only used in this macro lib -->
    <#if status.value?exists && status.value?is_boolean>
        <#assign stringStatusValue=status.value?string>
    <#else>
        <#assign stringStatusValue=status.value?default("")>
    </#if>
</#macro>

<#--
 * bindEscaped
 *
 * Similar to spring:bind, but takes an explicit HTML escape flag rather
 * than relying on the default HTML escape setting.
 -->
<#macro bindEscaped path, htmlEscape>
    <#assign status = springMacroRequestContext.getBindStatus(path, htmlEscape)>
    <#-- assign a temporary value, forcing a string representation for any
    kind of variable.  This temp value is only used in this macro lib -->
    <#if status.value?exists && status.value?is_boolean>
        <#assign stringStatusValue=status.value?string>
    <#else>
        <#assign stringStatusValue=status.value?default("")>
    </#if>
</#macro>

<#--
 * formInput
 *
 * Display a form input field of type 'text' and bind it to an attribute
 * of a command or bean.
 *
 * @param path the name of the field to bind to
 * @param attributes any additional attributes for the element (such as class
 *    or CSS styles or size
 -->
<#macro formInput path attributes="" fieldType="text" >
    <@bind path/>
    <input type="${fieldType}" id="${status.expression}" name="${status.expression}" value="<#if fieldType!="password">${stringStatusValue}</#if>" ${attributes}
    <@closeTag/>
</#macro>

<#--
 * formPasswordInput
 *
 * Display a form input field of type 'password' and bind it to an attribute
 * of a command or bean.  No value will ever be displayed.  This functionality
 * can also be obtained by calling the formInput macro with a 'type' parameter
 * of 'password'
 *
 * @param path the name of the field to bind to
 * @param attributes any additional attributes for the element (such as class
 *    or CSS styles or size
 -->
<#macro formPasswordInput path attributes="" >
    <@formInput path, attributes, "password"/>
</#macro>

<#--
 * formHiddenInput
 *
 * Generate a form input field of type 'hidden' and bind it to an attribute
 * of a command or bean.  This functionality can also be obtained by calling
 * the formInput macro with a 'type' parameter of 'hidden'
 *
 * @param path the name of the field to bind to
 * @param attributes any additional attributes for the element (such as class
 *    or CSS styles or size
 -->
<#macro formHiddenInput path attributes="" >
    <@formInput path, attributes, "hidden"/>
</#macro>

<#--
 * formTextarea
 *
 * Display a text area and bind it to an attribute of a command or bean.
 *
 * @param path the name of the field to bind to
 * @param attributes any additional attributes for the element (such as class
 *    or CSS styles or size
 -->
<#macro formTextarea path attributes="" >
    <@bind path/>
    <textarea id="${status.expression}" name="${status.expression}" ${attributes}>${stringStatusValue?html}</textarea>
</#macro>

<#--
 * formSingleSelect
 *
 * Show a selectbox (dropdown) input element allowing a single value to be chosen
 * from a list of options.
 *
 * @param path the name of the field to bind to
 * @param options a map (value=label) of all the available options
 * @param attributes any additional attributes for the element (such as class
 *    or CSS styles or size
-->
<#macro formSingleSelect path options attributes="">
    <@bind path/>
    <select id="${status.expression}" name="${status.expression}" ${attributes}>
        <#list options?keys as value>
        <option value="${value?html}"<@checkSelected value/>>${options[value]?html}</option>
        </#list>
    </select>
</#macro>

<#--
 * formMultiSelect
 *
 * Show a listbox of options allowing the user to make 0 or more choices from
 * the list of options.
 *
 * @param path the name of the field to bind to
 * @param options a map (value=label) of all the available options
 * @param attributes any additional attributes for the element (such as class
 *    or CSS styles or size
-->
<#macro formMultiSelect path options attributes="">
    <@bind path/>
    <select multiple="multiple" id="${status.expression}" name="${status.expression}" ${attributes}>
        <#list options?keys as value>
        <#assign isSelected = contains(status.value?default([""]), value)>
        <option value="${value?html}" <#if isSelected>selected="selected"</#if>>${options[value]?html}</option>
        </#list>
    </select>
</#macro>

<#--
 * formRadioButtons
 *
 * Show radio buttons.
 *
 * @param path the name of the field to bind to
 * @param options a map (value=label) of all the available options
 * @param separator the html tag or other character list that should be used to
 *    separate each option.  Typically '&nbsp;' or '<br>'
 * @param attributes any additional attributes for the element (such as class
 *    or CSS styles or size
-->
<#macro formRadioButtons path options separator attributes="">
    <@bind path/>
    <#list options?keys as value>
    <#assign id="${status.expression}${value_index}">
    <input type="radio" id="${id}" name="${status.expression}" value="${value?html}"
        <#if stringStatusValue == value>checked="checked"</#if> ${attributes}
    <@closeTag/>
    <label for="${id}">${options[value]?html}</label>${separator}
    </#list>
</#macro>

<#--
 * formCheckboxes
 *
 * Show checkboxes.
 *
 * @param path the name of the field to bind to
 * @param options a map (value=label) of all the available options
 * @param separator the html tag or other character list that should be used to
 *    separate each option.  Typically '&nbsp;' or '<br>'
 * @param attributes any additional attributes for the element (such as class
 *    or CSS styles or size
-->
<#macro formCheckboxes path options separator attributes="">
    <@bind path/>
    <#list options?keys as value>
    <#assign id="${status.expression}${value_index}">
    <#assign isSelected = contains(status.value?default([""]), value)>
    <input type="checkbox" id="${id}" name="${status.expression}" value="${value?html}"
        <#if isSelected>checked="checked"</#if> ${attributes}
    <@closeTag/>
    <label for="${id}">${options[value]?html}</label>${separator}
    </#list>
</#macro>

<#--
 * showErrors
 *
 * Show validation errors for the currently bound field, with
 * optional style attributes.
 *
 * @param separator the html tag or other character list that should be used to
 *    separate each option. Typically '<br>'.
 * @param classOrStyle either the name of a CSS class element (which is defined in
 *    the template or an external CSS file) or an inline style.  If the value passed in here
 *    contains a colon (:) then a 'style=' attribute will be used, else a 'class=' attribute
 *    will be used.
-->
<#macro showErrors separator classOrStyle="">
    <#list status.errorMessages as error>
    <#if classOrStyle == "">
        <b>${error}</b>
    <#else>
        <#if classOrStyle?index_of(":") == -1><#assign attr="class"><#else><#assign attr="style"></#if>
        <span ${attr}="${classOrStyle}">${error}</span>
    </#if>
    <#if error_has_next>${separator}</#if>
    </#list>
</#macro>

<#--
 * checkSelected
 *
 * Check a value in a list to see if it is the currently selected value.
 * If so, add the 'selected="selected"' text to the output.
 * Handles values of numeric and string types.
 * This function is used internally but can be accessed by user code if required.
 *
 * @param value the current value in a list iteration
-->
<#macro checkSelected value>
    <#if stringStatusValue?is_number && stringStatusValue == value?number>selected="selected"</#if>
    <#if stringStatusValue?is_string && stringStatusValue == value>selected="selected"</#if>
</#macro>

<#--
 * contains
 *
 * Macro to return true if the list contains the scalar, false if not.
 * Surprisingly not a FreeMarker builtin.
 * This function is used internally but can be accessed by user code if required.
 *
 * @param list the list to search for the item
 * @param item the item to search for in the list
 * @return true if item is found in the list, false otherwise
-->
<#function contains list item>
    <#list list as nextInList>
    <#if nextInList == item><#return true></#if>
    </#list>
    <#return false>
</#function>

<#--
 * closeTag
 *
 * Simple macro to close an HTML tag that has no body with '>' or '/>',
 * depending on the value of a 'xhtmlCompliant' variable in the namespace
 * of this library.
-->
<#macro closeTag>
    <#if xhtmlCompliant?exists && xhtmlCompliant>/><#else>></#if>
</#macro>


<#macro contextPath>${rc.contextPath}</#macro>


<#macro header>
<script>
var contextPath="${rc.contextPath}";
var htmlPath = "${rc.contextPath}";
var staticRoot = "${staticRoot}";

</script>

<#assign contextPath=(rc.contextPath!'/')>
<#if contextPath==''|| contextPath=='/'>
<#assign contextPath='/'>
<#else>
<#assign contextPath=contextPath + '/'>
</#if>
<header>
   <!-- Header begin -->
	<div class="header"><div class="inner">
	    <!-- Logo begin -->
		        <h1 class="logo"><a href="http://www.jiagou4.com/" rel="home"><img src="${staticRoot}/images/logo.png" alt="架构那点事" title="架构那点事"></a></h1>
	        <!-- Logo end -->
	    <!-- HeadRight begin -->
	    
	    <div class="headr">
	    	<div class="op"><!-- 
	        	<a href="http://www.jiagou4.com/wp-login.php?action=register">注册</a>        	<a href="http://www.jiagou4.com/wp-login.php">登录</a> <span>/</span> 
	        	<a href="javascript:void(0);" id="fav"><i class="iconfont icon-shoucang"></i>收藏</a> <span>/</span> 
	            <a href="http://www.jiagou4.com/add-post"><i class="iconfont icon-dingyue"></i>订阅</a>
	             -->
	        </div>
	        
	        <!-- Search begin -->
	        <!--
	    	<form method="get" class="searchform" action="http://www.jiagou4.com/">
			   <input class="searchInput" type="text" placeholder="搜索关键字" name="s" id="ls"/>
			   <input class="searchBtn radius" type="submit" title="搜索" value="搜 索"/>
			</form>    -->
			
			<div class="searchform">
			<script type="text/javascript">(function(){document.write(unescape('%3Cdiv id="bdcs"%3E%3C/div%3E'));var bdcs = document.createElement('script');bdcs.type = 'text/javascript';bdcs.async = true;bdcs.src = 'http://znsv.baidu.com/customer_search/api/js?sid=11098449816907034128' + '&plate_url=' + encodeURIComponent(window.location.href) + '&t=' + Math.ceil(new Date()/3600000);var s = document.getElementsByTagName('script')[0];s.parentNode.insertBefore(bdcs, s);})();</script>   
			 </div>
			 <!-- Search end -->
	    </div>
	    <!-- HeadRight end -->
	    <a id="mo-menu" href="javascript:void(0);"><i class="iconfont icon-caidan"></i></a>
	    <a id="mo-so" href="javascript:void(0);"><i class="iconfont icon-sousuo"></i></a>
		</div>
	</div>
<!-- Header end -->

      <nav class="navbar  navbar-default">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <!--<a class="navbar-brand" href="#">架构那点事</a>-->
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
			   <li><a class="active" href="${contextPath}">首页</a></li>
	          <li><a href="${contextPath}jock" style="color:#FFCC00;">逗比</a></li>
	          <li><a href="${contextPath}jiagou">架构</a></li>
	          <li><a href="${contextPath}soa">SOA/Dubbo</a></li>
	          <li><a href="${contextPath}cache">缓存</a></li>
	          <li><a href="${contextPath}mq">消息</a></li>
	          <li><a href="${contextPath}bigdata">大数据</a></li>
	          <li><a href="${contextPath}yun">云计算</a></li>
	          <li><a href="${contextPath}store">数据库/NoSql</a></li>
	          <li><a href="${contextPath}news" style="color:#FFCC00;">业界</a></li>
          </ul>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->
         </header>
</#macro>


<#macro footer>
 <footer class="blog-footer">
 <p>Copyright © 2004-2015.&nbsp;&nbsp;&nbsp;&nbsp;沪ICP备15022626号</p>
 <p>请联系我们,邮箱：26969881@qq.com</p>
      <p>
        <a href="#">回顶部</a>
      </p>
  </footer>
</#macro>

<#--字符串截取； str代表要截取的字符串， l代表截取的长度，s代表从第几个字符开始截取(默认为0)-->
<#function substr str l s=0>
<#if (s>str?length)>
<#return "">
<#else>

	<#if (l>str?length)>
	<#assign l2=(s+str?length)>
	<#else>
	<#assign l2=s + l>
	</#if>
	<#assign returnStr=str?substring(s, l2)>
	
	
	<#return "${returnStr}">
</#if>
</#function>

<#function substr2 str l s=0>
<#if (s>str?length)>
<#return "">
<#else>

	<#if (l>str?length)>
	<#assign l2=(s+str?length)>
	<#else>
	<#assign l2=s + l>
	</#if>
	<#assign returnStr=str?substring(s, l2)>
	
	<#assign dian=''>
	<#if s==0>
	  <#if (str?length>l)>
	  	<#assign dian='...'>
	  </#if>
	</#if>
	
	<#return "${returnStr}${dian}">
</#if>
</#function>

<#macro tongji>
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?3166ca1111f69e64bfcec2e40d19ad21";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>

</#macro>

<#macro share>
<div class="bdsharebuttonbox"><a class="bds_more" href="#" data-cmd="more"></a><a title="分享到QQ空间" class="bds_qzone" href="#" data-cmd="qzone"></a><a title="分享到新浪微博" class="bds_tsina" href="#" data-cmd="tsina"></a><a title="分享到腾讯微博" class="bds_tqq" href="#" data-cmd="tqq"></a><a title="分享到微信" class="bds_weixin" href="#" data-cmd="weixin"></a></div>
</#macro>
<#macro shareJs>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"24"},"share":{},"image":{"viewList":["qzone","tsina","tqq","weixin"],"viewText":"分享到：","viewSize":"16"}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
</#macro>

<#function curl content>
<#return "${rc.contextPath}${content.url!''}${content.content_id}.html">
</#function>

<#function curl_a content>
<#return "<a href=\"${rc.contextPath}${content.url!''}${content.content_id}.html\" title=\"${content.title!''}\" target=\"_blank\">${content.title!''}</a>">
</#function>

<#macro tkeywords >
<meta name="keywords" content="${type.meta_keywords!''}" />
</#macro>
<#macro tdescription>
<meta name="description" content="${type.meta_description!''}" />
</#macro>
<#macro title>
<title>${type.meta_title!''}_架构那点事</title>
</#macro>
<#macro tmeta>
<@title />
<@tkeywords />
<@tdescription />
</#macro>


<#macro img c w=150 h=100>
<#if (c.default_img?exists && c.default_img !='')>
	<#assign defaultImg=c.default_img>
	<#if (w==150 && (defaultImg?index_of("/upload/2015-05")==-1))>
	<#assign defaultImg=c.default_img?replace('100x75.', '150x100.')>
	 </#if>
	 
	 <#assign defaultImg=defaultImg?replace('pngnull', 'png')>
	 <a href="${cms.curl(c)}" target="_blank">
      <img class="media-object" src="${staticRoot}/${defaultImg}" alt="${cms.substr(c.title, 15)}" width="${w}px" height="${h}px">
    </a>
 </#if>
</#macro>