$(function() {
	//刷新
	$("#referesh").click(function(){
		$('#tt').datagrid('reload');
	});
	//添加
	$("#addOperator").click(function(){
		j.openWindow('添加操作员', (contextPath + "/moss/user/create.htm?m=toCreate") ,450,400);
	});
	
	$.extend($.fn.validatebox.defaults.rules, {
		sysusername : {// 验证用户名
	         validator : function(value) {
	             return /^[a-zA-Z][a-zA-Z0-9_]{1,15}$/i.test(value);
	         },
	         message : '该项不合法（字母开头，允许2-16字节，允许字母数字下划线）'
	     },
	     password : {// 验证用户密码
	         validator : function(value) {
	             return /[a-zA-Z0-9_]{6,18}$/i.test(value);
	         },
	         message : '密码不合法（允许6-18字节，允许字母数字下划线）'
	     }
	});
	
	inputTrim('ff');
});

//操作列
function operator(val, row){
	var updateHtml = '<a href="javascript:reSetPwd(\'' + val + '\')">重置密码</a>';
	var deleteHtml = '&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:j.confirm(\'确认删除吗？\', deleteUser, \'' + val + '\')">删除</a>';
	if(!hasUpdateOpt){
		updateHtml = '';
	}
	if(!hasDeleteOpt){
		deleteHtml = '';
	}
	
	operatorHtml = updateHtml + deleteHtml;
	return operatorHtml;
}

function reSetPwd(sysUserId){
	$('#password').val('');
	$('#password2').val('');
	$('#dlg').dialog('open');
	$('#userId').val(sysUserId);
}

function updatePwd(){
	var delUrl = contextPath + "/moss/user/updatePwd.htm";
	$.post(delUrl, {
		"sysUserId" : $('#userId').val(),
		"password":$('#password').val()
	}, function(d) {
		if (d.result == "Y") {
			j.show('信息', d.message); 
			$('#dlg').dialog('close');
		} else {
			j.error('信息', d.message);
		}
	}, "json");
}

function deleteUser(sysUserId){
	var delUrl = contextPath + "/moss/user/delete.htm";
	var data = {
			"sysUserId" : sysUserId
		};
	$.post(delUrl, data, function(d) {
		if (d.result == "Y") {
			j.show('信息', d.message); 
			$('#tt').datagrid('reload');
		} else {
			j.error('信息', d.message);
		}
	}, "json");
}



//提交修改
function submitForm(){
	var validata =$('#ff').form('validate');
	if(!validata){
		return false;
	}
	var url = contextPath + '/moss/user/create.htm?' + $("form").serialize();
	$.post(url, {}, function(d) {
		if (d.result == "Y") {
			 j.show('信息', d.message); 
			 closeWin();
			 window.parent.$('#tt').datagrid('reload');
		} else {
			 j.error('信息', d.message);
		}
	}, "json");
	
}
//关闭窗口
function closeWin(){
	window.parent.j.closeWindow('添加操作员'); 
}
