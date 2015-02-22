<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/inc/frame/header.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!--[if lt IE 9]><script type="text/javascript"> isltIE9 = true; </script><![endif]-->
	<script type="text/javascript"> if(typeof(isltIE9) == "undefined") window.location.href = "<%= homePath %>"; </script>
	
    <title>不被支持的浏览器 | <%= title %></title>
    <style>
		h1,h2,h3{
			font-family:'Microsoft YaHei',Arial,Verdana,sans-serif;
			text-align:center;
			line-height:2em;
			letter-spacing:0.1em;
		}
		h1{font-size:4em;border-bottom:solid 1px #CCC;}
		h2,h3{font-weight:normal;}
		a{text-decoration:none;}
		a:hover{border-bottom:solid 0.1em #0000FF;}
	</style>
</head>
<body>
	<h1>不好意思</h1>
    <h2>您的IE版本过低，请升级您的浏览器</h2>
    <h3><a href="<%= homePath %>" target="_self">尝试返回主页</a></h3>
</body>
</html>