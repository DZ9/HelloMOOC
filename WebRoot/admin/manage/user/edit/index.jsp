<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/inc/frame/header.jsp" %>

<!doctype html>
<html>
<head>
    <%@ include file="/inc/frame/header.html" %><!-- 通用HTML头  -->
    <title>修改用户 | <%= title %></title>
	<jsp:include page="<%= cssPage %>"></jsp:include><!-- 通用CSS样式  -->
</head>
<body>
	<jsp:include page="<%= navPage %>"></jsp:include><!-- 导航条  -->
	
	<div class="container-fluid">
		<div class="row">
			<div class="pane-holder bottom-space col-md-6 col-md-offset-3">
	          <h6>修改用户</h6>
	          <form role="form" method="post" action="admin_updateStudent" >
	            <hr>
	            <div class="form-group hide">
	              <label for="userName">id</label>
	              <input type="text" class="form-control" id="userName" name="student.username" readonly value="${student.id}">
	            </div>
	            <div class="form-group hide">
	              <label for="userName">id</label>
	              <input type="text" class="form-control" id="userName" name="student.name" readonly value="${student.name}">
	            </div>
	             <div class="form-group hide">
	              <label for="userName">id</label>
	              <input type="password" class="form-control" id="userName" name="student.password" readonly value="${student.password}">
	            </div>
	            <div class="form-group hide">
	              <label for="userName">registerTime</label>
	              <input type="text" class="form-control" id="userName" name="student.registerTime" readonly value="${student.registerTime}">
	            </div>
	            <div class="form-group">
	              <label for="userName">用户名</label>
	              <input type="text" class="form-control" id="userName" name="student.username" readonly value="${student.username }">
	            </div>
	            <div class="form-group">
	              <label for="email">邮箱*</label>
	              <input type="email" required="required" class="form-control" id="email" name="student.email" value="${student.email }" placeholder="请输入邮箱">
	            </div>
	            <div class="form-group">
	              <label for="hobby">兴趣爱好</label>
	              <input class="form-control unresize" id="hobby" name="student.hobby" value="${student.hobby}" placeholder="请输入个人兴趣爱好"></input>
	            </div><hr>
	            <button type="submit" id="edit-btn" class="btn btn-primary btn-w right">修 改</button>
	          </form>
			</div>
		</div>
	</div>
	
	<jsp:include page="<%= footerPage %>"></jsp:include><!-- 页脚  -->
	<jsp:include page="<%= jsPage %>"></jsp:include><!-- 通用JS脚本  -->
</body>
</html>
