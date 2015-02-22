<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/inc/frame/header.jsp" %>

<!doctype html>
<html>
<head>
    <%@ include file="/inc/frame/header.html" %><!-- 通用HTML头  -->
    <title>修改课程 | <%= title %></title>
	<jsp:include page="<%= cssPage %>"></jsp:include><!-- 通用CSS样式  -->
</head>
<body>
	<jsp:include page="<%= navPage %>"></jsp:include><!-- 导航条  -->
	
	<div class="container-fluid">
		<div class="row">
			<div class="pane-holder bottom-space col-md-8 col-md-offset-2">
	          <h6>修改课程</h6>
				<hr>
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active">
						<a href="#info-pane" role="tab" data-toggle="tab">课程信息<!-- <span class="pane-info"></span> --></a>
					</li>	
					<li role="presentation">
						<a href="#video-pane" role="tab" data-toggle="tab">课程视频<!-- <span class="pane-info"></span> --></a>	
					</li>
					<li role="presentation">
						<a href="#resource-pane" role="tab" data-toggle="tab">课程资料<!-- <span class="pane-info"></span> --></a>
					</li>
					<li role="presentation">
						<a href="#msg-pane" role="tab" data-toggle="tab">课程通知<!-- <span class="pane-info"></span> --></a>
					</li>
				
				</ul>
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="info-pane"><!-- 课程信息 -->
						<div class="info-pane">
	          <form role="form" method="post" action="admin_updateCourse" enctype="multipart/form-data">
				<div class="cimg-holder">
				  <input type="file" id="cimg-sel" class="hide" name="file" accept=".jpg,.bmp,.png"/>
				  <input type="hidden" id="cimg-data" />
				  <img class="cimg img-rounded" src="<%=homePath %>upload/${course.picURL}" title="点击更换新图片" data-holder-rendered="true" >
				</div><hr>
				<input class="hide" type="text" name="course.id" value="${course.id}">
				<input class="hide" type="text" name="course.date" value="${course.date}">
				<input class="hide" type="text" name="teacher.ID" value="${course.teacher.ID}">
	            <div class="form-group">
	              <label for="name">课程名称*</label>
	              <input type="text" required="required" value="${course.name}" class="form-control" id="name" name="course.name" placeholder="请输入课程名称">
	            </div>
				<div class="form-group">
					<label for="class">课程分类*</label>
					<select data-toggle="select" class="form-control select select-default" name="courseType.id">
						<option value="${course.courseType.id}">${course.courseType.name }</option>
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
	              <textArea required="required" class="form-control unresize" id="intro" name="course.introduction" rows="6" placeholder="请输入课程简介">${course.introduction}</textArea>
	            </div><hr>
	            <button type="submit" id="edit-info-btn" class="btn btn-primary btn-w right">修 改</button>
	          </form>
						</div>
					</div><!-- 课程信息END -->	
					<div role="tabpanel" class="tab-pane" id="video-pane"><!-- 课程视频 -->
						<div class="video-pane">
							<div class="table-responsive">
								<table class="table table-hover" id="video-list">
									<tr>
										<th>名称</th>
										<th>大小</th>					
										<th>操作</th>								
									</tr>
									<s:iterator id="video" value="videos">
									<s:if test="#video!=null">
									<tr data-id="视频ID">
										<td class="video-title ellipsis"><a href="<%= homePath %>video/play" target="_blank"><s:property value="#video.name"/></a></td>
										<td><s:property value="#video.size"/></td>
										<s:set value="#video" name="video" scope="session"/>
										<td>
											<a href="<%=homePath %>admin/manage/course/edit/admin_deleteVideo?video.id=${sessionScope.video.id}" class="manage-remove-btn remove-video-btn" title="删除"><span class="glyphicon glyphicon-remove"></span></a>						
										</td>		
									</tr>
									</s:if>
									</s:iterator>
								</table>
							</div><hr>
							<button id="add-video-btn" class="btn btn-primary btn-w right">添 加</button>
						</div>
					</div><!-- 课程视频END -->
					<div role="tabpanel" class="tab-pane" id="resource-pane"><!-- 课程资料 -->
						<div class="resource-pane">
							<div class="table-responsive">
								<table class="table table-hover" id="resource-list">
									<tr>
										<th>文件名</th>				
										<th>操作</th>												
									</tr>
									<s:iterator id="resource" value="resources">
										<s:if test="#resource!=null">
											<tr data-id="资料ID">
												<s:set value="#resource" name="resource" scope="session"/>
												<td class="resource-title ellipsis"><a href='${sessionScope.resource.url}' target="_blank"><s:property value="#resource.name"/></a></td>
												
												<td>
													<a href="<%=homePath %>admin/manage/course/edit/admin_deleteResource?resource.id=${sessionScope.resource.id}" class="manage-remove-btn remove-resource-btn" title="删除"><span class="glyphicon glyphicon-remove"></span></a>						
												</td>		
											</tr>
										</s:if>
									</s:iterator>
								</table>
							</div><hr>
							<button id="add-resource-btn" class="btn btn-primary btn-w right">添 加</button>
						</div>
					</div><!-- 课程资料END -->
					<div role="tabpanel" class="tab-pane" id="msg-pane"><!-- 课程通知 -->
						<div class="msg-pane">
							<div class="table-responsive">
								<table class="table table-hover" id="msg-list">
									<tr>
										<th>标题</th>
										<th>时间</th>
										<th>操作</th>
									</tr>
									<s:iterator id="post" value="posts">
										<s:if test="#post!=null">
										<tr data-id="通知ID">
											<td class="msg-title ellipsis"><a href="#"><s:property value="#post.title"/></a></td>
											<td class="msg-date"><s:date name="#post.time" format="yyyy-MM-dd" /></td>
											<s:set value="#post" name="post" scope="session"/>
											<td>
												<a href="<%=homePath %>admin/manage/course/edit/admin_deletePost?post.id=${sessionScope.post.id}" class="manage-remove-btn remove-msg-btn" title="删除"><span class="glyphicon glyphicon-remove"></span></a>							
											</td>
										</tr>
										
										</s:if>
									</s:iterator>
								</table>
							</div><hr>
							<button id="add-msg-btn" class="btn btn-primary btn-w right">发 布</button>
						</div>
					</div><!-- 课程讨论END -->
				
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
	       <span class="hide" id="content_dx">${post.content}</span>
	        <span id="msg-show-content"></span>
	      </div>
	      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary btn-w" data-dismiss="modal">关 闭</button>
	      </div>
	    </div>
	  </div>
	</div><!-- 通知显示模态框END -->
	<!-- 通知发布模态框 -->
	<div class="modal fade" id="msg-add-modal" tabindex="-1" role="dialog" aria-labelledby="msg-add-title" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	        <h6 class="modal-title" id="msg-add-title">发布新通知</h6>
	      </div>
	      <div class="modal-body">
	      	<form id="msg-add-form" action="admin_addPost" method="post">
	      		<div class="form-group">
	      			<input type="text" required="required" class="form-control" name="post.title" placeholder="请输入通知标题">
	        	</div>
	        	<div class="form-group">
	        		<textarea id="msg-add-content" name="post.content" class="form-control unresize" rows="12" required="required" placeholder="请输入通知内容"></textarea>
	      		</div>
	      		<button type="submit" class="hide" id="msg-add-submit-btn"></button>
	      	</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default btn-w" id="msg-add-cancel-btn" data-dismiss="modal">关 闭</button>
	        <button type="button" class="btn btn-primary btn-w" id="msg-add-ok-btn">发 布</button>	        
	      </div>
	    </div>
	  </div>
	</div><!-- 通知发布模态框END -->
	<!-- 资料上传模态框 -->
	<div class="modal fade" id="resource-add-modal" tabindex="-1" role="dialog" aria-labelledby="resource-add-title" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	        <h6 class="modal-title" id="resource-add-title">添加新资料</h6>
	      </div>
	      <div class="modal-body">
	      	<form id="resource-add-form" method="post" action="admin_uploadResource" enctype="multipart/form-data">
				<div class="form-group input-holder">
					<input type="file" name="file" class="file-sel hide">
					<input type="text" name="course.id" valuee="${course.id}" class="hide">
					<div class="input-group">
						<input type="text" required="required" name="filename" class="form-control file-name-input" placeholder="请选择文件">
						<span class="input-group-btn">
							<button class="btn btn-default file-sel-btn" type="button">选择文件</button>
						</span>
					</div>
				</div>
				<div class="form-group progress-holder">
					<div class="progress">
					  <div class="progress-bar progress-bar-striped active" role="progressbar">请等待...</div>
					</div>
				</div>
				<button type="submit" class="btn btn-primary btn-w resource-add-ok-btn" data-loading-text="上传中..." autocomplete="off">添 加</button>	
	      	</form>
	      	
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default btn-w resource-add-cancel-btn" data-dismiss="modal">关 闭</button>
	        <button type="button" class="btn btn-primary btn-w resource-add-ok-btn" data-loading-text="上传中..." autocomplete="off">添 加</button>	        
	      </div>
	    </div>
	  </div>
	</div><!-- 资料上传模态框END -->
	<!-- 视频修改模态框 -->
	<div class="modal fade" id="video-edit-modal" tabindex="-1" role="dialog" aria-labelledby="video-edit-title" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	        <h6 class="modal-title" id="video-edit-title">修改视频名</h6>
	      </div>
	      <div class="modal-body">
	      	<form id="msg-add-form" action="#">
	      		<div class="form-group">
	      			<input type="text" required="required" class="form-control" name="name" id="video-name-input" placeholder="请输入视频名">
	        	</div>
	      		<button type="submit" class="hide" id="video-edit-submit-btn"></button>
	      	</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default btn-w" id="video-edit-cancel-btn" data-dismiss="modal">关 闭</button>
	        <button type="button" class="btn btn-primary btn-w" id="video-edit-ok-btn">修 改</button>	        
	      </div>
	    </div>
	  </div>
	</div><!-- 视频修改模态框END -->
	<!-- 视频上传模态框 -->
	<div class="modal fade" id="video-add-modal" tabindex="-1" role="dialog" aria-labelledby="video-add-title" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	        <h6 class="modal-title" id="video-add-title">添加视频</h6>
	      </div>
	      <div class="modal-body">
	      	<form id="video-add-form" action="admin_uploadVideo" method="post" enctype="multipart/form-data">
	      		<div class="form-group input-holder">
	      			<input type="text" required="required" class="form-control name-input" name="filename" placeholder="请输入视频名称">
	        	</div>
				<div class="form-group input-holder">
					<input type="file" name="file" accept=".mp4,.rmvb,.avi,.mkv,.flv,rm" class="file-sel hide">
					<input type="text" name="course.id" class="hide" value="${course.id}">
					<div class="input-group">
						<input type="text" required="required" name="" class="form-control file-name-input" placeholder="请选择文件">
						<span class="input-group-btn">
							<button class="btn btn-default file-sel-btn" type="button">选择文件</button>
						</span>
					</div>
				</div>
				<div class="form-group progress-holder">
					<div class="progress">
					  <div class="progress-bar progress-bar-striped active" role="progressbar">请等待...</div>
					</div>
				</div>
	      	</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default btn-w video-add-cancel-btn" data-dismiss="modal">关 闭</button>
	        <button type="button" class="btn btn-primary btn-w video-add-ok-btn" data-loading-text="上传中..." autocomplete="off">添 加</button>	        
	      </div>
	    </div>
	  </div>
	</div><!-- 视频上传模态框END -->
	<jsp:include page="<%= footerPage %>"></jsp:include><!-- 页脚  -->
	<script src="<%= homePath + kitPath %>js/dataurl-to-blob.js"></script>
	<jsp:include page="<%= jsPage %>"></jsp:include><!-- 通用JS脚本  -->
</body>
</html>
