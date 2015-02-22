<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/inc/frame/header.jsp" %>

<!doctype html>
<html>
<head>
    <%@ include file="/inc/frame/header.html" %><!-- 通用HTML头  -->
    <title>修改教师 | <%= title %></title>
	<jsp:include page="<%= cssPage %>"></jsp:include><!-- 通用CSS样式  -->
</head>
<body>
	<jsp:include page="<%= navPage %>"></jsp:include><!-- 导航条  -->
	
	<div class="container-fluid">
		<div class="row">
			<div class="pane-holder bottom-space col-md-6 col-md-offset-3">
	          <h6>修改教师</h6>
	          <form role="form" method="post" action="admin/manage/teacher/edit/admin_updateTeacher">
	            <hr>
	            
	            <div class="form-group hide">
	              <label for="id">id</label>
	              <input type="text" class="form-control" id="id" name="teacher.ID" value="${teacher.ID }">
	            </div>
	            <div class="form-group hide">
	              <label for="password">password</label>
	              <input type="password" class="form-control" id="password" name="teacher.password" value="${teacher.password}">
	            </div>
	            <div class="form-group">
	              <label for="userName">用户名</label>
	              <input type="text" readonly class="form-control" id="userName" name="teacher.username" value="${teacher.username}">
	            </div>
	            <div class="form-group">
	              <label for="name">姓名*</label>
	              <input type="text" required="required" class="form-control" id="name" name="teacher.name" value="${teacher.name}" placeholder="请输入姓名">
	            </div>
	            <div class="form-group">
	              <label for="email">邮箱*</label>
	              <input type="email" required="required" class="form-control" id="email" name="teacher.email" value="${teacher.email}" placeholder="请输入邮箱">
	            </div>
	            <div class="form-group">
	              <label for="school">学校*</label>
	              <input type="text" required="required" class="form-control" id="school" name="teacher.school" value="${teacher.school}" placeholder="请输入所在学校名">
	            </div>
	            <div class="form-group">
	              <label for="school">个人简介*</label>
	              <textArea required="required" class="form-control unresize" id="intro" name="teacher.introduction" value="${teacher.introduction}" rows="6" placeholder="请输入个人简介"></textArea>
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
