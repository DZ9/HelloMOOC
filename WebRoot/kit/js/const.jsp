<%@ page language="java" import="java.util.*" contentType="application/javascript" pageEncoding="UTF-8" %>
<%@ include file="/inc/frame/header.jsp" %>

<%-- 要给JS传的常量  --%>

var NAVBAR = "<%= homePath + navPage.substring(1) %>";

var TITLE = "<%= title %>";

var HOMEPATH = "<%= homePath %>";

//默认课程图片尺寸
var CIMG_WIDTH  = 400;
var CIMG_HEIGHT = 225;

//默认用户头像尺寸
var AVATAR_WIDTH  = 100;
var AVATAR_HEIGHT = 100;

//默认视频图片
var VIDEO_IMG = "<%= defaultVideoImgURL %>";

//分页相关
var PAGE_NAV_COUNT = 7;
var MAX_ITEM_COUNT = 10;

//异步接口
var API = {

	//账号
	ACCOUNT : {
		LOGIN 		: "http://127.0.0.1/ejb/login.php",	/* 登录 */
		EXISTED 	: "http://127.0.0.1/ejb/e.php",	/* 存在性检测 */
		
		TYPE : {	/* 账号类型 */
			SUPERADMIN 	: 0,
			ADMIN 		: 2,
			TEACHER 	: 4,
			USER 		: 8
		}
	},
	
	//弹幕
	BARRAGE : {
		GET 		: "<%=homePath %>video/play/user_getBarrage",	/* 获取 */
		PUBLISH 	: "<%=homePath %>video/play/user_postBarrage",	/* 发布 */
		REMOVE 		: "<%=homePath %>video/play/user_deleteBarrage"	/* 删除 */
	},
	
	//笔记
	NOTE : {
		GET_BY_COURSE 	: "http://127.0.0.1/ejb/note.php",	/* 获取课程下公开的笔记 */
		GET 			: "<%=homePath %>user/note/list/user_userNotes",	/* 获取当前用户的笔记 */
		UPDATE 			: "http://127.0.0.1/ejb/note.php?op=update",	/* 更新笔记 */
	},
	
	//讨论
	DISCUSS : {
		GET_BY_COURSE 	: "http://127.0.0.1/ejb/d.php",	/* 获取课程下的讨论 */
		GET 			: "<%=homePath %>user/discuss/user_userComments",	/* 获取当前用户相关的讨论 */
		PUBLISH 		: "http://127.0.0.1/ejb/d.php",	/* 发表评论 */
		UNREAD 			: "http://127.0.0.1/ejb/unread.php",	/* 设置已读 */
		REMOVE 			: "http://127.0.0.1/ejb/d.php?op=del"	/* 删除 */
	}
	
};