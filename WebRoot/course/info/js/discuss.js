function initDiscuss(){
	var showPaneBtn = $(".show-reply-pane-btn");
	var removeBtn = $(".discuss-remove-btn");
	var publishBtn = $("#discuss-publish-btn");
	var replyBtn = $("#reply-btn");
	var replyCancelBtn = $("#reply-cancel-btn");
	var cid = $("body").attr("data-cid");
	
	replyCancelBtn.click(function(event) {
		var curListItem = $(this).parents(".discuss-item");
		var curCtrlPane = curListItem.children(".discuss-ctrl");
		var replyPane = $(this).parents(".reply-pane");
		curCtrlPane.show();
		replyPane.remove();
	});
	replyBtn.click(function(event) {
		var pid = $(this).parents("*[data-id]").attr("data-id");
		var text = $(this).parents(".reply-pane").find("#reply-input").val().trim();
		if(text == "") return;
		var $btn = replyBtn.button('loading');
		replyCancelBtn.hide();
		$.ajax({
			url: API.DISCUSS.PUBLISH,
			type: "post",
			data: {pid: pid, cid: cid, text:text}
		})
		.done(function(req) {
			if(req == 0){
				Discuss.getAll(Discuss.pageIndex);
				Discuss.getMine(Discuss.pageMineIndex);
				curCtrlPane.show();
				replyPane.remove();					
			}
			else{
				msg("回复讨论", "回复失败。");
				$btn.button('reset');
				replyCancelBtn.show();
			}
		})
		.fail(function(){
			msg("回复讨论", "回复失败。");
			$btn.button('reset');
			replyCancelBtn.show();
		});
	});
	
	var replyPaneTemp = $(".reply-pane.template").clone(true).removeClass("template");

	showPaneBtn.click(function(event) {
		var curListItem = $(this).parents(".discuss-item");
		var curCtrlPane = $(this).parents(".discuss-ctrl");
		var replyPane = replyPaneTemp.clone(true);
		var input = replyPane.find("#reply-input");
		curCtrlPane.hide();
		replyPane.appendTo(curListItem);
		input.focus();
	});

	removeBtn.click(function(){
		var id = $(this).parents("*[data-id]").attr("data-id");
		msg("删除讨论", "您确定要删除此条讨论吗？", function(){
			$.ajax({
				url: API.DISCUSS.REMOVE,
				data: {id: id}
			})
			.done(function(req) {
				if(req == 0){
					Discuss.getAll(Discuss.pageIndex);
					Discuss.getMine(Discuss.pageMineIndex);
				}
				else{
					msg("删除讨论", "删除失败。");
				}
			});
			
		});
	});

	$(".discuss-item").click(function(event) {
		if($(this).hasClass("unread")){
			var id = $(this).attr("data-id");
			var that = $(this);
			$.ajax({
				url: API.DISCUSS.UNREAD,
				data: {id: id}
			})
			.done(function(req) {
				if(req != -1){
					$(".unread-count").html(req);
					that.removeClass("unread");
				}
			});
		}
		$(this).removeClass("target");
	});

	$("#discuss-readall-btn").click(function(event) {
		$.ajax({
			url: API.DISCUSS.UNREAD
		})
		.done(function(req) {
			if(req != -1){
				$(".unread-count").html("0");
				$(".discuss-item").removeClass("unread");				
			}
		});
		return false;
	});

	initDiscussObj();

	publishBtn.click(function(){
		if(!hasLogined){
			msg("需要登录", "请登录后操作。");
			return;
		}
		if(Account.type != API.ACCOUNT.TYPE.USER && Account.type != API.ACCOUNT.TYPE.TEACHER){
			msg("发表讨论", "您的账号类型不能发表新的讨论内容。");
			return;
		}
		var isToTeacher = $("#at-teacher-check").is(":checked");
		var input = $("#discuss-input");
		var text = input.val().trim();
		if(text == "") return;
		var $btn = publishBtn.button('loading');
		setEnabled(input, false);
		$.ajax({
			url: API.DISCUSS.PUBLISH,
			data: {pid: (isToTeacher? -2: -1), cid: Discuss.cid, text: text}
		})
		.done(function(req) {
			if(req == 0){
				input.val("");
				Discuss.getAll(Discuss.pageIndex);
				Discuss.getMine(Discuss.pageMineIndex);
			}
			else{
				msg("发表讨论", "发表失败。");
			}
		})
		.always(function(){
			setEnabled(input, true);
			$btn.button('reset');
		});
	});
}

