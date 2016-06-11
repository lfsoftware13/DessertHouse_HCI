<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>

<link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/topnav.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/logoline.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/cart.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/public.css" rel="stylesheet">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>

</head>
<body>
	<%@ include file="topnav.jsp" %>
	<%@ include file="logoline2.jsp" %>
	
	<div class="cartItems">
		<table class="tbl_cart">
			<tr>
				<td><input type="checkbox" name="chooseAll">全选</td>
				<td>商品信息</td>
				<td>单价</td>
				<td>数量</td>
				<td>金额</td>
				<td>操作</td>
			</tr>
			<%for(int i=0; i<20; i++){ %>
			<tr>
				<td><input type="checkbox" name="choose"><img src="<%= request.getContextPath() %>/img/cpp.jpg" alt="cover"></td>
				<td><a href="">C++高级程序设计</a></td>
				<td>11.1</td>
				<td>9</td>
				<td>99.9</td>
				<td>删除</td>
			</tr>
			<%} %>
		</table>
	</div>
	
	<div class="footer">
		<div class="chooseAll">
			<input type="checkbox">全选
		</div>
		<div class="sum">
			<span>共选中3件商品</span><span>总价88.0元</span>
			<input type="button" id="pay" value="结算">
		</div>
	</div>

</body>
</html>