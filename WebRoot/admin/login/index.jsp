<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/inc/frame/header.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!doctype html>
<html>
<head>
    <%@ include file="/inc/frame/header.html" %><!-- 通用HTML头 -->
    <title>管理员登录 | <%= title %></title>
	<jsp:include page="<%= cssPage %>"></jsp:include><!-- 通用CSS文件 -->
</head>

<s:if test="%{tip==null}">
	<body>
</s:if>
<s:elseif test="%{tip=='登陆成功'}">
	<body>
</s:elseif>
<s:elseif test="tip=='验证码错误'">
	<body data-msg-title="${tip}" data-msg-text="验证码输入错误！">
</s:elseif>
<s:else>
	<body data-msg-title="输入信息有误" data-msg-text="用户名或密码错误，请正确输入！">
</s:else>

	<jsp:include page="<%= navPage %>"></jsp:include><!-- 导航条  -->
	<div class="container-fluid">
		<div class="row">
			<div class="pane-holder bottom-space col-sm-6 col-sm-offset-3">
	          <h6>管理员登录</h6><hr>
				<form class="form-horizontal" role="form" action="admin_login" method="post">
				  <div class="form-group">
				    <label for="id-input"  class="col-sm-2 control-label">用户名</label>
				    <div class="col-sm-10">
				      <input type="text" name="admin.username" class="form-control" id="id-input" placeholder="请输入用户名">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="password-input" class="col-sm-2 control-label">密码</label>
				    <div class="col-sm-10">
				      <input type="password" name="admin.password" class="form-control" id="password-input" placeholder="请输入密码">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="vcode-input" class="col-sm-2 control-label">验证码</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="vcode"  name="vcode" required="required" placeholder="请输入验证码">
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-10 col-md-offset-2">
				      <img src="admin/login/admin_securityCode" id="securityCode" style="cursor:hand;" alt="看不清，换一张" title="点击更换验证码" />
				    </div>
				  </div><hr>
	            	<button type="submit" class="btn btn-primary btn-w right">登 录</button>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="<%= footerPage %>"></jsp:include><!-- 页脚  -->
	<jsp:include page="<%= jsPage %>"></jsp:include><!-- 通用JS文件 -->
	<s:debug></s:debug>
</body>
</html>

