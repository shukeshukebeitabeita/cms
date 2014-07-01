<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>内容管理</title>
<%@ include file="../include/head.jsp"%>


<script type="text/javascript" src="${rc.contextPath}/js/content/content_list.js"></script>

</head>
<body>
<table  id="tt" class="easyui-datagrid" title="内容管理" style="width:auto;height:auto"
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
				url:'${rc.contextPath}/moss/cont/list.htm?typeId=${typeId}',
				toolbar:'#tb'" sortName="UPDATE_DATE" sortOrder="desc">
		<thead>
			<tr>
				<th data-options="field:'sort',hidden:true"></th>
				<th data-options="field:'id', width:80">编号</th>
				<th data-options="field:'title', width:130," sortable="true" >内容标题 </th>
				<th data-options="field:'hasTop', width:50"  >置顶 </th>
				<th data-options="field:'hasLatest', width:50"  >最新 </th>
				<th data-options="field:'hasHot', width:50"  >热门</th>
				<!-- <th data-options="field:'typeName', width:110,align:'center'" >栏目</th> -->
				<th data-options="field:'attributeName', width:50,align:'center'" sortable="true" >类型 </th>
				<th data-options="field:'updateDate', width:70,align:'right',
				formatter:function(val, row, index){
					return formatMyDate(val);
				}" sortable="true" >更新时间 </th>
				
				<th data-options="field:'status', width:70,formatter:function(val, row, index){
					return (val==0?'上架中':'下架中');
				}" sortable="true" >状态 </th>
				
				<th data-options="field:'titleStyle',width:70,align:'center',formatter:operator">操作</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb" style="padding:5px;height:auto">
		<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-add',iconAlign:'top'" onclick="	window.parent.j.addTab(' 新增内容', contextPath + '/moss/cont/create.htm?typeId=${typeId}');">Add</a>
		<a id="deleteContent"  href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">Remove</a>
 		<a href="javascript:;" class="easyui-linkbutton" data-options="">回收站</a>
 
	<form id="searchForm" action="${rc.contextPath}/moss/cont/list.htm">
			<input type="hidden" name="typeId" id="typeId" value=${typeId}/>
			<div style="margin-bottom:5px">
			       商品编号:<input id="id" name="id" class="easyui-validatebox jinputMinWidth" type="text"  data-options="validType:['no','length[0,19]']"/>
			      &nbsp;&nbsp; 商品名称:<input id="title" name="title" class="easyui-validatebox jinputMinWidth" type="text"  data-options="validType:['length[0,100]']"/>
			  &nbsp;&nbsp; 商品分类:<input type="hidden" id="_hidden4" name="categoryId">
					<input type="text" id="_category" name="_category" class="easyui-searchbox" readonly="readonly">
			  &nbsp;&nbsp; 会员名称:<input id="account" name="account" class="easyui-validatebox jinputMinWidth" type="text"  data-options="validType:['length[0,100]']"/>
			&nbsp;&nbsp;推荐状态:<select class="easyui-combobox" panelHeight="auto" style="width:100px" id="recommendStatus" name="recommendStatus">
					<option value="">全部</option>
					<option value="1">已推荐</option>
					<option value="0">未推荐</option>
				</select>
			</div>
			<div>
			商品状态: 
				<select class="easyui-combobox" panelHeight="auto" style="width:100px" id="status" name="status">
					<option value="">所有</option>
					<option value="0">上架中</option>
					<option value="1">下架中</option>
				</select>
			
				&nbsp;&nbsp;更新时间:<input id="startDateStr" name="startDateStr" class="easyui-datebox jinputMinWidth test" >
				&nbsp;-&nbsp; <input id="endDateStr" name="endDateStr" class="easyui-datebox jinputMinWidth test" />
				&nbsp;&nbsp;推荐位置:<select class="easyui-combobox" panelHeight="auto" style="width:100px" id="recommendPostion" name="recommendPostion">
					<option value="">全部</option>
					<option value="1">家里社区首页</option>
					<option value="2">闲置商品首页</option>
				</select>
				&nbsp;&nbsp;<a href="javascript:void(0);" id="searchButton" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
				&nbsp;&nbsp;<a href="javascript:void(0);" id="searchAllButton" class="easyui-linkbutton" iconCls="icon-search">全部</a>
			</div>
			<div style="margin-bottom:5px;margin-top: 8px">
			  <j:existsAuth code="005005003">
				<b>筛选结果:</b> &nbsp;&nbsp;总数<span id="totalCount">0</span>条
				，&nbsp;&nbsp;其中发布<span id="sjCount">0</span>条
				，&nbsp;&nbsp;其中未发布<span id="xjCount">0</span>条
			  </j:existsAuth>
			</div>
		</form>
		</div>
</body>

</html>