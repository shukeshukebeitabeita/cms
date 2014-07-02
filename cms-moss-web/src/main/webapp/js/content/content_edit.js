$(function() {
	
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
					if (d.result == "Y") {
						j.show('信息', '内容编辑成功');
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
	//	alert(contentBody);
		$('#contentBody').val(contentBody);
		
		$('#ff').submit();
	});
	
	$('span.datebox input').attr("readonly", "readonly");
	inputTrim('ff');
});

function validate(){
	var validata =$('#ff').form('validate');
	if(!validata){
		return false;
	}
	return true;
}
//数据验证。 type: 1,创建时； 2，修改时
function checkData(type){
	return true;
}

function resetForm(){
	$('#ff').resetForm();
}