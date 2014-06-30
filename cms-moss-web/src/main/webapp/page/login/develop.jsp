<%@page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>

	大家验证类错误，使用easyui 的验证器提示。 其他的提示使用下面的方式：
	<br></br>
	<input type="button" onclick="j.show('信息', '大家一些提示类的消息用这个。如：列表页面要删除一行，点删除按钮时没有选择一行，就用这个提示，不要弹框。');" value="show"/>
	&nbsp;	&nbsp;j.show('信息', '大家一些提示类的消息用这个。如：列表页面要删除一行，点删除按钮时没有选择一行，就用这个提示，不要弹框。');
	<br></br>
	<input type="button" onclick="j.error('信息', '严重错误提示框');" value="error"/>
		&nbsp;	&nbsp;j.error('信息', '严重错误提示框');
		
		<br></br>
		<input type="button" onclick="j.confirm('确认删除吗？', testgg, 'param');" value="confirm"/>
		&nbsp;	&nbsp;j.confirm('确认删除吗？', testgg, 'param');  function testgg(data){alert(data);}
		  或者 j.confirm('确认删除吗？', testgg','确认');
		<script>
		function testgg(data){alert(data);}
		</script>
<br></br>

<input type="button" onclick="j.process(true, 'title','处理中。。。');" value="进度条"/>
		&nbsp;	&nbsp;j.process(true, 'title','处理中。。。');  j.process(false);//关闭 


<br></br>
	<input type="button" onclick="j.openWindow('title_test', 'http://www.baidu.com', 800, 600);" value="openwindow"/>
		&nbsp;	&nbsp;j.openWindow('title_test', 'http://www.baidu.com', 800, 600);
		<br></br>关闭窗口的调用： &nbsp;	&nbsp;j.closeWindow('title_test'); 
		<br></br>或者  window.parent.j.closeWindow('title_test');
			<br></br><span style="color:red;">
				/**
		 <br>* 显示窗口
		<br> * @param title 窗口标题
		 <br>* @param href 窗口里显示的内容链接地址
		<br> * @param width 宽
		<br> * @param height 高
		<br> * @param modal true:模态窗口；false:非模态窗口
		 <br>* @param minimizable 是否显示最小化按钮
		<br><b style="color:green;"> * @param maximizable 是否显示最大化按钮</b>
		 <br>*/
<br>j.openWindow = function(title, href, width, height, modal, minimizable, maximizable)
</span>
		
<br></br>

	<input type="button" onclick="addOneTab()" value="addTab"/>
		&nbsp;	&nbsp; window.parent.j.addTab('test', '/mall-moss/page/login/welcome.jsp'); 
		<script>
		function addOneTab(){
			window.parent.j.addTab('test', '/mall-moss/page/login/welcome.jsp');
		}
		</script>
		
<br></br>



	<input type="button" onclick="j.updateTab('test')" value="刷新tab"/>
		&nbsp;	&nbsp; j.updateTab('test'); 
		

