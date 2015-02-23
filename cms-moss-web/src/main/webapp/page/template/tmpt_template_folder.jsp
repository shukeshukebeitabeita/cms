<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>编辑模板文件夹</title>
<%@ include file="../include/head.jsp"%>

<script type="text/javascript" src="${rc.contextPath}/js/jquery/jquery.form.js"></script>
<script type="text/javascript" src="${rc.contextPath}/js/template/template_folder.js"></script>
</head>
<body>
	<div class="wrap_box" align="center">
		<form id="ff" action="create.htm" method="post">
			<input type="hidden" name="type" value="f"/>
			<input type="hidden" id="_entityId" name="id" value="${template.id}"/>
			<input type="hidden" name="templateType" value="0"/>
			<input type="hidden" name="hasLeaf" value="0"/>
			<input type="hidden" name="status" value="1"/>
			<input type="hidden" id="parentId" name="parentId" value="${parentId}"/>
			
			<table cellpadding="0" cellspacing="0" align="center"
				border="1" class="gridtable" style="width: 50%">
				<tr>
					<td class="grid-tab-r" colspan="2" align="left" style="min-width: 400px"><b>
					<c:if test="${empty template}">新增</c:if><c:if test="${not empty template}">修改</c:if>
					</b>
					</td>
				</tr>
				<tr>
					<td class="grid-tab-l"><b style="color: red">* </b>模板文件夹名：</td>
					<td class="grid-tab-r" style="min-width: 400px"><input type="text" id="_templateName" name="templateName"
						class="input-style easyui-validatebox" data-options="required:true" value="${template.templateName}"/></td>
				</tr>
		
			
				
				<tr>
					<td colspan="2" class="single-tab">
					<input id="postFormButton" type="button"
						value="确 定" class="btn-style" />
					</td>
				</tr>
			</table>
		</form>
	</div>
	
</body>

</html>