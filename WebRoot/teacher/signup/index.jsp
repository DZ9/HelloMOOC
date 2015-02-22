<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/inc/frame/header.jsp" %>

<!doctype html>
<html>
<head>
    <%@ include file="/inc/frame/header.html" %><!-- 通用HTML头  -->
    <title>教师注册 | <%= title %></title>
	<jsp:include page="<%= cssPage %>"></jsp:include><!-- 通用CSS样式  -->
</head>
<body>
	<jsp:include page="<%= navPage %>"></jsp:include><!-- 导航条  -->
	
	<div class="container-fluid">
		<div class="row">
			<div class="pane-holder bottom-space col-md-6 col-md-offset-3">
	          <h6>教师注册</h6>
	          <form role="form" action="teacher_signup" method="post" enctype="multipart/form-data">
	            <legend>以下信息将会被审核，请认真填写</legend><hr>
	            <div class="form-group">
	              <label for="userName">用户名*<span class="error-tips hide">此用户名已存在</span></label>
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
	              <label for="name">姓名*</label>
	              <input type="text" required="required" class="form-control" id="name" name="name" placeholder="请输入姓名">
	            </div>
				<div class="form-group">
					<label for="pic-sel-btn">工作证扫描件*</label>
					<input type="file" id="pic-sel" name="photoURL" accept=".jpg,.bmp,.png" class="hide">
					<div class="input-group">
						<input type="text" required="required" class="form-control" id="file-name-input" placeholder="请选择图片">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button" id="pic-sel-btn">选择图片</button>
						</span>
					</div>
				</div>
	            <div class="form-group">
	              <label for="email">邮箱*</label>
	              <input type="email" required="required" class="form-control" id="email" name="email" placeholder="请输入邮箱">
	            </div>
	            <div class="form-group">
	              <label for="school">学校*</label>
	              <input type="text" required="required" class="form-control" id="school" name="school" placeholder="请输入所在学校名">
	            </div>
	            <div class="form-group">
	              <label for="school">个人简介*</label>
	              <textArea required="required" class="form-control unresize" id="intro" name="introduction" rows="6" placeholder="请输入个人简介"></textArea>
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
