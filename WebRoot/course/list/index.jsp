<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/inc/frame/header.jsp" %>

<!doctype html>
<html>
<head>
    <%@ include file="/inc/frame/header.html" %><!-- 通用HTML头  -->
    <title>所有课程 | <%= title %></title>
	<jsp:include page="<%= cssPage %>"></jsp:include><!-- 通用CSS样式  -->
</head>
<body>
	<jsp:include page="<%= navPage %>"></jsp:include><!-- 导航条  -->
	
	<div class="container-fluid">
		<div class="row">
			<div class="pane-holder bottom-space col-md-10 col-md-offset-1">
				<h6>所有课程 <span class="pane-info course-count">${courses.size() }</span></h6><hr>
		          <div class="form-group filter-holder">
		              <select data-toggle="select" class="form-control select select-default">
		                <option><a href="#">全部分类</a></option>
		                <option><a href="#">文学艺术</a></option>
		                <option><a href="#">哲学历史</a></option>
		                <option><a href="#">经管法学</a></option>
		                <option><a href="#">基础科学</a></option>
		                <option><a href="#">工程技术</a></option>
		                <option><a href="#">农林医药</a></option>
		              </select>
		          </div>
		          <div class="form-group search-holder">
		            <div class="input-group">
		              <input type="text" class="form-control">
		              <div class="input-group-btn">
					    <button class="btn btn-primary" type="button"><span class="glyphicon glyphicon-search"></span></button>
		              </div>
		            </div>
		          </div>
		          
					<div class="row course-row">
					<s:iterator value="courses" id="course">
						<s:if test="#course!=null">
						  <div class="col-sm-4 col-md-4">
						    <div class="course-block thumbnail">
						    	<s:set value="#course" id="course" />
						      <a href="<%= homePath%>course/info/info?course.id=${course.id}" target="_blank"><img data-src="holder.js/400x225" src="<%= homePath %>upload/<s:property value="#course.picURL" />" alt="..."></a>
							<div class="caption">
						  	<h6 class="course-name"><a href='<%= homePath + "course/info" %>' target="_blank"><s:property value="#course.name" /></a></h6>
						        <div class="info">
							        <span class="grade glyphicon glyphicon-star"><s:property value="courseScore[#course.name]" /></span>  					        
							        <span class="attend-count glyphicon glyphicon-user"><s:property value="stuQuantity[#course.name]" /></span>
						        </div>
						      </div>
						    </div>
						  </div>
						 </s:if>
					  </s:iterator>
					  
					
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
