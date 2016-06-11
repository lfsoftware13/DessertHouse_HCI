<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>灵图网</title>

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
		<%@ include file="/jsp/classification.jsp" %>
		<div class="home_carousel">
			<div class="col storey_one_center">
				<div id='component_403753'></div>
					<div  class="tab_box_aa">
						<div class="head">
							<ul class="tab_aa">
								<li class="on first" type="bar"><span>1</span></li>
								<li type="bar" ><span>2</span></li>
								<li type="bar" ><span>3</span></li>
							</ul>
						</div>
						<div class="tab_content_aa">
							<div class="content tab_1">
								<a class=" _1  pic" href="http://book.dangdang.com/20160528_4twk" target="_blank">
									<img src="http://img60.ddimg.cn/upload_img/00087/hw/750x315_ljx_0603.jpg"/>
								</a>
							</div>
							<div class="content tab_2" style="display: none">
								<a class=" _1  pic" href="http://baby.dangdang.com/20160603_jnj3">
									<img src="http://img60.ddimg.cn/upload_img/00570/tongshu/750315duan66.jpg"/>
								</a>
							</div>
							<div class="content tab_3" style="display: none">
								<a   class=" _1  pic" href="http://book.dangdang.com/20160606_nvsg">
									<img src="http://img63.ddimg.cn/upload_img/00367/fyf/0607shidaihuayu750-315.jpg"/>
								</a>
							</div>    
						</div>
					</div>
			</div>	
		</div>
		<div class="home_hot_topics">
			<div style="float: left;">
				<span>热门专题</span>
			</div>
			<div class="topics">
				<%for(int i=0; i<14; i++){ %>
				<div class="hot_topic">
					从零开始学html
				</div>
				<%} %>
				<div class="hot_topic">
					<a href="">
						<img src="../img/icon_refresh.jpg" class="lt_icon">
						<font color="white">换一批</font>
					</a>
				</div>
			</div>
		</div>
		<div class="home_new_books">
			<div class="div_btn btn_prev"></div>
			<div class="div_btn btn_next"></div>
			<p class="title">新书速递</p>
			<div class="new_book">
				<img src="../img/vc.jpg">
				<p class="introduction">
					为了你我愿意热爱整个世界<br>
					xx著&nbsp&nbsp&nbsp&nbspxx出版社<br>
					<font>¥20.0</font>
				</p>
			</div>
		</div>
	</div>
	
	<%for(int i=0; i<3; i++){ %>
	<div class="home_single_topic">
		<div class="hot_books" id="topic_<%=i %>">
			<h1>Android学习</h1>
			<div class="book_list" id="book_i">
				<%for(int j=0; j<10; j++){ %>
				<div class="book">
					<a href="../BookServlet?id=book_i"><img class="book_cover" src="https://images-cn.ssl-images-amazon.com/images/I/516W9PDv80L._SX353_BO1,204,203,200_.jpg" alt="cover"></a>
					<p><a href="../BookServlet?id=book_i">Head First Java中文版</a><br><font>¥20</font></p>
				</div>
				<%} %>
			</div>
		</div>
		<div class="topic_rankings rankings">
			<h1>畅销榜单</h1>
			<ul>
				<%for(int k=0; k<10; k++){ %>
				<li class="line0<%=k %> brief">
					<span><%=k+1 %></span>
					<a href="../BookServlet?id=123">Head First Java中文版</a>
				</li>
				<li class="line1<%=k %> detail">
					<span><%=k+1 %></span>
					<a href="../BookServlet?id=123"><img src="../img/cpp.jpg"></a>
					<p><a href="../BookServlet?id=123">Head First Java中文版</a></p>
					<p><font color="red">¥20.0</font></p>
				</li>
				<%} %>
			</ul>
		</div>
	</div>
	<%} %>
</div>
</body>


<script>
	function carousel(){
		var li = $(".tab_aa .on");
		var idx = parseInt(li.find("span:eq(0)").html()) % 3;
		li.removeClass("on");
		$(".tab_aa li").eq(idx).addClass("on");
		$(".tab_content_aa div").eq(idx-1).hide();
		$(".tab_content_aa div").eq(idx).show();
	}

	$(".tab_aa li").each(function(i){
		$(this).mouseover(function(){
			var idx = parseInt($(".tab_aa .on").find("span:eq(0)").html()) - 1;
			$(".tab_aa li").eq(idx).removeClass("on");
			$(".tab_aa li").eq(i).addClass("on");
			$(".tab_content_aa div").eq(idx).hide();
			$(".tab_content_aa div").eq(i).show();
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
		window.location = "<%= request.getContextPath() %>/SearchServlet?topic=" + topic;
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
});
</script>

</html>