<#ftl strip_whitespace=true>

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
<title>${c.meta_title!''}-架构那点事</title>
<#else>
<title>${c.title!''}-架构那点事</title>
</#if>
</#macro>
<#macro cmeta>
<@ctitle />
<@ckeywords />
<@cdescription />
</#macro>


<#macro tongji>

</#macro>

<#macro share>
<div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a></div>
</#macro>
<#macro shareJs>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"24"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
</#macro>


<#macro header>
<script>
var contextPath="${contextPath}";
var htmlPath = "${contextPath}";
var staticRoot = "${staticRoot}";

</script>

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
    	<form method="get" class="searchform" action="http://www.jiagou4.com/">
   <input class="searchInput" type="text" placeholder="搜索关键字" name="s" id="ls"/>
   <input class="searchBtn radius" type="submit" title="搜索" value="搜 索"/>
</form>        <!-- Search end -->
    </div>
    <!-- HeadRight end -->
    <a id="mo-menu" href="javascript:void(0);"><i class="iconfont icon-caidan"></i></a>
    <a id="mo-so" href="javascript:void(0);"><i class="iconfont icon-sousuo"></i></a>
</div></div>
<!-- Header end -->

<div class="blog-masthead">
 <div class="container">
        <nav class="blog-nav">
          <a class="blog-nav-item active" href="${contextPath}">首页</a>
           <a class="blog-nav-item active" href="${contextPath}jock">逗比</a>
          <a class="blog-nav-item active" href="${contextPath}jiagou">架构</a>
          <a class="blog-nav-item" href="${contextPath}soa">SOA/Dubbo</a>
          <a class="blog-nav-item" href="${contextPath}cache">缓存</a>
          <a class="blog-nav-item" href="${contextPath}mq">消息</a>
          <a class="blog-nav-item" href="${contextPath}bigdata">大数据</a>
          <a class="blog-nav-item" href="${contextPath}yun">云计算</a>
          <a class="blog-nav-item" href="${contextPath}store">数据库/NoSql</a>
          <a class="blog-nav-item" href="${contextPath}news">业界</a>
        </nav>
      </div>
       </div>
       
         </header>
</#macro>