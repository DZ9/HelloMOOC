//异步登录
var hasLogined = false;

function setAsynLogin(){
	$("#user-login-link, #teacher-login-link").addClass("hide");
	$('*[data-target*="-login-modal"]').removeClass("hide");
	initUserLogin();
	initTeacherLogin();	
}
function initUserLogin(){
	var modal = $("#user-login-modal");
	var idInput = modal.find("#id-input");
	var passwdInput = modal.find("#password-input");
	var cancelBtn = modal.find(".cancel-btn");
	var loginBtn = modal.find(".login-btn");

	cancelBtn.click(function(event) {
		idInput.val("");
		passwdInput.val("");
	});

	loginBtn.click(function(event) {
		var userName = idInput.val().trim();
		var passwd = passwdInput.val();
		if(userName == ""){
			idInput.focus();
			return;
		}
		if(passwd == ""){
			passwdInput.focus();
			return;
		}
		var $btn = loginBtn.button('loading');
		cancelBtn.hide();
		$.ajax({
			url: API.ACCOUNT.LOGIN,
			data: {type: API.ACCOUNT.TYPE.USER, name: userName, password: passwd}
		})
		.done(function(req) {
			hasLogined = false;			
			if(req == "-1"){
				idInput.focus();
				idInput.select();
			}
			else if(req == "-2"){
				passwdInput.focus();
				passwdInput.select();
			}
			else{
				modal.modal("hide");
				$(".modal-backdrop").remove();
				hasLogined = true;
				reloadPage(toJSON(req));	//局部页面重载
			}
		})
		.always(function(){
			$btn.button('reset');
			cancelBtn.show();
		});
	});
}

function initTeacherLogin(){
	var modal = $("#teacher-login-modal");
	var idInput = modal.find("#id-input");
	var passwdInput = modal.find("#password-input");
	var vcodeInput = modal.find("#vcode-input");
	var cancelBtn = modal.find(".cancel-btn");
	var loginBtn = modal.find(".login-btn");

	cancelBtn.click(function(event) {
		idInput.val("");
		passwdInput.val("");
		vcodeInput.val("");
	});

	loginBtn.click(function(event) {
		var userName = idInput.val().trim();
		var passwd = passwdInput.val();
		var vcode = vcodeInput.val();
		if(userName == ""){
			idInput.focus();
			return;
		}
		if(passwd == ""){
			passwdInput.focus();
			return;
		}
		if(vcode == ""){
			vcodeInput.focus();
			return;
		}
		var $btn = loginBtn.button('loading');
		cancelBtn.hide();
		$.ajax({
			url: API.ACCOUNT.LOGIN,
			data: {type: API.ACCOUNT.TYPE.TEACHER, name: userName, password: passwd, vcode: vcode}
		})
		.done(function(req) {
			hasLogined = false;
			if(req == "-1"){
				idInput.focus();
				idInput.select();
			}
			else if(req == "-2"){
				passwdInput.focus();
				passwdInput.select();
			}
			else if(req == "-3"){
				vcodeInput.focus();
				vcodeInput.select();
			}
			else{
				modal.modal("hide");
				$(".modal-backdrop").remove();
				hasLogined = true;
				reloadPage(toJSON(req));	//局部页面重载
			}
		})
		.always(function(){
			$btn.button('reset');
			cancelBtn.show();
		});
	});
}

