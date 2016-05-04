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



	<link href='<%=request.getContextPath() + "/page/css/bootstrap.css"%>' rel="stylesheet">
    

    <!-- Custom styles for this template -->
    <link href='<%=request.getContextPath() + "/page/css/dashboard.css"%>' rel="stylesheet">


    <script type="text/javascript">
    
    
    function init(){
    	
    	doAjax('<%=request.getContextPath() + "/ClerkInf"%>', 'id=<%=session.getAttribute("id")%>',setClerkInf);

    }
    
	function setClerkInf(data, status){
        storeid=data[0].storeid;
        var myDate=new Date();
        var str=myDate.getFullYear()+"-"+(myDate.getMonth()+1)+"-"+myDate.getDate();
    	doAjax("<%=request.getContextPath() + "/GetList"%>","type=product&storeid="+storeid+"&time="+str,setProductlist);
        
        //doAjax('<%=request.getContextPath() + "/StoreInf"%>','id='+storeid,setInf);
    }
    
    
			function setProductlist(data, status){
                var a=$("#content");
                var b=$("#J_ItemList");
                var pat='<%=request.getContextPath()%>';
                
                var item;
                for(var i=0;i<data.length;i++){
                	//<p class="productPrice"><em style="font-size: 12px;">'+data[i].time+'</em></p>
                    b.append('<div class="product item-1111" ><div class="productImg-wrap"><a href="'+pat+'/page/jsps/Clerk_Sale.jsp?id='+data[i].id+'" class="productImg"><img src="'+pat+'/page/images/s2.png" /></a></div><p class="productPrice"><em><b>¥</b>'+data[i].price+'</em></p><p class="productTitle"><a href="'+pat+'/page/jsps/Clerk_Sale.jsp?id='+data[i].id+'">'+data[i].product+'</a></p><div class="productShop"><a class="productShop-name" href="'+pat+'/page/jsps/Clerk_Store.jsp?id='+data[i].storeid+'">'+data[i].store+'</a></div></div>');
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


    </script>

  </head>
  <body onload="init()">
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


        <div class="col-sm-3 col-md-2 sidebar" style="padding-top: 100px;">
          <ul class="nav nav-sidebar">
          <li class="active"><a href="<%=request.getContextPath() + "/page/jsps/Clerk_Productlist.jsp"%>">销售</a></li>
            <li ><a href="<%=request.getContextPath() + "/page/jsps/Clerk_Store.jsp?id="+session.getAttribute("id")%>">商店信息</a></li>
            <li ><a href="<%=request.getContextPath() + "/page/jsps/Clerk_Clerk.jsp?id="+session.getAttribute("id")%>">个人信息</a></li>
          </ul>
          <ul class="nav nav-sidebar">
 			<li ><a href="<%=request.getContextPath() + "/page/jsps/Clerk_Memberlist.jsp"%>">会员列表</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li ><a href="<%=request.getContextPath() + "/Login?type=logout"%>"><h5>退出</h5></a></li>
          </ul>
        </div>


        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <div>
          <h1 class="page-header">Product List</h1>
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