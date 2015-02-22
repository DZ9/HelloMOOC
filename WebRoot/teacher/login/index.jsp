<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/inc/frame/header.jsp" %>
<!doctype html>
<html>
<head>
    <%@ include file="/inc/frame/header.html" %><!-- 通用HTML头  -->
    <title>教师登录 | <%= title %></title>
	<jsp:include page="<%= cssPage %>"></jsp:include><!-- 通用CSS样式  -->
</head>
<body>
	<jsp:include page="<%= navPage %>"></jsp:include><!-- 导航条  -->
	<div class="container-fluid">
		<div class="row">
			<div class="pane-holder bottom-space col-sm-6 col-sm-offset-3">
	          <h6>教师登录</h6><hr>
				<form class="form-horizontal" role="form" action="teacher/teacher_login.action" method="post">
				  <div class="form-group">
				    <label for="id-input" class="col-sm-2 control-label">用户名</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="id-input" name="userName" required="required" placeholder="请输入用户名">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="password-input" class="col-sm-2 control-label">密码</label>
				    <div class="col-sm-10">
				      <input type="password" class="form-control" id="password-input" name="password" required="required" placeholder="请输入密码">
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
				      <img src="【】" title="点击更换验证码" />
				    </div>
				  </div><hr>
	            	<button type="submit" class="btn btn-primary btn-w right">登 录</button>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="<%= footerPage %>"></jsp:include><!-- 页脚  -->
	<jsp:include page="<%= jsPage %>"></jsp:include><!-- 通用JS脚本  -->
</body>
</html>
