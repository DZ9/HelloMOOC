<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/inc/frame/header.jsp" %>

<%-- 页脚  --%>
<!-- 确认模态框 -->
<div class="modal" id="message-modal" tabindex="-1" role="dialog" aria-labelledby="message-modal-title" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h6 class="modal-title" id="message-modal-title"></h6>
      </div>
      <div class="modal-body">
      	<span id="message-modal-content"></span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-w" id="message-modal-cancel-btn" data-dismiss="modal">取 消</button>
        <button type="button" class="btn btn-primary btn-w" id="message-modal-confirm-btn" data-dismiss="modal">确 定</button>	        
      </div>
    </div>
  </div>
</div><!-- 确认模态框END -->
<footer class="text-center">
	
</footer>