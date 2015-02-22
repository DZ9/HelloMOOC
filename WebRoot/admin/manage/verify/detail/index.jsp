<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/inc/frame/header.jsp" %>

<!doctype html>
<html>
<head>
    <%@ include file="/inc/frame/header.html" %><!-- 通用HTML头  -->
    <title>审核详情 | <%= title %></title>
	<jsp:include page="<%= cssPage %>"></jsp:include><!-- 通用CSS样式  -->
</head>
<body>
	<jsp:include page="<%= navPage %>"></jsp:include><!-- 导航条  -->

	<div class="container-fluid">
		<div class="row">
			<div class="pane-holder bottom-space col-sm-6 col-sm-offset-3">
	          	<h6>审核详情</h6><hr>
				<form class="form-horizontal" role="form" method="post" action="admin_verifyTeacher">
					<input type="hidden" name="teacher.ID" value="${teacher.ID}"> 
					<input type="hidden" name="teacher.password" value="${teacher.password}"> 
					<input type="hidden" name="teacher.date" value="${teacher.date}"> 
					<div class="form-group">
						<label class="col-sm-3 control-label">账 号：</label>
						<div class="col-sm-9">
							<p class="form-control-static">${teacher.username}</p>
							<input type="hidden" name="teacher.username" value="${teacher.username}"> 
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">姓 名：</label>
						<div class="col-sm-9">
							<p class="form-control-static">${teacher.name }<a class="cert-link" target="_blank" href="${teacher.photoURL}">查看证件</a></p>
							<input type="hidden" name="teacher.name" value="${teacher.name}"> 
							<input type="hidden" name="teacher.photoURL" value="${teacher.photoURL}"> 
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">邮 箱：</label>
						<div class="col-sm-9">
							<p class="form-control-static" name="">${teacher.email }</p>
							<input type="hidden" name="teacher.email" value="${teacher.email}"> 
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">学 校：</label>
						<div class="col-sm-9">
							<p class="form-control-static">${teacher.school }</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">简 介：</label>
						<div class="col-sm-9">
							<p class="form-control-static">${teacher.introduction }</p>
						</div>
					</div><hr>
					<div class="form-group">
						<label class="col-sm-3 control-label">判 定：</label>
						<div class="col-sm-9">
							<label class="radio" for="yes">
								<input type="radio" name="teacher.state" data-toggle="radio" value="1" id="yes" checked>通 过
							</label>
							<label class="radio" for="no">
								<input type="radio" name="teacher.state" data-toggle="radio" value="0" id="no">否 决
							</label>
						</div>
					</div><hr>
					<button type="submit" id="confirm-btn" class="btn btn-primary btn-w right">确 定</button>
					<button type="button" id="cancel-btn" class="btn btn-default btn-w right">取消</button>
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="<%= footerPage %>"></jsp:include><!-- 页脚  -->
	<jsp:include page="<%= jsPage %>"></jsp:include><!-- 通用JS脚本  -->
</body>
</html>
