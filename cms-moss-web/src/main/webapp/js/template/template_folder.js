$(function() {

	if (isNotNull($('#_entityId').val())) {
		$('#ff').attr("action", "update.htm");
	}

	try {
		var options = {
			dataType : 'json',
			timeout : 3000, // 限制请求的时间，当请求大于3秒后，跳出请求
			beforeSubmit : validate,
			success : function(d) {
				if (d.result == "Y") {
					j.show('信息', '编辑成功');
					closeWin();
					window.parent.reloadTemplateNode($('#parentId').val());
				} else {
					j.error('信息', d.message);
				}
			}
		};

		$("#ff").submit(function() {
			$(this).ajaxSubmit(options);
			return false; // 阻止表单默认提交
		});

	} catch (e) {
	}

	$('#postFormButton').click(function() {
		if (isNull($('#_entityId').val())) {
			submitForm();
		} else {
			j.confirm('确认修改吗？', submitForm, 'param');
		}
	});

	inputTrim('ff');
});

function submitForm(){
	$('#ff').submit();
}

function validate() {
	var validata = $('#ff').form('validate');
	if (!validata) {
		return false;
	}
	 
	return true;
}



//关闭窗口
function closeWin(){
	window.parent.j.closeWindow('编辑模板文件夹'); 
}

					