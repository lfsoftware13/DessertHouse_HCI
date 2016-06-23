<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="homework.model.Book" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%= (String)session.getAttribute("kw") %></title>

<link href="http://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

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
		<%@ include file="classification2.jsp" %>
		<div class="search_recommend">
			<div class="recommend_title">
				<p class="title">图书推荐</p>
				<%
				List<Book> recommend = (List<Book>)session.getAttribute("recommend");
				for(int i=0; i<3; i++){
					Book book = recommend.get(i);
				%>
				<div class="book_recommend">
					<a href="../BookServlet?id=<%= book.getId() %>"><img src="..<%= book.getImage() %>"></a>
					<p><a href="../BookServlet?id=<%= book.getId() %>"><%= book.getName() %></a><br><font>¥<%= book.getPrice() %></font></p>	
				</div>
				<%
				}
				%>
			</div>
			
		</div>
	</div>
	
	<div class="search_right">
		<div class="result_filter">
			<div class = "filter_line filter_border first_line line">
			<%
			List<Book> books1=(List<Book>)session.getAttribute("search_books");
			int len=books1.size();
			%>
				<span id = "search_type" value = "<%= session.getAttribute("kw") %>"></span>
				<span id = "book_num">相关书籍<%= books1.size()%>本</span>
			</div>
			<div class="filter_line filter_border" id="filter_publish">
				<span class="title">出版社：</span>
				<span><input type="checkbox" class="checkbox_filter" name="checkbox_publish" value="0">
					<span class = "checkItem">所有</span>
				</span>
				<span><input type="checkbox" class="checkbox_filter" name="checkbox_publish" value="1">
					<span class = "checkItem">机械工业出版社</span>
				</span>
				<span><input type="checkbox" class="checkbox_filter" name="checkbox_publish" value="2">
					<span class = "checkItem">电子工业出版社</span>
				</span>
				<span><input type="checkbox" class="checkbox_filter" name="checkbox_publish" value="3">
					<span class = "checkItem">其它</span>
				</span>
			</div>
			<div class="filter_line filter_border" id="filter_publish_date">
				<span class="title">出版时间：</span>
				<span><input type="checkbox" class="checkbox_filter" name="checkbox_publishDate" value="0">
					<span class = "checkItem">所有</span>
				</span>
				<span><input type="checkbox" class="checkbox_filter" name="checkbox_publishDate" value="1">
					<span class = "checkItem">2000年以前</span>
				</span>
				<span><input type="checkbox" class="checkbox_filter" name="checkbox_publishDate" value="2">
					<span class = "checkItem">2000年-2010年</span>
				</span>
				<span><input type="checkbox" class="checkbox_filter" name="checkbox_publishDate" value="3">
					<span class = "checkItem">2010年以后</span></span>
			</div>
			<div class="filter_line filter_border" id="filter_price">
				<span class="title">价格：</span>
				<span><input type="checkbox" class="checkbox_filter" name="checkbox_price" value="0">
					<span class = "checkItem">所有</span></span>
				<span><input type="checkbox" class="checkbox_filter" name="checkbox_price" value="1">
					<span class = "checkItem">小于20元</span></span>
				<span><input type="checkbox" class="checkbox_filter" name="checkbox_price" value="2">
					<span class = "checkItem">20-50元</span></span>
				<span><input type="checkbox" class="checkbox_filter" name="checkbox_price" value="3">
					<span class = "checkItem">50-100元</span></span>
				<span><input type="checkbox" class="checkbox_filter" name="checkbox_price" value="4">
					<span class = "checkItem">100元以上</span></span>
			</div>
		</div>
		<div class="result_sort">
			<div style="float: left">
				<label>排序：</label>
				<div class="btn-group">
					<button type="button" class="btn btn-default" name="btn_sort" value="0">评分</button>
					<button type="button" class="btn btn-default" name="btn_sort" value="1">价格</button>
					<button type="button" class="btn btn-default" name="btn_sort" value="2">折扣</button>
				</div>
			</div>
			<div class="available_only">
				<input type="checkbox" id="checkbox_show_available_only">
				<span class = "checkItem">仅显示有货</span>
			</div>
		</div>
		<%
		String[] books = new String[]{"Linux从入门到精通","Linux鸟叔的私房菜","嵌入式Linux开发","Linux设备驱动程序","Linux内核","Linux内核与实现","数理统计与数据分析","数据挖掘-概念与技术","数据库系统概念"};
		%>
		<div class="book_list">
			<%
			List<Book> bookList = (List<Book>)session.getAttribute("search_books");
			for(int i=0; i<bookList.size(); i++){
				Book book = bookList.get(i);
			%>
				<div class="book" id="<%= book.getId() %>">
					<a href="../BookSer	vlet?id=<%= book.getId() %>"><img class="cover" src="..<%= book.getImage() %>" alt="cover"></a><br>
					<p><a href="../BookServlet?id=<%= book.getId() %>"><%= book.getName() %></a><br>
					<a href=""><%= book.getAuthor() %></a>&nbsp&nbsp<a href=""><%= book.getPublisher() %></a><br>
					<font>¥<%= book.getPrice() %></font>
					</p>
					<span class = "level" >
						<i class = "fa fa-star level"></i><i class = "fa fa-star"></i><i class = "fa fa-star"></i><i class = "fa fa-star"></i><i class = "fa fa-star-half-o"></i>
					</span>
					
				</div>
			<% } %>
		</div>
		<div class="digg page" id="div_pagination">
			
		</div>
	</div>
