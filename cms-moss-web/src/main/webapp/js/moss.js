var moss={};

//左边栏目
function loadLeftType(){
	var node = $("#leftContentType").tree("getRoot");
	if(node == null) {
		$("#leftContentType").tree({
		     url: contextPath + "/moss/login/type_tree.htm",
		  /*   onClick:function(node){
		      for(var x in node){
		       alert(x+"-----"+eval("node."+x));
		      }
		      if(node.attributes!=undefined){
		       alert("node's attributes is:"+node.attributes.url+"--"+node.attributes.name)
		      }
		     }*/
		    });
	}
}

function createFrame(url) {
	var s = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:99.4%;"></iframe>';
	return s;
}
/**
 * 增加一个tab.
 * @param subtitle tab的标题
 * @param url  tab里面显示的页面地址。默认以iframe的形式打开。  url带noIframe参数表示tab以非ifarme的形式打开（url?noIframe）。
 * @param icon tab的图标，可不填。
 * @param flag 特殊处理用
 */
moss.addTab=function(subtitle, url, flag, icon) {
	/*$.messager.progress({
		text : '页面加载中....',
		interval : 200
	});*/
	
	if(flag == "type") {//栏目
		subtitle = "栏目内容";
	}
	
	//特殊处理
	if(subtitle == ' 内容') {
		$('#letftAccordion').accordion("select", "内容栏目"); 
		loadLeftType();
		return ;
	}
	
	if (!$('#maintabs').tabs('exists', subtitle)) {
		//判断是否进行iframe方式打开tab，默认为href方式
		if(url.indexOf('noIframe') != -1){
			$('#maintabs').tabs('add', {
				title : subtitle,
				//----------------------------------------------------------------
				href : url,
				//----------------------------------------------------------------
				closable : true,
				icon : icon,
				tools:[{
					 	iconCls:'icon-reload', //icon-mini-refresh
				        handler:function(){  
				            //alert('refresh');  
				        }  
				}]
			});			
		}else{
			$('#maintabs').tabs('add', {
				title : subtitle,
				//----------------------------------------------------------------
				content : '<iframe src="' + url + '" frameborder="0" style="border:0;width:100%;height:99.4%;"></iframe>',
				//----------------------------------------------------------------
				closable : true,
				icon : icon,
				tools:[{
						iconCls:'icon-reload', //icon-mini-refresh 
				        handler:function(){  
				        	moss.updateTab(subtitle);//refresh tab
				        }  
				}]
			});			
		}

	} else {
		$('#maintabs').tabs('select', subtitle);
		
		if(flag == "type") {//栏目
			moss.updateTab(subtitle);//refresh tab
		}
	}
	//$.messager.progress('close');
	tabClose();

};

moss.getContextPath= function () {
	var pathName = document.location.pathname;
	var index = pathName.substr(1).indexOf("/");
	var result = pathName.substr(0, index + 1);
	return result;
};

/**
 * 刷新tab.
 */
moss.updateTab=function(subtitle,url) {
	if (self.parent.$('#maintabs').tabs('exists', subtitle)) {
		var currTab = self.parent.$('#maintabs').tabs('getTab', subtitle);
		if(url==undefined)
		   url = $(currTab.panel('options').content).attr('src');
		self.parent.$('#maintabs').tabs('update', {
			tab:currTab,
			options:{
				content : '<iframe src="' + url + '" frameborder="0" style="border:0;width:100%;height:99.4%;"></iframe>'
			}
		});
	}
};
/**
 * 显示消息。
 * 大家一些提示类的消息用这个。如：列表页面要删除一行，点删除按钮时没有选择一行，就用这个提示，不要弹框。
 * @param title
 * @param msg
 */
moss.show=function(title, msg) { 
    window.top.$.messager.show({    
    		title: title,  
            msg: msg,    
            showType: 'slide',
            style:{  
            	right:'',  
            	top:document.body.scrollTop+document.documentElement.scrollTop,  
            	bottom:''  
            	}  
      });   
	};

	/**
	 * 严重错误提示框。
	 * @param title
	 * @param msg
	 */
moss.error=function(title, msg) { 
	   $.messager.alert(title, msg, 'error');  
};

/**
 * 确认框。
 * @param title 确认标题 , 可以不填
 * @param msg 确认消息
 * @param callback 点ok后的执行的回调函数
 * @param callbackParam 回调函数的擦数，可以定义对象，数组等形式。
 */
moss.confirm=function(msg, callback, callbackParam, title) {
	if (!(title != undefined && title)) {
		title="确认信息";
	}
	 $.messager.confirm(title, msg, function (r) { 
	  if (r) {    
	      if (jQuery.isFunction(callback))   
	    	  //callback.call();   
	          callback(callbackParam);  
	       }    
	    });    
	};

	/**
	 * 进度条。 
	 * @param isShow true:显示进度条 ; false:关闭进度条
	 * @param title
	 * @param msg
	 */
moss.process=function(isShow, title, msg) {   
		  if (!isShow) {    
		    $.messager.progress('close'); 
		     return;    
		   }   
		   $.messager.progress({ //var win = $.messager.progress(   
		       title: title,    
		       msg: msg    
		  });  
	};
		
		/**
		 * 显示窗口
		 * @param title 窗口标题
		 * @param href 窗口里显示的内容链接地址
		 * @param width 宽
		 * @param height 高
		 * @param modal true:模态窗口；false:非模态窗口
		 * @param minimizable 是否显示最小化按钮
		 * @param maximizable 是否显示最大化按钮
		 */
