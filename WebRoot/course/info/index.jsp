<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/inc/frame/header.jsp" %>

<!doctype html>
<html>
<head>
    <%@ include file="/inc/frame/header.html" %><!-- 通用HTML头  -->
    <title>课程信息 | <%= title %></title>
	<jsp:include page="<%= cssPage %>"></jsp:include><!-- 通用CSS样式  -->
</head>

<!-- 与异步登录返回结果一致，若未登录则data-account-*全为空 -->
<body data-account-id="用户ID" 
		data-account-name="用户名" 
		data-account-type="账号类型" 
		data-cid="课程ID" 
		data-isAttend="true|false(当前用户是否参与此课程)"
		>
		
	<jsp:include page="<%= navPage %>"></jsp:include><!-- 导航条  -->
	
	<div class="container-fluid">
		<div class="row">
			<div class="pane-holder bottom-space col-md-10 col-md-offset-1">
				<h6>${course.name }<a href="#" id="attend-btn" class="btn btn-default btn-w">参 与</a></h6><hr>
				<div class="course-info-holder">
					<div class="info-block">
						<div class="title">教师：</div>
						<div class="content"><a href="<%= homePath%>teacherInfo?teacher.ID=${course.teacher.ID }" target="_blank">${course.teacher.name }</a><span class="school">${course.teacher.school }</span></div>
					</div>
					<div class="info-block">
						<div class="title">简介：</div>
						<div class="content intro">${course.introduction }</div>
					</div>
					<div class="info-block">
						<div class="title">参与：</div>
						<div class="content attend"><span id="attend"><s:property value="stuQuantity[course.name]" /></span>人</div>
						
					</div>
					<div class="info-block">
						<div class="title">评分：</div>
						<div class="content rate"><span id="rate" 
							data-grade-all="<s:property value="courseScore[course.name]" />" data-grade-mine="" data-readonly="false"
							></span><span class="rate-info"></span><sapn class="rate-mine"></sapn></div>
					</div>
				</div><hr>
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active">
						<a href="#video-pane" role="tab" data-toggle="tab">课程视频<span class="pane-info">${videos.size() }</span></a>	
					</li>
					<li role="presentation">
						<a href="#resource-pane" role="tab" data-toggle="tab">课程资料<span class="pane-info">${resources.size()}</span></a>
					</li>
					<li role="presentation">
						<a href="#discuss-all-pane" role="tab" data-toggle="tab">课程讨论<span class="pane-info">0</span></a>
					</li>
					<li role="presentation" class="per-hide">
						<a href="#discuss-mine-pane" role="tab" data-toggle="tab">与我相关<span class="pane-info">0</span></a>
					</li>					
					<li role="presentation">
						<a href="#note-all-pane" role="tab" data-toggle="tab">课程笔记<span class="pane-info">0</span></a>
					</li>
					<li role="presentation" class="per-hide">
						<a href="#note-mine-pane" role="tab" data-toggle="tab">我的笔记<span class="pane-info">0</span></a>
					</li>
					<li role="presentation">
						<a href="#msg-pane" role="tab" data-toggle="tab">课程通知<span class="pane-info">${posts.size() }</span></a>
					</li>					
				</ul>
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="video-pane"><!-- 课程视频 -->
						<div class="video-pane">
							<div class="table-responsive">
								<table class="table table-hover" id="video-list">
									<tr>
										<th>名称</th>
										<th>大小</th>				
									</tr>
									<s:iterator var="video" value="videos">
									<s:set id="video" value="#video" />
									<tr data-id="视频ID">
										<td class="video-title"><a href="<%= homePath %>video/play/play?video.id=${video.id}" target="_blank">${video.name}</a></td>
										<td>${video.size}</td>	
									</tr>
									</s:iterator>
								</table><hr>
							</div>
						</div>
					</div><!-- 课程视频END -->
					<div role="tabpanel" class="tab-pane" id="resource-pane"><!-- 课程资料 -->
						<div class="resource-pane">
							<div class="table-responsive">
								<table class="table table-hover" id="resource-list">
									<tr>
										<th>文件名</th>											
									</tr>
									<s:iterator var="r" value="resources">
									<tr data-id="资料ID">
										<td class="resource-title"><a href="<%=homePath %>upload/${r.name}" target="_blank">${r.name }</a></td>	
									</tr>
									</s:iterator>
								</table><hr>
							</div>
						</div>
					</div><!-- 课程资料END -->
					<div role="tabpanel" class="tab-pane" id="discuss-all-pane"><!-- 课程讨论 -->
						<div class="discuss-publish-pane">
							<textarea id="discuss-input" class="form-control" rows="4"></textarea>
							<label>
								<input  type="checkbox" id="at-teacher-check"> @教师
							</label>
							<button id="discuss-publish-btn" class="btn btn-primary" type="button" data-loading-text="发表中..." autocomplete="off">发表新内容</button>	
						</div>
						<ul class="list-group" id="discuss-all-list">
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
									<a class="show-reply-pane-btn" href="javascript:void(0)">回复</a>
									<a class="discuss-remove-btn" href="javascript:void(0)">删除</a>
								</div>
							</li>
						</ul>
						<jsp:include page="<%= paginationTemplatePage %>">
							<jsp:param value="pagination-discuss-all" name="class"/>
						</jsp:include>
					</div><!-- 课程讨论END -->
					<div role="tabpanel" class="tab-pane per-hide" id="discuss-mine-pane"><!-- 与我相关 -->
						<div class="discuss-mine-pane">
							<span id="discuss-mine-info">发表与回复</span>
							<a id="discuss-readall-btn" href="#">全部设为已读<span class="unread-count">0</span></a>
						</div>
						<ul class="list-group" id="discuss-mine-list">
						</ul>
						<jsp:include page="<%= paginationTemplatePage %>">
							<jsp:param value="pagination-discuss-mine" name="class"/>
						</jsp:include>
					</div><!-- 与我相关END -->
					<div role="tabpanel" class="tab-pane" id="note-all-pane"><!-- 公开笔记 -->
						<div class="note-all-pane">
							<ul class="list-group" id="note-all-list">
								<li class="list-group-item note-item template">
									<div class="note-item-profile">
										<img class="avatar"/>
										<a target="_blank" class="name"></a>
									</div>
									<div class="list-item-text ellipsis note-text"></div>
									<div class="note-ctrl">
										<a class="show-note-btn" href="javascript:void(0)">切换折叠</a>
									</div>
								</li>
							</ul><hr>
							<jsp:include page="<%= paginationTemplatePage %>">
								<jsp:param value="pagination-note-all" name="class"/>
							</jsp:include>
						</div>
					</div><!-- 公开笔记END -->
					<div role="tabpanel" class="tab-pane per-hide" id="note-mine-pane"><!-- 我的笔记 -->
						<div>
							<textarea id="note-input" class="form-control" rows="20"></textarea>
							<label>
								<input id="note-public-check" type="checkbox"> 公开笔记
							</label>
							<button id="note-update-btn" class="btn btn-primary" type="button" data-loading-text="更新中..." autocomplete="off">更新笔记</button>
						</div>
					</div><!-- 我的笔记END -->
					<div role="tabpanel" class="tab-pane" id="msg-pane"><!-- 课程通知 -->
						<div class="msg-pane">
							<div class="table-responsive">
								<table class="table table-hover" id="msg-list">
									<tr>
										<th>标题</th>
										<th>时间</th>
									</tr>
									<s:iterator var="p" value="posts">
									<tr data-id="通知ID">
										<td class="msg-title ellipsis"><a href="#">${p.title }</a></td>
										<td class="msg-date"><s:date name="#p.time"  format="yyyy-MM-dd" /></td>
									</tr>
									</s:iterator>
								</table><hr>
							</div>
						</div>
					</div><!-- 课程通知END -->
				</div>
			</div>
		</div>
	</div>
	<!-- 通知显示模态框 -->
	<div class="modal fade" id="msg-show-modal" tabindex="-1" role="dialog" aria-labelledby="msg-show-title" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	        <h6 class="modal-title" id="msg-show-title"></h6>
	      </div>
	      <div class="modal-body">
	      <span class="hide" id="content_dx">${p.content}</span>
	        <span id="msg-show-content"></span>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary btn-w" data-dismiss="modal">关 闭</button>
	      </div>
	    </div>
	  </div>
	</div><!-- 通知显示模态框END -->
	
	<jsp:include page="<%= footerPage %>"></jsp:include><!-- 页脚  -->
	
	<jsp:include page="<%= jsPage %>">
		<jsp:param value="true" name="isExcludeLocal"/>
	</jsp:include><!-- 通用JS脚本 -->

	<script src="<%= curPath %>js/discuss.js"></script>
	<script src="<%= curPath %>js/note.js"></script>
	<script src="<%= curPath %>js/main.js"></script>
</body>
</html>
