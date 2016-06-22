<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script> 
<style type="text/css"> 
#sidebar-menu { 
/*目前要求宽度是238px,高度是332px，左边框+width正好238，以后需要可以修改*/ 
border-left : 1px solid #F93; 
width : 237px; 
/* height : 332px; */ 
margin : 0; 
padding : 0; 
background : #FFF7F0; 
} 
#sidebar-menu > ul { 
list-style : none; 
padding : 0; 
margin : 0; 
} 
#sidebar-menu > ul > li { 
list-style : none; 
padding : 0; 
margin : 0; 
border-bottom : 1px solid #FDEADB; 
position : relative; 
} 
#sidebar-menu > ul > li.selected { 
background : #FFF; 
border-top : 1px solid #F93; 
border-bottom : 1px solid #F93; 
} 
#sidebar-menu > ul > li.first { 
border-top : 1px solid #F93; 
} 
#sidebar-menu > ul > li.last { 
border-bottom : 1px solid #F93; 
} 

#sidebar-menu .menu-item { 
background : #FFF7F0 no-repeat left center; 
height : 32px; /**控制菜单中每行的宽度，下面还有两处需要修改**/ 
border-right : 1px solid #F93; 
z-index : 10000; 
position : relative; 
} 

#sidebar-menu > ul > li.selected .menu-item { 
border-right : 1px solid #FFF; 
background : #FFF no-repeat left center; 
} 
#sidebar-menu .menu-item span { 
font-size : 13px; 
font-weight : bold; 
height : 32px; 
line-height : 32px; 
padding-left : 35px; 
padding-top : 2px; 
display : inline-block; 
} 

#sidebar-menu .menu-panel { 
padding : 10px 20px; 
display : none; 
border : 1px solid #F93; 
width : 560px; 
position : absolute; 
left : 236px; 
top : -1px; 
z-index : 5000; 
min-height : 50px; 
box-shadow: 1px 1px 4px #888888; 
} 

#sidebar-menu div.menu-panel.selected { 
display : block; 
} 

/*Panel 里面的链接列表*/ 
#sidebar-menu div.menu-panel ul { 
list-style : none; 
padding : 0; 
margin : 0; 
} 
#sidebar-menu div.menu-panel ul li { 
list-style : none; 
padding : 5px 0px; 
margin : 0; 
} 

