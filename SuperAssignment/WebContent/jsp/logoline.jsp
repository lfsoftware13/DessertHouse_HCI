<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="logoline">
	<div class="logo">
		<img src="../img/logo.jpg" class = "logoimg">
		<span><a href="../jsp/homepage.jsp" class="no_underline">灵图</a></span>
	</div>
	<div class="search">
		<form class="searchform">
			<input type="text" class="search-text" id="search_key" value="" placeholder = "搜一搜你想要的书籍" />
			<input type="button" class="search-btn" id="btn_search" value="搜&nbsp&nbsp索" onclick="search_by_keyword()"/>
		</form>
	</div>
	<div class="cart">
		<a href="../CartServlet">
			<i class="fa fa-cart-plus fa-lg"></i> 
			&nbsp购物车
		</a>
	</div>
	<div class="orders">
		<a href="../OrdersServlet">
			<i class = "fa fa-file-text fa-lg"></i>
			&nbsp我的订单
		</a>
	</div>
</div>

<script>
	$("#btn_search").click(function(){
		var kw = $("#search_key").val();
		window.location = "<%= request.getContextPath() %>/SearchServlet?type=kw&kw=" + kw;
	});
</script>

<script>
$(document).ready(function(){
	<%
	 String keyword = (String)session.getAttribute("kw");
	 if(keyword == null){
		 keyword = "Javascript";
	 }
	%>
	$("#search_key").val("<%= keyword %>");
});
</script>