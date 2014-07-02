<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@page import="com.ckeditor.CKEditorConfig"%>
<%@ taglib uri="/WEB-INF/tld/ckfinder.tld/" prefix="ckf"%>
<%@ taglib uri="/WEB-INF/tld/ckeditor.tld/" prefix="ck"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>编辑操作员</title>
<%@ include file="../include/head.jsp"%>

<script type="text/javascript" src="${rc.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${rc.contextPath}/ckfinder/ckfinder.js"></script>
<script type="text/javascript" src="${rc.contextPath}/js/jquery/jquery.form.js"></script>
<script type="text/javascript" src="${rc.contextPath}/js/content/content_edit.js"></script>
</head>
<body>
	<div class="wrap_box">
		<form id="ff" action="create.htm" method="post">
			<input type="hidden" name="typeId" value="${type.id} "/>
			<input type="hidden" name="templateId" value="${template.id} "/>
			<input type="hidden" name="attrId" value="${attribute.id} "/>
			<table width="100%" cellpadding="0" cellspacing="0" align="center"
				border="1" class="gridtable">
				<tr>
					<td class="grid-tab-l"><b style="color: red">* </b>标题：</td>
					<td class="grid-tab-r"><input type="text" id="_title" name="title"
						class="input-style easyui-validatebox" data-options="required:true"/></td>
				</tr>
				
				<c:if test="${attribute.hasSource == 1 || attribute.hasShowTime == 1 || attribute.hasAuthor == 1}">
				<tr>
					<td class="grid-tab-l">发布属性：</td>
					<td class="grid-tab-r">
						<c:if test="${attribute.hasAuthor == 1}">
						<span>作者：</span><input type="text" name="author"
						class="input-style short" />
						</c:if>
						<c:if test="${attribute.hasShowTime == 1}">
						<span class="end-date">发布时间：</span><input type="text" name="publishTime"
						class="easyui-datebox  jinputMinWidth"  />
						</c:if>
						<c:if test="${attribute.hasSource == 1}">
						<span class="left-padding">来源：</span><input type="text" name="source"
						class="input-style short" />
						</c:if>
						</td>
				</tr>
				</c:if>
				
				<c:if test="${attribute.hasOrderOpt == 1}">
				<tr>
					<td class="grid-tab-l">品牌：</td>
					<td class="grid-tab-r"><input type="text" name="brand"
						class="input-style short" value=""/></td>
				</tr>
				<tr>
					<td class="grid-tab-l">原价：</td>
					<td class="grid-tab-r"><input type="text" name="price"
						class="input-style short" value=""/></td>
				</tr>
				<tr>
					<td class="grid-tab-l">销售价：</td>
					<td class="grid-tab-r"><input type="text" name="salePrice"
						class="input-style short" value=""/></td>
				</tr>
			
				<tr>
					<td class="grid-tab-l">库存：</td>
					<td class="grid-tab-r"><input type="text" name="stock"
						class="input-style short" value=""/></td>
				</tr>
				<tr>
					<td class="grid-tab-l">原商品连接：</td>
					<td class="grid-tab-r"><input type="text" name="goodsUrl"
						class="input-style" value=""/></td>
				</tr>
				</c:if>
				
				
				<c:if test="${attribute.hasOutLink == 1}">
				<tr>
					<td class="grid-tab-l">链接到：</td>
					<td class="grid-tab-r"><input type="text" name="link"
						class="input-style" value="http://"/>
						注: 填写此项后, 此标题跳转到该链接, 本页填写的其他内容将失效.
						</td>
				</tr>
				</c:if>
				<c:if test="${attribute.hasImg == 1}">
				<tr>
					<td class="grid-tab-l">图片：</td>
					<td class="grid-tab-r"><input type="text" name="defaultImg"
						class="input-style" value=""/></td>
				</tr>
				</c:if>
				<c:if test="${attribute.hasVedio == 1}">
				<tr>
					<td class="grid-tab-l">视频：</td>
					<td class="grid-tab-r"><input type="text" name="vedio"
						class="input-style" value=""/></td>
				</tr>
				</c:if>
				<!-- <tr>
					<td class="grid-tab-l">音频：</td>
					<td class="grid-tab-r"><input type="text" name="theme"
						class="input-style" value=""/></td>
				</tr> -->
			<!-- 	<tr>
					<td class="grid-tab-l">文件：</td>
					<td class="grid-tab-r"><input type="text" name="theme"
						class="input-style" value="http://"/></td>
				</tr> -->
				
				<c:if test="${attribute.hasAbout == 1}">
				<tr>
					<td class="grid-tab-l">简介：</td>
					<td class="grid-tab-r">
					<textarea name="about" class="area-style"></textarea>
					</td>
				</tr>
				</c:if>
				
				<c:if test="${attribute.hasDetail == 1}">
				<tr>
					<td class="grid-tab-l">详细内容：</td>
					<td class="grid-tab-r">
	
						<textarea id="_offerDesc" name="offerDesc" rows="10" cols="50">
						</textarea> <ckf:setupCKEditor basePath="../../ckfinder/"
							editor="_offerDesc" /> <ck:replace
							basePath="../../ckeditor" replace="_offerDesc" />
					 <div style="display: none;">
					 <textarea id="contentBody" name="contentBody" rows="4" cols="4" ></textarea>
					 </div>	
					</td>
				</tr>
				</c:if>
				
				<c:if test="${attribute.hasKeyword == 1}">
				<tr>
					<td class="grid-tab-l">关键词：</td>
					<td class="grid-tab-r">
						<input type="text" name="keyword"  class="input-style">
						
					</td>
				</tr>
				</c:if>
				
				<c:if test="${attribute.hasTag == 1}">
				<tr>
					<td class="grid-tab-l">标签：</td>
					<td class="grid-tab-r">
						置顶&nbsp;<input type="checkbox" name="hasTop" value="1">
						<span class="left-padding-min">最新&nbsp;<input type="checkbox" name="hasLatest" value="1"></span>
						<span class="left-padding-min">热点&nbsp;<input type="checkbox" name="hasHot" value="1"></span>
						
						<span class="left-padding"><a href="javascript:alert('开发中，敬请期待...');">添加自定义标签</a></span>
					</td>
				</tr>
				</c:if>
				
				<c:if test="${attribute.hasSEO == 1}">
				<tr>
					<td class="grid-tab-l">搜索引擎优化：</td>
					<td class="grid-tab-r">
						<div>内容标题 &nbsp;&nbsp;&nbsp;<input type="text" name="metaTitle" class="input-style"></div>
						<div>内容关键字&nbsp;<input type="text" name="metaKeywords" class="input-style"></div>
						<div>内容描述&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="metaDescription"  class="input-style"></div>
					</td>
				</tr>
				</c:if>
				
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