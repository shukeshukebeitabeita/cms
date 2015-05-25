$(function() {


});

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




var recommend_template_data = '<li><a href="{contentUrl}" title="{title}" target="_blank">{title}</a></li>';
//推荐/热门
function hotContent(htmlId, type_id, count){
	var recommend_template = '<h3 class="right-type-title"><span>热门推荐</span></h3><ol class="list-unstyled" id="'+ htmlId + '_li"></ol>';
	var delUrl = contextPath + "/c/get.htm";
	var data = {
			"type_id" : type_id,
			"count" : 5,
			"hasLatest" : 1,
		};
	
	$("#" + htmlId).append(recommend_template);
	$.post(delUrl, data, function(d) {
		if (d.result == "Y") {
			$.each(d.data, function(index, oneData) {
				//var title_tip = oneData.title.substring(3+index);
				var contentUrl = htmlPath + oneData.url + oneData.content_id+".html";
				var tempLi = recommend_template_data.format({
					title : oneData.title,
					publish_time : oneData.publish_time,
					contentUrl :contentUrl,
					default_img : staticRoot + oneData.default_img,
					contextPath:contextPath
				});
				// alert(tempLi);
				$("#" + htmlId + "_li").append(tempLi);
			});
		} else {
			//console('信息', d.message);
		}
	}, "json");
}


//最新
var  new_template= '<h3 class="right-type-title" style="margin-top: 0px;"><span>最新</span></h3>';
var new_template_data = '<div class="media">'
	  +'<div class="media-left media-middle">'
	  +'<a href="{contentUrl}" target="_blank">'
	  +'<img class="media-object" src="{default_img}" alt="{title}" width="100px" height="75px">'
	  +'</a>'
	  +'</div>'
	  +'<div class="media-body">'
	  +'<h2 class="media-heading blog-post-title"><a href="{contentUrl}" title="{title}" target="_blank">{title}</a></h2>'
	  +'<p class="blog-post-meta">{publish_time}<!--<a href="#">Chris</a>  --> </p>'
	  +'</div>'
	  +'</div>';


function newContent(htmlId, type_id, count){
	var delUrl = contextPath + "/c/get.htm";
	var data = {
			"type_id" : type_id,
			"count" : 5,
			"hasHot" : 1,
		};
	
	$("#" + htmlId).append(new_template);
	$.post(delUrl, data, function(d) {
		if (d.result == "Y") {
			$.each(d.data, function(index, oneData) {
				//var title_tip = oneData.title.substring(3+index);
				var contentUrl = htmlPath + oneData.url + oneData.content_id+".html";
				var tempLi = new_template_data.format({
					title : oneData.title,
					publish_time : oneData.publish_time,
					contentUrl :contentUrl,
					default_img : staticRoot + oneData.default_img,
					contextPath:contextPath
				});
				// alert(tempLi);
				$("#" + htmlId).append(tempLi);
			});
		} else {
			//console('信息', d.message);
		}
	}, "json");
}


//最近一周，最近一个月排行。  ---待实现。。。


