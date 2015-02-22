<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/inc/frame/header.jsp" %>

<!doctype html>
<html>
<head>
    <%@ include file="/inc/frame/header.html" %><!-- 通用HTML头  -->
    <title>用户注册 | <%= title %></title>
	<jsp:include page="<%= cssPage %>"></jsp:include><!-- 通用CSS样式  -->
</head>
<body>
	<jsp:include page="<%= navPage %>"></jsp:include><!-- 导航条  -->
	
	<div class="container-fluid">
		<div class="row">
			<div class="pane-holder bottom-space col-md-6 col-md-offset-3">
	          <h6>注册</h6>
	          <form role="form">
	            <hr>
	            <div class="form-group">
	              <label for="userName">用户名*</label>
	              <input type="text" required="required" class="form-control" id="userName" name="userName" placeholder="请输入用户名">
	            </div>
	            <div class="form-group">
	              <label for="password">密码*</label>
	              <input type="password" required="required" class="form-control" id="password" name="password" placeholder="请输入密码">
	            </div>
	            <div class="form-group">
	              <label for="passwordV">确认密码*</label>
	              <input type="password" required="required" class="form-control" id="passwordV" placeholder="请再次输入密码">
	            </div>
	            <div class="form-group">
	              <label for="email">邮箱*</label>
	              <input type="email" required="required" class="form-control" id="email" name="email" placeholder="请输入邮箱">
	            </div>
	            <div class="form-group">
	              <label for="school">学校</label>
	              <input type="text" class="form-control" id="school" name="school" placeholder="请输入所在学校名">
	            </div>
	            <div class="form-group">
	              <label for="hobby">兴趣爱好</label>
	              <input class="form-control unresize" id="hobby" name="hobby" placeholder="请输入个人兴趣爱好"></input>
	            </div><hr>
	            <button type="submit" id="signup-btn" class="btn btn-primary btn-w right">注 册</button>
	          </form>
			</div>
		</div>
	</div>
	
	<jsp:include page="<%= footerPage %>"></jsp:include><!-- 页脚  -->
	<jsp:include page="<%= jsPage %>"></jsp:include><!-- 通用JS脚本  -->
</body>
</html>
