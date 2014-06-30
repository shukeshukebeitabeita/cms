<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@page import="com.ckeditor.CKEditorConfig"%>
<%@ taglib uri="/WEB-INF/tld/ckfinder.tld/" prefix="ckf"%>
<%@ taglib uri="/WEB-INF/tld/ckeditor.tld/" prefix="ck"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>编辑操作员</title>
<script type="text/javascript"
	src="${rc.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/javascript"
	src="${rc.contextPath}/ckfinder/ckfinder.js"></script>

<%@ include file="../include/head.jsp"%>
<script type="text/javascript" src="${rc.contextPath}/js/jquery/jquery.form.js"></script>
<script type="text/javascript" src="${rc.contextPath}/js/content/content_edit.js"></script>
</head>
<body>
	<div class="wrap_box">
		<form id="ff" action="">
			<input type="hidden" name="" value=""/>
			<input type="hidden" name="" value=""/>
			<input type="hidden" name="" value=""/>
			<table width="100%" cellpadding="0" cellspacing="0" align="center"
				border="1" class="gridtable">
				<tr>
					<td class="grid-tab-l">*标题：</td>
					<td class="grid-tab-r"><input type="text" name="theme"
						class="input-style" /></td>
				</tr>
				<tr>
					<td class="grid-tab-l">发布属性：</td>
					<td class="grid-tab-r"><span
						>作者：</span><input type="text" name="start-date"
						class="input-style short" />
						
						<span class="end-date">发布时间：</span><input type="text" name="theme"
						class="input-style date" onClick="WdatePicker()" />
						
						<span class="left-padding">来源：</span><input type="text" name="theme"
						class="input-style short" /></td>
				</tr>
				<tr>
					<td class="grid-tab-l">链接：</td>
					<td class="grid-tab-r"><input type="text" name="theme"
						class="input-style" value="http://"/></td>
				</tr>
				<tr>
					<td class="grid-tab-l">图片：</td>
					<td class="grid-tab-r"><input type="text" name="theme"
						class="input-style" value="http://"/></td>
				</tr>
				<tr>
					<td class="grid-tab-l">视频：</td>
					<td class="grid-tab-r"><input type="text" name="theme"
						class="input-style" value="http://"/></td>
				</tr>
				<tr>
					<td class="grid-tab-l">音频：</td>
					<td class="grid-tab-r"><input type="text" name="theme"
						class="input-style" value="http://"/></td>
				</tr>
			<!-- 	<tr>
					<td class="grid-tab-l">文件：</td>
					<td class="grid-tab-r"><input type="text" name="theme"
						class="input-style" value="http://"/></td>
				</tr> -->
				<tr>
					<td class="grid-tab-l">简介：</td>
					<td class="grid-tab-r">
					<textarea class="area-style"></textarea>
					</td>
				</tr>
			
				<tr>
					<td class="grid-tab-l">详细内容：</td>
					<td class="grid-tab-r">
	
						<textarea id="_offerDesc" name="offerDesc" rows="10" cols="50">
						</textarea> <ckf:setupCKEditor basePath="../../ckfinder/"
							editor="_offerDesc" /> <ck:replace
							basePath="../../ckeditor" replace="_offerDesc" /></td>
				</tr>
				
				<tr>
					<td class="grid-tab-l">关键词：</td>
					<td class="grid-tab-r">
						<input type="text" name="keyword"  class="input-style">
						
					</td>
				</tr>
				
				<tr>
					<td class="grid-tab-l">标签：</td>
					<td class="grid-tab-r">
						置顶&nbsp;<input type="checkbox" name="" value="0">
						<span class="left-padding-min">最新&nbsp;<input type="checkbox" name="" value="0"></span>
						<span class="left-padding-min">热点&nbsp;<input type="checkbox" name="" value="0"></span>
						
						<span class="left-padding"><a>添加自定义标签</a></span>
					</td>
				</tr>
				
				<tr>
					<td class="grid-tab-l">搜索引擎优化：</td>
					<td class="grid-tab-r">
						<div>内容标题 &nbsp;&nbsp;&nbsp;<input type="text" name="" class="input-style"></div>
						<div>内容关键字&nbsp;<input type="text" name="" class="input-style"></div>
						<div>内容描述&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name=""  class="input-style"></div>
					</td>
				</tr>
				
				
				<tr>
					<td colspan="2" class="single-tab"><input type="button"
						value="确 定" class="btn-style" /></td>
				</tr>
			</table>
		</form>
	</div>
	
	
	<script type="text/javascript">
		//鼠标移入移出表格行变色效果
		$('.gridtable').find('tr').hover(function() {
			$(this).css('background', '#fffcd8')
		}, //鼠标移入
		function() {
			$(this).css('background', '#fff')
		} //鼠标移出
		);
	</script>
</body>

</html>