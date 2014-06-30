<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>登录</title>

<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  if(request.getSession().getAttribute("USER_KEY")==null){
%>
   <script type="text/javascript">
    alert("登录超时或没有登录，请先登录");
    window.top.location.href="<%=basePath%>login/index.htm";
   </script>
<%
  }

 %>
 </head>
 <body></body>
 </html>