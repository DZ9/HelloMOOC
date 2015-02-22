<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/inc/frame/header.jsp" %>

<!doctype html>
<html>
<head>
    <%@ include file="/inc/frame/header.html" %><!-- 通用HTML头  -->
    <title>我的笔记 | <%= title %></title>
	<jsp:include page="<%= cssPage %>"></jsp:include><!-- 通用CSS样式  -->
</head>

<!-- 与异步登录返回结果一致，若未登录则data-account-*全为空 -->
<body data-account-id="${session.studentID }" 
		data-account-name="${session.student }"
		data-account-type="user" 
		>
		
	<jsp:include page="<%= navPage %>"></jsp:include><!-- 导航条  -->

	<div class="container-fluid">
		<div class="row">
			<div class="pane-holder bottom-space col-md-10 col-md-offset-1">
				<h6>我的笔记 <span class="pane-info note-mine-count">0</span></h6><hr>
				<ul class="list-group" id="note-mine-list">
					<li class="list-group-item note-item template">
						<div class="note-item-profile">
							<img class="avatar"/>
							<a target="_blank" class="course-name"></a>
						</div>
						<div class="list-item-text ellipsis note-text"></div>
						<div class="note-ctrl">
							<a class="show-note-btn" href="javascript:void(0)">切换折叠</a>
						</div>
					</li>
				</ul><hr>
				<jsp:include page="<%= paginationTemplatePage %>">
					<jsp:param value="pagination-note-mine" name="class"/>
				</jsp:include>
			</div>
		</div>
	</div>
	
	<!-- 页脚  -->
	<jsp:include page="<%= footerPage %>"></jsp:include>
	<!-- 通用JS脚本 -->
	<jsp:include page="<%= jsPage %>">
		<jsp:param value="true" name="isExcludeLocal"/>
	</jsp:include>
	<!-- 通用JS脚本END -->
	<script src="<%= curPath %>js/note.js"></script>
	<script src="<%= curPath %>js/main.js"></script>

</body>
</html>
