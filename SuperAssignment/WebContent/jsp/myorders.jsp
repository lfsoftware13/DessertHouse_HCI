<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>

<link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/public.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/topnav.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/logoline.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/personalcenter.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/myorders.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/import_pagination_digg.css" rel="stylesheet">
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
			<table class="tbl_orders">
				<tr class="tbl_head">
					<td><input type="checkbox" name="chooseAll">全选</td>
					<td>商品信息</td>
					<td>单价</td>
					<td>数量</td>
					<td>实付款</td>
					<td>交易状态</td>
					<td>操作</td>
				</tr>
			</table>
			<%for(int i=0; i<5; i++){ %>
			<div class="order">
				<div class="order_title">
					<input type="checkbox">
					<span>2016-05-26</span>
					<span>订单号：<span>9347013740912375</span></span>
					<a class="show_details">详情</a>
				</div>
				<div class="order_details">
					<table class="tbl_orders">
						<%for(int j=0; j<3; j++){ %>
						<tr class="orderline">
							<td><img src="<%= request.getContextPath() %>/img/cpp.jpg" alt="cover"></td>
							<td>Head First Java(Edition 1)</td>
							<td>22.0</td>
							<td>4</td>
							<td>88.0</td>
							<td>交易成功<br><a href="">订单详情</a></td>
							<td>删除</td>
						</tr>
						<%} %>
					</table>
				</div>
			</div>
			<%} %>
			<div class="digg">
				<span class="disabled"> < </span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a><a href="#?page=4">4</a><a href="#?page=5">5</a><a href="#?page=6">6</a><a href="#?page=7">7</a>...<a href="#?page=199">199</a><a href="#?page=200">200</a><a href="#?page=2"> > </a>
			</div>
		</div>
	</div>
</div>

<script>
$(".pc_leftnav li:eq(3)").attr("class", "bgcolor_selected");

$(".order_details:gt(0)").hide();
$("a.show_details:eq(0)").html("收起");

$(".show_details").click(function(){
	var details = $(this).parent().next("div");
	if(details.css("display") != "none"){
		details.hide();
		$(this).html("详情");
	}else{
		details.show();
		$(this).html("收起");
	}
});
</script>

</body>
</html>