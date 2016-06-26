<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="homework.model.Member" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>安全中心</title>

<link
	href="http://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/public.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/topnav.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/logoline.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/personalcenter.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/security.css" rel="stylesheet">
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
		<div class="init">
		<%
		Member userInfo = (Member)session.getAttribute("userInfo");
		String email = userInfo.getMail();
		if(email.equals("")){
			email = "未填写";
		}else if(email.length() > 35){
			email = email.substring(0, 35) + "...";
		}
		String phone = userInfo.getPhone();
		if(phone.equals("")){
			phone = "未填写";
		}else if(phone.length() > 35){
			phone = phone.substring(0, 35) + "...";
		}
		%>
			<div class="security_item">
				<table class="tbl_pc">
					<tr>
						<td class="title">登录邮箱：</td>
						<td class="content"><%= email %></td>
						<td class="btn"><div class="div_btn" id="show_mod_email">修改邮箱</div></td>
					</tr>
					<tr>
						<td class="title">绑定手机：</td>
						<td class="content"><%= phone %></td>
						<td class="btn"><div class="div_btn" id="show_mod_phone">修改手机</div></td>
					</tr>
					<tr>
						<td class="title">密码：</td>
						<td class="content">**********</td>
						<td class="btn"><div class="div_btn"  id="show_mod_password">修改密码</div></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="div_mod_email div_mod" style="display: none;">
			<div class="div_mod_title">
				<!-- <span>修改邮箱</span> -->
				<a class="return"><i class="fa fa-undo"></i>&nbsp返回</a>
				<div style="clear: both"></div>
			</div>
			<table class="tbl_pc">
				<tr>
					<td class="title">新邮箱地址：</td>
					<td class="content"><input type="text" id="text_new_email1"></td>
				</tr>
				<tr>
					<td class="title">确认新邮箱地址：</td>
					<td class="content"><input type="text" id="text_new_email2"><span class="error_msg"></span></td>
				</tr>
			</table>
			<div class="div_btn" id="btn_mod_email" style="margin-left: 155px;">保存</div>
		</div>
		<div class="div_mod_phone div_mod"  style="display: none;">
			<div class="div_mod_title">
				<!-- <span>修改手机</span> -->
				<a class="return"><i class="fa fa-undo"></i>&nbsp返回</a>
				<div style="clear: both"></div>
			</div>
			<table class="tbl_pc">
				<tr>
					<td class="title">新手机号码：</td>
					<td class="content"><input type="text" id="text_new_phone1"></td>
				</tr>
				<tr>
					<td class="title">确认新手机号码：</td>
					<td class="content"><input type="text" id="text_new_phone2"><span class="error_msg"></span></td>
				</tr>
			</table>
			<div class="div_btn" id="btn_mod_phone" style="margin-left: 155px;">保存</div>
		</div>
		<div class="div_mod_password div_mod"  style="display: none;">
			<div class="div_mod_title">
				<!-- <span>修改密码</span> -->
				<a class="return"><i class="fa fa-undo"></i>&nbsp返回</a>
				<div style="clear: both"></div>
			</div>
			<table class="tbl_pc">
				<tr>
					<td class="title">原密码：</td>
					<td class="content"><input type="password" id="text_old_password"></td>
				</tr>
				<tr>
					<td class="title">新密码：</td>
					<td class="content"><input type="password" id="text_new_password1"></td>
				</tr>
				<tr>
					<td class="title">确认新密码：</td>
					<td class="content"><input type="password" id="text_new_password2"><span class="error_msg"></span></td>
				</tr>
			</table>
			<div class="div_btn" id="btn_mod_password" style="margin-left: 130px;">保存</div>
		</div>
	</div>
	</div>
</div>

<script>
$(".pc_leftnav li:eq(2)").addClass("selected");
$(".pc_leftnav li:eq(2)").find("a").addClass("selected");

$("#show_mod_email").click(function(){
	$(".init").hide();
	$(".div_mod_email").show();
});

$("#show_mod_phone").click(function(){
	$(".init").hide();
	$(".div_mod_phone").show();
});

$("#show_mod_password").click(function(){
	$(".init").hide();
	$(".div_mod_password").show();
});

$(".return").click(function(){
	$(this).parent().parent().hide();
	$(this).parent().parent().find("input").val("");
	$(".error_msg").html("");
	$(".init").show();
});

$(".content input[type='text']").keyup(function(){
	var tbl = $(this).parent().parent().parent();
	var val1 = tbl.find("tr:eq(0)").find("input[type='text']").val();
	var val2 = tbl.find("tr:eq(1)").find("input[type='text']").val();
	if(val2 != ""){
		if(val1 == val2){
			tbl.find(".error_msg").html("输入一致");
		}else{
			tbl.find(".error_msg").html("两次输入不一致");
		}
	}else{
		tbl.find(".error_msg").html("");
	}
});

$(".content input[type='password']").keyup(function(){
	var tbl = $(this).parent().parent().parent();
	var val1 = tbl.find("tr:eq(1)").find("input[type='password']").val();
	var val2 = tbl.find("tr:eq(2)").find("input[type='password']").val();
	if(val2 != ""){
		if(val1 == val2){
			tbl.find(".error_msg").html("输入一致");
		}else{
			tbl.find(".error_msg").html("两次输入不一致");
		}
	}else{
		tbl.find(".error_msg").html("");
	}
});

$("#btn_mod_email").click(function(){
	if($(".div_mod_email .error_msg").html() != "输入一致"){
		return;
	}
	var email1 = $("#text_new_email1").val();
	var email2 = $("#text_new_email2").val();
	$.ajax({
		type: 'post',
		url: '../SecurityServlet?action=email&new=' + email1,
		success: function(){
			window.location = "../SecurityServlet";
		}
	});
});

$("#btn_mod_phone").click(function(){
	if($(".div_mod_phone .error_msg").html() != "输入一致"){
		return;
	}
	var phone1 = $("#text_new_phone1").val();
	var phone2 = $("#text_new_phone2").val();
	$.ajax({
		type: 'post',
		url: '../SecurityServlet?action=phone&new=' + phone1,
		success: function(){
			window.location = "../SecurityServlet";
		}
	});
});

$("#btn_mod_password").click(function(){
	if($(".div_mod_password .error_msg").html() != "输入一致"){
		return;
	}
	var old_password = $("#text_old_password").val();
	var password1 = $("#text_new_password1").val();
	var password2 = $("#text_new_password2").val();
	$.ajax({
		type: 'post',
		url: '../SecurityServlet?action=password&old=' + old_password + '&new=' + password1,
		success: function(msg){
			if(msg == "false"){
				alert("密码错误");
			}else{
				window.location = "../SecurityServlet";
			}
		}
	});
});

</script>

</body>
</html>