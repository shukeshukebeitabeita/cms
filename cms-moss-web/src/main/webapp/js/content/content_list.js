$(function() {
	
	$("#deleteContent").click(function(){
	
	});
	
	inputTrim("searchForm");
	
	tongji({});
	$('#tt').datagrid({
		onLoadSuccess:function(){
			setTotal();
	}});
	
	$("#searchButton").bind('click', function(){
		var validata =$('#searchForm').form('validate');
		if(!validata){
			return false;
		}
		
		var id = $('#id').val();
		var title = $('#title').val();
		
		var status = $.trim($('#status').combobox('getValue'));
		
		/*var account = $('#account').val();
		  var typeId = $('#typeId').val();
		var categoryId = $('#_hidden4').val();
		var startDate = $.trim($('#startDateStr').datebox('getValue'));
		var endDate = $.trim($('#endDateStr').datebox('getValue'));
		var recommendStatus = $.trim($('#recommendStatus').combobox('getValue'));
		var recommendPostion = $.trim($('#recommendPostion').combobox('getValue'));*/
		//var data = {title: title,id:id,startDateStr:startDate,endDateStr:endDate,account:account,categoryId:categoryId,recommendStatus:recommendStatus,status:status,recommendPostion:recommendPostion};
		
		var data = {title: title,id:id,status:status};
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
			queryParams:{},
			onLoadSuccess:function(){
				setTotal();
		}});
		tongji({});
	});
	
	$("#_category").searchbox({
		searcher : function(value, name) {
			j.openWindow("分类", contextPath + "/category/index.htm?accountId=", 650, 380, true,	true);
		},
		prompt : ""
	});
	
	$('span.datebox input').attr("readonly", "readonly");
});


function tongji(d){
	return ;
	var delUrl = contextPath + "/moss/cont/list.htm?m=s";
	var data = d;
	$.post(delUrl, data, function(d) {
		if (d.result == "Y") {
			$('#sjCount').html(d.data.sjCount);
			$('#xjCount').html(d.data.xjCount);
		} else {
			j.error('信息', d.message);
		}
	}, "json");
}

function setTotal(){
	return;
	$('#totalCount').html($('#tt').datagrid('getData')['total']);
}

//操作列
function operator(val, row){
	var operatorHtml = ''; 
	
	var delete_url = contextPath + "/moss/idle/delete.htm?id=" + row.id;
	var edit_url = contextPath + "/moss/cont/update.htm?contentId=" + row.id;
	var editOpt = '<a href="javascript:window.parent.j.addTab(\' 编辑内容-' + row.id + '\',\'' + edit_url + '\',400,200)">编辑</a>';
	var deleteOpt = '<a href="javascript:j.openWindow(\'删除\',\'' + delete_url + '\',460,410)">删除</a>';
	if(row.status == 1) {
		operatorHtml = deleteOpt;
	} else {
		operatorHtml = editOpt + '<br />' + deleteOpt;
	}
	
	return operatorHtml;
}
function titleFormatter(val, row, index){
	var url = row.contentUrl + row.id +'.html';
	return ('<a target="_blank" href="'+ htmlRootUrl + url + '">' + val + '</a>');
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
