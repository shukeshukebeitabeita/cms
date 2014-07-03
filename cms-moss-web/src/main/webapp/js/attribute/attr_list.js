$(function() {
	
	inputTrim("searchForm");
	
	$("#searchButton").bind('click', function(){
		var validata =$('#searchForm').form('validate');
		if(!validata){
			return false;
		}
		
		var id = $('#id').val();
		var title = $('#title').val();
		var recommendPostion = $.trim($('#recommendPostion').combobox('getValue'));
		var status = $.trim($('#status').combobox('getValue'));
		var data = {title: title,id:id,status:status,recommendPostion:recommendPostion};
		$('#tt').datagrid({
			queryParams:data,
			onLoadSuccess:function(){
				setTotal();
		}});
		
		tongji(data);
	});
	
	$("#searchAllButton").bind('click', function(){
		$('#searchForm')[0].reset();
		$('#tt').datagrid({
			queryParams:{}
		});
	});
	
	
});


function transateYN(val, row) {
	return (val==0?'否':'是');
}

//操作列
function operator(val, row){
	var operatorHtml = ''; 
	
	var delete_url = contextPath + "/moss/attr/delete.htm?id=" + row.id;
	var edit_url = contextPath + "/moss/attr/update.htm?id=" + row.id;
	var editOpt = '<a href="javascript:window.parent.j.addTab(\' 编辑类型-' + row.id + '\',\'' + edit_url + '\',400,200)">编辑</a>';
	var deleteOpt = '<a href="javascript:j.openWindow(\'删除\',\'' + delete_url + '\',460,410)">删除</a>';
	if(row.status == 1) {
		operatorHtml = deleteOpt;
	} else {
		operatorHtml = editOpt + '<br />' + deleteOpt;
	}
	
	return operatorHtml;
}


//删除
function submitForm(){
	
	var validata =$('#ff').form('validate');
	if(!validata){
		return false;
	}
	var title = $('#commentMessage_title').val();
	if(isNull(title)){
		j.error('信息', "请选择模板");
		return false;
	}
	var url = contextPath + '/moss/idle/delete.htm?m=doDelete&title=' + title + "&"+ $("form").serialize();
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
	window.parent.j.closeWindow('删除'); 
}
