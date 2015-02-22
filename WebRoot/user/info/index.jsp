<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/inc/frame/header.jsp" %>

<!doctype html>
<html>
<head>
    <%@ include file="/inc/frame/header.html" %><!-- 通用HTML头 -->
    <title>个人中心 | <%= title %></title>
	<jsp:include page="<%= cssPage %>"></jsp:include><!-- 通用CSS文件 -->
</head>
<body>
	<jsp:include page="<%= navPage %>"></jsp:include><!-- 导航条  -->
	
	<div class="container-fluid">
		<div class="row bottom-space">
			<div class="col-md-3 col-md-offset-1">
				<div class="pane-holder info-holder">
					<div class="avatar-holder">
					  <img class="avatar img-circle" src="<%= homePath %>upload/${student.picURL} " data-holder-rendered="true" >
					</div><hr>
					<h6 class="name">${student.name }</h6><hr>
					<p><span class="glyphicon glyphicon-envelope"></span>${student.email }</p>
					<p><span class="glyphicon glyphicon-heart"></span>${student.hobby }</p><hr>
					<a href="<%= homePath%>user/edit/edit?student.username=${student.username}"  id="edit-btn" class="btn btn-primary btn-block">修 改</a>
				</div>
			</div>
			<div class="col-md-7">
				<div class="pane-holder course-pane-holder">
					<h6>参与的课程<span class="pane-info">${courses.size()}</span></h6><hr>
					
					<div class="row course-row">
						
					<s:iterator value="courses" id="course">
						<s:if test="#course!=null">
						<div class="col-sm-6 col-md-6">
						    <div class="course-block thumbnail">
						      <a href="<%= homePath%>course/info/info?course.id=<s:property value="#course.id"/>" target="_blank"><img data-src="holder.js/400x225" src="<%= homePath %>/upload/<s:property value="#course.picURL"/>" alt="..."></a>
						      <div class="caption">
						        <h6 class="course-name"><a href="<%= homePath%>course/info/info?course.id=<s:property value="#course.id"/>" target="_blank"><s:property value="#course.name"/></a></h6>
						        <div class="info">
							        <span class="grade glyphicon glyphicon-star"><s:property value="courseScore[#course.name]"/></span>  					        
							        <span class="attend-count glyphicon glyphicon-user"><s:property value="stuQuantity[#course.name]"/></span>
						        </div>
						      </div>
						    </div>
						</div>
						</s:if>
					</s:iterator>
					  
					 
					
					 
					

					</div>
					
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="<%= jsPage %>"></jsp:include><!-- 通用JS文件 -->
</body>
</html>

