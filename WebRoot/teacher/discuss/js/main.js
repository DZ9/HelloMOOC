$(function(){
	window.Account = {};
	Account.id = $("body").attr("data-account-id");
	Account.name = $("body").attr("data-account-name");
	Account.type = $("body").attr("data-account-type");

	if(typeof(Account.id) != "undefined" && Account.id != ""){
		initDiscuss();
	}
});