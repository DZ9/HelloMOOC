<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/inc/frame/header.jsp" %>

<!doctype html>
<html>
<head>
    <%@ include file="/inc/frame/header.html" %><!-- 通用HTML头  -->
    <title>添加管理员 | <%= title %></title>
	<jsp:include page="<%= cssPage %>"></jsp:include><!-- 通用CSS样式  -->
</head>
<body>
	<jsp:include page="<%= navPage %>"></jsp:include><!-- 导航条  -->
	
	<div class="container-fluid">
		<div class="row">
			<div class="pane-holder bottom-space col-md-6 col-md-offset-3">
	          <h6>添加管理员</h6>
	          <form role="form" method="post" action="admin/manage/admin/add/admin_addAdmin">
	            <hr>
	            <div class="form-group">
	              <label for="userName">用户名*<span class="error-tips hide">此用户名已存在</span></label>
	              <input type="text" class="form-control" required="required" id="userName" name="admin.username" placeholder="请输入用户名">
	            </div>
	            <div class="form-group">
	              <label for="password">密码*</label>
	              <input type="password" class="form-control" required="required" id="password" name="admin.password" placeholder="请输入密码">
	            </div>
	            <div class="form-group">
	              <label for="passwordV">确认密码*</label>
	              <input type="password" class="form-control" required="required" id="passwordV" placeholder="请再次输入密码">
	            </div>
	            <div class="form-group">
	              <label for="passwordV">姓名*</label>
	              <input type="text" class="form-control" required="required" id="passwordV" name="admin.name" placeholder="请输入姓名">
	            </div>
				<div class="form-group">
					<label for="class">权限*</label>
					<select data-toggle="select" class="form-control select select-default" name="admin.authority">
						<option value="0">普通</option>
						<option value="1">超级</option>
					</select>
				</div><hr>
	            <button type="submit" id="add-btn" class="btn btn-primary btn-w right">添 加</button>
	          </form>
			</div>
		</div>
	</div>
	
	<jsp:include page="<%= footerPage %>"></jsp:include><!-- 页脚  -->
	<jsp:include page="<%= jsPage %>"></jsp:include><!-- 通用JS脚本  -->
</body>
</html>
