<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>安全中心</title>

<link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/topnav.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/logoline.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/personalcenter.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/security.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/public.css" rel="stylesheet">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>

</head>
<body>
	<%@ include file="topnav.jsp" %>
	<%@ include file="logoline2.jsp" %>

	<div class="tl_container">
		
		<%@ include file="pc_leftnav.jsp" %>
		
		<div class="pc_right_part">
			<div class="security_item">
				<p>登录邮箱</p>
				<table>
					<tr>
						<td>xinjin@163.com</td>
						<td><a href="#">修改邮箱</a></td>
					</tr>
				</table>
			</div>
			
			<div class="security_item">
				<p>绑定手机</p>
				<table>
					<tr>
						<td>130xxxx3152</td>
						<td><a href="#">修改手机</a></td>
					</tr>
				</table>
			</div>
			
			<div class="security_item">
				<p>修改密码</p>
				<table>
					<tr>
						<td>******</td>
						<td><a href="#">修改密码</a></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>