<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>角色管理</title>
<%@ include file="../include/head.jsp"%>
<script type="text/javascript" src="${rc.contextPath}/js/auth/role.js"></script>
</head>
<body>
<table  id="tt" class="easyui-datagrid" title="角色管理" style="width:auto;height:auto"
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
				<j:ifAuth code="001002003">
				url:'${rc.contextPath}/moss/role/list.htm',
				</j:ifAuth>
				toolbar:'#tb'">
		<thead>
			<tr>
				<th data-options="field:'roleName', width:250">角色</th>
				<th data-options="field:'roleUser', width:250" sortable="true" >分配的操作员 </th>
				<th data-options="field:'sysRoleId', width:120,align:'center',formatter:operator">操作</th>
			</tr>
		</thead>
	</table>
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<j:existsAuth code="001002001">
			<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-add" plain="true" id="addOperator" title="添加"></a>
			</j:existsAuth>
			<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-reload" plain="true" id="referesh" title="刷新"></a>
		</div>
		
	</div>
	
</body>
<script type="text/javascript">
//操作列
function operator(val, row){
	var url = contextPath + "/moss/role/update.htm?m=toUpdate&sysRoleId=" + val;
	var updateHtml = '<a  href="javascript:j.openWindow(\'修改角色\',\'' + url + '\',720, 620)">修改</a>';
	var deleteHtml ='&nbsp;&nbsp;&nbsp;&nbsp;<a  href="javascript:j.confirm(\'确认删除吗？\', deleteRole, \'' + val + '\')">删除</a>';
	
	<j:notExistsAuth code="001002002">
	  updateHtml = '';//隐藏修改权限
	</j:notExistsAuth>
	<j:notExistsAuth code="001002004">
	   deleteHtml = '';//隐藏删除权限
	</j:notExistsAuth>
		
	operatorHtml = updateHtml + deleteHtml;
	return operatorHtml;
}
</script>
</html>