var WIDTH = 100;
var HEIGHT = 100;

var reader = new FileReader();
var img    = new Image();
var avatarSelector;

$(function(){
	avatarSelector = $("#avatar-sel")[0];

	$(".avatar").click(function(event) {
		avatarSelector.click();
	});

	$(avatarSelector).change(function(e){
		reader.readAsDataURL(this.files[0]);
	});

	reader.onload = function(e) {
    	img.src = e.target.result;
	};

	img.onload = function(){
		var imgData = clipPic(this, WIDTH, HEIGHT);
		$(".avatar").attr("src", imgData);
		$("#avatar-data").val(imgData);
	};
});

$("#edit-btn").click(function(){
	if($("#password").val() != $("#passwordV").val()){
		$("#passwordV").focus().select();
		return false;
	}
});