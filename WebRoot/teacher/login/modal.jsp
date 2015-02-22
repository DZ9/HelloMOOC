<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/inc/frame/header.jsp" %>

<div class="modal fade" id="teacher-login-modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h6 class="modal-title">教师登录</h6>
      </div>
      <div class="modal-body">
		<form class="form-horizontal" role="form">
		  <div class="form-group">
		    <label for="id-input" class="col-sm-2 control-label">用户名</label>
		    <div class="col-sm-10">
		      <input type="email" class="form-control" id="id-input" placeholder="请输入用户名">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="password-input" class="col-sm-2 control-label">密 码</label>
		    <div class="col-sm-10">
		      <input type="password" class="form-control" id="password-input" placeholder="请输入密码">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="vcode-input" class="col-sm-2 control-label">验证码</label>
		    <div class="col-sm-10">
		      <input type="email" class="form-control" id="vcode-input" placeholder="请输入验证码">
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-10 col-md-offset-2">
		      <img src="【】" title="点击更换验证码" />
		    </div>
		  </div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-w btn-default cancel-btn" data-dismiss="modal">取 消</button>
        <button type="button" class="btn btn-w btn-primary login-btn" data-loading-text="登录中...">登 录</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->