$(function(){
	$(".remove-course-btn").click(function(event) {
		var href = $(this).attr("href");
		msg("退出课程","您确定要退出此课程吗？", function(){
			$.ajax({url: href})
			.always(function() {
				window.location.reload();
			});
		});
		return false;
	});
});