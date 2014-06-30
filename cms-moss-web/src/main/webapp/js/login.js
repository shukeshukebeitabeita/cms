$(function(){
	$('#loginButton').click(function(){
		login();
	});
	
	
	$(window).keydown(function(event){//监听键盘按键
		  switch(event.keyCode) {//esc键
		  case 27:
			  window.close();
			  break;
		  case 13://回车键
			  login();
			  break;
		  }
		});
});


function login(){
	var validata =$('#ff').form('validate');
	if(!validata){
		dese();
		return false;
	}
	j.process(true, '登录','登录中。。。');
	var url = contextPath + '/login/check.htm?' + $("form").serialize();
	$.post(url, {}, function(d) {
		if (d.result == "Y") {
			 location.href = window.contextPath + "/moss/login/toMain.htm";
		} else {
			j.process(false);//关闭 
			j.show('信息', d.message);
			dese();
		}
	}, "json");
}

function dese(){
	$('#loginWindow').jrumble({
		x : 4,
		y : 0,
		rotation : 0
	});
	$('#loginWindow').trigger('startRumble');
	setTimeout('$("#loginWindow").trigger("stopRumble")', 700);
}