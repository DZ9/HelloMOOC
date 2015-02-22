<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/inc/frame/header.jsp" %>

<!doctype html>
<html>
<head>
    <%@ include file="/inc/frame/header.html" %><!-- 通用HTML头  -->
    <title>添加课程 | <%= title %></title>
	<jsp:include page="<%= cssPage %>"></jsp:include><!-- 通用CSS样式  -->
</head>
<body>
	<jsp:include page="<%= navPage %>"></jsp:include><!-- 导航条  -->
	
	<div class="container-fluid">
		<div class="row">
			<div class="pane-holder bottom-space col-md-6 col-md-offset-3">
	          <h6>添加课程</h6>
	          <form role="form" action="teacher_addCourse" method="post">
	            <legend>以下信息将会被审核，请认真填写</legend><hr>
	            <div class="form-group">
	              <label for="name">课程名称*</label>
	              <input type="text" required="required" class="form-control" id="name" name="course.name" placeholder="请输入课程名称">
	            </div>
				<div class="form-group">
					<label for="class">课程分类*</label>
					<select data-toggle="select" class="form-control select select-default" name="courseType.id">
						<option value="1">文学艺术</option>
						<option value="2">哲学历史</option>
						<option value="3">经管法学</option>
						<option value="4">基础科学</option>
						<option value="5">工程技术</option>
						<option value="6">农林医药</option>
					</select>
				</div>
	            <div class="form-group">
	              <label for="school">课程简介*</label>
	              <textArea required="required" class="form-control unresize" id="intro" name="course.introduction" rows="6" placeholder="请输入课程简介"></textArea>
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