#sidebar-menu div.menu-panel>ul>li>h2 { 
margin : 0; 
padding : 0; 
padding-top : 2px; 
font-size : 13px; 
color : red; 
float : left; 
width : 60px; 
} 
#sidebar-menu div.menu-panel>ul>li>div.link-list { 
float : left; 
padding-left : 10px; 
width : 450px; 
} 
#sidebar-menu div.menu-panel div.link-wrapper { 
display : inline-block; 
padding : 3px 0px; 
} 
#sidebar-menu div.menu-panel div.link-wrapper span { 
font-size : 13px; 
color : #888; 
padding-right : 4px; 
} 
#sidebar-menu div.menu-panel div.link-list a { 
font-size : 13px; 
color : #888; 
text-decoration : none; 
} 
#sidebar-menu div.menu-panel div.link-list a:hover { 
text-decoration : underline; 
} 
#sidebar-menu div.clear { 
clear : both; 
height : 0; 
line-height : 0; 
} 
</style> 
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
<!--[if IE 7]> 
<style type="text/css"> 
#sidebar-menu div.menu-panel div.link-wrapper { 
display : inline; 
zoom : 1; 
} 
</style> 
<![endif]--> 
<title>Side bar demo</title> 
</head> 
<body> 
<div id="sidebar-menu"> 
<ul> 
<li class="first"> 
<div class="menu-item" style="background-image : url(images/tubiao.jpg);"> 
<span>图书音像</span> 
</div> 
<div class="menu-panel"> 
<ul> 
<li> 
<h2>高考图书</h2> 
<div class="link-list"> 
<div class="link-wrapper"><span>|</span><a href="#">物理习题</a></div> 
<div class="link-wrapper"><span>|</span><a href="#">生物</a></div> 
<div class="link-wrapper"><span>|</span><a href="#">高考复习题</a></div> 
<div class="link-wrapper"><span>|</span><a href="#">语文作文大全</a></div> 
<div class="link-wrapper"><span>|</span><a href="#">政治时事</a></div> 
<div class="link-wrapper"><span>|</span><a href="#">历年高考真题解析与答案</a></div> 
<div class="link-wrapper"><span>|</span><a href="#">考试题</a></div> 
<div class="link-wrapper"><span>|</span><a href="#">化学实验测试</a></div> 
<div class="link-wrapper"><span>|</span><a href="#">生物测试</a></div> 
</div> 
<div class="clear"></div> 
</li> 
<li> 
<h2>专辑</h2> 
<div class="link-list"> 
<div class="link-wrapper"><span>|</span><a href="#">郑智化专辑</a></div> 
<div class="link-wrapper"><span>|</span><a href="#">台湾伍佰</a></div> 
<div class="link-wrapper"><span>|</span><a href="#">大陆张含韵</a></div> 
<div class="link-wrapper"><span>|</span><a href="#">刘德华</a></div> 
<div class="link-wrapper"><span>|</span><a href="#">成龙</a></div> 
<div class="link-wrapper"><span>|</span><a href="#">王菲</a></div> 
<div class="link-wrapper"><span>|</span><a href="#">最新歌曲排行榜</a></div> 
</div> 
<div class="clear"></div> 
</li> 
<li> 
<h2>生活图书</h2> 
<div class="link-list"> 
<div class="link-wrapper"><span>|</span><a href="#">领悟人生</a></div> 
<div class="link-wrapper"><span>|</span><a href="#">天文地理</a></div> 
<div class="link-wrapper"><span>|</span><a href="#">旅游百科</a></div> 
<div class="link-wrapper"><span>|</span><a href="#">炒菜一本通</a></div> 
</div> 
<div class="clear"></div> 
</li> 
</ul> 
</div> 
</li> 
<li> 
<div class="menu-item" style="background-image : url(images/tubiao.jpg);"> 
<span>生活类</span> 
</div> 
<div class="menu-panel"> 
<ul> 
<li> 
<h2>炒菜宝典</h2> 
<div class="link-list"> 
<div class="link-wrapper"><span>|</span><a href="#">领悟人生</a></div> 
<div class="link-wrapper"><span>|</span><a href="#">天文地理</a></div> 
<div class="link-wrapper"><span>|</span><a href="#">旅游百科</a></div> 
<div class="link-wrapper"><span>|</span><a href="#">炒菜一本通</a></div> 
</div> 
<div class="clear"></div> 
</li> 
</ul> 
</div> 
</li> 
<li> 
<div class="menu-item"> 
<span>商品分类</span> 
</div> 
<div class="menu-panel"> 
商品分类内容...... 
</div> 
</li> 
<li> 
<div class="menu-item"> 
<span>商品分类</span> 
</div> 
<div class="menu-panel"> 
商品分类内容...... 
</div> 
</li> 
<li> 
<div class="menu-item"> 
<span>商品分类</span> 
</div> 
<div class="menu-panel"> 
商品分类内容...... 
</div> 
</li> 
<li> 
<div class="menu-item"> 
<span>商品分类</span> 
</div> 
<div class="menu-panel"> 
商品分类内容...... 
</div> 
</li> 
<li> 
<div class="menu-item"> 
<span>商品分类</span> 
</div> 
<div class="menu-panel"> 
商品分类内容...... 
</div> 
</li> 
<li> 
<div class="menu-item"> 
<span>商品分类</span> 
</div> 
<div class="menu-panel"> 
商品分类内容...... 
</div> 
</li> 
<li> 
<div class="menu-item"> 
<span>商品分类</span> 
</div> 
<div class="menu-panel"> 
商品分类内容...... 
</div> 
</li> 
<li> 
<div class="menu-item"> 
<span>商品分类</span> 
</div> 
<div class="menu-panel"> 
商品分类内容...... 
</div> 
</li> 
<li class="last"> 
<div class="menu-item"> 
<span>商品分类</span> 
</div> 
<div class="menu-panel"> 
商品分类内容...... 
</div> 
</li> 
</ul> 
</div> 
</body> 
</html> 