$(function(){
	$(".remove-teacher-btn").click(function(event) {
		var href = $(this).attr("href");
		msg("删除教师","您确定要删除此教师吗？", function(){
			$.ajax({url: href})
			.always(function() {
				window.location.reload();
			});
		});
		return false;
	});
});
