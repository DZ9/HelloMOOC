$("#edit-btn").click(function(){
	if($("#password").val() != $("#passwordV").val()){
		$("#passwordV").focus().select();
		return false;
	}
});