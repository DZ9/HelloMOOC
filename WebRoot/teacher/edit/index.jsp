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
	          <form role="form" action="teacher_edit" method="post">
	            <legend>以下信息将会被审核，请认真填写</legend><hr>
				<div class="avatar-holder">
				  <input type="file" id="avatar-sel"   class="hide" accept=".jpg,.bmp,.png"/>
				  <input type="hidden" id="avatar-data" name="avatar-data"/>
				  <img class="avatar img-circle"  src="<%= homePath+"images"+"/"%><s:property value=""/>" title="点击更换新头像" data-holder-rendered="true" >
				</div><hr>
	            <div class="form-group">
	              <label for="userName">用户名</label>
	              <input type="text" disabled="disabled" name="userName" class="form-control" id="userName" value="">
	            </div>
	            <div class="form-group">
	              <label for="password">新密码</label>
	              <input type="password" class="form-control" id="password" name="password" placeholder="如需更改，请输入新密码">
	            </div>
	            <div class="form-group">
	              <label for="passwordV">确认新密码</label>
	              <input type="password" class="form-control" id="passwordV" placeholder="请再次输入新密码">
	            </div>
	            <div class="form-group">
	              <label for="name">姓名*</label>
	              <input type="text" required="required" class="form-control" id="name" name="name" placeholder="请输入姓名" value="">
	            </div>
	            <div class="form-group">
	              <label for="email">邮箱*</label>
	              <input type="email" required="required" class="form-control" id="email" name="email" placeholder="请输入邮箱" value="">
	            </div>
	            <div class="form-group">
	              <label for="school">学校*</label>
	              <input type="text" required="required" class="form-control" id="school" name="school" placeholder="请输入所在学校名" value="">
	            </div>
	            <div class="form-group">
	              <label for="school">个人简介*</label>
	              <textArea required="required" class="form-control unresize" id="intro" name="introduction" rows="6" placeholder="请输入个人简介"></textArea>
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
