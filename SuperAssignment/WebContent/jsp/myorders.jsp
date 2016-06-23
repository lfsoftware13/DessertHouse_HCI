<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.List" %>
<%@ page import="homework.model.Orderesd" %>
<%@ page import="homework.model.OrderItem" %>
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
			<%
			List<Orderesd> orders = (List<Orderesd>)session.getAttribute("orders");
			for(int i=0; i<orders.size(); i++){
				Orderesd order = orders.get(i);
			%>
			<div class="order">
				<div class="order_title">
					<span class="bold"><%= order.getTime() %></span>
					<span>订单号：<span class="orderId"><%= order.getId() %></span></span>
					<span class="del">
						<i class="fa fa-trash-o fa-lg deleteOrder"></i>
					</span>
				</div>
				<div class="order_details">
					<table class="tbl_orders">
						<%
						List<OrderItem> items = order.getItems();
						for(int j=0; j<order.getItems().size(); j++){
							OrderItem item = items.get(j);
						%>
						<tr class="orderline">
							<td class="bookinfo"><img src="<%= request.getContextPath() %>/img/cpp.jpg" alt="cover"><%= item.getBook() %></td>
							<td class="narrow price"><%= item.getPrice() %></td>
							<td class="narrow"><%= item.getNumber() %></td>
						</tr>
						<%} %>
					</table>
				</div>
				<div class="vertical_line totle" style="height: <%=110 * items.size() %>px; line-height: <%=110 * items.size() %>px;">
					<%= order.getTotal() %>
				</div>
				<div class="vertical_line" style="height: <%=110 * items.size() %>px; line-height: <%=110 * items.size() %>px;">
					交易成功
				</div>
				<div style="clear: both;"></div>
			</div>
			<%} %>
			<div class="digg" id="div_pagination">
			
			</div>
		</div>
	</div>
</div>

<script>
$(".pc_leftnav li:eq(3)").addClass("selected");
$(".pc_leftnav li:eq(3)").find("a").addClass("selected");

$(".order .deleteOrder").click(function(){
	var orderId = $(this).parent().parent().find("span.orderId").html();
	$.ajax({
		type: "post",
		url: "../OrdersServlet?action=delete&orderId=" + orderId,
		success: function(){
			window.location = "../OrdersServlet?page=<%= request.getParameter("page") %>";
		}
	});
	
});

$(".order_details .orderline:gt(0)").addClass("top_border");
</script>

<script type="text/javascript" src="<%= request.getContextPath() %>/js/pagination.js"></script>
<script>
	<%
	String cur_page = request.getParameter("page");
	if(cur_page == null){
		cur_page = "1";
	}
	%>
	$.paging(<%=cur_page %>, 100, 10, "div_pagination", "../OrdersServlet");
</script>



</body>
</html>