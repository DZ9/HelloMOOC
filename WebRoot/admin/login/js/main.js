$(function () {  
    //点击图片更换验证码
    $("#securityCode").click(function(){
        $(this).attr("src","admin/login/admin_securityCode?timestamp="+new Date().getTime());
    });
});