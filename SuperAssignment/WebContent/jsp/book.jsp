<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="homework.model.Book" %>
<% Book book = (Book)session.getAttribute("book"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%= book.getName() %></title>

<link
	href="http://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/topnav.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/logoline.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/public.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/nav_route.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/book.css"
	rel="stylesheet">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/fly.js"></script>

</head>
<body>
	<div class="lt_container">
		<%@ include file="/jsp/topnav.jsp"%>
		<%@ include file="/jsp/logoline.jsp"%>
<div class="route">
	<p><a href="../HomepageServlet">首页</a> > <a href="../SearchServlet?type=topic&kw=从零开始学html">从零开始学html</a> > <%= book.getName() %></p>
</div>

		<div class="top_part">
			<div class="pictures">
				<img src="..<%= book.getImage() %>">
			</div>
			<div class="details">
				<input type="hidden" id="bookId" value="<%= book.getId() %>">
				<div class="book_title"><%= book.getName() %></div>
				<div class="book_introduction">
					<p><%= book.getIntroduction() %></p>
				</div>
				<div class="publish_info">
					<span>作者：<a href=""><%= book.getAuthor() %></a></span> <span>出版社：<a href=""><%= book.getPublisher() %></a></span>
					<span>出版时间：<a href=""><%= book.getTime() %></a></span>
				</div>
				<div class="sales_comments">
					<span class="comments_name line">月销量<font><%= book.getSales() %></font>
					</span> <span class="comments_name ">累计评价<font>10</font></span>
				</div>
				<div class="price">
					<font class="price_symbol">￥</font> <font class="price"><%= book.getPrice() %></font>
					<br> <span class="level"> <i class="fa fa-star level"></i><i
						class="fa fa-star"></i><i class="fa fa-star"></i><i
						class="fa fa-star"></i><i class="fa fa-star-half-o"></i>
					</span> <font class="ranking">在<%= book.getLevel2() %>类图书 排名: </font> <font
						class="ranking_num"> <%= book.getRank() %></font> <font class="ranking"
						style="margin-left: 5px;">位</font>
				</div>
				<div class="quantity">
					<dl>
						<dt>数量：</dt>
						<dd>
							<span class="span_quantity" id="span_quantity"> <input
								type="text" value="1" class="input_quantity"> <span
								class="add_minus"> <span id="quantity_add">+</span> <span
									id="quantity_minus">-</span>
							</span> <span class="unit">本</span>
							</span>
						</dd>
					</dl>
				</div>
				<div class="btn_addToCart">
					<i class="fa fa-cart-plus fa-lg"></i> 加入购物车

				</div>

				<div class="btn_buyNow">
					<i class="fa fa-credit-card fa-lg"></i>&nbsp立即购买
				</div>
				<div class = "btn_share">
					<a><i class="fa fa-share-alt" ></i>&nbsp分享
					</a>
				</div>
			</div>
		</div>
		<div class="bottom_part">
			<div class="book_recommend">
				<p class="title">看过本商品的人还看了</p>
				<div class="booklist">
					<%
					List<Book> similar = (List<Book>)session.getAttribute("similar");
					for(int i=0; i<4; i++) {
						Book b = similar.get(i);
					%>
					<div class="book">
						<a href="../BookServlet?id=<%= b.getId() %>"> <img src="..<%= b.getImage() %>">
							<p>
								<%= b.getName() %><br> <font>¥<%= b.getPrice() %></font><br> <%= b.getAuthor() %>著
							</p>
						</a>
					</div>
					<%
					}
					%>
				</div>
			</div>

			<div class="more_details">
				<ul id="book_infos" class="nav nav-tabs">
					<li class="active in"><a href="#book_details"
						onfocus="this.blur();" data-toggle="tab">图书详情</a></li class =>
					<li><a href="#book_comments" onfocus="this.blur();"
						data-toggle="tab">累计评价</a></li>
				</ul>

				<!-- <div class="btn-group">
				<button type="button" class="btn btn-default" id="btn_book_details">图书详情</button>
				<button type="button" class="btn btn-default" id="btn_book_comments">累计评价</button>
				</div> -->
				<div id="tabContent" class="tab-content">
					<div id="book_details" class="tab-pane fade active in activity">
						<div>
							<div class = "title">
								<span>基本信息</span>
							</div>
							<div class = "content" style = "padding-top:20px;margin-bottom:20px;">
								<span class = "basic_item">
									<span>版次：</span>
									<font id = "edition">1</font>
								</span>
								<span class = "basic_item">
									<span>页数：</span>
									<font id = "page_num">1</font>
								</span>
								<span class = "basic_item">
									<span>字数：</span>
									<font id = "word_num">1</font>
								</span>
								<br/>
								<span class = "basic_item">
									<span>印刷时间：</span>
									<font id = "printing_time">2016-1-1</font>
								</span>
								<span class = "basic_item">
									<span>开本：</span>
									<font id = "format">16开</font>
								</span>									
								<span class = "basic_item">
									<span>纸张：</span>
									<font id = "paper_type">轻型纸</font>
								</span>	
								<br/>
								<span class = "basic_item">
									<span>印次：</span>
									<font id = "printing_copy">1</font>
								</span>	
								
								<span class = "basic_item">
									<span>包装：</span>
									<font id = "wrapper">平装</font>
								</span>	
								<span class = "basic_item">
									<span>丛书名：</span>
									<font id = "series">鬼吹灯系列</font>
								</span>	
								<br/>
								<span class = "basic_item">
									<span>国际标准书号ISBN：</span>
									<font id = "isbn">23808814</font>
								</span>	
								<br/>
								<span class = "basic_item">
									<span>所属分类：</span>
									<font id = "sort">Javascript</font>
								</span>	

							</div>	

							<div class = "title">
								<span>内容简介</span>
							</div>
							<p class = "content" id = "contents">
								<%= book.getIntroduction() %>
							<!-- 我写的《鬼吹灯》这部书前后两部，共计八册，顺序依次是《精绝古城》《龙岭迷窟》《云南虫谷》《昆仑神宫》《黄皮子坟》《南海归墟》《怒晴湘西》《巫峡棺山》。
 　　从2006年2月份开始，直至2008年2月底，前前后后总共写了整整两年时间，约有两百万字的篇幅。这期间付出了很多，但同样也有很大的收获。通过这部书，认识了很多朋友，这其中有见过的，也有没见过的。可以说如果您喜欢我的这部书，咱们就应该算是朋友了，在此请允许我由衷地感谢你们，能和许多人分享我写的故事，对我而言是最大的快乐。今天在全本结稿之际，我想对《鬼吹灯》全部创作过程做一次简单的回顾，献给喜欢《鬼吹灯》的读者朋友们。
 　　常被人问起自己觉得哪一卷最满意，所以借《鬼吹灯》完结之际也来个“导演自评”。作为作者，自己评价一下自己的作品，也是一件很有趣的事情。
 　　全套八卷故事，每一卷的核心元素与题材都不相同，想表现的内容也有所区别。在连载的过程中，每天只能写几千字，出于时间限制和个人喜好的原因，对于已经写过的部分基本上从未进行修改，而且始终没有故事大纲，到现在还不知道大纲是什么。对我而言，自己也不清楚下一章会出现什么意想不到的情况，许多都是即兴发挥，这是创作过程中很大的乐趣。
 　　很难说这八卷中有哪一卷是我自己最满意的，每一卷都有很满意的章节和桥段；但在我自己看来，每一卷也都同样存在着不足和缺陷，如果重新修改一遍，会好很多，可是  -->
							</p>
						</div>

						<div>
							<div class = "title" >
								<span>适合阅读群体</span>
							</div>
							<div class = "content" id = "target_reader">
								<%= book.getFitpeo() %>
							</div>
						</div>

						<div>
							<div class = "title">
								<span>作者简介</span>
							</div>
							<div class = "content" id = "author">
								<%= book.getAutintro() %>
							</div>
						</div>
						<div> 
							<div class = "title">
								<span>本书目录</span>
							</div>
							<div class = "content" id = "catelog">
								<%= book.getBookindex() %>
							</div>
						</div>
					</div>
					
					<div id="book_comments" class="tab-pane fade activity">
						<div class="comments_score">
							<div class="score">
								<p>
									好评率<br> <font>98%</font><br> 共22人评价
								</p>
							</div>
							<div class="match">
								<p>与描述相符<br> <font>4.9</font><br> 
									<span class="level">
										<i class="fa fa-star level"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star-half-o"></i>
									</span> 	
								</p>
							</div>
						</div>
						<%
						String[] comments = new String[]{
								"好评！",
								"这本书太好看了！",
								"受用一生的一本书。",
								"质量很好，给个赞",
								"还行，质量一般，书是一本好书。",
								"书送过来的时候已经破掉了，质量太差，还好客服给退了。",
								"很好很不错，下次还来买。",
								"很好很强大，很全面，是自己想要的，好评"
						};
						for (int i = 0; i < 8; i++) {
						%>
						<div class="single_comment">
							<div class="left">
								<img src="<%=request.getContextPath()%>/img/avatar.jpg"
									alt="avatar"><br>
								<p>匿名用户</p>
							</div>
							<div class="right">
								<div class="right1">
									<p><%= comments[i] %></p>
								</div>
								<div class="right2">2016年6月1日</div>
							</div>
						</div>
						<%
						}
						%>
						<div class="digg" id="div_pagination">
						
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


<script>
$(document).ready(function(){

// 	$('#myTab a').click(function (e) {
//   		e.preventDefault();
//   		$(this).tab('show');
// })

	$('#book_infos a').click(function (e){
		e.preventDefaut();
		$(this).tab('show');
	});
	
	// $("#btn_book_comments").click(function(){
	// 	$(".book_details").hide();
	// 	$(".book_comments").show();
	// });
	
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
});
</script>

<script>
//加入购物车效果

	$(".btn_addToCart").click(function(){
		if(!isLogin()){
			$("#a_login").trigger("click");
		}else{
			var bookId = $("#bookId").val();
			var quantity = $(".input_quantity").val();
			$.ajax({
				type: 'post',
				url: '../CartServlet?action=add&bookId=' + bookId + '&quantity=' + quantity
			});
		}
	});
	
	$(".btn_buyNow").click(function(){
		var list = new Array();
		var bookId = $("#bookId").val();
		var bookName = $("div.book_title").html();
		var price = $("font.price").html();
		var quantity = $(".input_quantity").val();
		var orderItem = new OrderItem(bookId, bookName, price, quantity);
		list[0] = orderItem;
		var orderList = new OrderList(list);
		var str_list = JSON.stringify(orderList).replace(/\+/g, "%2B");
		window.location = "../PurchaseServlet?orderList=" + str_list;
	});
	
	function OrderItem(bookId, bookName, price, quantity){
		this.bookId = bookId;
		this.bookName = bookName;
		this.price = price;
		this.quantity = quantity;
		this.sum = price * quantity;
	}

	function OrderList(list){
		this.list = list;
	}
	
	$(".btn_share a").click(function(){
		alert('分享成功');
	});
	
	
	function isLogin(){
		var login = <%= session.getAttribute("user") == null ? false : true %>;
		return login;
	}

$(function() {
	$(".btn_addToCart").click(function(event) {
		if(!isLogin()){
			return;
		}
		var offset = $(".logoline .cart").find("i").offset();
		var scrollTop = $(window).scrollTop();
		var flyer = $('<i class="fa fa-book fa-2x" style = "color:#556589;"></i>');//抛物体对象 
		flyer.fly({
			start : {
				left : event.pageX,//抛物体起点横坐标 
				top : event.pageY - scrollTop  //抛物体起点纵坐标 
			},
			end : {
				left : offset.left,//抛物体终点横坐标 
				top : offset.top - scrollTop, //抛物体终点纵坐标 
				width : 15, //结束时宽度
				height : 15 //结束时高度
			},
			speed: 1.5,
			onEnd : function() {
				flyer.remove()
			}
		});
	});
});
</script>
	
<script type="text/javascript" src="<%= request.getContextPath() %>/js/pagination.js"></script>
<script>
	<%
	String cur_page = request.getParameter("page");
	if(cur_page == null){
		cur_page = "1";
	}
	%>
	$.paging(<%=cur_page %>, 100, 10, "div_pagination", "#");
</script>

</body>
</html>