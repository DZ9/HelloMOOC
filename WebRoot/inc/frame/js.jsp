<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>

<script src="<%= homePath + kitPath %>js/jquery-2.1.3.min.js"></script>
<script src="<%= homePath + kitPath %>js/jquery.raty.min.js"></script>
<script src="<%= homePath + kitPath %>js/flat-ui.min.js"></script>
<script src="<%= homePath + kitPath %>js/application.js"></script>

<script src="<%= homePath + kitPath %>js/const.js"></script>
<script src="<%= homePath + kitPath %>js/main.js"></script>
<script src="<%= homePath + kitPath %>js/login.js"></script>

<% if( !Boolean.parseBoolean(request.getParameter("isExcludeLocal")) ){ %>
<script src="<%= curPath %>js/main.js"></script>
<% } %>