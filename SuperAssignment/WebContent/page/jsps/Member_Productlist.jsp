<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Product List</title>



    <!-- Bootstrap core CSS -->
	<script type="text/javascript" src='<%=request.getContextPath() + "/page/js/jquery.js"%>'></script>
	<script type="text/javascript" src='<%=request.getContextPath() + "/page/js/json2.js"%>'></script>
    <link href="<%=request.getContextPath()%>/page/css/newcss/a.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/page/css/newcss/b.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/page/css/newcss/c.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/page/css/newcss/d.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/page/css/newcss/e.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/page/css/newcss/f.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/page/css/newcss/g.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/page/css/newcss/h.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/page/css/newcss/i.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/page/css/newcss/j.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/page/css/newcss/k.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/page/css/newcss/l.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/page/css/newcss/-mui-.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/page/css/newcss/-mui-mallbar-3.2.13.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/page/css/newcss/-mui-mallbar-3.2.13-.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/page/css/newcss/-mui-searchbar-3.3.28-.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/page/css/newcss/tdog.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/page/css/newcss/tstart.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/page/css/newcss/base.css" rel="stylesheet">



<style type="text/css">
/*body{font-size:12px;font-family:Verdana,Arial,"宋体";}*/
/*a:link {color:#464646;text-decoration:none;}
a:visited {color:#464646;text-decoration:none;}
a:hover{color:#ed145b;text-decoration:underline;}
a:active{color:#ed145b;text-decoration:underline;}
td{font-size:12px}*/
/*/*/
/*DateCSS样式*/
.header {font: 12px Arial, Tahoma !important;font-weight: bold !important;font: 11px Arial, Tahoma;font-weight: bold;color: #154BA0;background:#C2DEED;height: 25px;padding-left: 10px;
}
.header td {padding-left: 10px;}
.header a {color: #154BA0;}
.header input {background:none;vertical-align: middle;height: 16px;}
.category {font: 12px Arial, Tahoma !important;font: 11px Arial, Tahoma;color: #92A05A;height:20px;background-color: #FFFFD9;}
.category td {border-bottom: 1px solid #DEDEB8;}
.expire, .expire a:link, .expire a:visited {color: #999999;}
.default, .default a:link, .default a:visited {color: #000000;}
.checked, .checked a:link, .checked a:visited {color: #FF0000;}
.today, .today a:link, .today a:visited {color: #00BB00;}
#calendar_year {display: none;line-height: 130%;background: #FFFFFF;position: absolute;z-index: 10;}
#calendar_year .col {float: left;background: #FFFFFF;margin-left: 1px;border: 1px solid #86B9D6;padding: 4px;}
#calendar_month {display: none;background: #FFFFFF;line-height: 130%;border: 1px solid #86B9D6;padding: 4px;position: absolute;z-index: 11;}
.tableborder {background: white;border: 1px solid #86B9D6;}
#year,#month{padding-right:10px;}
</style>




	<link href='<%=request.getContextPath() + "/page/css/bootstrap.css"%>' rel="stylesheet">
    

    <!-- Custom styles for this template -->
    <link href='<%=request.getContextPath() + "/page/css/dashboard.css"%>' rel="stylesheet">


    <script type="text/javascript">
        
        function init(){
        	var d=jQuery("#datelist");
            var myDate=new Date();
            var str=myDate.getFullYear()+"-"+(myDate.getMonth()+1)+"-"+myDate.getDate();
        	doAjax("<%=request.getContextPath() + "/GetList"%>","type=store",setStorelist);
        	doAjax("<%=request.getContextPath() + "/GetList"%>","type=product&storeid=all&time="+str,setProductlist);
        }
        
        function setStorelist(data, status){
        	var c=jQuery("#selectstore");
        	c.append('<option value="all">all</option>');
        	for(var i=0;i<data.length;i++){
        		c.append('<option value="'+data[i].id+'">'+data[i].name+'</option>');
        	}
        	var d=jQuery("#datelist");
            var myDate=new Date();
            var temp=myDate.getMonth()+1;
            if(temp<10){
            	temp='0'+temp;
            }
            var str=myDate.getFullYear()+"-"+temp+"-"+myDate.getDate();
            d.val(str);
        }
        
        function setProductlist(data, status){
                var a=jQuery("#content");
                var b=jQuery("#J_ItemList");
                b.children().remove();
                var pat='<%=request.getContextPath()%>';
                
                var c=jQuery("#datelist").val();
                
                if(c==""){
                    var myDate=new Date();
                    var temp=myDate.getMonth()+1;
                    if(temp<10){
                    	temp='0'+temp;
                    }
                    c=myDate.getFullYear()+"-"+temp+"-"+myDate.getDate();
                }
                
                var item;
                for(var i=0;i<data.length;i++){
                    //a.append('<div class="col-xs-6 col-sm-3 placeholder"> <img src='+pat+'/page/images/clerk1.jpg  class="img-responsive" alt="Generic placeholder thumbnail"> <h4><a href='+pat + '/page/jsps/Clerk_Sale.jsp?id='+data[i].id+'&storeid=1>'+data[i].name+'</a></h4> <span class="text-muted">Something else</span> </div>');
                	b.append('<div class="product item-1111" ><div class="productImg-wrap"><a href="'+pat+'/page/jsps/Member_Sale.jsp?id='+data[i].id+'&time='+c+'" class="productImg"><img src="'+pat+'/page/images/s2.png" /></a></div><p class="productPrice"><em><b>¥</b>'+data[i].price+'</em></p><p class="productTitle"><a href="'+pat+'/page/jsps/Member_Sale.jsp?id='+data[i].id+'&time='+c+'">'+data[i].product+'</a></p><div class="productShop"><a class="productShop-name" href="#">'+data[i].store+'</a></div></div>');
                }
            }
        	
        	
        
        
        function doAjax(url1, inf1, func1){
        	
            jQuery.ajax({type:"GET", url:url1,data:inf1, dataType:"json", jsonp:"callback", success:func1

        , error:function(){
            alert("Ajax Error.");
        }
    }
        )
        }
        
        function refresh(){
        	//alert("123");
        	var j={'type':'product','storeid':jQuery("#selectstore").val(),'time':jQuery("#datelist").val()}
        	doAjax("<%=request.getContextPath() + "/GetList"%>",j,setProductlist);
        }
        
        function calen(){
        	showcalendar(event,this);
        }
        		
        
        
        

    </script>
    
<script language="javascript">
//下面的代码段如果你页面里有，可以去掉
var ie =navigator.appName=="Microsoft Internet Explorer"?true:false;
function $(objID){
return document.getElementById(objID);
}
</script>

  </head>
  <body onload="init()">




<script type="text/javascript" src='<%=request.getContextPath() + "/page/js/datelist.js"%>'></script>



    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#" style="color:white;">Dessert House</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">name</a></li>
          </ul>
<!--           <form class="navbar-form navbar-right">
            <input class="form-control" placeholder="Search..." type="text">
          </form> -->
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">


        <div class="col-sm-3 col-md-2 sidebar" style="padding-top: 50px;">
          <ul class="nav nav-sidebar">
            <li ><a href="<%=request.getContextPath() + "/page/jsps/Member_Myinf.jsp"%>">个人信息</a></li>
            <li ><a href="<%=request.getContextPath() + "/page/jsps/Member_Password.jsp?id="+session.getAttribute("id")%>">修改密码</a></li>
            <li ><a href="<%=request.getContextPath() + "/page/jsps/Member_Recharge.jsp?id="+session.getAttribute("id")%>">账户充值</a></li>
            <li ><a href="<%=request.getContextPath() + "/page/jsps/Member_Exchange.jsp?id="+session.getAttribute("id")%>">积分兑换</a></li>
            <li ><a href="<%=request.getContextPath() + "/page/jsps/Member_Consumptionlist.jsp?id="+session.getAttribute("id")%>">消费记录</a></li>
            <li ><a href="<%=request.getContextPath() + "/page/jsps/Member_Paymentlist.jsp?id="+session.getAttribute("id")%>">缴费记录</a></li>
          </ul>
          <ul class="nav nav-sidebar">
			<li class="active"><a href="<%=request.getContextPath() + "/page/jsps/Member_Productlist.jsp?storeid=all&time=all"%>">购买产品</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li ><a href="<%=request.getContextPath() + "/Login?type=logout"%>"><h5>退出</h5></a></li>
          </ul>
        </div>


        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <div>
          <h1 class="page-header">产品目录</h1>
          </div>
          
          
                  <div class="rowElem noborder" >
        	<label style="margin-left: 10px;">选择商店:</label>
        	<select id="selectstore" onchange="refresh()" style="width: 100px;margin-left: 20px;">
        	</select>
        	<label style="margin-left:20px">选择日期：</label>
        	<input id="datelist" name="member.birth" type="text" value="" size="14" readonly onchange="refresh()" onclick="showcalendar(event,this);" onfocus="showcalendar(event, this);if(this.value=='0000-00-00')this.value=''">
			</div>
          
          

          <div class="row placeholders" id="content">
          	<div class="sr-b" style="margin-left: auto;margin-right: auto;">
          		
          		
          		<div class="view grid-cspu view-noCom" id="J_ItemList" style="width:90%;">
          		
          		
          		
          		
          		
          		
          		</div>
          		
          		
          		
          	</div>
          </div>
        </div>
      </div>
    </div>

    
    </body>
    </html>