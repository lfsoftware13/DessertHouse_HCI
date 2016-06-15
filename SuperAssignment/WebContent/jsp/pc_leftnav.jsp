<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="pc_leftnav">
	<ul>
		<li onclick="redirect('../PersonalCenterServlet')"><a class="no_underline">个人信息</a></li>
		<li onclick="redirect('../AddressServlet')"><a class="no_underline">收货地址</a></li>
		<li onclick="redirect('../SecurityServlet')"><a class="no_underline">安全中心</a></li>
		<li onclick="redirect('../OrdersServlet')"><a class="no_underline">我的订单</a></li>
	</ul>
</div>

<script>
$(document).ready(function(){
	$(".pc_leftnav li").addClass("bgcolor");
	
	$(".pc_leftnav li").mouseover(function(){
		$(this).addClass("bgcolor_mouseon");
	});
	
	$(".pc_leftnav li").mouseout(function(){
		$(this).removeClass("bgcolor_mouseon");
	});
});
</script>

<script>
function redirect(url){
	window.location = url;
}
</script>