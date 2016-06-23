<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="homework.model.CartItem" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
<link
	href="http://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/public.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/topnav.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/logoline.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/cart.css" rel="stylesheet">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>

</head>
<body>
<div class="lt_container">
	<%@ include file="topnav.jsp" %>
	<%@ include file="logoline.jsp" %>
	
	<div class="bottom_part">
	<div class="cartItems">
		<div class="top">
			<table class="tbl_cart">
				<tr class="tbl_head">
					<td class="select"><input type="checkbox" name="chooseAll">全选</td>
					<td class="bookinfo">商品信息</td>
					<td class = "price">单价</td>
					<td class = "num">数量</td>
					<td class = "total">金额</td>
					<td>操作</td>
				</tr>
			</table>
		</div>
		<div class="bottom">
			<table class="tbl_cart">
				<%
				List<CartItem> cart = (List<CartItem>)session.getAttribute("cart");
				for(int i=0; i<cart.size(); i++){
					CartItem item = cart.get(i);
				%>
				<tr class="cartline">
					<td class="select"><input type="checkbox" name="choose"><img src="<%= request.getContextPath() %>/img/cpp.jpg" alt="cover"></td>
					<td class="bookinfo"><a href="../BookServlet?bookId=<%= item.getBookid() %>"><%= item.getBook() %></a></td>
					<td class = "price price_info"><%= item.getPrice() %></td>

					<td class = "num">
						<span class="span_quantity" id="span_quantity">
							<span id="quantity_minus_cart<%=i%>" class = "minus_cart">
							-
							</span>
							
							 <input
								type="text" value="<%= item.getNumber() %>" id = "input_quantity_cart<%=i%>"class="input_quantity_cart">
							<span id="quantity_add_cart<%=i%>" class = "add_cart" style = "margin-left:5px;">
							+
							</span>
								
						</span>
					</td>

					<td class = "total total_info"><%= item.getTotal() %></td>
					<td class = "del">
						<!-- <div class="div_btn deleteline" style="width: 100px; margin: 0 auto;">删除</div> -->
						<i class="fa fa-trash-o fa-lg"></i>
					</td>
					<td class="bookId" style="display: none;"><%= item.getBookid() %></td>
					<td class="cartId" style="display: none;"><%= item.getCartid() %></td>
				</tr>
				<%} %>
			</table>
		</div>
	</div>
	
	<div class="empty"></div>
	
	<div class="footer">
		<div class="left">
			<div class="chooseAll">
				<input type="checkbox" name="chooseAll">全选
			</div>
			<div class="sum">
				<span>共选中<span class="space" id="book_quantity">0</span>件商品</span><span class="space">总价<span class="space big_font">¥<span id="sum">0.0</span></span></span>
			</div>
		</div>
		<div class="right">
			<div class="div_btn" id="settle">结&nbsp算</div>
		</div>
	</div>
	</div>
</div>

<script>
$("input[type='checkbox'][name='chooseAll']").click(function(){
	if($(this).prop("checked")){
		$("input[type='checkbox']").not(this).prop("checked", true);
		$("#book_quantity").html($(".tbl_cart tr:gt(0)").length);
		
		var sum = 0;
		$(".tbl_cart tr:gt(0)").each(function(){
			sum += parseFloat($(this).find("td:eq(4)").html());
		});
		$("#sum").html(sum.toFixed(1));
	}else{
		$("input[type='checkbox']").not(this).prop("checked", false);
		$("#book_quantity").html(0);
		$("#sum").html("0.0");
	}
});

$("input[type='checkbox'][name!='chooseAll']").click(function(){
	if($(this).prop("checked")){
		var quantity = parseInt($("#book_quantity").html()) + 1;
		var sum = parseFloat($("#sum").html()) + parseFloat($(this).parent().parent().find("td:eq(4)").html());
		$("#book_quantity").html(quantity);
		$("#sum").html(sum.toFixed(1));
	}else{
		var quantity = parseInt($("#book_quantity").html()) - 1;
		var sum = parseFloat($("#sum").html()) - parseFloat($(this).parent().parent().find("td:eq(4)").html());
		$("#book_quantity").html(quantity);
		$("#sum").html(sum.toFixed(1));
	}
});

