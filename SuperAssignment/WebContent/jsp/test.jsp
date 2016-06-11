<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery.min.js"></script>
<link href="<%= request.getContextPath() %>/css/carousel.css" rel="stylesheet">


</head>
<body>

<div class="col storey_one_center">
	<div id='component_403753'></div>
	<div  class="tab_box_aa">
		<div class="head">
		<ul class="tab_aa">
			<li class="on first" type="bar"><span>1</span></li>
			<li type="bar" ><span>2</span></li>
			<li type="bar" ><span>3</span></li>
			<li type="bar" ><span>4</span></li>
			<li type="bar" ><span>5</span></li>
			<li type="bar" ><span>6</span></li>
			<li type="bar" ><span>7</span></li>
			<li type="bar" ><span>8</span></li>
		</ul>
		</div>
		<div class="tab_content_aa">
			<div class="content tab_1" type="item">
				<a class=" _1  pic" href="http://book.dangdang.com/20160528_4twk" target="_blank">
					<img  src="http://img60.ddimg.cn/upload_img/00087/hw/750x315_ljx_0603.jpg"/>
				</a>
			</div>
			<div class="content tab_2" type="item" style="display: none">
				<a class=" _1  pic" href="http://baby.dangdang.com/20160603_jnj3">
					<img src="http://img60.ddimg.cn/upload_img/00570/tongshu/750315duan66.jpg"/>
				</a>
			</div>   
			<div class="content tab_3" type="item" style="display: none">
				<a   class=" _1  pic"    href="http://book.dangdang.com/20160606_nvsg">
				<img  src="http://img63.ddimg.cn/upload_img/00367/fyf/0607shidaihuayu750-315.jpg"/>
				</a>
			</div>   
			<div class="content tab_4" type="item" style="display: none">
				<a   class=" _1  pic"    href="http://book.dangdang.com/20160603_scmf">
				<img  src="http://img61.ddimg.cn/upload_img/00577/whn924/750x315-jingguanlicai0606.jpg"/></a>
			</div>   
			<div class="content tab_5" type="item" style="display: none">
				<a   class=" _1  pic"    href="http://baby.dangdang.com/new1606">
					<img  src="http://img62.ddimg.cn/upload_img/00570/tongshu/750315new601.jpg"/>
				</a>
			</div>   
			<div class="content tab_6" type="item" style="display: none">
				<a   class=" _1  pic"    href="http://book.dangdang.com/20160602_eqci">
					<img  src="http://img60.ddimg.cn/upload_img/00346/ljw/xllcy750x315-20160602.jpg"/>
				</a>
			</div>   
			<div class="content tab_7" type="item" style="display: none">
				<a   class=" _1  pic"    href="http://book.dangdang.com/20160603_gmn3">
					<img  src="http://img61.ddimg.cn/upload_img/00348/ln/wenyi_750x315_911.jpg"/>
				</a>
			</div>   
			<div class="content tab_8" type="item" style="display: none">
				<a   class=" _1  pic"    href="http://e.dangdang.com/special_page.html?stId=1043" >
					<img  src="http://img62.ddimg.cn/upload_img/00421/pcsz/dw750-315.jpg"/>
				</a>
			</div>   
		</div>
	</div>
</div>

<script>
	function carousel(){
		var li = $(".tab_aa .on");
		var idx = parseInt(li.find("span:eq(0)").html()) % 8;
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
	
	setInterval(carousel, 1000);
</script>

</body>
</html>