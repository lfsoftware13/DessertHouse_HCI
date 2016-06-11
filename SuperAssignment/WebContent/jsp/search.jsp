<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>???</title>

<link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/public.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/topnav.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/logoline.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/classification.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/search.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/import_pagination_digg.css" rel="stylesheet">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>

</head>
<body>
<div class="lt_container">
	<%@ include file="/jsp/topnav.jsp" %>
	<%@ include file="/jsp/logoline.jsp" %>
	
	<div class="search_left">
		<%@ include file="classification.jsp" %>
		<div class="search_recommend">
			<div class="recommend_title">
				<p class="title">图书推荐</p>
				<%for(int i=0; i<3; i++){ %>
				<div class="book_recommend">
					<a href="../BookServlet?id=book_i"><img src="../img/vc.jpg"></a>
					<p><a href="../BookServlet?id=book_i">Visual C++从入门到精通</a><br><font>¥20.0</font></p>	
				</div>
				<%} %>
			</div>
			
		</div>
	</div>
	
	<div class="search_right">
		<div class="result_filter">
			<div class="filter_line filter_border first_line" id="filter_publish">
				<span class="title">出版社：</span>
				<span><input type="checkbox" class="checkbox_filter" name="checkbox_publish" value="0">所有</span>
				<span><input type="checkbox" class="checkbox_filter" name="checkbox_publish" value="1">机械工业出版社</span>
				<span><input type="checkbox" class="checkbox_filter" name="checkbox_publish" value="2">电子工业出版社</span>
				<span><input type="checkbox" class="checkbox_filter" name="checkbox_publish" value="3">其它</span>
			</div>
			<div class="filter_line filter_border" id="filter_publish_date">
				<span class="title">出版时间：</span>
				<span><input type="checkbox" class="checkbox_filter" name="checkbox_publishDate" value="0">所有</span>
				<span><input type="checkbox" class="checkbox_filter" name="checkbox_publishDate" value="1">2000年以前</span>
				<span><input type="checkbox" class="checkbox_filter" name="checkbox_publishDate" value="2">2000年-2010年</span>
				<span><input type="checkbox" class="checkbox_filter" name="checkbox_publishDate" value="3">2010年以后</span>
			</div>
			<div class="filter_line filter_border" id="filter_price">
				<span class="title">价格：</span>
				<span><input type="checkbox" class="checkbox_filter" name="checkbox_price" value="0">所有</span>
				<span><input type="checkbox" class="checkbox_filter" name="checkbox_price" value="1">小于20元</span>
				<span><input type="checkbox" class="checkbox_filter" name="checkbox_price" value="2">20-50元</span>
				<span><input type="checkbox" class="checkbox_filter" name="checkbox_price" value="3">50-100元</span>
				<span><input type="checkbox" class="checkbox_filter" name="checkbox_price" value="4">100元以上</span>
			</div>
		</div>
		<div class="result_sort">
			<div style="float: left">
				<label>排序：</label>
				<div class="btn-group">
					<button type="button" class="btn btn-default">评分</button>
					<button type="button" class="btn btn-default">价格</button>
					<button type="button" class="btn btn-default">折扣</button>
				</div>
			</div>
			<div class="available_only">
				<input type="checkbox" id="checkbox_show_available_only">仅显示有货
			</div>
		</div>
		<div class="book_list">
			<% for(int i=0; i<20; i++){ %>
				<div class="book" id="book_i">
					<a href="../BookServlet?id=book_i"><img class="cover" src="https://images-cn.ssl-images-amazon.com/images/I/516W9PDv80L._SX353_BO1,204,203,200_.jpg" alt="cover"></a><br>
					<p><a href="../BookServlet?id=book_i">Head First Java</a><br>
					<a href="">xx著</a>&nbsp&nbsp<a href="">xx出版社</a><br>
					<font>¥20.0</font></p>
					<img src="../img/icon_star.jpg" alt="5星" class="star">
				</div>
			<% } %>
		</div>
		<div class="digg">
			<span class="disabled"> < </span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a><a href="#?page=4">4</a><a href="#?page=5">5</a><a href="#?page=6">6</a><a href="#?page=7">7</a>...<a href="#?page=199">199</a><a href="#?page=200">200</a><a href="#?page=2"> > </a>
		</div>
	</div>
</div>
</body>


<script>
$(document).ready(function(){
	
	<%
	String f_publish = (String)session.getAttribute("f_publish");
	if(f_publish == null){
		f_publish = "0";
	}
	String f_pd = (String)session.getAttribute("f_pd");
	if(f_pd == null){
		f_pd = "0";
	}
	String f_price = (String)session.getAttribute("f_price");
	if(f_price == null){
		f_price = "0";
	}
	%>
	
	$("input[name='checkbox_publish']").eq(<%=f_publish %>).prop("checked", "checked");
	$("input[name='checkbox_publishDate']").eq(<%=f_pd %>).prop("checked", "checked");
	$("input[name='checkbox_price']").eq(<%=f_price %>).prop("checked", "checked");
	
	$("input[name='checkbox_publish']").click(function(i){
		$("input[name='checkbox_publish']").removeAttr("checked");
		$(this).prop("checked", true);
	});
	$("input[name='checkbox_publishDate']").click(function(i){
		$("input[name='checkbox_publishDate']").removeAttr("checked");
		$(this).prop("checked", true);
	});
	$("input[name='checkbox_price']").click(function(i){
		$("input[name='checkbox_price']").removeAttr("checked");
		$(this).prop("checked", true);
	});
	
	$(".book").click(function(){
		var bookId = $(this).attr("id");
		window.location = "<%= request.getContextPath() %>/BookServlet?id=" + bookId;
	});
	
	$(".book_list .book").each(function(i){
		if(i % 4 != 0){
			$(this).addClass("not_first");
		}
	});
});
</script>


</html>