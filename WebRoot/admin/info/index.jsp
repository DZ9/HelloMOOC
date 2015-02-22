<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/inc/frame/header.jsp" %>

<!doctype html>
<html>
<head>
    <%@ include file="/inc/frame/header.html" %><!-- 通用HTML头 -->
    <title>个人中心 | <%= title %></title>
	<jsp:include page="<%= cssPage %>"></jsp:include><!-- 通用CSS文件 -->
</head>
<body>
	<jsp:include page="<%= navPage %>"></jsp:include><!-- 导航条  -->
	
	<div class="container-fluid">
		<div class="row">
			<div class="pane-holder bottom-space col-md-6 col-md-offset-3">
	          <h6>修改信息</h6>
	          <form role="form">
	            <hr>
	            <div class="form-group">
	              <label for="userName">用户名</label>
	              <input type="text" class="form-control" disabled="disabled" id="userName" value="用户名">
	            </div>
	            <div class="form-group">
	              <label for="password">新密码</label>
	              <input type="password" class="form-control" id="password" name="password" placeholder="若需更改，请输入新密码">
	            </div>
	            <div class="form-group">
	              <label for="passwordV">确认新密码</label>
	              <input type="password" class="form-control" id="passwordV" placeholder="请再次输入新密码">
	            </div><hr>
	            <button type="submit" id="edit-btn" class="btn btn-primary btn-w right">修 改</button>
	          </form>
			</div>
		</div>
	</div>
	
	<jsp:include page="<%= jsPage %>"></jsp:include><!-- 通用JS文件 -->
</body>
</html>

