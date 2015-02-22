<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<nav class="row text-center">
	<ul class="pagination <%=request.getParameter("class") %>">
		<li class="template page-min"><a class="fui-arrow-left" href="javascript:void(0)"></a></li>	
		<li class="template page-index"><a data-to-page="[index]" href="javascript:void(0)">[num]</a></li>
		<li class="template page-max"><a class="fui-arrow-right" href="javascript:void(0)"></a></li>
	</ul>
</nav>