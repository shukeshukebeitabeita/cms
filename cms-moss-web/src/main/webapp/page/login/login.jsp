<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/head.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>登录</title>
<style type="text/css">
	#loginWindow{}
</style>
</head>

<body style="background:#000;background-image: url('${rc.contextPath}/images/background.jpg');background-positionY: centerbackground-positionX: center;background-repeat: no-repeat;" >
	 
	<div id="loginWindow" class="easyui-window" title="登录" 
	data-options="minimizable:false,closable:false" 
	style="width:500px;height:320px;padding:8px;">
		<div align="center" style="margin: 5px 0 0 0;">
		<div class="logo" style="padding:25px 0;">
			<img src="${rc.contextPath}/images/log_logo.png" height="45px" width="297px"/>
		</div>
		<div class="formLogin">
			<form id="ff" name="ff" >
				<table>
					<tr>
						<td align="right">用户名：</td>
						<td align="left"><input class="easyui-validatebox" type="text" name="name" data-options="required:true" maxlength="20" value=""/> </td>
					</tr>
					<tr>
						<td align="right">密码：</td>
						<td align="left"><input class="easyui-validatebox" type="password" name="password" data-options="required:true" maxlength="20" value=""/> </td>
					</tr>
				<tr>
				<td colspan="2">&nbsp;</td>
				</tr>
				</table>
				<input type="button" class="easyui-linkbutton" value=" 登 录 " id="loginButton"/>
			</form>
			
			</div>
	  </div>
	  <div align="center" style="margin: 30px 0 0 0;">Copyright(C)矩阵CMS 2014，All Rights Reserved</div>
	</div>
</body>
<script type="text/javascript" src="${rc.contextPath}/js/jquery/jquery.jrumble.1.3.min.js"></script>
<script type="text/javascript" src="${rc.contextPath}/js/login.js"></script>
</html>