$(function(){
	$(".remove-user-btn").click(function(event) {
		var href = $(this).attr("href");
		msg("删除用户","您确定要删除此用户吗？", function(){
			$.ajax({url: href})
			.always(function() {
				window.location.reload();
			});
		});
		return false;
	});
});
