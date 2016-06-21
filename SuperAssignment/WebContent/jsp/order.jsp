<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="homework.model.OrderItem" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单</title>

<link
	href="http://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
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
		<div class = "info_title">
			<span>选择收货地址</span>
			<a href="../AddressServlet"><i class="fa fa-plus-circle fa-lg"></i>&nbsp使用新地址</a>
		</div>
		</div>
		<div class = "address_list">
		<%for(int i=0; i<5; i++){ %>
			<div class="addressItem">
				<p>江苏省南京市鼓楼区汉口路22号陶园1舍3楼313室</p>
			</div>
			<%} %>
		</div>
		<div style="clear: both"></div>
		
	</div>
	
	<div class="orderInfo">
		<div class = "info_title">
			<span>选购商品列表 </span>
		</div>
		<div class="order_list">
			<table class="tbl_orderItems">
				<tr class="head">
					<td class="bookinfo">商品信息</td>
					<td class = "price">单价</td>
					<td class = "num">数量</td>
					<td class = "total">金额</td>
					<td>操作</td>
				</tr>
				<%
				ArrayList<OrderItem> orderList = (ArrayList<OrderItem>)session.getAttribute("orderList");
				for(int i =0; i<orderList.size(); i++){
					OrderItem item = orderList.get(i);
				%>
				<tr class="orderline">
					<td class = "bookinfo"><img src="<%= request.getContextPath() %>/img/cpp.jpg" alt="cover">
						<a href=""><%= item.getBook() %></a>

					</td>
					<td class = "price price_info"><%= item.getPrice() %></td>

					<td class = "num">
						<span class="span_quantity" id="span_quantity">
							<span id="quantity_add_order<%=i%>" class = "add_cart" click = "">
							+
							</span>
							 <input
								type="text" value="<%= item.getNumber() %>" id = "input_quantity_order<%=i%>"class="input_quantity_order">
							<span id="quantity_minus_order<%=i%>" class = "minus_cart">
							-
							</span>
								
						</span>
					</td>

					<td class = "total total_info"><%= item.getTotal() %></td>
					<td><a class="deleteline">放回购物车</a></td>
					<td style="display: none;"><%= item.getBookid() %></td>
				</tr>
				<%} %>
			</table>
		</div>
	</div>
	
	<div class="sum_submit">
		<div class="sum">
			<span>应付总金额：<font id="sum">0</font>元</span>
		</div>
		<div class="submit">
			<div class="div_btn">提交订单</div>
		</div>
	</div>
	
	</div>
</div>

<script>

$(document).ready(function(){
	// var i = 0;
	//  for (var i = 0; i < 10; i++) {
	// 	$("#quantity_add_order"+count).click(function(i){
	// 		return function(e){
	// 			e.preventDefault();
	// 			var val = parseInt($("#input_quantity_order"+count).attr("value"));
	// 			$("#input_quantity_order"+count).attr("value", val+1);
	// 		};
		
	// })(i);
	// alert("here");
	for (var i = 0; i < 10; i++) {

    	(function (lockedInIndex) {

        	$("#quantity_add_order"+lockedInIndex).click(function () {
            	// e.preventDefault();
            	// alert('I am link #' + lockedInIndex);
            	var val = parseInt($("#input_quantity_order"+lockedInIndex).attr("value"));
				$("#input_quantity_order"+lockedInIndex).attr("value", val+1);
        	});

    	})(i);

	}
	// i = 0;
	for(var i = 0; i < 10; i++){
	(function(i){
	$("#quantity_minus_order"+i).click(function(){
		var val = parseInt($("#input_quantity_order"+i).attr("value"));
		if(val > 1){
			$("#input_quantity_order"+i).attr("value", val-1);
		}
	});
	})(i);
	}

});

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