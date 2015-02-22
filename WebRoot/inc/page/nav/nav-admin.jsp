<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/inc/frame/header.jsp" %>

  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1">
        <span class="sr-only"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="javascript:;"><%= title %></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="navbar-collapse-1">
      <ul class="nav navbar-nav">
<%--         <li><a href='<%= homePath + "course/list" %>'>课程列表</a></li> --%>
        <li><a href='<%= homePath + "admin/manage/course/list/course" %>'>课程管理</a></li>
        <li><a href='<%= homePath + "admin/manage/teacher/list/teacher" %>'>教师管理</a></li>
        <li><a href='<%= homePath + "admin/manage/verify/list/verify" %>'>教师审核</a></li>
        <li><a href='<%= homePath + "admin/manage/user/list/user" %>'>用户管理</a></li>
	<% if( Boolean.parseBoolean(request.getParameter("isSuperAdmin")) ){ %>
        <li><a href='<%= homePath + "admin/manage/admin/list/admin" %>'>管理员</a></li>
	<% } %>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          	<s:if test="#session.admin!=null">
          		<a href="#" class="dropdown-toggle" data-toggle="dropdown"><s:property value="#session.admin"/></a>
          	</s:if>
          	<s:else>
          		<a href=<%= homePath + "admin/login/index.jsp" %>>您尚未登录</a>
          	</s:else>
          <!--  <a href="#" class="dropdown-toggle" data-toggle="dropdown">用户名</a>-->
          <ul class="dropdown-menu" role="menu">
            <li><a href='<%= homePath + "admin/info" %>'>个人中心</a></li>
            <li class="divider"></li>
            <li><a href='admin_logout'>注销</a></li>
            <!--  <li><a href='<%= homePath + "logout" %>'>注销</a></li>-->
          </ul>
        </li>
      </ul>
      <s:debug></s:debug>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->