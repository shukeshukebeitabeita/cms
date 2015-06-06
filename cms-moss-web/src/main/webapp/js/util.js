//时间格式化
Date.prototype.format = function(format) {
	if (!format) {
		format = "yyyy-MM-dd hh:mm:ss";
	}
	var o = {
		"M+" : this.getMonth() + 1, // month
		"d+" : this.getDate(), // day
		"h+" : this.getHours(), // hour
		"m+" : this.getMinutes(), // minute
		"s+" : this.getSeconds(), // second
		"q+" : Math.floor((this.getMonth() + 3) / 3), // quarter
		"S" : this.getMilliseconds()
	// millisecond
	};
	if (/(y+)/.test(format)) {
		format = format.replace(RegExp.$1, (this.getFullYear() + "")
				.substr(4 - RegExp.$1.length));
	}
	for ( var k in o) {
		if (new RegExp("(" + k + ")").test(format)) {
			format = format.replace(RegExp.$1, RegExp.$1.length == 1
					? o[k]
					: ("00" + o[k]).substr(("" + o[k]).length));
		}
	}
	return format;
};
function fomatDate(str) {
	return (new Date(parseInt(str))).format("yyyy-MM-dd hh:mm:ss");
}
// 前台调用：
function formatMyDate(value, row, index) {
	return fomatDate(value);
}

//get system time ;yyyy-MM-dd hh:mm:ss
function getTime(){
	var now=new Date();
	var year=now.getFullYear();
	var month=now.getMonth()+1;
	var day=now.getDate();
	var hours=now.getHours();
	var minutes=now.getMinutes();
	var seconds=now.getSeconds();
	return  ""+year+"-"+month+"-"+day+"- "+hours+":"+minutes+":"+seconds;
	////一秒刷新一次显示时间
	//var timeID=setTimeout(showTime,1000);
}

/**
 * 去id为formName的元素内的input框类型为text的空格。 当焦点失去的时候生效。
 * 
 * @param formName
 */
function inputTrim(formName) {
	$('#' + formName + ' input[type="text"]').blur(function() {
		$(this).val($.trim($(this).val()));
	});
}

/*
 * 判空。 左右空白验证时会忽略。
 */
function isNull(str) {
	if (str != null && str != '' && str.Trim() != '') {
		return false;
	}
	return true;
}

function isNotNull(str) {
	
	return !isNull(str);
}

// 去空格
String.prototype.Trim = function() {
	var m = this.match(/^\s*(\S+(\s+\S+)*)\s*$/);
	return (m == null) ? "" : m[1];
};

/**
 * format方法。 eg: 两种调用方式 var template1="我是{0}，今年{1}了"; var
 * template2="我是{name}，今年{age}了"; var result1=template1.format("loogn",22); var
 * result2=template1.format({name:"loogn",age:22}); 两个结果都是"我是loogn，今年22了"
 * 
 * @param {}
 *            args
 * @return {String}
 */
String.prototype.format = function(args) {
	if (arguments.length > 0) {
		var result = this;
		if (arguments.length == 1 && typeof (args) == "object") {
			for ( var key in args) {
				var reg = new RegExp("({" + key + "})", "g");
				result = result.replace(reg, args[key]);
			}
		} else {
			for ( var i = 0; i < arguments.length; i++) {
				if (arguments[i] == undefined) {
					return "";
				} else {
					var reg = new RegExp("({[" + i + "]})", "g");
					result = result.replace(reg, arguments[i]);
				}
			}
		}
		return result;
	} else {
		return this;
	}
};
/**
 * 根据参数名获取地址栏参数值
 * 
 * @type {}
 * @author lhj
 */
Request = {
	QueryString : function(item) {
		var svalue = location.search.match(new RegExp("[\?\&]" + item
				+ "=([^\&]*)(\&?)", "i"));
		return svalue ? svalue[1] : svalue;
	},
	QueryStringByUrl : function(url, item) {
		var svalue = url.match(new RegExp("[\?\&]" + item + "=([^\&]*)(\&?)",
				"i"));
		return svalue ? svalue[1] : svalue;
	}
};

