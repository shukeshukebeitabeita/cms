<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@page import="com.ckeditor.CKEditorConfig"%>
<%@ taglib uri="/WEB-INF/tld/ckfinder.tld/" prefix="ckf" %>
<%@ taglib uri="/WEB-INF/tld/ckeditor.tld/" prefix="ck" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>编辑操作员</title>
	<script type="text/javascript" src="${rc.contextPath}/ckeditor/ckeditor.js"></script>
   <script type="text/javascript"src="${rc.contextPath}/ckfinder/ckfinder.js"></script>

<%@ include file="../include/head.jsp"%>
<script type="text/javascript" src="${rc.contextPath}/js/auth/role.js"></script>
</head>
<body>
	<div class="wrap_box">
<table width="100%" cellpadding="0" cellspacing="0" align="center" border="1" class="gridtable">
	<tr>
    	<td class="grid-tab-l">*活动主题：</td><td class="grid-tab-r"><input type="text" name="theme" class="input-style" /></td>
    </tr>
    <tr>
    	<td class="grid-tab-l">*开始时间：</td><td class="grid-tab-r"><input type="text" name="start-date" class="input-style date"  onClick="WdatePicker()" /><span class="end-date">*结束时间：</span><input type="text" name="theme" class="input-style date"   onClick="WdatePicker()"/></td>
    </tr>
    <tr>
    	<td class="grid-tab-l">*报名截止时间：</td><td class="grid-tab-r"><input type="text" name="end-date" class="input-style date"   onClick="WdatePicker()"/><span class="end-date">含当天24小时</span>不填则活动开始时间到停止报名</td>
    </tr>
    <tr>
    	<td class="grid-tab-l">*商品价格要求：</td>
        <td class="grid-tab-r">
        <div><input type="radio" name="price" value="0"><span>无特殊要求</span><input type="radio" name="price" value="1"><span>打折商品</span><input type="radio" name="price" value="2"><span>可使用优惠券</span></div>
        <div class="discount">最高折扣率：<input type="text" name="discount" class="input-style short" /><span>%</span>0~100%<span></span>促销折扣率不小于此数据才能参加活动！</span></div>
        </td>
    </tr>
    <tr>
    	<td class="grid-tab-l">*每家店铺商品上限：</td><td class="grid-tab-r"><input type="text" name="count" class="input-style short" /><span>件</span></td>
    </tr>
   
    <tr>
    	<td class="grid-tab-l">活动介绍：</td><td class="grid-tab-r"><textarea class="area-style"></textarea>
    	
    	<textarea id="_offerDesc" name="offerDesc" rows="10"
						cols="50">
		</textarea>
		
		<ckf:setupCKEditor basePath="/cms-moss-web/ckfinder/"  editor="_offerDesc"/>
		<ck:replace basePath="/cms-moss-web/ckeditor" replace="_offerDesc"/>
    	
    	</td>
    </tr>
	<tr><td colspan="2" class="single-tab"><input type="button" value="确 定" class="btn-style"/></td></tr>
</table>
</div>
<script type="text/javascript">
	//鼠标移入移出表格行变色效果
	$('.gridtable').find('tr').hover(
		function(){$(this).css('background','#fffcd8')}, //鼠标移入
   		function(){$(this).css('background','#fff')}  //鼠标移出
	);
</script>
</body>

</html>