<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>编辑采集节点</title>
<%@ include file="../include/head.jsp"%>

<script type="text/javascript" src="${rc.contextPath}/js/jquery/jquery.form.js"></script>
<script type="text/javascript" src="${rc.contextPath}/js/spider/spider_edit.js"></script>
</head>
<body>
	<div class="wrap_box" align="center">
		<form id="ff" action="create.htm" method="post">
			<input type="hidden" id="_entityId" name="id" value="${attribute.id}"/>
			<table cellpadding="0" cellspacing="0" align="center"
				border="1" class="gridtable" style="width: 50%" >
				<tr>
					<td class="grid-tab-l" colspan="2" style="background-color: green;text-align: left;">基本信息（目前不支持正则，仅采用jsoup）</td>
				</tr>
				<tr>
					<td class="grid-tab-l"><b style="color: red">* </b>采集节点名：</td>
					<td class="grid-tab-r"><input type="text" id="_name" name="name"
						class="input-style easyui-validatebox" data-options="required:true" value="${attribute.name}"/></td>
				</tr>
				
				
				<tr>
					<td class="grid-tab-l">采集列表页地址：</td>
					<td class="grid-tab-r"><input type="text" name="listUrl"
						class="input-style easyui-validatebox"  value="${attribute.listUrl}"/></td>
				</tr>
				
				<tr>
					<td class="grid-tab-l">内容根地址：</td>
					<td class="grid-tab-r"><input type="text" name="contentBaseUrl"
						class="input-style easyui-validatebox"  value="${attribute.contentBaseUrl}"/></td>
				</tr>
				<tr>
					<td class="grid-tab-l">图片地址前缀：</td>
					<td class="grid-tab-r"><input type="text" name="imgBaseUrl"
						class="input-style easyui-validatebox"  value="${attribute.imgBaseUrl}"/></td>
				</tr>
				<tr>
					<td class="grid-tab-l">入库栏目(逗号分割)：</td>
					<td class="grid-tab-r"><input type="text" name="typeIds"
						class="input-style easyui-validatebox"  value="${attribute.typeIds}"/></td>
				</tr>
					
				<tr>
					<td class="grid-tab-l">备注：</td>
					<td class="grid-tab-r">
					<textarea name="remark" class="area-style" >${attribute.remark}</textarea>
					</td>
				</tr>
				<tr>
					<td class="grid-tab-l">是否保存图片到本地：</td>
					<td class="grid-tab-r">
					<input type="checkbox" name="hasSaveImgToLocal" value="1" <c:if test="${attribute.hasSaveImgToLocal == 1}">checked="checked"</c:if>/>
					</td>
				</tr>
				<tr>
					<td class="grid-tab-l">信息来源：</td>
					<td class="grid-tab-r"><input type="text" name="contentSource"
						class="input-style easyui-validatebox"  value="${attribute.contentSource}"/></td>
				</tr>
					<tr>
					<td class="grid-tab-l">采集间隔时间：</td>
					<td class="grid-tab-r"><input type="text" name="jobTime"
						class="input-style easyui-validatebox"  value="${attribute.jobTime}"/></td>
				</tr>
				<tr>
					<td class="grid-tab-l" colspan="2" style="background-color: green;text-align: left;">过滤选项</td>
				</tr>
			
				<tr>
					<td class="grid-tab-l">内容替换：</td>
					<td class="grid-tab-r">
					
					<textarea rows="10" cols="35" name="filterSource">${attribute.filterSource}</textarea>
					--
					<textarea rows="10" cols="35" name="filterTarger">${attribute.filterTarger}</textarea>
					</td>
				</tr>
				<tr>
					<td class="grid-tab-l">广告过滤规则：</td>
					<td class="grid-tab-r">
					<textarea rows="10" cols="35" name="adFilter">${attribute.adFilter}</textarea>
					</td>
				</tr>
				<tr>
					<td class="grid-tab-l">获取内容简介：</td>
					<td class="grid-tab-r"><input type="text" name="conterAbort"
						class="input-style easyui-validatebox"  value="${attribute.conterAbort}"/>个字。内容页采集设置时，如果内容简介抓取项为空，则这里设置的有效，从文章中自动截取</td>
				</tr>
				
				<tr>
					<td class="grid-tab-l" colspan="2" style="background-color: green;text-align: left;">列表页采集</td>
				</tr>
				<tr>
					<td class="grid-tab-l">列表页内容链接区规则：</td>
					<td class="grid-tab-r"><input type="text" name="listLinksAreaRule"
						class="input-style easyui-validatebox"  value="${attribute.listLinksAreaRule}"/></td>
				</tr>
				<tr>
					<td class="grid-tab-l">列表页内容链接规则：</td>
					<td class="grid-tab-r"><input type="text" name="listLinkRule"
						class="input-style easyui-validatebox"  value="${attribute.listLinkRule}"/></td>
				</tr>
				<tr>
					<td class="grid-tab-l">标题图片规则：</td>
					<td class="grid-tab-r"><input type="text" name="titleImgRule"
						class="input-style easyui-validatebox"  value="${attribute.titleImgRule}"/>如果标题图片在内容页，则不填</td>
				</tr>
				
					
				<tr >
					<td class="grid-tab-l" colspan="2" style="background-color: green;text-align: left;">内容页采集设置</td>
				</tr>
				<tr>
					<td class="grid-tab-l">内容标题规则：</td>
					<td class="grid-tab-r"><input type="text" name="titleRule"
						class="input-style easyui-validatebox"  value="${attribute.titleRule}"/></td>
				</tr>
				<tr>
					<td class="grid-tab-l">内容标题图片规则：</td>
					<td class="grid-tab-r"><input type="text" name="contentTitleImgRule"
						class="input-style easyui-validatebox"  value="${attribute.contentTitleImgRule}"/></td>
				</tr>
				<tr>
					<td class="grid-tab-l">内容简介规则：</td>
					<td class="grid-tab-r"><input type="text" name="contentAbortRule"
						class="input-style easyui-validatebox"  value="${attribute.contentAbortRule}"/></td>
				</tr>
				<tr>
					<td class="grid-tab-l">内容规则：</td>
					<td class="grid-tab-r"><input type="text" name="contentRule"
						class="input-style easyui-validatebox"  value="${attribute.contentRule}"/></td>
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