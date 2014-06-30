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
		var account = $('#account').val();
		var categoryId = $('#_hidden4').val();
		var startDate = $.trim($('#startDateStr').datebox('getValue'));
		var endDate = $.trim($('#endDateStr').datebox('getValue'));
		var recommendStatus = $.trim($('#recommendStatus').combobox('getValue'));
		var recommendPostion = $.trim($('#recommendPostion').combobox('getValue'));
		var status = $.trim($('#status').combobox('getValue'));
		var data = {title: title,id:id,startDateStr:startDate,endDateStr:endDate,account:account,categoryId:categoryId,recommendStatus:recommendStatus,status:status,recommendPostion:recommendPostion};
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
			j.openWindow("商品分类", contextPath + "/category/index.htm?accountId=", 650, 380, true,	true);
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
	$('#totalCount').html($('#tt').datagrid('getData')['total']);
}

//操作列
function operator(val, row){
	var operatorHtml = ''; 
	
		var delete_url = contextPath + "/moss/idle/delete.htm?id=" + row.id;
		var recommend_url = contextPath + "/moss/idle/remmend.htm?id=" + row.id;
		var recommendOpt = '<a href="javascript:j.openWindow(\'推荐管理\',\'' + recommend_url + '\',400,200)">推荐管理</a>';
		var deleteOpt = '<a href="javascript:j.openWindow(\'删除\',\'' + delete_url + '\',460,410)">删除</a>';
		if(row.status == 1) {
			operatorHtml = deleteOpt;
		} else {
			operatorHtml = recommendOpt + '<br />' + deleteOpt;
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


//推荐管理
function recommendForm(){
	var url = contextPath + '/moss/idle/remmend.htm?m=r&' + $("form").serialize();
	$.post(url, {}, function(d) {
		if (d.result == "Y") {
			 j.show('信息', d.message); 
			 closeRecommendWin();
			 window.parent.$('#tt').datagrid('reload');
		} else {
			 j.error('信息', d.message);
		}
	}, "json");
	
}
//关闭窗口
function closeRecommendWin(){
	window.parent.j.closeWindow('推荐管理'); 
}