// -------扩展easyui validatebox start----------------

/**
 * 扩展easyui的validator插件rules，支持更多类型验证 auther by lhj
 * 
 * date : 2013 - 06 -06
 */
$
		.extend(
				$.fn.validatebox.defaults.rules,
				{
					minLength : { // 判断最小长度
						validator : function(value, param) {
							return value.length >= param[0];
						},
						message : '最少输入 {0} 个字符。'
					},
					length : {
						validator : function(value, param) {
							var len = $.trim(value).length;
							return len >= param[0] && len <= param[1];
						},
						message : "输入内容长度必须介于{0}和{1}之间."
					},
					phone : {// 验证电话号码
						validator : function(value) {
							return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i
									.test(value);
						},
						message : '格式不正确,请使用下面格式:020-88888888'
					},
					mobile : {// 验证手机号码
						validator : function(value) {
							return /^(13|15|18)\d{9}$/i.test(value);
						},
						message : '手机号码格式不正确'
					},
					idcard : {// 验证身份证
						validator : function(value) {
							return /^\d{15}(\d{2}[A-Za-z0-9])?$/i.test(value);
						},
						message : '身份证号码格式不正确'
					},
					intOrFloat : {// 验证整数或小数
						validator : function(value) {
							return /^\d+(\.\d+)?$/i.test(value);
						},
						message : '请输入数字，并确保格式正确'
					},
					currency : {// 验证货币
						validator : function(value) {
							return /^\d+(\.\d+)?$/i.test(value);
						},
						message : '货币格式不正确'
					},
					qq : {// 验证QQ,从10000开始
						validator : function(value) {
							return /^[1-9]\d{4,9}$/i.test(value);
						},
						message : 'QQ号码格式不正确'
					},
					integer : {// 验证整数
						validator : function(value) {
							return /^[+]?[1-9]+\d*$/i.test(value);
						},
						message : '请输入整数'
					},
					chinese : {// 验证中文
						validator : function(value) {
							return /^[\u0391-\uFFE5]+$/i.test(value);
						},
						message : '请输入中文'
					},
					english : {// 验证英语
						validator : function(value) {
							return /^[A-Za-z]+$/i.test(value);
						},
						message : '请输入英文'
					},
					unnormal : {// 验证是否包含空格和非法字符
						validator : function(value) {
							return /.+/i.test(value);
						},
						message : '输入值不能为空和包含其他非法字符'
					},
					username : {// 验证用户名
						validator : function(value) {
							return /^[a-zA-Z][a-zA-Z0-9_]{5,15}$/i.test(value);
						},
						message : '该项不合法（字母开头，允许6-16字节，允许字母数字下划线）'
					},
					faxno : {// 验证传真
						validator : function(value) {
							// return /^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[
							// ]){1,12})+$/i.test(value);
							return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i
									.test(value);
						},
						message : '传真号码不正确'
					},
					zip : {// 验证邮政编码
						validator : function(value) {
							return /^[1-9]\d{5}$/i.test(value);
						},
						message : '邮政编码格式不正确'
					},
					ip : {// 验证IP地址
						validator : function(value) {
							return /d+.d+.d+.d+/i.test(value);
						},
						message : 'IP地址格式不正确'
					},
					name : {// 验证姓名，可以是中文或英文
						validator : function(value) {
							return /^[\u0391-\uFFE5]+$/i.test(value)
									| /^\w+[\w\s]+\w+$/i.test(value);
						},
						message : '请输入姓名'
					},
					carNo : {
						validator : function(value) {
							return /^[\u4E00-\u9FA5][\da-zA-Z]{6}$/.test(value);
						},
						message : '车牌号码无效（例：粤J12350）'
					},
					carenergin : {
						validator : function(value) {
							return /^[a-zA-Z0-9]{16}$/.test(value);
						},
						message : '发动机型号无效(例：FG6H012345654584)'
					},
					email : {
						validator : function(value) {
							return /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/
									.test(value);
						},
						message : '请输入有效的电子邮件账号(例：abc@126.com)'
					},
					msn : {
						validator : function(value) {
							return /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/
									.test(value);
						},
						message : '请输入有效的msn账号(例：abc@hotnail(msn/live).com)'
					},
					same : {
						validator : function(value, param) {
							if ($("#" + param[0]).val() != "" && value != "") {
								return $("#" + param[0]).val() == value;
							} else {
								return true;
							}
						},
						message : '两次输入的密码不一致！'
					},
					bigDecemal : {
						validator : function(value) {
							var reg1 = /^\d+(\.{0,1}\d{1,2})?$/;
							return reg1.test(value);
						},
						message : '货币格式不正确(最多保留两位小数)'
					},
					percent : {
						validator : function(value) {
							var reg1 = /^\d+(\.{0,1}\d{1,2})?$/;
							if (reg1.test(value)) {
								if (Number(value) <= 0) {
									return false;
								}
								return true;
							} else {
								return false;
							}

						},
						message : '百分比格式不正确(最多保留两位小数,且不能为0)'
					},
					no : {// 验证19位数字编号
						validator : function(value) {
							return /[0-9]{0,19}$/i.test(value);
						},
						message : '请输入19位数字编号'
					}

				});

