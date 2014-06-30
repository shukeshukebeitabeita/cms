<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>编辑操作员</title>
<%@ include file="../include/head.jsp"%>

</head>
<body>
	<div style="margin:10px 0;"></div>
	<div class="easyui-panel jbackground tabcont">
		<div style="padding:10px 0 10px 30px" id="fenlifloat">
	    <form id="ff" method="post" action="${rc.contextPath }/moss/user/create.htm">
	    	<table cellpadding="0" cellspacing="0">
				<tr><th width="80" height="35" scope="col">操作员姓名</th><td><input name="name" id="name" class="easyui-validatebox" type="text" data-options="required:true,validType:['sysusername']"/></td></tr>
				<tr>
					<th scope="col" height="35">操作员密码</th>
					<td>
					<input class="easyui-validatebox" id="password" name="password" maxlength="23" type="password" data-options="required:true,validType:['length[6,18]','password','same[\'password2\']']"/>
					</td>
				</tr>
				<tr>
					<th scope="col" height="35">密码确认</th>
					<td>
					<input class="easyui-validatebox" id="password2" name="password2" maxlength="23" type="password" data-options="required:true,validType:['length[6,18]','password','same[\'password2\']']"/>
					</td>
				</tr>
				<tr>
					<th scope="col" height="35">匹配角色</th>
					<td>
					<input class="easyui-combobox" 
						id="roleId" name="roleId"
						data-options="
								url:'${rc.contextPath }/moss/user/create.htm?m=getRole',
								valueField:'id',
								textField:'text',
								editable:false,
								panelHeight:'auto'
						"/>
						
					</td>
				</tr>
				
		 	</table>
		 	
			<div  style="width:100%;text-align: center;">
			    <div style="text-align:center;padding:30px;">
			    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="submitForm()">确 定</a>
			    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-undo" onclick="closeWin()">取 消</a>
			    </div>
			</div>
	    </form>
	    </div>
	</div>
</body>
<script type="text/javascript" src="${rc.contextPath}/js/auth/user.js"></script>

</html>