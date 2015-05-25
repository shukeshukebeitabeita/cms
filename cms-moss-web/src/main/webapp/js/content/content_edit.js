$(function() {
	CKEDITOR.config.height = "350";
	//CKEDITOR.config.width = "850";
	if(isNotNull($('#_contentId').val())){
		$('#ff').attr("action", "update.htm");
	}
	
	$("#_title").blur(function(){//当标题框失去焦点时，把标题自动赋值到 搜索引擎优化：内容标题 里。
		var metaTitle = $("input[name='metaTitle']");
		if(metaTitle && metaTitle.size()>0){// && isNull(metaTitle[0].val())
			$("input[name='metaTitle']").val($("#_title").val());
		}
	});
	

	try {
		var options = {
		        // dataType identifies the expected content type of the server response
		        dataType:  'json',
		        timeout: 3000,               //限制请求的时间，当请求大于3秒后，跳出请求
		        beforeSubmit: validate,
		      //clearForm: true,
		        //resetForm: true,
		        // success identifies the function to invoke when the server response
		        // has been received
		        success:   function(d) {
		        	 $("#postFormButton").removeAttr("disabled");//将按钮可用
					if (d.result == "Y") {
						resetForm();
					} else {
						j.error('信息', d.message);
					}
				}
		    };
	
		//$('#ff').ajaxForm(options);
		
		$("#ff").submit(function(){
			$(this).ajaxSubmit(options);
			return false;   //阻止表单默认提交  
		});
		
	} catch (e) {
	}

	
	$('#postFormButton').click(function() {
		$('#contentBody').val('');
		var contentBody = CKEDITOR.instances._offerDesc.getData();
		$('#contentBody').val(contentBody);
		
		if (isNull($('#_contentId').val())) {
			submitForm();
		} else {
			j.confirm('确认修改吗？', submitForm, 'param');
		}
	});
	
	$('span.datebox input').attr("readonly", "readonly");
	inputTrim('ff');
});

function submitForm(){
	$('#postFormButton').attr({"disabled":"disabled"});//控制按钮为禁用
	$('#ff').submit();
}

function validate(){
	var validata =$('#ff').form('validate');
	if(!validata){
		return false;
	}
	return true;
}

function resetForm(){
	if(isNull($('#_contentId').val())){
		//$('#ff').resetForm();
		j.updateTab();
	}
	j.show('信息', '内容编辑成功');
}

