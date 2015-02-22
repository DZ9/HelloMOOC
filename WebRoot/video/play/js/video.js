function initVideo(){
	initVideoObj();
	var holder = $(".player-holder");
	var floatMask = $(".player-float-mask");
	var player = $("#player");
	var api = flowplayer(player);
	var barrageArea = $(".barrage-area");
	// 视频下拉浮动
	$(window).on("scroll", tryToFloatVideo);
	$(player).on("seek", tryToFloatVideo);	
	// 点击浮动视频时隐藏
	$(".player-float-mask").on("click", function(){
		$("#player, .player-float-mask").addClass("player-float-hide");
	});
	
	player.on("finish", unfloatVideo);	//播放结束时关闭浮动
	
	function tryToFloatVideo(){
		var isPlaying = api.playing;
		if(!isPlaying) return;
		var offset = $(window).scrollTop() - holder.height() - holder.offset().top;
		var shouldFloat = (offset > 0);
		if(shouldFloat){
			floatVideo();
		}else{
			unfloatVideo();
		}
	}
	function floatVideo(){
		if(!player.hasClass("player-float")){
			holder.css("height", holder.height()+"px");
			player.addClass("player-float");
			floatMask.height(player.height()+30);
		}
	}
	function unfloatVideo(){
		if(player.hasClass("player-float")){
			player.removeClass("player-float player-float-hide");
			floatMask.removeClass("player-float-hide");
			holder.css("height", "");
			floatMask.height(0);
		}
	}
}

function initVideoObj(){
	window.Video = {};
	Video.lastTime = 0;
}