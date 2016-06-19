<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>

<link
	href="http://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
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
			<div class="titleline">
				<table class="tbl_orders">
					<tr class="tbl_head">
						<td class="bookinfo">商品信息</td>
						<td class="narrow">单价</td>
						<td class="narrow">数量</td>
						<td class="wide">实付款</td>
						<td class="wide">交易状态</td>
					</tr>
				</table>
			</div>
			<%for(int i=0; i<5; i++){ %>
			<div class="order">
				<div class="order_title">
					<span class="bold">2016-05-26</span>
					<span>订单号：<span>9347013740912375</span></span>
					<span class="del">
						<i class="fa fa-trash-o fa-lg"></i>
					</span>
				</div>
				<div class="order_details">
					<table class="tbl_orders">
						<%for(int j=0; j<3; j++){ %>
						<tr class="orderline">
							<td class="bookinfo"><img src="<%= request.getContextPath() %>/img/cpp.jpg" alt="cover">Head First Java(Edition 1)</td>
							<td class="narrow price">22.0</td>
							<td class="narrow">4</td>
						</tr>
						<%} %>
					</table>
				</div>
				<div class="vertical_line totle" style="height: <%=110 * 3 %>px; line-height: <%=110 * 3 %>px;">
					123.0
				</div>
				<div class="vertical_line" style="height: <%=110 * 3 %>px; line-height: <%=110 * 3 %>px;">
					交易成功
				</div>
				<div style="clear: both;"></div>
			</div>
			<%} %>
			<div class="digg">
				<span class="disabled"> < </span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a><a href="#?page=4">4</a><a href="#?page=5">5</a><a href="#?page=6">6</a><a href="#?page=7">7</a>...<a href="#?page=199">199</a><a href="#?page=200">200</a><a href="#?page=2"> > </a>
			</div>
		</div>
	</div>
</div>

<script>
$(".pc_leftnav li:eq(3)").addClass("selected");
$(".pc_leftnav li:eq(3)").find("a").addClass("selected");

$(".order .deleteline").click(function(){
	$(this).parent().parent().remove();
});

$(".order_details .orderline:gt(0)").addClass("top_border");
</script>

</body>
</html>