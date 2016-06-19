<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="left_nav">
	<div class="classification_title"><p class="title">图&nbsp书&nbsp分&nbsp类</p></div>
	<%for(int i=0; i<8; i++){ %>
	<div class="classification">
		<dl>
			<dt><a href="../SearchServlet?type=c1&kw=c1">一级分类<%= i+1 %></a></dt>
			<%for(int j=0; j<4; j++){ %>
			<dd><a href="../SearchServlet?type=c2&kw=c2">二级分类<%=j+1 %></a></dd>
			<%} %>
		</dl>
	</div>
	<%} %>
</div>

<script>
$(".classification dl").each(function(){
	$(this).find("dd:not(:eq(-1))").addClass("not_last");
	$(this).find("dd:eq(-1)").addClass("last");
});

$(".classification:even").addClass("bgcolor_even");
$(".classification:odd").addClass("bgcolor_odd");
</script>