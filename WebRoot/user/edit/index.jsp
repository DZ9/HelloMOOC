<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/inc/frame/header.jsp" %>

<!doctype html>
<html>
<head>
    <%@ include file="/inc/frame/header.html" %><!-- 通用HTML头  -->
    <title>修改信息 | <%= title %></title>
	<jsp:include page="<%= cssPage %>"></jsp:include><!-- 通用CSS样式  -->
</head>
<body>
	<jsp:include page="<%= navPage %>"></jsp:include><!-- 导航条  -->
	
	<div class="container-fluid">
		<div class="row">
			<div class="pane-holder bottom-space col-md-6 col-md-offset-3">
	          <h5>修改信息</h5>
	          <form role="form" method="post" action="user_edit">
	            <hr>
	             <input type="text" class="form-control hide" readonly name="student.id" value="<s:property value="student.id"/>">
	            <input type="text" class="form-control hide" readonly name="student.registerTime" value="<s:date name="student.registerTime" format="yyyy-MM-dd"/>">
				<div class="avatar-holder">
				  <input type="file" class="hide" id="avatar-sel" accept=".jpg,.bmp,.png"/>
				  <input type="hidden" id="avatar-data" name="avatar-data"/>
				  <img class="avatar img-circle" src="<%= homePath %>/upload/${student.picURL}" title="点击更换新头像" data-holder-rendered="true" >
				</div><hr>
	            <div class="form-group">
	              <label for="userName"></label>
	              <input type="text" class="form-control" readonly id="student.username" value="${student.username }">
	            </div>
	            <div class="form-group">
	              <label for="password">新密码</label>
	              <input type="password" class="form-control"  id="password" name="student.password" placeholder="若需更改，请输入新密码">
	            </div>
	            <div class="form-group">
	              <label for="passwordV">确认新密码</label>
	              <input type="password" class="form-control" id="passwordV" placeholder="请再次输入新密码">
	            </div>
	            
	             <div class="form-group">
	              <label for="email"></label>
	              <input type="text" required="required" class="form-control" id="name" name="student.name" value="${student.name}" placeholder="请输入姓名" >
	            </div>
	            <div class="form-group">
	              <label for="email"></label>
	              <input type="email" required="required" class="form-control" id="email" name="student.email" value="${student.email}" placeholder="请输入邮箱" >
	            </div>
	            <div class="form-group">
	              <label for="hobby"></label>
	              <input class="form-control unresize" id="hobby" name="student.hobby" placeholder="请输入个人兴趣爱好" value="${student.hobby}">
	            </div><hr>
	            <button type="submit" id="edit-btn" class="btn btn-primary btn-w right">修 改</button>
	          </form>
			</div>
		</div>
	</div>
	
	<jsp:include page="<%= footerPage %>"></jsp:include><!-- 页脚  -->
	<script src="<%= homePath + kitPath %>js/dataurl-to-blob.js"></script>
	<jsp:include page="<%= jsPage %>"></jsp:include><!-- 通用JS脚本  -->
</body>
</html>
