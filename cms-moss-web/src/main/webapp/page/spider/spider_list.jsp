<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>采集配置</title>
<%@ include file="../include/head.jsp"%>


<script type="text/javascript" src="${rc.contextPath}/js/spider/spider_list.js"></script>

</head>
<body>
<table  id="tt" class="easyui-datagrid" title="采集配置" style="width:auto;height:auto"
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
				url:'${rc.contextPath}/moss/spider/list.htm',
				toolbar:'#tb'" sortName="UPDATE_DATE" sortOrder="desc">
		<thead>
			<tr>
				<th data-options="field:'name', width:200" sortable="true" >采集节点名</th>
				<th data-options="field:'listUrl', width:50, align:'center'"  >采集列表页地址 </th>
				<th data-options="field:'typeIds', width:50, align:'center'"  >入库栏目</th>
				<th data-options="field:'jobTime', width:50, align:'center'"  >采集时间</th>
				<th data-options="field:'id',width:70,align:'center',formatter:operator">操作</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb" style="padding:5px;height:auto">
	<form id="searchForm" action="${rc.contextPath}/moss/spider/list.htm">
			<div style="margin-bottom:5px">
				<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-add',iconAlign:'top'" onclick="window.parent.j.addTab(' 新增采集节点', contextPath + '/moss/spider/create.htm');">新 增</a>
			    &nbsp;&nbsp; 名称:<input id="title" name="title" class="easyui-validatebox jinputMinWidth" type="text"  data-options="validType:['length[0,100]']"/>
				&nbsp;&nbsp;<a href="javascript:void(0);" id="searchButton" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
				&nbsp;&nbsp;<a href="javascript:void(0);" id="searchAllButton" class="easyui-linkbutton" iconCls="icon-search">全部</a>
			</div>
		</form>
		</div>
</body>

</html>