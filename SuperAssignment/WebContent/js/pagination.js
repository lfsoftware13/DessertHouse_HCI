jQuery.extend({
	paging: function(cur_page, max_page, num_show, id_parent_element, dest_url){
		var htmlcontent = "";
		if(cur_page != 1){
			htmlcontent += "<span><a href='" + dest_url + "?page=1'>首页</a>&nbsp</span><span><a href='" + dest_url + "?page=" + (cur_page - 1) + "'>上一页</a></span>";
		}
		var group = parseInt((cur_page -1) / num_show);
		var first = group * num_show + 1;
		var last = first + num_show - 1;
		if(last > max_page){
			last = max_page;
		}
		for(var i=first; i<=last; i++){
			if(i == cur_page){
				htmlcontent += "<span class='current'>" + i + "</span>";
			}else{
				htmlcontent += "<span><a href='" + dest_url + "?page=" + i + "'>" + i + "</a></span>";
			}
		}
		if(cur_page != max_page){
			htmlcontent += "<span><a href='" + dest_url + "?page=" + (cur_page + 1) + "'>下一页</a></span>&nbsp<span><a href='" + dest_url + "?page=" + max_page + "'>尾页</a></span>";
		}
		htmlcontent += "&nbsp&nbsp<span>共" + max_page + "页</span";
		$("#" + id_parent_element).html(htmlcontent);
	}
});