$.extend($.fn.validatebox.methods, {
	// remove 验证
	remove : function(jq, newposition) {
		return jq.each(function() {
			$(this).removeClass("validatebox-text validatebox-invalid").unbind(
					'focus').unbind('blur');
		});
	},
	// 还原验证
	reduce : function(jq, newposition) {
		return jq.each(function() {
			var opt = $(this).data().validatebox.options;
			$(this).addClass("validatebox-text").validatebox(opt);
		});
	}
});
// -------扩展easyui validatebox end----------------

/**
 * 复制内容至剪切板
 * 
 * @param txt
 * @returns {Boolean}
 */
function copyToClipboard(txt) {
	if (window.clipboardData) {
		window.clipboardData.clearData();
		window.clipboardData.setData("Text", txt);
	} else if (navigator.userAgent.indexOf("Opera") != -1) {
		window.location = txt;
	} else if (window.netscape) {
		try {
			netscape.security.PrivilegeManager
					.enablePrivilege("UniversalXPConnect");
		} catch (e) {
			alert("您的firefox安全限制限制您进行剪贴板操作，请打开’about:config’将signed.applets.codebase_principal_support’设置为true’之后重试，相对路径为firefox根目录/greprefs/all.js");
			return false;
		}
		var clip = Components.classes['@mozilla.org/widget/clipboard;1']
				.createInstance(Components.interfaces.nsIClipboard);
		if (!clip)
			return;
		var trans = Components.classes['@mozilla.org/widget/transferable;1']
				.createInstance(Components.interfaces.nsITransferable);
		if (!trans)
			return;
		trans.addDataFlavor('text/unicode');
		//var str = new Object();
		//var len = new Object();
		var str = Components.classes["@mozilla.org/supports-string;1"]
				.createInstance(Components.interfaces.nsISupportsString);
		var copytext = txt;
		str.data = copytext;
		trans.setTransferData("text/unicode", str, copytext.length * 2);
		var clipid = Components.interfaces.nsIClipboard;
		if (!clip)
			return false;
		clip.setData(trans, null, clipid.kGlobalClipboard);
	}
}


$(function() {
	//鼠标移入移出表格行变色效果
	$('.gridtable').find('tr').hover(function() {
		$(this).css('background', '#fffcd8');
	}, //鼠标移入
	function() {
		$(this).css('background', '#fff');
	} //鼠标移出
	);
});

