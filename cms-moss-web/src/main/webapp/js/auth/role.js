$(function() {
//刷新
	$("#referesh").click(function(){
		$('#tt').datagrid('reload');
	});
	//添加
	$("#addOperator").click(function(){
		j.openWindow('添加角色', (contextPath + "/moss/role/create.htm?m=toCreate") ,740,620);
	});
	
	$.extend($.fn.validatebox.defaults.rules, {
		sysrolename : {// 验证用户名
	         validator : function(value) {
	             return /^[a-zA-Z][a-zA-Z0-9_]{1,15}$/i.test(value);
	         },
	         message : '该项不合法（字母开头，允许2-16字节，允许字母数字下划线）'
	     }
	});
	
	inputTrim('ff');
});


//关闭窗口
function closeAddWin(){
	window.parent.j.closeWindow('添加角色'); 
}
function closeUpdateWin(){
	window.parent.j.closeWindow('修改角色'); 
}

//删除角色
function deleteRole(sysRoleId){
	var delUrl = contextPath + "/moss/role/delete.htm";
	var data = {
			"sysRoleId" : sysRoleId
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

function isCheck(){
	var name = "sysModelIds";
	var names = $("#ff").find('input[name="'+name+'"]');
	if(names && names.length>0){
		for(var i =0;i<names.length;i++){
			if(names[i].checked)
				return true;
		}
	}
	
	return false;
}

//提交新增
function submitAddForm(){
	var validata =$('#ff').form('validate');
	if(!validata){
		return false;
	}
	if(!isCheck()){
		 j.error('信息', "请选择权限");
		return false;
	}
	
	var url = contextPath + '/moss/role/create.htm?' + $("form").serialize();
	$.post(url, {}, function(d) {
		if (d.result == "Y") {
			 j.show('信息', d.message); 
			 closeAddWin();
			 window.parent.$('#tt').datagrid('reload');
		} else {
			 j.error('信息', d.message);
		}
	}, "json");	
}

//提交修改
function submitUpdateForm(){
	var validata =$('#ff').form('validate');
	if(!validata){
		return false;
	}
	if(!isCheck()){
		 j.error('信息', "请选择权限");
		return false;
	}
	
	var url = contextPath + '/moss/role/update.htm?' + $("form").serialize();
	$.post(url, {}, function(d) {
		if (d.result == "Y") {
			 j.show('信息', d.message); 
			 closeUpdateWin();
			 window.parent.$('#tt').datagrid('reload');
		} else {
			 j.error('信息', d.message);
		}
	}, "json");	
	
}
