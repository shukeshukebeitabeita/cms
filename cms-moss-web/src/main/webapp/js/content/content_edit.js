$(function() {
	
	try {
		$('#ff').ajaxForm({
	        // dataType identifies the expected content type of the server response
	        dataType:  'json',
	        timeout: 3000,               //限制请求的时间，当请求大于3秒后，跳出请求
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
	    });
	} catch (e) {
	}

	$('#submitButton').click(function() {
		if (checkData(1)) {
			$('#ff').submit();
			return false;//阻止表单默认提交 
		}
	});

	$('span.datebox input').attr("readonly", "readonly");
	inputTrim('ff');
});

//数据验证。 type: 1,创建时； 2，修改时
function checkData(type){
	return true;
}

function resetForm(){
	$('#ff').resetForm();
}