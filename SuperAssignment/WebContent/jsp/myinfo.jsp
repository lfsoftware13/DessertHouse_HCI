<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="homework.model.Member" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心</title>

<link
	href="http://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
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
			<div class="avatar">
				<img src="../img/avatar2.jpg">
			</div>
			<%
			Member userInfo = (Member)session.getAttribute("userInfo");
			%>
			<div class="info">
				<table>
					<tr>
						<td class="title">昵称</td>
						<td class="content"><input type="text" id="nickname" value="<%= userInfo.getNickname() %>"></td>
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
						<td class="content"><input type="text" id="name" value="<%= userInfo.getName() %>"></td>
					</tr>
				</table>
			</div>
			<div style="clear: both;"></div>
			<div class="div_btn" id="btn_save">保存</div>				
		</div>
	</div>
	</div>
</div>

<script>

$(".pc_leftnav li:eq(0)").addClass("selected");
$(".pc_leftnav li:eq(0)").find("a").addClass("selected");

$("#btn_save").click(function(){
	var nickname = $("#nickname").val();
	var sex = $("input[name='sex']:checked").val();
	var name = $("#name").val();
	alert(nickname + sex + name);
	$.ajax({
		type: 'post',
		url: '../PersonalCenterServlet?nickname=' + nickname + "&sex=" + sex + "&name=" + name,
		success: function(){
			alert("修改成功");
		}
	});
});

if("男" == "<%= userInfo.getSex() %>"){
	$("input[type='radio']:eq(0)").prop("checked", true);
	$("input[type='radio']:eq(1)").prop("checked", false);
}else{
	$("input[type='radio']:eq(0)").prop("checked", false);
	$("input[type='radio']:eq(1)").prop("checked", true);
}

</script>

</body>
</html>