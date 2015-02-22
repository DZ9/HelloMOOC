<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/inc/frame/header.jsp" %>

<!doctype html>
<html>
<head>
    <%@ include file="/inc/frame/header.html" %><!-- 通用HTML头  -->
    <title>视频播放 | <%= title %></title>
    <link href='<%= homePath + kitPath + "flowplayer/skin/minimalist.css" %>' rel="stylesheet">
	<jsp:include page="<%= cssPage %>"></jsp:include><!-- 通用CSS样式  -->
</head>

<!-- 与异步登录返回结果一致，若未登录则data-account-*全为空 -->
<body data-account-id="${session.studentID }" 
		data-account-name="${session.student}" 
		data-account-type="8" 
		data-vid="${video.id}" 
		data-cid="${video.course.id}" 
		data-isAttend="false"
		>
		
	<jsp:include page="<%= navPage %>"></jsp:include><!-- 导航条  -->
	
	<div class="container-fluid">
		<div class="row"><!-- 视频 -->
			<div class="player-holder">
				<div id="player" class="flowplayer is-splash" data-swf='<%= homePath + kitPath + "flowplayer/flowplayer.swf" %>'>
				   <video>
				      <source type="video/mp4" src="<%= homePath %>upload/${video.url}">
				   </video>
				</div>
				<div class="player-float-mask" title="点击隐藏"></div><!-- 视频浮动遮罩 -->
			</div>
		</div><!-- 视频END -->

		<div class="barrage-area"><!-- 弹幕区 -->
			<pre class="template barrage-float-item"></pre>
		</div><!-- 弹幕区END -->
		<div class="row barrage-control-holder"><!-- 弹幕控制 -->
			<div class="barrage-control">
				<div class="input-group">
					<span class="input-group-btn">
						<button id="barrage-control-btn" class="btn btn-default" type="button">弹 幕</button>
					</span>
					<input id="barrage-text-input" type="text" class="form-control" placeholder="在这里输入弹幕文字">
					<span class="input-group-btn">
						<button id="barrage-cancel-btn" class="btn btn-default" type="button">取 消</button>
						<button id="barrage-publish-btn" class="btn btn-default" type="button" data-loading-text="发布中...">发 布</button>
					</span>
			    </div>
			</div>
		</div><!-- 弹幕控制END -->

		<div class="row video-info-holder"><!-- 视频信息 -->
			<div class="video-info-pane">
				<h1 class="video-title">${video.name }</h1><hr>
				<div class="course-info">
					课程：<a class="course-link" href="<%=homePath%>info?course.id=${video.course.id}">${video.course.name }</a><span class="course-grade">评分:<s:property value="courseScore[video.course.name]" /></span><br>
					教师：<a class="teacher-link" href="<%=homePath%>teacherInfo?teacher.ID=${video.course.teacher.ID }">${video.course.teacher.name }</a><span class="teacher-info">${video.course.teacher.school}</span><br><hr>
					<!--  
					上一课：<a class="video-link" href="#">【上一课视频名】</a><br>
					下一课：<a class="video-link" href="#">【下一课视频名】</a>
					-->	
				</div>
			</div>
		</div><!-- 视频信息END -->

		<div class="row com-pane-holder"><!-- 交流 -->
			<div class="com-pane">
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active">
						<a href="#discuss-all-pane" role="tab" data-toggle="tab">课程讨论<span class="pane-info">0</span></a>
					</li>
					<li role="presentation" class="per-hide">
						<a href="#discuss-mine-pane" role="tab" data-toggle="tab">与我相关<span class="pane-info">0</span></a>
					</li>
					<li role="presentation">
						<a href="#note-all-pane" role="tab" data-toggle="tab">全部笔记<span class="pane-info">0</span></a>
					</li>
					<li role="presentation" class="per-hide">
						<a href="#note-mine-pane" role="tab" data-toggle="tab">我的笔记<span class="pane-info">0</span></a>
					</li>
					<li role="presentation">
						<a href="#barrage-list-pane" role="tab" data-toggle="tab">弹幕列表<span class="pane-info">0</span></a>
					</li>
				</ul>
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="discuss-all-pane"><!-- 课程讨论 -->
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
								<input id="note-public-check" name="id" type="checkbox"> 公开笔记
							</label>
							<button id="note-update-btn" class="btn btn-primary" type="button" data-loading-text="更新中..." autocomplete="off">更新笔记</button>
						</div>
					</div><!-- 我的笔记END -->
					<div role="tabpanel" class="tab-pane" id="barrage-list-pane"><!-- 弹幕列表 -->
						<ul class="list-group" id="barrage-list">
							<a href="javascript:;" class="template list-group-item">
								<span class="badge barrage-time"></span>
								<span class="badge remove-barrage-btn"><span class="glyphicon glyphicon-remove"></span></span>
								<div class="list-item-text barrage-text auto-wrap"></div>
							</a>
						</ul>
					</div><!-- 弹幕列表END -->
				</div>
			</div>
		</div><!-- 交流END -->
	</div>
	
	<jsp:include page="<%= footerPage %>"></jsp:include><!-- 页脚  -->
	
	<jsp:include page="<%= jsPage %>">
		<jsp:param value="true" name="isExcludeLocal"/>
	</jsp:include><!-- 通用JS脚本 -->
	
	<script src="<%= homePath + kitPath %>flowplayer/flowplayer.min.js"></script>
	<script src="<%= curPath %>js/video.js"></script>
	<script src="<%= curPath %>js/barrage.js"></script>
	<script src="<%= curPath %>js/discuss.js"></script>
	<script src="<%= curPath %>js/note.js"></script>
	<script src="<%= curPath %>js/main.js"></script>

</body>
</html>
