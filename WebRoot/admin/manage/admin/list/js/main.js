$(function(){
	$(".remove-admin-btn").click(function(event) {
		var href = $(this).attr("href");
		msg("删除管理员","您确定要删除此管理员吗？", function(){
			$.ajax({url: href})
			.always(function() {
				window.location.reload();
			});
		});
		return false;
	});
});