<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%if(session.getAttribute("user") != null){%>
<div class="topnav">
	<div>
		<!--向左对齐-->
		<font class="topnav-text topnav-left title">LingTu.Com</font>
		<a class="topnav-text topnav-left">请登录</a>
		<a class="topnav-text topnav-left">免费注册</a>
	</div>
</div>
<%}else{%>
<div class="topnav">
	<div>
		<!--向左对齐-->
		<font class="topnav-text topnav-left title">LingTu.Com</font>
		<!--向右对齐-->
		<a class="topnav-text topnav-right user" href="../PersonalCenterServlet"> 
			<i class = "fa fa-user fa-lg"></i>
			&nbspUser1
		</a>
	</div>
</div>
<%}%>