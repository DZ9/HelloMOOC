function initBarrage(){

	initBarrageObj();

	var ctrlHolder = $(".barrage-control-holder");
	var controlBtn = $("#barrage-control-btn");
	var publishBtn = $("#barrage-publish-btn");
	var cancelBtn = $("#barrage-cancel-btn");
	var input = $("#barrage-text-input");
	var player = $("#player");
	var api = flowplayer(player);
	var area = $(".barrage-area");
	ctrlHolder.addClass("per-hide");
	ctrlHolder.hide();
	setEnabled(publishBtn, false);
	cancelBtn.hide();

	input.keydown(function(event) {
		if(event.which == 13)
			publish();
	});
	publishBtn.on("click", publish);
	controlBtn.on("click", toggleBarrage);
	cancelBtn.on("click", cancel);
	input.focusin(function(){
			cancelBtn.show();
			tryToPauseVideo();
	})
	.focusout(function(){
		if(input.val().trim().length == 0 && api.playing)
			cancel();
	})
	.on("propertychange input", function(){
		setEnabled(publishBtn, ($(this).val().length > 0));
	});
	player.on("resume", adjustBarrageArea);
	player.on("resume", function(){ctrlHolder.show("fast");});
	player.on("finish", function(){
		ctrlHolder.hide("fast");
		$("#barrage-list>.active").removeClass("active");
	});
	player.on("progress", showItem);
	$(window).on("resize scroll", adjustBarrageArea);

	function cancel(){
		input.val("");
		setEnabled(publishBtn, false);
		cancelBtn.hide();
		tryToPlayVideo();
	}
	function tryToPauseVideo(){
		if(api.playing){
			player.addClass("is-paused-for-input");
			api.pause();
		}
	}
	function tryToPlayVideo(){
		if(player.hasClass("is-paused-for-input") && input.val().length == 0){
			player.removeClass("is-paused-for-input");
			api.play();
		}
	}
	function showItem(e, api){
		var time = api.video.time;
		if(Barrage.isOn){
			if(Math.abs(time - Video.lastTime) > 1){	//跳跃播放时
				console.log("resetStatus");
				area.children("*:not(.template)").remove();	//清除正在滚动的弹幕
				Barrage.resetStatus(api.video.time*10);			
			}
 			Barrage.showItem(api.video.time*10);
		}
		Video.lastTime = time;
	}
	function adjustBarrageArea(){
		if(!player.hasClass("player-float")){
	 		area.offset({top:player.offset().top, left:player.offset().left});
	 		area.width(player.width());
	 		area.height(player.height()*0.8);			
		}
	}
	function publish(){
		if(!hasLogined){
			msg("需要登录", "请登录后操作。");
			return;
		}
		if(Account.type != API.ACCOUNT.TYPE.USER && Account.type != API.ACCOUNT.TYPE.TEACHER){
			msg("发布弹幕", "您的账号类型不能发布弹幕。");
			return;
		}
		var text = input.val().trim();
		var time = Math.ceil(api.video.time*10) + 5;	//延迟0.5秒
		if(text.length == 0) return;
		var $btn = publishBtn.button('loading');
		$.ajax({
			url: API.BARRAGE.PUBLISH,
			type: "post",
			data: {id:Barrage.vid, time:time, text:text}
		})
		.done(function(req) {
			if("req" == "") return;
			req = toJSON(req);
			Barrage.pool.push(req);
			Barrage.pool[Barrage.pool.length-1].hasShowed = false;
			Barrage.pool[Barrage.pool.length-1].isCanRemove = true;
			Barrage.sort();
			Barrage.refreshListView();
		})
		.always(function(){
			$btn.button('reset');
			publishBtn.focus();
			cancel();
		});
		
	}
}

//切换弹幕状态
function toggleBarrage(){
	if(!Barrage.isOn){
		openBarrage();
	}else{
		closeBarrage();
	}
}

function openBarrage(){
	Barrage.isOn = true;
	$(".barrage-area").show();
	setEnabled($("#barrage-text-input, #barrage-publish-btn"), true);
}

function closeBarrage(){
	Barrage.isOn = false;
	$(".barrage-area").hide();
	$("#barrage-cancel-btn").click();
	setEnabled($("#barrage-text-input, #barrage-publish-btn"), false);
	$("#barrage-list>*").removeClass("active");
}

