
function initNote(){
	var listAll = $("#note-all-list");
	var updateBtn = $("#note-update-btn");
	var publicCheck = $("#note-public-check");

	initNoteObj();
	Note.init();

	updateBtn.click(function(event) {
		Note.update();
	});
}

function initNoteObj(){
	var listAll = $("#note-all-list");
	var updateBtn = $("#note-update-btn");
	var publicCheck = $("#note-public-check");
	var noteInput = $("#note-input");
	var temp = listAll.find(".note-item.template").clone(true).removeClass("template").remove();

	window.Note = {};

	Note.pageNavCount = PAGE_NAV_COUNT;
	Note.maxItemCount = MAX_ITEM_COUNT;
	Note.cid = $("body").attr("data-cid");

	Note.init = function(){
		Note.getAll(0);
	};
	Note.getAll = function(index){
		$.ajax({
			url: API.NOTE.GET_BY_COURSE,
			data: {cid:Note.cid, count:Note.maxItemCount, index:index}
		})
		.done(function(req) {
			Note.refreshListView(toJSON(req));
		});
	};
	Note.getMine = function(){
		$.ajax({
			url: API.NOTE.GET,
			data: {cid:Note.cid}
		})
		.done(function(req) {
			if(req == 0) return;
			var note = toJSON(req);
			noteInput.val(note.content);
			if(note['public'])
				publicCheck.attr("checked", "checked");
			else
				publicCheck.removeAttr("checked");				
		});
	};
	Note.refreshListView = function(notes){
		var items = notes.items;
		var length = items.length;
		listAll.children().remove();
		for(var i = 0; i < length; i++){
			var item = temp.clone(false);
			item.attr("data-id", items[i].id)
				.attr("user-id", items[i].userId);
			item.find('.avatar').attr("src", HOMEPATH + items[i].avatarURL);
			item.find('.name').attr("href", items[i].userLink).html(items[i].userName);
			item.find('.note-text').html(items[i].content);
			item.appendTo(listAll);
		}
		listAll.find(".show-note-btn").click(function(event) {
			var text = $(this).parents(".note-item").find(".list-item-text");
			text.toggleClass("ellipsis");
			text.toggleClass("auto-wrap");
		});
		$("*[href='#note-all-pane']>.pane-info").html(notes.total);
		setPagination($(".pagination-note-all"), function(index){
			index = (index == "min"? 0: index);
			index = (index == "max"? 9999999: index);
			Note.getAll(index);
		}, 
		Note.pageNavCount, Math.ceil(notes.total / Note.maxItemCount), notes.index);
	};
	Note.update = function(){
		var content = noteInput.val().trim();
		var isPublic = publicCheck.is(":checked");
		var $btn = updateBtn.button('loading');
		setEnabled(noteInput, false);
		$.ajax({
			url: API.NOTE.UPDATE,
			type: "post",
			data: {cid:Note.cid, 'public':isPublic, content:content},
		})
		.done(function(req) {
			if(req == "0")
				msg("更新笔记", "笔记更新成功。");
			else
				msg("更新笔记", "笔记更新失败。");				
		})
		.fail(function() {
			msg("更新笔记", "笔记更新失败。");
		})
		.always(function(){
			$btn.button('reset');
			setEnabled(noteInput, true);
		});
	};

}