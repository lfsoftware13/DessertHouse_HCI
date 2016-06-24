<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="homework.model.Book" %>
<%@ page import="homework.model.Topic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>灵图网</title>

<link href="http://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/public.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/topnav.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/logoline.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/classification.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/homepage.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/carousel.css" rel="stylesheet">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>

</head>
<body>
<div class="lt_container">
	<%@ include file="/jsp/topnav.jsp" %>
	<%@ include file="/jsp/logoline.jsp" %>
	
	<div class="home_first_screen">
		<%@ include file="/jsp/classification2.jsp" %>
		<div class="home_carousel">
			<div class="col storey_one_center" style = "width:800px;">
				<div id='component_403753' style = "width:800px;"></div>
					<div  class="tab_box_aa" style = "width:800px;">
						<div class="head">
							<ul class="tab_aa">
								<li class="on first" type="bar"><span>1</span></li>
								<li type="bar" ><span>2</span></li>
								<li type="bar" ><span>3</span></li>
							</ul>
						</div>
						<div class="tab_content_aa" >
							<div class="content tab_1" style = "width:800px;">
								<a class=" _1  pic" href="http://book.dangdang.com/20160528_4twk" target="_blank">
									<img src="http://img60.ddimg.cn/upload_img/00087/hw/750x315_ljx_0603.jpg"/ style = "width:800px;">
								</a>
							</div>
							<div class="content tab_2" style="display: none; width:800px;">
								<a class=" _1  pic" href="http://baby.dangdang.com/20160603_jnj3">
									<img src="http://img60.ddimg.cn/upload_img/00570/tongshu/750315duan66.jpg" style = "width:800px;"/>
								</a>
							</div>
							<div class="content tab_3" style="display: none; width:800px;">
								<a   class=" _1  pic" href="http://book.dangdang.com/20160606_nvsg">
									<img src="http://img63.ddimg.cn/upload_img/00367/fyf/0607shidaihuayu750-315.jpg" style = "width:800px;"/>
								</a>
							</div>    
						</div>
					</div>
			</div>	
		</div>
		<div class="home_hot_topics">
			<div style="float: left;">
				<span>&nbsp<i class = "fa fa-bookmark-o fg"></i> &nbsp热门专题</span>
			</div>
			<div class="topics">
				<div class="hot_topic">
					新手入门
				</div>
				<div class="hot_topic">
					热销专题
				</div>
				<div class="hot_topic">
					理论基础
				</div>
				<div class="hot_topic">
					计算机安全
				</div>
				<div class="hot_topic">
					计算机网络
				</div>
				<div class="hot_topic">
					自由软件
				</div>
				<div class="hot_topic">
					极限编程
				</div>
				<div class="hot_topic">
					专家系统
				</div>
				<div class="hot_topic">
					模式识别
				</div>
				<div class="hot_topic">
					神经计算
				</div>
				<div class="hot_topic">
					工具软件
				</div>
				<div class="hot_topic">
					硬件与维护
				</div>
				<div class="hot_topic">
					数据库
				</div>
				<div class="hot_topic">
					证书相关
				</div>
				<div class="change" >
					<a href="" >
						<i class="fa fa-refresh fa-spin"></i>
						换一批
					</a>
				</div>
			</div>
		</div>
		<div class="home_new_books">
			<div class="div_btn btn_prev"></div>
			<div class="div_btn btn_next"></div>
			<p class="title">新书速递</p>
			<div class="scroll_box">
				<div class="scroll_new_books">
					<%
					List<Book> newBooks = (List<Book>)session.getAttribute("newBooks");
					for(int i=0; i<newBooks.size(); i++){
						Book book = newBooks.get(i);
					%>
					<div class="new_book" value="<%=i %>">
						<a href="../BookServlet?id=<%= book.getId() %>">
						<img src="..<%= book.getImage() %>">
						<p class="introduction">
							<%= book.getName() %><br>
							<%= book.getAuthor() %>著&nbsp&nbsp&nbsp&nbsp<%= book.getPublisher() %><br>
							<font>¥<%= book.getPrice() %></font>
						</p>
						</a>
					</div>
					<%} %>
				</div>
			</div>
		</div>
	</div>
	
	<%
	List<Book> books1 = (List<Book>)session.getAttribute("system");
	List<Book> books2 = (List<Book>)session.getAttribute("database");
	%>
	<div class="home_single_topic">
		<div class="hot_books" id="topic_<%=1 %>">
			<h3><i class = "fa fa-code fg"></i> &nbsp&nbsp操作系统</h3>
			<div class="book_list" id="book_i">
				<%for(int j=0; j<10; j++){ 
					Book b1 = books1.get(j);
				%>
				<div class="book">
					<a href="../BookServlet?id=<%= b1.getId() %>"><img class="book_cover" src="..<%= b1.getImage() %>" alt="cover"></a>
					<p><a href="../BookServlet?id=<%= b1.getId() %>"><%= b1.getName() %></a><br><font>¥<%= b1.getPrice() %></font></p>
				</div>
				<%} %>
			</div>
		</div>
		<div class="topic_rankings rankings">
			<h3><i class = "fa fa-server fg"></i>&nbsp&nbsp畅销榜单</h3>
			<ul>
				<%for(int k=0; k<10; k++){
					Book k1 = books1.get(k);
				%>
				<li class="line0<%=k %> brief">
					<span><%=k+1 %></span>
					<a href="../BookServlet?id=<%= k1.getId() %>"><%= k1.getName() %></a>
				</li>
				<li class="line1<%=k %> detail">
					<span><%=k+1 %></span>
					<a href="../BookServlet?id=<%= k1.getId() %>"><img src="..<%= k1.getImage() %>"></a>
					<p><a href="../BookServlet?id=<%= k1.getId() %>"><%= k1.getName() %></a></p>
					<p><font color="red">¥<%= k1.getPrice() %></font></p>
				</li>
				<%} %>
			</ul>
		</div>
	</div>
	<div class="home_single_topic" style="margin-top: 50px;">
		<div class="hot_books" id="topic_<%=2 %>">
			<h3><i class = "fa fa-code fg"></i> &nbsp&nbsp操作系统</h3>
			<div class="book_list" id="book_i">
				<%for(int j=0; j<10; j++){ 
					Book b1 = books2.get(j);
				%>
				<div class="book">
					<a href="../BookServlet?id=<%= b1.getId() %>"><img class="book_cover" src="..<%= b1.getImage() %>" alt="cover"></a>
					<p><a href="../BookServlet?id=<%= b1.getId() %>"><%= b1.getName() %></a><br><font>¥<%= b1.getPrice() %></font></p>
				</div>
				<%} %>
			</div>
		</div>
		<div class="topic_rankings rankings">
			<h3><i class = "fa fa-server fg"></i>&nbsp&nbsp畅销榜单</h3>
			<ul>
				<%for(int k=0; k<10; k++){
					Book k1 = books2.get(k);
				%>
				<li class="line0<%=k %> brief">
					<span><%=k+1 %></span>
					<a href="../BookServlet?id=<%= k1.getId() %>"><%= k1.getName() %></a>
				</li>
				<li class="line1<%=k %> detail">
					<span><%=k+1 %></span>
					<a href="../BookServlet?id=<%= k1.getId() %>"><img src="..<%= k1.getImage() %>"></a>
					<p><a href="../BookServlet?id=<%= k1.getId() %>"><%= k1.getName() %></a></p>
					<p><font color="red">¥<%= k1.getPrice() %></font></p>
				</li>
				<%} %>
			</ul>
		</div>
	</div>
