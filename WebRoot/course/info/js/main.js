$(function(){
	initPage();
	initRate();
	initMsg();
	initDiscuss();
	initNote();
});

function initPage(){
	window.Account = {};
	Account.id = $("body").attr("data-account-id");
	Account.name = $("body").attr("data-account-name");
	Account.type = $("body").attr("data-account-type");
	if(typeof(Account.id) != "undefined" && Account.id != ""){
		window.hasLogined = true;
	}else{
		window.hasLogined = false;
	}

	if(Account.type == API.ACCOUNT.TYPE.USER){
		$("*[href='#discuss-mine-pane']").parents(".per-hide").removeClass("per-hide");
		$("#discuss-mine-pane").removeClass("per-hide");
		if($("body").attr("data-isattend").toLocaleLowerCase() == "true"){
			$("*[href='#note-mine-pane']").parents(".per-hide").removeClass("per-hide");
			$("#note-mine-pane").removeClass("per-hide");					
		}
		Discuss.getAll(0);
		Discuss.getMine(0);
		Note.getMine();
	}
	else if(Account.type == API.ACCOUNT.TYPE.TEACHER){
		$("*[href='#discuss-mine-pane']").parents(".per-hide").removeClass("per-hide");
		$("#discuss-mine-pane").removeClass("per-hide");		
		Discuss.getAll(0);
		Discuss.getMine(0);
	}
}

function initRate(){
	var rate = $("#rate");
	var gradeAll = rate.attr("data-grade-all");
	var gradeMine = rate.attr("data-grade-mine");
	var isReadOnly = (rate.attr("data-readonly") != "" 
		&& rate.attr("data-readonly").toLocaleLowerCase() == "true");
	var info = $(".rate-info");
	var mine = $(".rate-mine");
	info.html(gradeAll);
	mine.html(gradeMine == ""? "未评": gradeMine);
	rate.raty({
		number: 5,
		start: gradeAll/2,
		showHalf: true,
		readOnly: isReadOnly,
		onClick: function(score) {
			console.log(score);	//TODO
		}
	});
}

function initMsg(){
	$(".msg-title>a").click(function(event) {
		$("#msg-show-title").html($(this).html());
		$("#msg-show-content").html($("#content_dx").html());	//TODO: .load()
		$('#msg-show-modal').modal({backdrop:"static"});
		return false;
	});
}