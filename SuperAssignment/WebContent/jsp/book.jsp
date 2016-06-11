<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>xxx</title>

<link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/topnav.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/logoline.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/public.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/book.css" rel="stylesheet">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>

</head>
<body>
<div class="lt_container">
	<%@ include file="/jsp/topnav.jsp" %>
	<%@ include file="/jsp/logoline.jsp" %>
	
	<div class="top_part">
		<div class="pictures">
			<img src="../img/cpp.jpg">
		</div>
		<div class="details">
			<div class="book_title">
				Visual C++从入门到精通
			</div>
			<div class="book_introduction">
				<p>累计15次印刷 14小时视频 881个实例 371项面试真题 616项测试 vc 入门经典 范例 案例 视频教程 零基础学vc 深入详解 长期位居 vc 开发实战 类排行榜前列 </p>
			</div>
			<div class="publish_info">
				<span>作者：<a href="">明日科技</a></span>
				<span>出版社：<a href="">清华大学出版社</a></span>
				<span>出版时间：<a href="">2012年9月</a></span>
			</div>
			<div class="sales_comments">
				<span>月销量<font>33</font></span>
				<span>累计评价<font>10</font></span>
			</div>
			<div class="price">
				<font class="price">¥32.9</font>
				<br>
				<img src="../img/icon_star.jpg" alt="5星"> <font class="ranking">在c++类图书 排名：88位</font>
			</div>
			<div class="quantity">
				<dl>
					<dt>数量：</dt>
					<dd>
						<span class="span_quantity" id="span_quantity">
							<input type="text" value="1" class="input_quantity">
							<span class="add_minus">
								<span id="quantity_add">+</span>
								<span id="quantity_minus">-</span>
							</span>
							<span class="unit">本</span>
						</span>
					</dd>
				</dl>
			</div>
			<div class="btn_addToCart">
				<img src="../img/icon_cart.jpg">
				加入购物车
			</div>
		</div>
	</div>
	<div class="bottom_part">
		<div class="book_recommend">
			<p class="title">看过本商品的人还看了</p>
			<%for(int i=0; i<5; i++){ %>
			<div class="book">
				<a href="../BookServlet?id=book_i">
					<img src="../img/vc.jpg">
					<p>
						Visual C++从入门到精通<br>
						<font>¥20.0</font><br>
						xx著
					</p>
				</a>
			</div>
			<%} %>
		</div>
		<div class="more_details">
			<div class="btn-group">
				<button type="button" class="btn btn-default" id="btn_book_details">图书详情</button>
				<button type="button" class="btn btn-default" id="btn_book_comments">累计评价</button>
			</div>
			<div class="book_details">
				详细介绍
			</div>
			<div class="book_comments">
				<div class="comments_score">
					<div class="score">
						<p>好评率<br>
						<font>98%</font><br>
						共22人评价</p>
					</div>
					<div class="match">
						<p>与描述相符<br>
						<font>4.9</font><br>
						<img src="../img/icon_star.jpg" alt="五星">
						</p>
					</div>
				</div>
				<%for(int i=0; i<8; i++){ %>
				<div class="single_comment">
					<div class="left">
						<img src="<%= request.getContextPath() %>/img/avatar.jpg" alt="avatar"><br>
						<p>匿名用户</p>
					</div>
					<div class="right">
						<div class="right1">
							<p>书很好</p>
						</div>
						<div class="right2">
							2016年6月1日
						</div>
					</div>
				</div>
				<%} %>
				<div class="digg">
					<span class="disabled"> < </span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a><a href="#?page=4">4</a><a href="#?page=5">5</a><a href="#?page=6">6</a><a href="#?page=7">7</a>...<a href="#?page=199">199</a><a href="#?page=200">200</a><a href="#?page=2"> > </a>
				</div>
			</div>
		</div>
	</div>
</div>


<script>
$(document).ready(function(){
	$("#btn_book_details").click(function(){
		$(".book_details").show();
		$(".book_comments").hide();
	});
	
	$("#btn_book_comments").click(function(){
		$(".book_details").hide();
		$(".book_comments").show();
	});
	
	$("#quantity_add").click(function(){
		var val = parseInt($(".input_quantity").attr("value"));
		$(".input_quantity").attr("value", val+1);
	});
	
	$("#quantity_minus").click(function(){
		var val = parseInt($(".input_quantity").attr("value"));
		if(val > 1){
			$(".input_quantity").attr("value", val-1);
		}
	});
	
	$(".btn_addToCart").click(function(){
		var quantity = $(".input_quantity").val();
		$.ajax({
			type: 'post',
			url: '../AddToCartServlet?bookId=<%= session.getAttribute("bookId") %>&quantity=' + quantity
		});
	});
});
</script>

</body>
</html>