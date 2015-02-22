<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/inc/frame/header.jsp" %>

<!doctype html>
<html>
<head>
    <%@ include file="/inc/frame/header.html" %><!-- 通用HTML头  -->
    <title>用户管理 | <%= title %></title>
	<jsp:include page="<%= cssPage %>"></jsp:include><!-- 通用CSS样式  -->
</head>
<body>
	<jsp:include page="<%= navPage %>"></jsp:include><!-- 导航条  -->
	
	<div class="container-fluid">
		<div class="row">
			<div class="pane-holder bottom-space col-md-10 col-md-offset-1">
				<h6>用户管理<a id="manage-add-btn" href='<%= homePath + "admin/manage/user/add" %>' class="btn btn-default"><span class="glyphicon glyphicon-plus"></span></a></h6><hr>
				<div class="table-responsive">
					<table class="table table-hover">
						<tr>
							<th>用户名</th>
							<th>姓名</th>
							<th>所属学校</th>
							<th>参与课程数</th>
							<th>邮箱</th>
							<th>注册时间</th>
							<th>操作</th>
						</tr>
						<s:iterator id="student" value="students">
							<s:if test="#student!=null">
								<tr data-id="用户ID">
									<td><a href="<%= homePath%>teacherInfo?teacher.ID=<s:property value="#course.teacher.ID"/>" target="_blank">
										<s:property value="#student.username"/>
										</a>
									</td>
									<td><s:property value="#student.name"/></td>
									<td><s:property value="#student.school"/></td>
									<td>3</td>
									<td><s:property value="#student.email"/></td>
									<td><s:date name="#student.date" format="yyyy--MM-dd"/></td>
									<s:set value="#student" name="student" scope="session"/>
									<td>
										<a href="<%=homePath %>admin/manage/user/edit/studentEdit?student.id=${sessionScope.student.id}" class="manage-edit-btn edit-user-btn" title="修改"><span class="glyphicon glyphicon-pencil"></span></a>
										<a href="<%=homePath %>admin/manage/user/list/admin_deleteStudent?student.id=${sessionScope.student.id}" class="manage-remove-btn remove-user-btn" title="删除"><span class="glyphicon glyphicon-remove"></span></a>							
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