$("#settle").click(function(){
	var list = new Array();
	$("input[type='checkbox'][name='choose']:checked").each(function(i){
		var row = $(this).parent().parent();
		var bookId = row.find("td.bookId").html();
		var bookName = row.find("td.bookinfo a").html();
		var price = row.find("td.price").html();
		var quantity = row.find("td.num input").val();
		var orderItem = new OrderItem(bookId, bookName, price, quantity);
		list[i] = orderItem;
	});
	var orderList = new OrderList(list);
	var str_list = JSON.stringify(orderList).replace(/\+/g, "%2B");
	window.location = "../PurchaseServlet?orderList=" + str_list;
});

function OrderItem(bookId, bookName, price, quantity){
	this.bookId = bookId;
	this.bookName = bookName;
	this.price = price;
	this.quantity = quantity;
	this.sum = price * quantity;
}

function OrderList(list){
	this.list = list;
}

/*
$(document).ready(function(){
	for (var i = 0; i < 10; i++) {

    	(function (lockedInIndex) {

        	$("#quantity_add_cart"+lockedInIndex).click(function () {
            	// e.preventDefault();
            	// alert('I am link #' + lockedInIndex);
            	var val = parseInt($("#input_quantity_cart"+lockedInIndex).attr("value"));
				$("#input_quantity_cart"+lockedInIndex).attr("value", val+1);
        	});

    	})(i);

	}
	// i = 0;
	for(var i = 0; i < 10; i++){
	(function(i){
	$("#quantity_minus_cart"+i).click(function(){
		var val = parseInt($("#input_quantity_cart"+i).attr("value"));
		if(val > 1){
			$("#input_quantity_cart"+i).attr("value", val-1);
		}
	});
	})(i);
	}
});
*/

$("span.add_cart").click(function(){
	var row = $(this).parent().parent().parent();
	var price = row.find("td.price").html();
	var quantity = row.find("td.num").find("input[type='text']").val();
	var total = row.find("td.total").html();
	row.find("input[type='text']").val(parseInt(quantity) + 1);
	row.find("td.total").html((parseFloat(total) + parseFloat(price)).toFixed(1));
	sumup();
});

$("span.minus_cart").click(function(){
	var row = $(this).parent().parent().parent();
	var price = row.find("td.price").html();
	var quantity = row.find("td.num").find("input[type='text']").val();
	var total = row.find("td.total").html();
	if(parseInt(quantity) > 1){
		row.find("input[type='text']").val(parseInt(quantity) - 1);
		row.find("td.total").html((parseFloat(total) - parseFloat(price)).toFixed(1));
	}
	sumup();
});

function sumup(){
	var sum = 0;
	$(".tbl_cart tr:gt(0)").each(function(){
		var checkbox = $(this).find("td.select").find("input[type='checkbox']");
		if(checkbox.prop("checked")){
			sum += parseFloat($(this).find("td:eq(4)").html());
		}
	});
	$("#sum").html(sum.toFixed(1));
}

$("td.del i").click(function(){
	var row = $(this).parent().parent();
	var cartId = row.find("td.cartId").html();
	var checkbox = row.find("td.select").find("input[type='checkbox']");
	$.ajax({
		type: "post",
		url: "../CartServlet?action=delete&cartId=" + cartId,
		success: function(){
			if(checkbox.prop("checked")){
				var linetotal = row.find("td.total").html();
				var total = $("#sum").html();
				$("#sum").html((parseFloat(total) - parseFloat(linetotal)).toFixed(1));
			}
			row.remove();
		}
	});
});
</script>

</body>
</html>