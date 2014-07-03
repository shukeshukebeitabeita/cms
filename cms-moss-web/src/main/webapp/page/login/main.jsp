<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="../include/head.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>家里商城运营后台</title>
<style>
.cs-tab-menu {
	width: 120px;
}

#treePanle a:visited {
	color: #000;
	text-decoration: none;
}

#treePanle a:link {
	color: #000;
	text-decoration: none;
}

#treePanle a:active {
	color: #000;
	text-decoration: none;
}

#treePanle a:hover {
	color: #EA5514;
	text-decoration: none;
}
</style>
<script type="text/javascript">
	/**
	 * 检测浏览器窗口大小改变，来改变layout大小。
	 */
	$(function() {
		$(window).resize(function() {
			$('mainLayout').layout('resize');
		});
		
		
		$('#letftAccordion').accordion({
			"onSelect":function(title,index){
				if(title == "内容栏目") {
					loadLeftType();
				}
			}
		});

		tabCloseEven();
	});
	
	function updatePwd() {
		var delUrl = contextPath + "/moss/user/updatePasswordForUser.htm";
		$.post(delUrl, {
			"oldPwd" : $('#oldPwd').val(),
			"newPwd" : $('#password').val()
		}, function(d) {
			if (d.result == "Y") {
				j.show('信息', d.message);
				$('#dlg').dialog('close');
			} else {
				j.error('信息', d.message);
			}
		}, "json");
	}

	
</script>
</head>
<body id="mainLayout" class="easyui-layout" style="overflow-y: hidden">
	<!-- 布局 -->
	<div data-options="region:'north'"
		style="width:100%; height:100px; background:url(${rc.contextPath}/images/banner_bg.jpg) repeat-x;">
		 <span
			style="width: 48%; height: 90px; text-align: center; float: left;"><img
			src="${rc.contextPath}/images/banner_logo.jpg" height="90px"
			width="400px" /></span> <span
			style="width: 48%; height: 90px; text-align: right; float: left;"><b
			style="line-height: 40px; font-size: 20px; display: inline-block;">${user_name}</b><br />
			<a style="line-height: 40px; font-size: 20px; display: inline-block;"
			href="#" onclick="$('#dlg').dialog('open')">修改密码</a><a
			style="line-height: 40px; margin-left: 40px; font-size: 20px; display: inline-block;"
			href="${rc.contextPath }/loginout.htm">退出</a></span>
	</div>

	<!-- tree -->
	<div id="treePanle" data-options="region:'west',split:true" title=""
		style="width: 190px; padding: 1px;">
		<div id="letftAccordion" class="easyui-accordion" data-options="fit:true,border:false">
			<div title="菜单" style="padding: 10px;" data-options="selected:true">
				<ul class="easyui-tree"
					data-options="url:'${rc.contextPath}/moss/login/treeMenu.htm',animate:true,dnd:false,lines:true"></ul>
			</div>
			
			<div title="内容栏目" style="padding: 10px;" data-options="tools:[{
						iconCls:'icon-reload',
						 handler:function(){
							$('#leftContentType').tree('reload');
						}
					}]">
				<ul id="leftContentType" class="easyui-tree"
					data-options=" method: 'get',animate:true,dnd:false,lines:true,onContextMenu: function(e,node){
							 e.preventDefault();
							 $(this).tree('select',node.target);
							 $('#mm').menu('show',{
													 left: e.pageX,
													top: e.pageY
							});
				}">
				</ul>

				<div id="mm" class="easyui-menu" style="width: 120px;">
					<div onclick="newOpen()">新窗口打开</div>
					<div class="menu-sep"></div>
					<div onclick="append()" data-options="iconCls:'icon-add'">Append</div>
					<div onclick="removeit()" data-options="iconCls:'icon-remove'">Remove</div>
					<div class="menu-sep"></div>
					<div onclick="expand()">Expand</div>
					<div onclick="collapse()">Collapse</div>
				</div>
				<script type="text/javascript">
					function newOpen() {//新窗口打开
						var node = $('#leftContentType').tree('getSelected');
						j.addTab(" " + node.attributes.name, contextPath + node.attributes.url);
					}
				
					function append() {
						var t = $('#leftContentType');
						var node = t.tree('getSelected');
						t.tree('append', {
							parent : (node ? node.target : null),
							data : [ {
								text : 'new item1'
							}, {
								text : 'new item2'
							} ]
						});
					}
					function removeit() {
						var node = $('#leftContentType').tree('getSelected');
						$('#leftContentType').tree('remove', node.target);
					}
					function collapse() {
						var node = $('#leftContentType').tree('getSelected');
						$('#leftContentType').tree('collapse', node.target);
					}
					function expand() {
						var node = $('#leftContentType').tree('getSelected');
						$('#leftContentType').tree('expand', node.target);
					}
				</script>
			</div>
			
			<div title="预留" style="padding: 10px"></div>
		</div>
	</div>

	<!-- 主页 -->
	<div id="mainPanle" data-options="region:'center',iconCls:'icon-ok'">
		<div id="maintabs" class="easyui-tabs"
			data-options="fit:true,border:false,plain:true">
			<div title="Welcome"
				data-options="href:'${rc.contextPath}/page/login/welcome.jsp'"
				style="padding: 10px"></div>

		</div>
	</div>

	<div id="mm" class="easyui-menu cs-tab-menu">
		<div id="mm-tabupdate">刷新</div>
		<div class="menu-sep"></div>
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseother">关闭其他</div>
		<div id="mm-tabcloseall">关闭全部</div>
	</div>

	<div id="dlg" class="easyui-dialog" title="修改密码"
		style="width: 400px; height: 200px; padding: 10px; text-align: center;"
		data-options="
				iconCls: 'icon-save',
				closed:true,
				modal:true,
				shadow:true,
				buttons: [{
					text:'修改',
					iconCls:'icon-ok',
					handler:function(){
						updatePwd();
					}
				},{
					text:'取消',
					iconCls:'icon-undo',
					handler:function(){
						$('#dlg').dialog('close');
					}
				}]
			">
		<input type="hidden" id="userId" />
		<table align="center">
			<tr>
				<td align="right"><em style="color: red">*</em>旧密码：</td>
				<td><input class="easyui-validatebox" id="oldPwd"
					name="password" maxlength="23" type="password"
					data-options="required:true,validType:['length[6,18]']" /></td>
			</tr>
			<tr>
				<td align="right"><em style="color: red">*</em>操作员密码：</td>
				<td><input class="easyui-validatebox" id="password"
					name="password" maxlength="23" type="password"
					data-options="required:true,validType:['length[6,18]','password','same[\'password2\']']" /></td>
			</tr>
			<tr>
				<td align="right"><em style="color: red">*</em>确认密码：</td>
				<td><input class="easyui-validatebox" id="password2"
					name="password2" maxlength="23" type="password"
					data-options="required:true,validType:['length[6,18]','password','same[\'password\']']" /></td>
			</tr>
		</table>

	</div>
</body>
</html>
