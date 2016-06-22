<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="homework.model.Classification" %>

<script type="text/javascript"> 
$(function() { 
$("#sidebar-menu > ul > li").hover(function() { 
$(this).addClass("selected"); 
$(".menu-panel", this).addClass("selected"); 
var bgImg = $(".menu-item", this).css("background-image"); 
bgImg = bgImg.replace(".", "-hover."); 
$(".menu-item", this).css("background-image", bgImg); 
}, function() { 
$(this).removeClass("selected"); 
$(".menu-panel", this).removeClass("selected"); 
var bgImg = $(".menu-item", this).css("background-image"); 
bgImg = bgImg.replace("-hover.", "."); 
$(".menu-item", this).css("background-image", bgImg); 
}); 
}); 
</script>

<div id="sidebar-menu" class="left_nav">
	<div class="classification_title"><p class="title">图&nbsp书&nbsp分&nbsp类</p></div>
	<ul>
	<%
	List<Classification> classifications = (List<Classification>)session.getAttribute("classifications");
	for(int i=0; i<classifications.size(); i++){
		Classification c1 = classifications.get(i);
	%>
		<li>
			<div class="menu-item classification"> 
				<span><a href=""><%= c1.c1 %></a></span> 
			</div> 
			<div class="menu-panel"> 
				<ul>
					<li>
						<div class="link-list">
				<%
					for(int j=0; j<c1.c2.length; j++){
						String c2 = c1.c2[j];
				%>
							<div class="link-wrapper">
								<span>|</span>
								<a href="#"><%= c2 %></a>
							</div> 
				<%} %>
						</div>
						<div class="clear"></div> 
					</li>
				</ul>
			</div>
		</li>
	<%
	}
	%>
	</ul> 
</div>

<script>
$(".classification:even").addClass("bgcolor_even");
$(".classification:odd").addClass("bgcolor_odd");
$(".menu-panel:even").addClass("bgcolor_even");
$(".menu-panel:odd").addClass("bgcolor_odd");
</script>