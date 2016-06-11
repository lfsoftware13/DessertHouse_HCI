<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心</title>

<link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/topnav.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/logoline.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/personalcenter.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/myinfo.css" rel="stylesheet">
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
			<div class="personal_info">
				<img src="http://ww2.sinaimg.cn/crop.0.0.1080.1080.1024/d773ebfajw8eum57eobkwj20u00u075w.jpg" alt="avatar" width="250" height="250"><br>
				<label>昵称：</label><input type="text" id="nickname" value="许可蕊"><br>
				<label>性别：</label><input type="radio" name="sex" id="male" checked="checked">男<input type="radio" name="sex" id="female">女<br>
				<label>真实姓名：</label><input type="text" id="name" value="许珂磊"><br>
				<input type="button" value="保存">
			</div>
		</div>
	</div>

</body>
</html>