</div>
</body>

<script type="text/javascript" src="<%= request.getContextPath() %>/js/pagination.js"></script>
<script>
	<%
	String cur_page = request.getParameter("page");
	if(cur_page == null){
		cur_page = "1";
	}
	%>
	$.paging(<%=cur_page %>, 100, 10, "div_pagination", "../SearchServlet");
</script>


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
	String sort = (String)session.getAttribute("sort");
	if(sort == null){
		sort = "0";
	}
	String available_only = (String)session.getAttribute("f_available");
	%>
	
	$("input[name='checkbox_publish']").eq(<%=f_publish %>).prop("checked", "checked");
	$("input[name='checkbox_publishDate']").eq(<%=f_pd %>).prop("checked", "checked");
	$("input[name='checkbox_price']").eq(<%=f_price %>).prop("checked", "checked");
	$("button[name='btn_sort']").eq(<%=sort %>).addClass("active in");
	if(<%= available_only %>){
		$("#checkbox_show_available_only").prop("checked", true);
	}
	
	$("input[name='checkbox_publish']").click(function(i){
		$("input[name='checkbox_publish']").removeAttr("checked");
		$(this).prop("checked", true);
		search();
	});
	$("input[name='checkbox_publishDate']").click(function(i){
		$("input[name='checkbox_publishDate']").removeAttr("checked");
		$(this).prop("checked", true);
		search();
	});
	$("input[name='checkbox_price']").click(function(i){
		$("input[name='checkbox_price']").removeAttr("checked");
		$(this).prop("checked", true);
		search();
	});
	$("button[name='btn_sort']").click(function(){
		if(!$(this).hasClass("selected")){
			$("button[name='btn_sort'].active").removeClass("active in");
			$(this).addClass("active in");
			search();
		}
	});
	$("#checkbox_show_available_only").click(function(){
		search();
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
	
	
	function search(){
		var type = "<%= (String)session.getAttribute("type") %>";
		var kw = "<%= (String)session.getAttribute("kw") %>";
		var publish = $("input[name='checkbox_publish']:checked:eq(0)").val();
		var publishDate = $("input[name='checkbox_publishDate']:checked:eq(0)").val();
		var price = $("input[name='checkbox_price']:checked:eq(0)").val();
		var sort = $("button[name='btn_sort'].active").val();
		var available = $("#checkbox_show_available_only").prop("checked");
		window.location = "../SearchServlet?type=" + type + "&kw=" + kw + "&f_publish=" + publish + "&f_pd=" + publishDate + "&f_price=" + price + "&sort=" + sort + "&f_available=" + available;
	}
});
</script>


<script>
$(document).ready(function(){
	$("#search_type").html("<%= session.getAttribute("kw") %> 类书籍");
});
</script>
</html>