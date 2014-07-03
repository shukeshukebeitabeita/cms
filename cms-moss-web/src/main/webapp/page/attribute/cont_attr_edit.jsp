<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@page import="com.ckeditor.CKEditorConfig"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>编辑操作员</title>
<%@ include file="../include/head.jsp"%>

<script type="text/javascript" src="${rc.contextPath}/js/jquery/jquery.form.js"></script>
<script type="text/javascript" src="${rc.contextPath}/js/attribute/attr_edit.js"></script>
</head>
<body>
	<div class="wrap_box" align="center">
		<form id="ff" action="create.htm" method="post">
			<input type="hidden" id="_entityId" name="id" value="${attribute.id}"/>
			<table cellpadding="0" cellspacing="0" align="center"
				border="1" class="gridtable" style="width: 50%" >
				<tr>
					<td class="grid-tab-l"><b style="color: red">* </b>类型名：</td>
					<td class="grid-tab-r"><input type="text" id="_name" name="name"
						class="input-style easyui-validatebox" data-options="required:true" value="${attribute.name}"/></td>
				</tr>
				
				
				<tr>
					<td class="grid-tab-l">是否显示图片：</td>
					<td class="grid-tab-r">
					<input type="checkbox" name="hasImg" value="1" <c:if test="${attribute.hasImg == 1}">checked="checked"</c:if>>
					</td>
				</tr>
				<tr>
					<td class="grid-tab-l">是否显示作者：</td>
					<td class="grid-tab-r">
					<input type="checkbox" name="hasAuthor" value="1" <c:if test="${attribute.hasAuthor == 1}">checked="checked"</c:if>>
					</td>
				</tr>
				<tr>
					<td class="grid-tab-l">是否显示来源：</td>
					<td class="grid-tab-r">
					<input type="checkbox" name="hasSource" value="1" <c:if test="${attribute.hasSource == 1}">checked="checked"</c:if>>
					</td>
				</tr>
				<tr>
					<td class="grid-tab-l">是否显示发布时间：</td>
					<td class="grid-tab-r">
					<input type="checkbox" name="hasShowTime" value="1" <c:if test="${attribute.hasShowTime == 1}">checked="checked"</c:if>>
					</td>
				</tr>
				<tr>
					<td class="grid-tab-l">是否显示关键字：</td>
					<td class="grid-tab-r">
					<input type="checkbox" name="hasKeyword" value="1" <c:if test="${attribute.hasKeyword == 1}">checked="checked"</c:if>>
					</td>
				</tr>
				<tr>
					<td class="grid-tab-l">是否显示链接：</td>
					<td class="grid-tab-r">
					<input type="checkbox" name="hasOutLink" value="1" <c:if test="${attribute.hasOutLink == 1}">checked="checked"</c:if>>
					</td>
				</tr>
				<tr>
					<td class="grid-tab-l">是否显示简介：</td>
					<td class="grid-tab-r">
					<input type="checkbox" name="hasAbout" value="1" <c:if test="${attribute.hasAbout == 1}">checked="checked"</c:if>>
					</td>
				</tr>
				<tr>
					<td class="grid-tab-l">是否显示详细内容：</td>
					<td class="grid-tab-r">
					<input type="checkbox" name="hasDetail" value="1" <c:if test="${attribute.hasDetail == 1}">checked="checked"</c:if>>
					</td>
				</tr>
				<tr>
					<td class="grid-tab-l">是否显示特殊标签：</td>
					<td class="grid-tab-r">
					<input type="checkbox" name="hasTag" value="1" <c:if test="${attribute.hasTag == 1}">checked="checked"</c:if>>
					</td>
				</tr>
				<tr>
					<td class="grid-tab-l">是否显示商品订单类选项：</td>
					<td class="grid-tab-r">
					<input type="checkbox" name="hasOrderOpt" value="1" <c:if test="${attribute.hasOrderOpt == 1}">checked="checked"</c:if>>
					</td>
				</tr>
				<tr>
					<td class="grid-tab-l">是否显示SEO：</td>
					<td class="grid-tab-r">
					<input type="checkbox" name="hasSEO" value="1" <c:if test="${attribute.hasSEO == 1}">checked="checked"</c:if>>
					</td>
				</tr>
				<tr>
					<td class="grid-tab-l">是有否动态属性：</td>
					<td class="grid-tab-r">
					<input type="checkbox" name="hasExtAttribute" value="1" <c:if test="${attribute.hasExtAttribute == 1}">checked="checked"</c:if>>
					</td>
				</tr>
				
				<tr>
					<td class="grid-tab-l">备注：</td>
					<td class="grid-tab-r">
					<textarea name="remark" class="area-style">${attribute.remark}</textarea>
					</td>
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