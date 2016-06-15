<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心</title>

<link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/public.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/topnav.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/logoline.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/personalcenter.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/myinfo.css" rel="stylesheet">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>

</head>
<body>
<div class="lt_container">
	<%@ include file="topnav.jsp" %>
	<%@ include file="logoline.jsp" %>
	
	<div class="bottom_part">
	<%@ include file="pc_leftnav.jsp" %>
		
	<div class="pc_right_part">
		<div class="personal_info">
			<table>
				<tr>
					<td class="title">头像</td>
					<td class="content"><img src="../img/avatar2.jpg" alt="avatar" width="250" height="250"></td>
				</tr>
				<tr>
					<td class="title">昵称</td>
					<td class="content"><input type="text" id="nickname" value="许可蕊"></td>
				</tr>
				<tr>
					<td class="title">性别</td>
					<td class="content">
						<input type="radio" name="sex" value="male" checked="checked">男
						<input type="radio" name="sex" value="female" class="not_first">女
					</td>
				</tr>
				<tr>
					<td class="title">真实姓名</td>
					<td class="content"><input type="text" id="name" value="许珂磊"></td>
				</tr>
			</table>
			
			<div class="div_btn" style="margin-left: 150px;">
				保存
			</div>
						
		</div>
	</div>
	</div>
</div>

<script>

$(".pc_leftnav li:eq(0)").attr("class", "bgcolor_selected");

$(".div_btn").click(function(){
	$(this).addClass("div_btn_clicked");
	var nickname = $("#nickname").val();
	var sex = $("input[name='sex']:checked").val();
	var name = $("#name").val();
	$.ajax({
		type: 'post',
		url: '../PersonalCenterServlet?nickname=' + nickname + "&sex=" + sex + "&name=" + name
	});
	
	setTimeout(function(){$(".div_btn").removeClass("div_btn_clicked");}, 50);
});

</script>

</body>
</html>