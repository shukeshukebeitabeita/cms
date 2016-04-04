$(function() {
	
	inputTrim("searchForm");
	
	$("#searchButton").bind('click', function(){
		var validata =$('#searchForm').form('validate');
		if(!validata){
			return false;
		}
		
		var id = $('#id').val();
		var title = $('#title').val();
		var data = {title: title,id:id};
		$('#tt').datagrid({
			queryParams:data
			});
		
	});
	
	$("#searchAllButton").bind('click', function(){
		$('#searchForm')[0].reset();
		$('#tt').datagrid({
			queryParams:{}
		});
	});
	
	
});



//操作列
function operator(val, row){
	var operatorHtml = ''; 
	
	var delete_url = contextPath + "/moss/spider/delete.htm?id=" + row.id;
	var edit_url = contextPath + "/moss/spider/update.htm?id=" + row.id;
	var editOpt = '<a href="javascript:window.parent.j.addTab(\' 编辑采集节点-' + row.id + '\',\'' + edit_url + '\',400,200)">编辑</a>';
	var deleteOpt = '<a href="javascript:j.openWindow(\'删除\',\'' + delete_url + '\',460,410)">删除</a>';
	//if(row.status == 1) {
//		operatorHtml = deleteOpt;
	//} else {
		operatorHtml = editOpt + '<br />' + deleteOpt;
	//}
	
	return operatorHtml;
}



//关闭窗口
function closeWin(){
	window.parent.j.closeWindow('删除'); 
}
