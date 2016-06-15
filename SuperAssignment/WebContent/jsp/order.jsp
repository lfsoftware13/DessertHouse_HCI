<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单</title>

<link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/public.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/topnav.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/logoline.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/order.css" rel="stylesheet">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>

</head>
<body>
<div class="lt_container">
	<%@ include file="topnav.jsp" %>
	<%@ include file="logoline.jsp" %>

	<div class="bottom_part">
		
	<div class="choose_address">
		<h2>收货地址</h2>
		<div class="address_list">
			<%for(int i=0; i<5; i++){ %>
			<div class="addressItem">
				<p>江苏省南京市鼓楼区汉口路22号陶园1舍3楼313室</p>
			</div>
			<%} %>
		</div>
		<div style="clear: both"></div>
		<div class="address_settings">
			<a href="../AddressServlet">使用新地址</a>
		</div>
	</div>
	
	<div class="orderInfo">
		<h2>订单信息</h2>
		<div class="order_list">
			<table class="tbl_orderItems">
				<tr class="head">
					<td>商品信息</td>
					<td>单价</td>
					<td>数量</td>
					<td>金额</td>
					<td>操作</td>
				</tr>
				<%for(int i =0; i<10; i++){%>
				<tr class="orderline">
					<td><a href="">C++高级程序设计</a></td>
					<td>22.0</td>
					<td>2</td>
					<td>44.0</td>
					<td><a class="deleteline">放回购物车</a></td>
					<td style="display: none;">bookId</td>
				</tr>
				<%} %>
			</table>
		</div>
	</div>
	
	<div class="sum_submit">
		<div class="sum">
			<span>总价：<font id="sum">0</font>元</span>
		</div>
		<div class="submit">
			<div class="div_btn">提交订单</div>
		</div>
	</div>
	
	</div>
</div>

<script>

$(".tbl_orderItems tr:gt(0)").each(function(){
	var sum = parseFloat($(this).find("td:eq(3)").html()) + parseFloat($("#sum").html());
	$("#sum").html(sum.toFixed(1));
});

$(".addressItem:eq(0)").addClass("selected");

$(".addressItem").click(function(){
	$(".address_list .selected").removeClass("selected");
	$(this).addClass("selected");
});

$("a.deleteline").click(function(){
	var sum = parseFloat($("#sum").html()) - parseFloat($(this).parent().parent().find("td:eq(3)").html());
	$("#sum").html(sum.toFixed(1));
	$(this).parent().parent().remove();
});
</script>

</body>
</html>