<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<nav class="navbar navbar-inverse page-navbar" role="navigation">

<%-- 在这里统一指定导航条的显示方式  --%>


<%
	 HttpSession s = request.getSession(); 
 	 if(s.getAttribute("admin") != null) {
  %>	 
  	<jsp:include page="nav-admin.jsp">
		<jsp:param value="true" name="isSuperAdmin"/>
	</jsp:include>
<%
 	 }else if(s.getAttribute("teacher") != null) {
%>
	<jsp:include page="nav-teacher.jsp"></jsp:include>
<%
 	 }else if(s.getAttribute("student")!= null) {
 %>	
 	<jsp:include page="nav-user.jsp"></jsp:include>
 <%
 	 }else {
 %>
 	<jsp:include page="nav.jsp"></jsp:include>
	<jsp:include page="/user/login/modal.jsp"></jsp:include>
	<jsp:include page="/teacher/login/modal.jsp"></jsp:include>
 <%		 
 	 }
 %>
 	


</nav>