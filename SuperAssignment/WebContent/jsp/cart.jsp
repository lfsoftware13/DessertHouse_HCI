<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>

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
					<td>单价</td>
					<td>数量</td>
					<td>金额</td>
					<td>操作</td>
				</tr>
			</table>
		</div>
		<div class="bottom">
			<table class="tbl_cart">
				<%for(int i=0; i<10; i++){ %>
				<tr class="cartline">
					<td class="select"><input type="checkbox" name="choose"><img src="<%= request.getContextPath() %>/img/cpp.jpg" alt="cover"></td>
					<td class="bookinfo"><a href="">C++高级程序设计</a></td>
					<td>11.1</td>
					<td>9</td>
					<td>99.9</td>
					<td><div class="div_btn deleteline" style="width: 100px; margin: 0 auto;">删除</div></td>
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
			<div class="div_btn" id="settle">结算</div>
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

$(".deleteline").click(function(){
	var checkbox = $(this).parent().parent().find("td:eq(0)").find("input[type='checkbox']");
	if(checkbox.prop("checked")){
		var quantity = parseInt($("#book_quantity").html()) - 1;
		var sum = parseFloat($("#sum").html()) - parseFloat(checkbox.parent().parent().find("td:eq(4)").html());
		$("#book_quantity").html(quantity);
		$("#sum").html(sum.toFixed(1));
	}
	$(this).parent().parent().remove();
});

$("#settle").click(function(){
	window.location = "../PurchaseServlet";
});
</script>
</body>
</html>