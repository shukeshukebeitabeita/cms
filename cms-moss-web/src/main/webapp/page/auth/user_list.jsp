<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>操作员管理</title>
<%@ include file="../include/head.jsp"%>
</head>
<body>
<table  id="tt" class="easyui-datagrid" title="操作员管理" style="width:auto;height:auto"
			data-options="
				fit:true,
				fitColumns:true,
				autoRowHeight:true,
				rownumbers:true,
				singleSelect:true,
				nowrap:false,
				pagination:true,
				striped:true,
				pageList:[10,15,20,30,40,50],
				pageSize:15,
				<j:ifAuth code="001001003">
				url:'${rc.contextPath}/moss/user/list.htm',
				</j:ifAuth>
				toolbar:'#tb'"><!-- pagePosition:'both',sortName:'id',sortOrder:'asc',remoteSort:true -->
		<thead>
			<tr>
				<th data-options="field:'name', width:250">操作员姓名</th>
				<th data-options="field:'roleName', width:250" sortable="true" >匹配角色 </th>
				<th data-options="field:'sysUserId', width:120,align:'center',formatter:operator">操作</th>
			</tr>
		</thead>
	</table>
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
		<j:existsAuth code="001001001">
			<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-add" plain="true" id="addOperator" title="添加"></a>
		</j:existsAuth>
			<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-reload" plain="true" id="referesh" title="刷新"></a>
		</div>
		
	</div>
	
	
	<div id="dlg" class="easyui-dialog" title="重置密码" style="width:400px;height:200px;padding:10px;text-align: center;"
			data-options="
				iconCls: 'icon-save',
				closed:true,
				buttons: [{
					text:'Ok',
					iconCls:'icon-ok',
					handler:function(){
						updatePwd();
					}
				},{
					text:'Cancel',
					iconCls:'icon-undo',
					handler:function(){
						$('#dlg').dialog('close');
					}
				}]
			">
			<input type="hidden" id="userId"/>
			<table align="center">
			<tr><td align="right"><em style="color: red">*</em>操作员密码：</td><td><input class="easyui-validatebox" id="password" name="password" maxlength="23" type="password" data-options="required:true,validType:['length[6,18]','password','same[\'password2\']']"/></td></tr>
			<tr><td></td><td>&nbsp;</td></tr>
			<tr><td align="right"><em style="color: red">*</em>确认密码：</td><td><input class="easyui-validatebox" id="password2" name="password2" maxlength="23" type="password" data-options="required:true,validType:['length[6,18]','password','same[\'password\']']"/></td></tr>
			</table>
		
	</div>
</body>
<script type="text/javascript">
	var hasUpdateOpt = true;
	var hasDeleteOpt = true;
	<j:notExistsAuth code="001001002">
	   hasUpdateOpt = false;//隐藏修改权限
	</j:notExistsAuth>
	<j:notExistsAuth code="001001004">
	  hasDeleteOpt = false;//隐藏删除权限
	</j:notExistsAuth>
	</script>
	
<script type="text/javascript" src="${rc.contextPath}/js/auth/user.js"></script>
</html>