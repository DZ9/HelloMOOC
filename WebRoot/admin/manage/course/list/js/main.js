$(function(){
	$(".remove-course-btn").click(function(event) {
		var href = $(this).attr("href");
		msg("删除课程","您确定要删除此课程吗？", function(){
			$.ajax({url: href})
			.always(function() {
				window.location.reload();
			});
		});
		return false;
	});
});
