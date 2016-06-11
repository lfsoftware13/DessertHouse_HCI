<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单</title>

<link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/topnav.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/logoline.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/order.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/public.css" rel="stylesheet">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>

</head>
<body>
	<%@ include file="topnav.jsp" %>
	<%@ include file="logoline2.jsp" %>
	
	<div class="choose_address">
		<h2>收货地址</h2>
		<div class="address_list">
			<%for(int i=0; i<5; i++){ %>
			<div class="addressItem">
				江苏省南京市鼓楼区汉口路22号陶园1舍3楼313室
			</div>
			<%} %>
		</div>
		<div style="clear: both"></div>
		<div class="address_settings">
			<a href="../AddressServlet" style="float: left;">使用新地址</a><a href="" style="float: right;">管理收货地址</a>
		</div>
	</div>
	
	<div class="orderInfo">
		<h2>订单信息</h2>
		<table class="tbl_orderItems">
			<tr>
				<td>商品信息</td>
				<td>单价</td>
				<td>数量</td>
				<td>金额</td>
				<td>操作</td>
			</tr>
			<%for(int i =0; i<10; i++){%>
			<tr>
				<td><a href="">C++高级程序设计</a></td>
				<td>22.0</td>
				<td>2</td>
				<td>44.0</td>
				<td>放回购物车</td>
			</tr>
			<%} %>
		</table>
	</div>
	
	<div class="sum_submit">
		<div class="sum">
			<span>总价88.0元</span>
		</div>
		<div class="submit">
			<input type="button" id="submit" value="提交">
		</div>
	</div>
</body>
</html>