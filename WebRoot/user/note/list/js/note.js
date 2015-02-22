
function initNote(){
	var listAll = $("#note-mine-list");

	initNoteObj();
	Note.init();

}

function initNoteObj(){
	var listAll = $("#note-mine-list");
	var temp = listAll.find(".note-item.template").clone(true).removeClass("template").remove();

	window.Note = {};

	Note.pageNavCount = PAGE_NAV_COUNT;
	Note.maxItemCount = MAX_ITEM_COUNT;

	Note.init = function(){
		Note.getAll(0);
	};
	Note.getAll = function(index){
		$.ajax({
			url: API.NOTE.GET,
			data: {count:Note.maxItemCount, index:index}
		})
		.done(function(req) {
			Note.refreshListView(toJSON(req));
		});
	};

	Note.refreshListView = function(notes){
		var items = notes.items;
		var length = items.length;
		listAll.children().remove();
		for(var i = 0; i < length; i++){
			var item = temp.clone(false);
			item.attr("data-id", items[i].id);
			item.find('.avatar').attr("src", "images/note"+(items[i]['public'] == "true"? "": "-private")+".png");
			item.find('.course-name').attr("href", items[i].courseLink).html(items[i].courseName);
			item.find('.note-text').html(items[i].content);
			item.appendTo(listAll);
		}
		listAll.find(".show-note-btn").click(function(event) {
			var text = $(this).parents(".note-item").find(".list-item-text");
			text.toggleClass("ellipsis");
			text.toggleClass("auto-wrap");
		});
		$(".note-mine-count").html(notes.total);
		setPagination($(".pagination-note-mine"), function(index){
			index = (index == "min"? 0: index);
			index = (index == "max"? 9999999: index);
			Note.getAll(index);
		}, 
		Note.pageNavCount, Math.ceil(notes.total / Note.maxItemCount), notes.index);
	};

}