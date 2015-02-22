<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/inc/frame/header.jsp" %>

<!doctype html>
<html>
<head>
    <%@ include file="/inc/frame/header.html" %><!-- 通用HTML头  -->
    <title>管理员 | <%= title %></title>
	<jsp:include page="<%= cssPage %>"></jsp:include><!-- 通用CSS样式  -->
</head>
<body>
	<jsp:include page="<%= navPage %>"></jsp:include><!-- 导航条  -->
	
	<div class="container-fluid">
		<div class="row">
			<div class="pane-holder bottom-space col-md-10 col-md-offset-1">
				<h6>管理员<a id="manage-add-btn" href='<%= homePath + "admin/manage/admin/add" %>' class="btn btn-default"><span class="glyphicon glyphicon-plus"></span></a></h6><hr>
				<div class="table-responsive">
					<table class="table table-hover">
						<tr>
							<th>用户名</th>
							<th>权限</th>
							<th>操作</th>
						</tr>
						<s:iterator id="admin" value="admins">
							<s:if test="#admin!=null">
								<tr data-id="管理员ID">
									<td><s:property value="#admin.username"/></td>
									<td>
									<s:if test="#admin.authority==0">
										普通管理员
									</s:if>
									<s:else>
										超级管理员
									</s:else>
									
									</td>
									<s:set value="#admin" name="admin" scope="session"/>
									<td>
										<a href="admin/manage/admin/list/admin_deleteAdmin?admin.ID=${sessionScope.admin.ID}" class="manage-remove-btn remove-admin-btn" title="删除"><span class="glyphicon glyphicon-remove"></span></a>						
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
