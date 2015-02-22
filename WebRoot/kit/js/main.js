function clipPic(img, width, height){
	var w= img.width;
	var h = img.height;
	var scale1 = width / height;
	var scale2 = w / h;
	var sw, sh, sx, sy;
	if(scale1 < scale2){
		sh = h;
		sw = h * scale1;
		sx = (w - sw) / 2;
		sy = 0;
	}else{
		sw = w;
		sh = w / scale1;
		sx = 0;
		sy = (h - sh) / 2;
	}
	var canvas = document.createElement('canvas');
	canvas.width = width;
	canvas.height = height;
	var ctx = canvas.getContext("2d");
	ctx.drawImage(img, sx, sy, sw, sh, 0, 0, width, height);
	return canvas.toDataURL();
}


$(function(){
	initHash();
	initPageMsg();
});

//将Tab页与地址相关联
function initHash(){
	$(".nav-tabs a").click(function(event) {
		window.location.hash = $(this).attr("href");
	});
	var hash = window.location.hash.split("?")[0];
	if(hash != ""){
		$("a[href='"+hash+"']").click();		
	}
}

//初始页面提示
function initPageMsg(){
	var title = $("body").attr("data-msg-title");
	var text = $("body").attr("data-msg-text");
	if(typeof(text) != "undefined" && text != ""){
		if(typeof(title) == "undefined" || title == ""){
			msg(text);
		}else{
			msg(title, text);
		}
	}
}

function msg(title, text, callback){
	var num = arguments.length;
	var modal = $("#message-modal");
	var mTitle = $("#message-modal-title");
	var mText = $("#message-modal-content");
	var cancelBtn = $("#message-modal-cancel-btn");
	var confirmBtn = $("#message-modal-confirm-btn");
	cancelBtn.addClass("hide");
	if(num == 1){
		mTitle.html(TITLE);
		mText.html(title);
	}
	else if(num >= 2){
		mTitle.html(title);
		mText.html(text);
		if(num == 3){
			cancelBtn.removeClass("hide");
			confirmBtn.unbind("click").on("click", callback);
		}
	}
	modal.modal({backdrop:"static"});
}

/* 分页导航条设置
* count - 显示页数
* total - 总页数
* index - 页序（0）
*/
function setPagination(tar, callback, count, total, index){
	if(total <= 0 || count <= 0 || index < 0){
		tar.hide(); return;
	}
	var minLink = tar.children(".template.page-min").clone(true).removeClass("template");
	var maxLink = tar.children(".template.page-max").clone(true).removeClass("template");
	var indexLink = tar.children(".template.page-index").clone(true).removeClass("template");	
	var startIndex = index - Math.floor(count/2);
	count = total < count? total: count;	
	startIndex = (startIndex + count < total)? startIndex: (total - count);
	startIndex = startIndex < 0? 0: startIndex;	
	tar.children("*:not(.template)").remove();
	if(index == startIndex){
		minLink.addClass("hide");
	}else{
		minLink.click(function(event) {
			callback("min");
		});
	}
	if(index >= total - 1){
		maxLink.addClass("hide");
	}else{
		maxLink.click(function(event) {
			callback("max");
		});
	}
	tar.prepend(minLink);
	for(var i = 0; i < count; i++){
		var iLink = indexLink.clone(true);
		var html = iLink.html();
		iLink.addClass(startIndex == index? "active": "");
		startIndex++;
		html = html.replace("[index]", startIndex-1).replace("[num]", startIndex);
		iLink.html(html);
		iLink.unbind('click').click(function(event) {
			callback($(this).find("a").attr("data-to-page"));
		});
		iLink.appendTo(tar);
	}
	maxLink.appendTo(tar);
	tar.show();
}

function toJSON(str){
	return eval('(' + str + ')');
}

function putValue(str, name, value){
	return str.replace(new RegExp("\\["+name+"\\]","gm"), value);
}

function setEnabled(tar, isEnabled){
	if(isEnabled)
		tar.removeAttr("disabled");
	else
		tar.attr("disabled","disabled");
}