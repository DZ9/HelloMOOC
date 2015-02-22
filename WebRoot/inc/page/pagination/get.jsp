<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 分页导航 --%>

<%
	int count = Integer.parseInt(request.getParameter("count"));	//导航页数
	int total = Integer.parseInt(request.getParameter("total"));	//总页数
	int index = Integer.parseInt(request.getParameter("index"));	//当前页序
	String url = request.getParameter("url");	//匹配地址（$）
	
	if(total <= 0 || count <= 0 || index < 0){
		return;
	}
	
	int startIndex = index - count / 2;
	count = total < count? total: count;	
	startIndex = (startIndex + count < total)? startIndex: (total - count);
	startIndex = startIndex < 0? 0: startIndex;	
	boolean isCanMin = (index != startIndex);
	boolean isCanMax = (index < total - 1);	
%>
<nav class="row text-center">
	<ul class="pagination">
		<li class='page-min <%=(!isCanMin? "hide": "") %>'><a 
			class="fui-arrow-left" 
			href='<%=isCanMin? url.replace("$", "0"): "#" %>'></a>
		</li>
<%
	for(int i = 0; i < count; i++){
%>
		<li class='page-index <%=(startIndex == index? "active": "")%>'><a 
			href='<%=startIndex == index? "#": url.replace("$", String.valueOf(startIndex))%>'
		><%=++startIndex%></a></li>
<%
	}
%>
		<li class='page-max <%=(!isCanMax? "hide": "") %>'><a  
				class='fui-arrow-right' 
				href='<%=isCanMax? url.replace("$", "99999999"): "#" %>'
		></a></li>
	</ul>
</nav>