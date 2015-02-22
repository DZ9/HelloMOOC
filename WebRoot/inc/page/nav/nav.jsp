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
      <a class="navbar-brand" href="<%= homePath %>"><%= title %></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="navbar-collapse-1">
      <ul class="nav navbar-nav">
            <li><a href='<%= homePath + "course/list" %>'>课程列表</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown"><!-- 注册下拉菜单 -->
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">注册<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href='<%= homePath + "user/signup" %>'>用 户</a></li>
            <li class="divider"></li>
            <li><a href='<%= homePath + "teacher/signup" %>'>教 师</a></li>
          </ul>
        </li>
        <li class="dropdown"><!-- 登录下拉菜单 -->
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">登录<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
			<li><a class="hide" data-toggle="modal" data-target="#user-login-modal" data-backdrop="static" href="#">用 户</a></li>
			<li><a href='<%= homePath + "user/login" %>' id="user-login-link">用 户</a></li>
            <li class="divider"></li>
			<li><a class="hide" data-toggle="modal" data-target="#teacher-login-modal" data-backdrop="static" href="#">教 师</a></li>
			<li><a href='<%= homePath + "teacher/login" %>' id="teacher-login-link">教 师</a></li>
            <li class="divider"></li>            
            <li><a href='<%= homePath + "admin/login/login.action" %>' id="admin-login-link">管理员</a></li>          
          </ul>
        </li>
      </ul>
    </div>
  </div>