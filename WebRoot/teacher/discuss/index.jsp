<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/inc/frame/header.jsp" %>

<!doctype html>
<html>
<head>
    <%@ include file="/inc/frame/header.html" %><!-- 通用HTML头  -->
    <title>我的讨论 | <%= title %></title>
	<jsp:include page="<%= cssPage %>"></jsp:include><!-- 通用CSS样式  -->
</head>

<!-- 与异步登录返回结果一致，若未登录则data-account-*全为空 -->
<body data-account-id="用户ID" 
		data-account-name="用户名" 
		data-account-type="账号类型" 
		>
		
	<jsp:include page="<%= navPage %>"></jsp:include><!-- 导航条  -->

	<div class="container-fluid">
		<div class="row">
			<div class="pane-holder bottom-space col-md-10 col-md-offset-1">
				<h6>我的讨论 <span class="pane-info discuss-mine-count">0</span></h6><hr>
				<!-- 模板 -->
				<div class="reply-pane template">
					<textarea id="reply-input" class="form-control" rows="4"></textarea>
					<button id="reply-btn" class="btn btn-primary" type="button" data-loading-text="回复中..." autocomplete="off">回 复</button>
					<button id="reply-cancel-btn" class="btn btn-default" type="button">取 消</button>
				</div>
				<li class="list-group-item discuss-item template">
					<div class="discuss-item-profile">
						<img class="avatar"/>
						<a target="_blank" class="name"></a>
						<span class="date"></span>
						<a href="javascript:;" class="reply-to"></a>
					</div>
					<div class="list-item-text discuss-text"></div>
					<div class="discuss-ctrl">
						<span><a class="course-link" target="_blank"></a></span>
						<a class="show-reply-pane-btn" href="javascript:void(0)">回复</a>
						<a class="discuss-remove-btn" href="javascript:void(0)">删除</a>
					</div>
				</li>
				<!-- 模板END -->
				
				<div class="discuss-mine-pane">
					<span id="discuss-mine-info">发表与回复</span>
					<a id="discuss-readall-btn" href="#">全部设为已读<span class="unread-count">0</span></a>
				</div>
				
				<!-- 列表 -->
				<ul class="list-group" id="discuss-mine-list"></ul><hr>
				
				<!-- 分页导航 -->
				<jsp:include page="<%= paginationTemplatePage %>">
					<jsp:param value="pagination-discuss-mine" name="class"/>
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
	<script src="<%= curPath %>js/discuss.js"></script>
	<script src="<%= curPath %>js/main.js"></script>

</body>
</html>