moss.openWindow = function(title, href, width, height, modal, minimizable, maximizable) {  
	if($('#'+title).length<=0){
		$('body').append('<div id="' + title + '" class="easyui-dialog" closed="true"></div>');   	    
	}
	 $('#'+ title).window({  
		         title: title,   
		         width: width === undefined ? 600 : width,    
		         height: height === undefined ? 400 : height,    
		         content: '<iframe scrolling="yes" frameborder="0"  src="' + href + '" style="width:100%;height:98%;"></iframe>', //iframe方式  
		         // href: href === undefined ? null : href,//非iframe方式
		         modal: modal === undefined ? true : modal,  
		         minimizable: minimizable === undefined ? false : minimizable,  //minimizable: minimizable === undefined ? false : minimizable,
		         maximizable: maximizable === undefined ? false : maximizable,   
		         shadow: false,   
		         cache: false,   
		         closed: false,  
		         collapsible: false,  
		         resizable: false, 
		         left:50,
		         top:50,/*
		         onMove:function(left,top){
		        	 if(left < 0 || top < 0){
		        		 $(this).window("move",{"left":0,"top":0});
		        	 }
		         },*/
		         onMove:function(left,top){
		        	 if(left < 0){
		        		 $(this).window("move",{"left":0});
		        	 }
		        	 if(top < 0){
		        		 $(this).window("move",{"top":0});
		        	 }
		         },
		         loadingMessage: '正在加载数据，请稍等片刻......'   
		     });
}; 
/**
 * 关闭窗口
 * @param windowId 窗口id 
 */ 
moss.closeWindow = function(windowId){
	$('#'+windowId).window('close');
};

/**
 * 输入信息框
 * @param {} title option
 * @param {} msg option
 * @param {} callback required
 * @param {} callbackParam required 数组
 */
moss.prompt = function(title,msg, callback, callbackParam){
	if(title == '' || title == 'undefined'){
		title = '确定';
	}
	if(msg == '' || msg == 'undefined'){
		msg = '请输入信息';
	}
	$.messager.prompt(title,msg,function(r){
	  if(r){
	  	 if (jQuery.isFunction(callback)) {
	  	 	  if(jQuery.isArray(callbackParam)){
	  	 	  	callbackParam.push(r);
	  	 	  	callback(callbackParam);  
	  	 	  }
	  	 	  else{
	  	 	  	callback(callbackParam+',' +r);  
	  	 	  }	          
	       }  
	  }
	}); 
};

function tabClose() {
	/*双击关闭TAB选项卡*/
	$(".tabs-inner").dblclick(function(){
		var subtitle = $(this).children(".tabs-closable").text();
		$('#maintabs').tabs('close',subtitle);
	});
	/*为选项卡绑定右键*/
	$(".tabs-inner").bind('contextmenu',function(e){
		$('#mm').menu('show', {
			left: e.pageX,
			top: e.pageY
		});

		var subtitle =$(this).children(".tabs-closable").text();

		$('#mm').data("currtab",subtitle);
		$('#maintabs').tabs('select',subtitle);
		return false;
	});
}		
//绑定右键菜单事件
function tabCloseEven() {
	//刷新
	$('#mm-tabupdate').click(function(){
		var currTab = $('#maintabs').tabs('getSelected');
		var url = $(currTab.panel('options').content).attr('src');
		if(url != undefined && currTab.panel('options').title != 'Home') {
			$('#maintabs').tabs('update',{
				tab:currTab,
				options:{
					content:createFrame(url)
				}
			});
		}
	});
	//关闭当前
	$('#mm-tabclose').click(function(){
		var currtab_title = $('#mm').data("currtab");
		$('#maintabs').tabs('close',currtab_title);
	});
	//全部关闭
	$('#mm-tabcloseall').click(function(){
		$('.tabs-inner span').each(function(i,n){
			var t = $(n).text();
			if(t != 'Home') {
				$('#maintabs').tabs('close',t);
			}
		});
	});
	//关闭除当前之外的TAB
	$('#mm-tabcloseother').click(function(){
		var prevall = $('.tabs-selected').prevAll();
		var nextall = $('.tabs-selected').nextAll();		
		if(prevall.length>0){
			prevall.each(function(i,n){
				var t=$('a:eq(0) span',$(n)).text();
				if(t != 'Home') {
					$('#maintabs').tabs('close',t);
				}
			});
		}
		if(nextall.length>0) {
			nextall.each(function(i,n){
				var t=$('a:eq(0) span',$(n)).text();
				if(t != 'Home') {
					$('#maintabs').tabs('close',t);
				}
			});
		}
		return false;
	});
	//关闭当前右侧的TAB
	$('#mm-tabcloseright').click(function(){
		var nextall = $('.tabs-selected').nextAll();
		if(nextall.length==0){
			//msgShow('系统提示','后边没有啦~~','error');
			alert('后边没有啦~~');
			return false;
		}
		nextall.each(function(i,n){
			var t=$('a:eq(0) span',$(n)).text();
			$('#maintabs').tabs('close',t);
		});
		return false;
	});
	//关闭当前左侧的TAB
	$('#mm-tabcloseleft').click(function(){
		var prevall = $('.tabs-selected').prevAll();
		if(prevall.length==0){
			alert('到头了，前边没有啦~~');
			return false;
		}
		prevall.each(function(i,n){
			var t=$('a:eq(0) span',$(n)).text();
			$('#maintabs').tabs('close',t);
		});
		return false;
	});

	//退出
	$("#mm-exit").click(function(){
		$('#mm').menu('hide');
	});
}
























var j = moss;