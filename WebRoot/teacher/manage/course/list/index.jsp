<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/inc/frame/header.jsp" %>

<!doctype html>
<html>
<head>
    <%@ include file="/inc/frame/header.html" %><!-- 通用HTML头  -->
    <title>课程管理 | <%= title %></title>
	<jsp:include page="<%= cssPage %>"></jsp:include><!-- 通用CSS样式  -->
</head>
<body>
	<jsp:include page="<%= navPage %>"></jsp:include><!-- 导航条  -->
	
	<div class="container-fluid">
		<div class="row">
			<div class="pane-holder bottom-space col-md-10 col-md-offset-1">
				<h6>课程管理<a id="manage-add-btn" href='<%= homePath + "teacher/manage/course/add" %>' class="btn btn-default"><span class="glyphicon glyphicon-plus"></span></a></h6><hr>
				<div class="table-responsive">
					<table class="table table-hover">
						<tr>
							<th>名称</th>
							<th>教师</th>
							<th>参与人数</th>
							<th>上线时间</th>
							<th>评分</th>							
							<th>操作</th>												
						</tr>
						<s:iterator id="course" value="courses">
						
						<tr data-id="<s:property value="#course.id"/>">
							<td><a href="<%= homePath%>course/info/info?course.id=<s:property value="#course.id"/>" target="_blank"><s:property value="#course.name"/></a></td>
							<td><a href="<%= homePath%>teacherInfo?teacher.ID=<s:property value="#course.teacher.ID"/>"  target="_blank"><s:property value="#course.teacher.name"/></a></td>
							<td><s:property value="stuQuantity[#course.name]"/></td>
							<td><s:date name="#course.date" format="yyyy-MM-dd"/></td>
							<td><s:property value="courseScore[#course.name]"/></td>
							<td>
								<a href="<%= homePath%>teacher/manage/course/edit/edit?course.id=<s:property value="#course.id"/>" class="manage-edit-btn" title="修改"><span class="glyphicon glyphicon-pencil"></span></a>
								<a href="teacher_deleteCourse?course.id=<s:property value="#course.id"/>" 
									class="manage-remove-btn remove-course-btn" 
									title="删除"><span class="glyphicon glyphicon-remove"></span></a>						
							</td>		
						</tr>
						</s:iterator>
					</table>
				</div><hr>
				<!-- 分页导航条  -->
				<jsp:include page="<%= paginationPage %>">
					<jsp:param value="1" name="count"/>
					<jsp:param value="1" name="total"/>
					<jsp:param value="0" name="index"/>
					<jsp:param value="url?page=$" name="url"/>				
				</jsp:include>
			</div>
		</div>
	</div>
	
	<jsp:include page="<%= footerPage %>"></jsp:include><!-- 页脚  -->
	<jsp:include page="<%= jsPage %>"></jsp:include><!-- 通用JS脚本  -->
</body>
</html>