function initBarrageObj(){
	var ctrlHolder = $(".barrage-control-holder");
	var list = $("#barrage-list");
	var template = list.find(".template").clone(true,true).removeClass("template").remove();
	var player = $("#player");
	var api = flowplayer(player);

	window.Barrage = {};
	Barrage.isOn = true;
	Barrage.curIndex = 0;
	Barrage.vid = $("body").attr("data-vid");
	Barrage.pool = new Array();

	Barrage.init = function(){
		this.getPool();
	};
	Barrage.getPool = function(){
		$.ajax({
			url: API.BARRAGE.GET,
			data: {vid:Barrage.vid}
		})
		.done(function(req) {
			req = toJSON(req);
			Barrage.pool = [];
			for(var i = 0; i < req.count; i++){
				Barrage.pool.push(req.items[i]);
				Barrage.pool[i].hasShowed = false;
			}
			Barrage.sort();
			Barrage.refreshListView();
			ctrlHolder.removeClass("per-hide");
		})
		.fail(function() {
			//TODO
		});
	};
	Barrage.sort = function(){
		this.pool.sort(function(a,b){return a.time-b.time;});
	};
	Barrage.resetStatus = function(time){	//time之前设为已显示，之后设为未显示
		var pool = this.pool;
		var length = pool.length;
		for(var i = 0; i < length; i++){
			pool[i].hasShowed = (time > pool[i].time);
		}
		this.curIndex = length;
		for(var i = 0; i < length; i++){
			if(!pool[i].hasShowed){
				this.curIndex = i;
				break;
			}
		}
		console.log("Time: "+time+"  curIndex: "+this.curIndex);
	};
	Barrage.showItem = function(time){
		while(this.curIndex < this.pool.length 
			&& time >= this.pool[this.curIndex].time){
			this.addItemToFront(this.curIndex++);
		}
	};
	Barrage.addItemToFront = function(index){
 		$("#barrage-list>.active").removeClass("active");
 		$("#barrage-list>*[data-barrage-index='"+index+"']").addClass("active");
 		var area = $(".barrage-area");
 		var item = area.find(".template").clone(true,true).removeClass("template");
 		item.html(this.pool[index].text).appendTo(area);
 		item.css("font-size", (area.width() / 42) + "px");
 		var height = item.height();
 		var top = (Math.random()+Math.random())/2 * ((area.height() - height));
 		top = Math.floor(top / height) * height;
 		var left = area.width() + item.width();
 		item.css("top", top + "px");
 		item.animate(
			{left : "-=" + left + "px"},
 			8000,
 			"linear",
 			function(){$(this).remove();}
 		);
	};
	Barrage.refreshListView = function(){
		var pool = this.pool;
		var length = pool.length;
		list.children().remove();
		$("*[href='#barrage-list-pane']>.pane-info").html(length);
		for(var i = 0; i < length; i++){
	 		var item = template.clone(true,true);
	 		item.find(".remove-barrage-btn").addClass(pool[i].isCanRemove?"":"per-hide");
	 		item.attr("title", pool[i].userName)
	 			.attr("data-barrage-index", i)
	 			.attr("data-barrage-time", pool[i].time/10)
	 			.attr("data-barrage-id", pool[i].id);
	 		item.find(".barrage-time").html(getTimeStrBySecond(pool[i].time/10));
	 		item.find(".barrage-text").html(pool[i].text);
	 		item.appendTo(list);
		}
		$(".remove-barrage-btn").click(function(event) {
			var id = $(this).parents("*[data-barrage-id]").attr("data-barrage-id");
			Barrage.removeById(id);
			return false;
		});
		list.find(".list-group-item").click(function(event) {
			if(Barrage.isOn){
				api.seek($(this).attr("data-barrage-time"));
				//$('body').scrollTop(0);	//滚动置顶
				api.play();
			}
			return false;
		});
	};
	Barrage.removeById = function(id){
		$.ajax({
			url: API.BARRAGE.REMOVE,
			data: {id:id}
		})
		.done(function(req) {
			if(req == "0"){
				var len = Barrage.pool.length;
				for(var i = 0; i < len; i++){
					if(Barrage.pool[i].id == id){
						Barrage.pool.splice(i, 1);
						break;
					}
				}
				$("*[data-barrage-id='"+id+"']").remove();
				$("*[href='#barrage-list-pane']>.pane-info").html(len-1);
			}
		});
	}

	Barrage.init();
}