$(function(){
	var isExisting = false;
	var userNameInput = $("#userName");
	var userNameIputHolder = userNameInput.parents(".form-group");
	var existedTip = userNameIputHolder.find(".error-tips");	
	var signupBtn = $("#add-btn");

	signupBtn.click(function(){
		if(isExisting){
			userNameInput.focus().select();
			return false;
		}
		if($("#password").val() != $("#passwordV").val()){
			$("#passwordV").focus().select();
			return false;
		}
	});

	userNameInput.on("propertychange input", function(){
		checkUserName();
	});

	function checkUserName(){
		var userName = userNameInput.val().trim();
		isExisting = false;
		userNameIputHolder.removeClass("has-error");
		existedTip.addClass("hide");
		setEnabled(signupBtn, false);
		$.ajax({
			url: API.ACCOUNT.EXISTED,
			data: {name: userName, type: API.ACCOUNT.TYPE.USER},
		})
		.done(function(req) {
			isExisting = (req != "0");
			if(isExisting){
				userNameIputHolder.addClass("has-error");
				existedTip.removeClass("hide");
			}else{
				userNameIputHolder.removeClass("has-error");
				existedTip.addClass("hide");
			}
			setEnabled(signupBtn, !isExisting);
		});
	}

});