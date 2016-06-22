<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="homework.model.Classification" %>

<div class="left_nav">
	<div class="classification_title"><p class="title">图&nbsp书&nbsp分&nbsp类</p></div>
	<%
	List<Classification> classifications = (List<Classification>)session.getAttribute("classifications");
	for(int i=0; i<classifications.size(); i++){
		Classification c1 = classifications.get(i);
	%>
	<div class="classification">
		<dl>
			<dt><a href="../SearchServlet?type=c1&kw=<%=c1.c1%>"><%=c1.c1%></a></dt>
			<%
			for(int j=0; j<c1.c2.length; j++){
				String c2 = c1.c2[j];
			%>
			<dd><a href="../SearchServlet?type=c2&kw=<%=c2%>"><%=c2%></a></dd>
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