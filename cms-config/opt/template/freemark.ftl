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