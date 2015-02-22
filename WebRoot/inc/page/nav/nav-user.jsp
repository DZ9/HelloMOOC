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
        <li><a href='<%= homePath + "course/list/list" %>'>课程列表</a></li>
        <li><a href='<%= homePath + "user/course/course" %>'>我的课程</a></li>
        <li><a href='<%= homePath + "user/discuss/discuss" %>'>我的讨论</a></li>
        <li><a href='<%= homePath + "user/note/list/note" %>'>我的笔记</a></li>  
         	  
      </ul>
     
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">${session.student}</a>
          <ul class="dropdown-menu" role="menu">
            <li><a href='<%= homePath + "user/info/info" %>'>个人中心</a></li>        
            <li class="divider"></li>
            <li><a href="user_logout">注销</a></li>
          </ul>
        </li>
      </ul>
       <s:debug></s:debug>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
  