</div>
</body>


<script>
	function carousel(){
		var li = $(".tab_aa .on");
		var idx = parseInt(li.find("span:eq(0)").html()) % 3;
		li.removeClass("on");
		$(".tab_aa li").eq(idx).addClass("on");
		$(".tab_content_aa div").eq(idx-1).hide();
		$(".tab_content_aa div").eq(idx).fadeIn(1000);
	}
	
	$(".tab_aa li").each(function(i){
		$(this).mouseover(function(){
			var idx = parseInt($(".tab_aa .on").find("span:eq(0)").html()) - 1;
			$(".tab_aa li").eq(idx).removeClass("on");
			$(".tab_aa li").eq(i).addClass("on");
			$(".tab_content_aa div").eq(idx).hide();
			$(".tab_content_aa div").eq(i).fadeIn(1000);
		});
	});
	
	setInterval(carousel, 3000);
</script>

<script>
$(document).ready(function(){
	
	$(".hot_topic").each(function(i){
		if(i % 5 != 0){
			$(this).addClass("not_first");
		}
	});
	
	$(".hot_topic").click(function(){
		var topic = $(this).html();
		window.location = "../SearchServlet?type=topic&kw=" + topic;
	});
	
	$(".topic_rankings li:odd").hide();
	$(".top_rankings, .line00").hide();
	$(".top_rankings, .line10").show();
	
	$(".topic_rankings li:even").each(function(i){
		$(this).mouseover(function(){
			$(this).parent().find("li:odd").hide();
			$(this).parent().find("li:even").show();
			$(this).hide();
			$(this).next().show();
		});
	});
	
	$(".btn_prev").mouseover(function(){
		$(this).css("background", "url('../img/left2.jpg')");
	});
	$(".btn_prev").mouseout(function(){
		$(this).css("background", "url('../img/left1.jpg')");
	});
	$(".btn_next").mouseover(function(){
		$(this).css("background", "url('../img/right2.jpg')");
	});
	$(".btn_next").mouseout(function(){
		$(this).css("background", "url('../img/right1.jpg')");
	});
	
	
	//新书速递轮播
	setInterval(function(){
		var div = $(".scroll_new_books");
		var width = div.find(".new_book:eq(0)").width();
		div.animate({
			"left": -width + "px"
		}, 500, function(){
			div.css("left", "0px");
			div.find(".new_book:eq(0)").appendTo(div);
		});
	}, 5000);
	
	$(".btn_prev").click(function(){
		var div = $(".scroll_new_books");
		var width = div.find(".new_book:eq(0)").width();	
		div.css("left", -width + "px");
		div.find(".new_book:eq(-1)").prependTo(div);
		div.animate({
			"left": "0px"
		}, 500);
	});
	
	$(".btn_next").click(function(){
		var div = $(".scroll_new_books");
		var width = div.find(".new_book:eq(0)").width();
		div.animate({
			"left": -width + "px"
		}, 500, function(){
			div.css("left", "0px");
			div.find(".new_book:eq(0)").appendTo(div);
		});
	});
});
</script>

</html>