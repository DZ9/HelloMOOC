$(function(){
	initPage();
	initVideo();
	initBarrage();
	initDiscuss();
	initNote();
});

function initPage(){
	setAsynLogin();
	$(".flowplayer").css("background-image", "url("+VIDEO_IMG+")");
	$(".page-navbar").removeClass("navbar-inverse").addClass("navbar-default");

	window.Account = {};
	Account.id = $("body").attr("data-account-id");
	Account.name = $("body").attr("data-account-name");
	Account.type = $("body").attr("data-account-type");
	if(typeof(Account.id) != "undefined" && Account.id != ""){
		hasLogined = true;
	}
	setTab(false);
}

function getTimeStrBySecond(sec){
	sec = Math.floor(sec);
	var h = Math.floor(sec/3600);
	var m = Math.floor(sec%3600/60);
	var s = Math.floor(sec%60);
	var str = (h<10?"0":"")+h+":"+(m<10?"0":"")+m+":"+(s<10?"0":"")+s;
	return str;
}


function reloadPage(account){
	var nav = $(".page-navbar");
	nav.load(NAVBAR, function(){
		nav.html(nav.find(".page-navbar").html());
		setAsynLogin();	
	});
	window.Account = account;
	setTab(true);
	
}

function setTab(isRefresh){
	if(Account.type == API.ACCOUNT.TYPE.USER){
		$("*[href='#discuss-mine-pane']").parents(".per-hide").removeClass("per-hide");
		$("#discuss-mine-pane").removeClass("per-hide");
		if($("body").attr("data-isattend").toLocaleLowerCase() == "true"){
			$("*[href='#note-mine-pane']").parents(".per-hide").removeClass("per-hide");
			$("#note-mine-pane").removeClass("per-hide");					
		}
		if(isRefresh){
			Discuss.getAll(Discuss.PageIndex);
			Discuss.getMine(0);
			Note.getMine();
		}
	}
	else if(Account.type == API.ACCOUNT.TYPE.TEACHER){
		$("*[href='#discuss-mine-pane']").parents(".per-hide").removeClass("per-hide");
		$("#discuss-mine-pane").removeClass("per-hide");
		if(isRefresh){
			Discuss.getAll(Discuss.PageIndex);
			Discuss.getMine(0);
		}
	}
}