function initDiscussObj(){
	var listAll = $("#discuss-all-list");
	var listMine = $("#discuss-mine-list");
	var template = $(".discuss-item.template").clone(true).removeClass("template");

	window.Discuss = {};
	Discuss.pageNavCount = PAGE_NAV_COUNT;
	Discuss.maxItemCount = MAX_ITEM_COUNT;
	Discuss.PageIndex = 0;
	Discuss.PageMineIndex = 0;
	Discuss.cid = $("body").attr("data-cid");

	Discuss.init = function(){
		Discuss.getAll(0);
	}

	Discuss.getAll = function(index){
		$.ajax({
			url: API.DISCUSS.GET_BY_COURSE,
			data: {cid:Discuss.cid, count:Discuss.pageNavCount, index:index},
		})
		.done(function(req) {
			if(req == "") return;
			Discuss.refreshListView(toJSON(req));
		});	
	}
	Discuss.getMine = function(index){
		$.ajax({
			url: API.DISCUSS.GET,
			data: {id:Account.id, type:Account.type, cid:Discuss.cid, count:Discuss.maxItemCount, index:index}
		})
		.done(function(req) {
			if(req == "") return;
			Discuss.refreshMineListView(toJSON(req));
		});	
	}

	Discuss.refreshListView = function(discuss){
		var items = discuss.items;
		var length = items.length;
		var total = discuss.total;
		Discuss.PageIndex = discuss.index;
		listAll.children().remove();
		for(var i = 0; i < length; i++){
	 		var item = template.clone(true);
	 		item.attr("id", "discuss-item-"+items[i].id)
	 			.attr("data-id", items[i].id)
	 			.attr("data-pid", items[i].pid);
	 		item.addClass(items[i].isUnread? "unread": "");
	 		item.find('.avatar').attr("src", HOMEPATH + items[i].avatarURL);
	 		item.find('.name').attr("href", items[i].userLink).html(items[i].userName)
	 			.addClass(items[i].userType == API.ACCOUNT.TYPE.TEACHER? "heightline": "");
	 		item.find('.date').html(items[i].date);
	 		item.find('.discuss-text').html(items[i].text);
	 		if(items[i].pid == -1){
	 			item.find('.reply-to').hide();
	 		}
	 		else if(items[i].pid == -2){
				item.find('.reply-to').html("教师");
	 		}
	 		else{
	 			item.find('.reply-to').html(items[i].replyToInfo);
	 		}
	 		if(!items[i].isCanRemove){
	 			item.find('.discuss-remove-btn').addClass('per-hide');
	 		}
	 		if(!items[i].isCanReply){
	 			item.find('.show-reply-pane-btn').addClass('per-hide');
	 		}
	 		item.appendTo(listAll);
		}
		$("*[href='#discuss-all-pane']>.pane-info").html(total);
		setPagination($(".pagination-discuss-all"), function(index){
			index = (index == "min"? 0: index);
			index = (index == "max"? 9999999: index);
			Discuss.getAll(index);
		}, 
		Discuss.pageNavCount, Math.ceil(total / Discuss.maxItemCount), Discuss.PageIndex);
	}
	Discuss.refreshMineListView = function(discuss){
		var items = discuss.items;
		var length = items.length;
		var total = discuss.total;
		var unreadCount = discuss.unreadCount;
		Discuss.PageMineIndex = discuss.index;
		listMine.children().remove();
		for(var i = 0; i < length; i++){
	 		var item = template.clone(true);
	 		item.attr("id", "discuss-item-"+items[i].id)
	 			.attr("data-id", items[i].id)
	 			.attr("data-pid", items[i].pid);
	 		item.addClass(items[i].isUnread? "unread": "");
	 		item.find('.avatar').attr("src", HOMEPATH + items[i].avatarURL);
	 		item.find('.name').attr("href", items[i].userLink).html(items[i].userName)
	 			.addClass(items[i].userType == API.ACCOUNT.TYPE.TEACHER? "heightline": "");
	 		item.find('.date').html(items[i].date);
	 		item.find('.discuss-text').html(items[i].text);
	 		if(items[i].pid == -1){
	 			item.find('.reply-to').hide();
	 		}
	 		else if(items[i].pid == -2){
				item.find('.reply-to').html("教师");
	 		}
	 		else{
	 			item.find('.reply-to').html(items[i].replyToInfo);
	 		}
	 		if(!items[i].isCanRemove){
	 			item.find('.discuss-remove-btn').addClass('per-hide');
	 		}
	 		if(!items[i].isCanReply){
	 			item.find('.show-reply-pane-btn').addClass('per-hide');
	 		}
	 		item.appendTo(listMine);
		}
		$("*[href='#discuss-mine-pane']>.pane-info").html(total);
		$(".unread-count").html(unreadCount);
		setPagination($(".pagination-discuss-mine"), function(index){
			index = (index == "min"? 0: index);
			index = (index == "max"? 9999999: index);
			Discuss.getMine(index);
		}, 
		Discuss.pageNavCount, Math.ceil(total / Discuss.maxItemCount), Discuss.PageMineIndex);
	}
	Discuss.init();
}