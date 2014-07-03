<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>内容类型</title>
<%@ include file="../include/head.jsp"%>


<script type="text/javascript" src="${rc.contextPath}/js/attribute/attr_list.js"></script>

</head>
<body>
<table  id="tt" class="easyui-datagrid" title="内容类型" style="width:auto;height:auto"
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
				url:'${rc.contextPath}/moss/attr/list.htm',
				toolbar:'#tb'" sortName="UPDATE_DATE" sortOrder="desc">
		<thead>
			<tr>
				<th data-options="field:'name', width:200" sortable="true" >类型名</th>
				<th data-options="field:'hasImg', width:50, align:'center',formatter:transateYN"  >是否显示图片 </th>
				<th data-options="field:'hasOutLink', width:50, align:'center',formatter:transateYN"  >是否显示链接</th>
				<th data-options="field:'hasAbout', width:50, align:'center',formatter:transateYN"  >是否显示简介</th>
				<th data-options="field:'hasDetail', width:50, align:'center',formatter:transateYN"  >是否显示详细内容</th>
				<th data-options="field:'hasSEO', width:50, align:'center',formatter:transateYN"  >是否显示SEO</th>
				<th data-options="field:'hasTag', width:50, align:'center',formatter:transateYN"  >是否显示特殊标签</th>
				<th data-options="field:'hasExtAttribute', width:50, align:'center',formatter:transateYN"  >是有否动态属性</th>
				<th data-options="field:'updateDate', width:70,align:'right',
				formatter:function(val, row, index){
					return formatMyDate(val);
				}" sortable="true" >更新时间 </th>
				
				<th data-options="field:'status', align:'center',width:60,formatter:function(val, row, index){
					return (val==0?'删除':'正常');
				}" sortable="true" >状态 </th>
				
				<th data-options="field:'id',width:70,align:'center',formatter:operator">操作</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb" style="padding:5px;height:auto">
	<form id="searchForm" action="${rc.contextPath}/moss/attr/list.htm">
			<input type="hidden" name="typeId" id="typeId" value=${typeId}/>
			<div style="margin-bottom:5px">
				<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-add',iconAlign:'top'" onclick="window.parent.j.addTab(' 新增内容', contextPath + '/moss/attr/create.htm');">新 增</a>
			    &nbsp;&nbsp; 名称:<input id="title" name="title" class="easyui-validatebox jinputMinWidth" type="text"  data-options="validType:['length[0,100]']"/>
			    &nbsp;&nbsp;状态: 
				<select class="easyui-combobox" panelHeight="auto" style="width:100px" id="status" name="status">
					<option value="">所有</option>
					<option value="0">删除</option>
					<option value="1">正常</option>
				</select>
			
				&nbsp;&nbsp;<a href="javascript:void(0);" id="searchButton" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
				&nbsp;&nbsp;<a href="javascript:void(0);" id="searchAllButton" class="easyui-linkbutton" iconCls="icon-search">全部</a>
			</div>
		</form>
		</div>
</body>

</html>