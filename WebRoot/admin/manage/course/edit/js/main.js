$(function(){
	initInfo();
	initMsg();
	initResource();
	initVideo();
	
});

function initInfo(){
	var reader = new FileReader();
	var img    = new Image();
	var selector;	
	selector = $("#cimg-sel")[0];

	$(".cimg").click(function(event) {
		selector.click();
	});

	$(selector).change(function(e){
		reader.readAsDataURL(this.files[0]);
	});

	reader.onload = function(e) {
    	img.src = e.target.result;
	};

	img.onload = function(){
		var imgData = clipPic(this, CIMG_WIDTH, CIMG_HEIGHT);
		$(".cimg").attr("src", imgData);
		$("#cimg-data").val(imgData);
	};
}

function initMsg(){
	$(".msg-title>a").click(function(event) {
		$("#msg-show-title").html($(this).html());
		$("#msg-show-content").html($("#content_dx").html());	//TODO: .load()
		$('#msg-show-modal').modal({backdrop:"static"});
		return false;
	});
	$(".remove-msg-btn").click(function(event) {
		var href = $(this).attr("href");

		msg("删除通知","您确定要删除此条通知吗？", function(){
			$.ajax({url: href})
			.always(function() {
				window.location.reload();
			});

		});
		return false;
	});
	$("#add-msg-btn").click(function(event) {
		$('#msg-add-modal').modal({backdrop:"static"});
	});
	$("#msg-add-cancel-btn").click(function(event) {
		$("#msg-add-title").val("");
		$("#msg-add-content").val("");
	});
	$("#msg-add-ok-btn").click(function(event) {
		$("#msg-add-submit-btn").click();
	});

}

function initResource(){
	var removeBtn = $(".remove-resource-btn");
	var addBtn = $("#add-resource-btn");
	var modal = $('#resource-add-modal');
	var selBtn = modal.find(".file-sel-btn");
	var fileSel = modal.find(".file-sel");
	var inputHolder = modal.find(".input-holder");
	var input = modal.find(".file-name-input");
	var progressHolder = modal.find(".progress-holder");
	var progress = modal.find(".progress-bar");	
	var uploadBtn = modal.find(".resource-add-ok-btn");
	var cancelBtn = modal.find(".resource-add-cancel-btn");
	var filename = "";
	removeBtn.click(function(event) {
		var href = $(this).attr("href");

		msg("删除资料","您确定要删除此份资料吗？", function(){
			$.ajax({url: href})
			.always(function() {
				window.location.reload();
			});

		});
		return false;
	});
	addBtn.click(function(event) {
		filename = "";
		input.val("");
		modal.modal({backdrop:"static"});
		cancelBtn.show();
		progressHolder.hide();
		inputHolder.show();
	});
	selBtn.click(function(event) {
		fileSel.click();
	});
	fileSel.on("change", function(){
		filename = this.files? this.files[0].name: this.value;
		input.val(filename);
	});
	input.on("propertychange input", function(){
		$(this).val(filename);
	});
	uploadBtn.click(function(event) {
		if(filename != ""){
			var $btn = $(this).button('loading');
			cancelBtn.hide();
			progressHolder.show();
			inputHolder.hide();
			upload();
			$btn.button('reset');
		}
	});
	function upload(){
		$("#resource-add-form").submit();
	}
}

function initVideo(){
	var removeBtn = $(".remove-video-btn");
	var editBtn = $(".edit-video-btn");
	var addBtn = $("#add-video-btn");
	var modal = $('#video-add-modal');
	var selBtn = modal.find(".file-sel-btn");
	var fileSel = modal.find(".file-sel");
	var inputHolder = modal.find(".input-holder");
	var input = modal.find(".file-name-input");
	var nameInput  = modal.find(".name-input");	
	var progressHolder = modal.find(".progress-holder");
	var progress = modal.find(".progress-bar");	
	var uploadBtn = modal.find(".video-add-ok-btn");
	var cancelBtn = modal.find(".video-add-cancel-btn");
	var editOkBtn = modal.find(".video-edit-ok-btn");	
	var filename = "";


	removeBtn.click(function(event) {
		var href = $(this).attr("href");
		msg("删除视频","您确定要删除此视频吗？", function(){
			$.ajax({url: href})
			.always(function() {
				window.location.reload();
			});

		});
		return false;
	});
	editBtn.click(function(event) {
		$("#video-name-input").val($(this).parents("*[data-name]").attr("data-name"));
		$("#video-edit-modal").modal({backdrop:"static"});
	});
	editOkBtn.click(function(event) {
		$("#video-edit-submit-btn").click();
	});
	addBtn.click(function(event) {
		filename = "";
		input.val("");
		nameInput.val("");
		modal.modal({backdrop:"static"});
		cancelBtn.show();
		progressHolder.hide();
		inputHolder.show();
	});
	selBtn.click(function(event) {
		fileSel.click();
	});
	fileSel.on("change", function(){
		filename = this.files? this.files[0].name: this.value;
		input.val(filename);
	});
	input.on("propertychange input", function(){
		$(this).val(filename);
	});
	uploadBtn.click(function(event) {
		if(filename != "" && nameInput.val().trim() != ""){
			var $btn = $(this).button('loading');
			cancelBtn.hide();
			progressHolder.show();
			inputHolder.hide();
			upload();
			$btn.button('reset');
		}
	});
	function upload(){
		$("#video-add-form").submit();
	}
}