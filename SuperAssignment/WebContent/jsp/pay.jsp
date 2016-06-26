<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>支付</title>

<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery.min.js"></script>

<style>
#pwd input{display: block; float: left; width: 29px; height: 28px; line-height: 28px; font-size: 15px; text-align: center; border: 0px; background-color: transparent; outline: none;}
</style>

</head>
<body>

<div class="lt_container">
	<span style="position: absolute; margin-left: 970px; margin-top: 80px; width: 100px; height: 50px; line-height: 50px; text-align: right;">
		<%= String.format("%.1f", Double.parseDouble(request.getParameter("total"))) %>
	</span>
	<span style="position: absolute; margin-left: 975px; margin-top: 198px; width: 100px; height: 50px; line-height: 50px; text-align: right;">
		<%= String.format("%.1f", Double.parseDouble(request.getParameter("total"))) %>
	</span>
	<div id="pwd" style="position: absolute; margin-left: 220px; margin-top: 400px; width: 178px; height: 30px; line-height: 30px;">
		<input type="text" maxlength="1" style="margin-left: 2px;">
		<input type="text" maxlength="1" style="margin-left: 1px;">
		<input type="text" maxlength="1">
		<input type="text" maxlength="1" style="margin-left: 1px;">
		<input type="text" maxlength="1">
		<input type="text" maxlength="1">
	</div>
	<input type="button" style="position: absolute; margin-left: 220px; margin-top: 465px; width: 100px; height: 35px; line-height: 30px; background-color: transparent; cursor: pointer;" onclick="window.location='../OrdersServlet';">
		
	<div>
		<img src="../img/pay.jpg" style="height: 100%; width: 100%;">
	</div>
</div>



<script>
$("#pwd input:eq(0)").focus();

$("#pwd input").keyup(function(event){
	 var keycode = event.which;
	 if(keycode == 8){
		 if($(this).prevAll().length > 0){
			 $(this).prev("input").focus();
		 }
	 }else{
		 $(this).val("●");
		 if($(this).prevAll().length < 5){
			 $(this).next("input").focus();
		 }
	 }
});

</script>

</body>
</html>