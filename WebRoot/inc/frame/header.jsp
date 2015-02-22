<%
	String path = request.getContextPath();
	int port = request.getServerPort();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+port+path+"/";

	String domain = request.getScheme() + "://" + request.getServerName(); //上线后则替换为域名
	String homePath = domain + (port == 80? "" : (":" + port)) + path + "/";
	String curPath = homePath + request.getRequestURI().replace(request.getContextPath()+"/", "").replace("index.jsp","");
	
	String supportPath = homePath + "support/";	
	
	String incPath = "inc/";
	String kitPath = "kit/";
	String pagePath = incPath + "page/";
	
	String cssPage = "/" + incPath + "frame/css.jsp";
	String jsPage = "/" + incPath + "frame/js.jsp";
	String navPage = "/" + pagePath + "nav/get.jsp";
	String paginationPage = "/" + pagePath + "pagination/get.jsp";
	String paginationTemplatePage = "/" + pagePath + "pagination/template.jsp";
	String footerPage = "/" + pagePath + "footer/get.jsp";
	
	String defaultAvatarURL = homePath + kitPath + "images/avatar.jpg";
	//String defaultCImgURL = homePath + kitPath + "images/cimg.jpg";
	String defaultCImgURL = homePath + "upload";
	String defaultVideoImgURL = homePath + kitPath + "images/video.jpg";
	//在线学习互动平台
	String title = new String("HelloMOOC!".getBytes("ISO-8859-1"), "UTF-8");
%>
<%@ taglib prefix="s" uri="/struts-tags" %>