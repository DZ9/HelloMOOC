<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/inc/frame/header.jsp" %>

<!doctype html>
<html>
<head>
    <%@ include file="/inc/frame/header.html" %><!-- 通用HTML头  -->
    <title>教师管理 | <%= title %></title>
	<jsp:include page="<%= cssPage %>"></jsp:include><!-- 通用CSS样式  -->
</head>
<body>
	<jsp:include page="<%= navPage %>"></jsp:include><!-- 导航条  -->
	
	<div class="container-fluid">
		<div class="row">
			<div class="pane-holder bottom-space col-md-10 col-md-offset-1">
				<h6>教师管理<a id="manage-add-btn" href='<%= homePath + "admin/manage/teacher/add" %>' class="btn btn-default"><span class="glyphicon glyphicon-plus"></span></a></h6><hr>
				<div class="table-responsive">
					<table class="table table-hover">
						<tr>
							<th>用户名</th>
							<th>姓名</th>
							<th>所属学校</th>
							<th>发布课程数</th>
							<th>课程总体评分</th>							
							<th>操作</th>											
						</tr>
						<s:iterator id="teacher" value="teachers">
							<s:if test="#teacher!=null">
								<tr data-id="教师ID">
									<td><a href="<%= homePath%>teacherInfo?teacher.ID=<s:property value="#teacher.ID"/>" target="_blank"><s:property value="#teacher.username"/></a></td>
									<td><s:property value="#teacher.name"/></td>
									<td><s:property value="#teacher.school"/></td>
									<td><s:property value="teacher_course[#teacher.name].size()"/></td>
									<td><s:property value="teacher_avgScore[#teacher.name]"/></td>
									<s:set value="#teacher" name="teacher" scope="session"/>
									<td>
										<a href="<%= homePath %>admin/manage/teacher/edit/teacherEdit?teacher.ID=${sessionScope.teacher.ID}" class="manage-edit-btn" title="修改"><span class="glyphicon glyphicon-pencil"></span></a>
										<a href="<%= homePath%>admin/manage/course/list/admin_deleteTeacher?teacher.ID=${sessionScope.teacher.ID}" class="manage-remove-btn remove-teacher-btn" title="删除"><span class="glyphicon glyphicon-remove"></span></a>					
									</td>		
								</tr>
							</s:if>
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
