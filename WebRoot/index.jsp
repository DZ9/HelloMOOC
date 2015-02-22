<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/inc/frame/header.jsp" %>

<!doctype html>
<html>
<head>
    <%@ include file="/inc/frame/header.html" %><!-- 通用HTML头  -->
    <title><%= title %></title>
	<jsp:include page="<%= cssPage %>"></jsp:include><!-- 通用CSS样式  -->
</head>
<body>
	<jsp:include page="<%= navPage %>"></jsp:include><!-- 导航条  -->
	
	<div class="container-fluid">
		<!-- 轮播 -->
		<div class="row">
			<div id="carousel-generic" class="carousel slide" data-ride="carousel">
			  <ol class="carousel-indicators">
			    <li data-target="#carousel-generic" data-slide-to="0" class="active"></li>
			    <li data-target="#carousel-generic" data-slide-to="1"></li>
			    <li data-target="#carousel-generic" data-slide-to="2"></li>
			  </ol>
			  <div class="carousel-inner" role="listbox">
			    <div class="item active">
			      <img src="images/1.jpg">
			      <div class="carousel-caption">
			        
			      </div>
			    </div>
			    <div class="item">
			      <img src="images/2.jpg">
			      <div class="carousel-caption">
			        
			      </div>
			    </div>
			    <div class="item">
			      <img src="images/3.jpg">
			      <div class="carousel-caption">
			        
			      </div>
			    </div>
			  </div>
			  <a class="left carousel-control" href="#carousel-generic" role="button" data-slide="prev">
			    <span class="glyphicon glyphicon-chevron-left"></span>
			  </a>
			  <a class="right carousel-control" href="#carousel-generic" role="button" data-slide="next">
			    <span class="glyphicon glyphicon-chevron-right"></span>
			  </a>
			</div>
		</div>
		<!-- 轮播END -->
		<div class="bottom-space col-sm-10 col-sm-offset-1">
          <h6 class="show-title">最新课程</h6>
			<div class="row">
			
			  <div class="col-sm-4">
			    <div class="course-block thumbnail">
			      <a href='<%= homePath + "course/info" %>' target="_blank"><img data-src="holder.js/400x225" src="<%= defaultCImgURL %>" alt="..."></a>
			      <div class="caption">
			        <h6 class="course-name"><a href='<%= homePath + "course/info" %>' target="_blank">课程名课程名</a></h6>
			        <div class="info">
				        <span class="grade glyphicon glyphicon-star">8.0</span>  					        
				        <span class="attend-count glyphicon glyphicon-user">55</span>
			        </div>
			      </div>
			    </div>
			  </div>
			  <div class="col-sm-4">
			    <div class="course-block thumbnail">
			      <a href='<%= homePath + "course/info" %>' target="_blank"><img data-src="holder.js/400x225" src="<%= defaultCImgURL %>" alt="..."></a>
			      <div class="caption">
			        <h6 class="course-name"><a href='<%= homePath + "course/info" %>' target="_blank">课程名课程名</a></h6>
			        <div class="info">
				        <span class="grade glyphicon glyphicon-star">8.0</span>  					        
				        <span class="attend-count glyphicon glyphicon-user">55</span>
			        </div>
			      </div>
			    </div>
			  </div>
			  <div class="col-sm-4">
			    <div class="course-block thumbnail">
			      <a href='<%= homePath + "course/info" %>' target="_blank"><img data-src="holder.js/400x225" src="<%= defaultCImgURL %>" alt="..."></a>
			      <div class="caption">
			        <h6 class="course-name"><a href='<%= homePath + "course/info" %>' target="_blank">课程名课程名</a></h6>
			        <div class="info">
				        <span class="grade glyphicon glyphicon-star">8.0</span>  					        
				        <span class="attend-count glyphicon glyphicon-user">55</span>
			        </div>
			      </div>
			    </div>
			  </div>

			</div>
          <h6 class="show-title">最热课程</h6>
			<div class="row">
			
			  <div class="col-sm-4">
			    <div class="course-block thumbnail">
			      <a href='<%= homePath + "course/info" %>' target="_blank"><img data-src="holder.js/400x225" src="<%= defaultCImgURL %>" alt="..."></a>
			      <div class="caption">
			        <h6 class="course-name"><a href='<%= homePath + "course/info" %>' target="_blank">课程名课程名</a></h6>
			        <div class="info">
				        <span class="grade glyphicon glyphicon-star">8.0</span>  					        
				        <span class="attend-count glyphicon glyphicon-user">55</span>
			        </div>
			      </div>
			    </div>
			  </div>
			  <div class="col-sm-4">
			    <div class="course-block thumbnail">
			      <a href='<%= homePath + "course/info" %>' target="_blank"><img data-src="holder.js/400x225" src="<%= defaultCImgURL %>" alt="..."></a>
			      <div class="caption">
			        <h6 class="course-name"><a href='<%= homePath + "course/info" %>' target="_blank">课程名课程名</a></h6>
			        <div class="info">
				        <span class="grade glyphicon glyphicon-star">8.0</span>  					        
				        <span class="attend-count glyphicon glyphicon-user">55</span>
			        </div>
			      </div>
			    </div>
			  </div>
			  <div class="col-sm-4">
			    <div class="course-block thumbnail">
			      <a href='<%= homePath + "course/info" %>' target="_blank"><img data-src="holder.js/400x225" src="<%= defaultCImgURL %>" alt="..."></a>
			      <div class="caption">
			        <h6 class="course-name"><a href='<%= homePath + "course/info" %>' target="_blank">课程名课程名</a></h6>
			        <div class="info">
				        <span class="grade glyphicon glyphicon-star">8.0</span>  					        
				        <span class="attend-count glyphicon glyphicon-user">55</span>
			        </div>
			      </div>
			    </div>
			  </div>

			</div>
		</div>
		
		
	</div>
	
	<jsp:include page="<%= footerPage %>"></jsp:include><!-- 页脚  -->
	<jsp:include page="<%= jsPage %>"></jsp:include><!-- 通用JS脚本  -->
</body>
</html>
