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

    <title>Clerk</title>

    <!-- Bootstrap core CSS -->
	<script type="text/javascript" src='<%=request.getContextPath() + "/page/js/jquery.js"%>'></script>
	<script type="text/javascript" src='<%=request.getContextPath() + "/page/js/json2.js"%>'></script>
	<link href='<%=request.getContextPath() + "/page/css/base.css"%>' rel="stylesheet">
	<link href='<%=request.getContextPath() + "/page/css/zclc2.css"%>' rel="stylesheet">
	<link href='<%=request.getContextPath() + "/page/css/white.css"%>' rel="stylesheet">
	<link href='<%=request.getContextPath() + "/page/css/bootstrap.css"%>' rel="stylesheet">
    

    <!-- Custom styles for this template -->
    <link href='<%=request.getContextPath() + "/page/css/dashboard.css"%>' rel="stylesheet">


    <script type="text/javascript">
        
    function init(){
    	doAjax('<%=request.getContextPath() + "/ClerkInf"%>', 'id=<%=request.getParameter("id")%>',setClerkInf);
    }
    
		function setClerkInf(data, status){
                var a=$("#content");
                var pat='<%=request.getContextPath()%>';
                
                var item;
                
                //a.append('<li><div class="sb-info"><p class="sbi-l">账户编号：</p><p class="sbi-m">'+data[0].id+'</p></div></li><li><div class="sb-info"><p class="sbi-l">账户名：</p><p class="sbi-m">'+data[0].account+'</p></div></li><li><div class="sb-info"><p class="sbi-l">姓名：</p><p class="sbi-m">'+data[0].name+'</p></div></li><li><div class="sb-info"><p class="sbi-l">性别：</p><p class="sbi-m">'+data[0].sex+'</p></div></li><li><div class="sb-info"><p class="sbi-l">所属商店：</p><p class="sbi-m">'+data[0].store+'</p></div></li>');
                $("#showid").text(data[0].id);
                $("#showname").text(data[0].name);
                $("#showsex").text(data[0].sex);
                $("#showstore").text(data[0].store);
                
                
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
            <li ><a href="<%=request.getContextPath() + "/page/jsps/Clerk_Productlist.jsp"%>">销售</a></li>
            <li ><a href="<%=request.getContextPath() + "/page/jsps/Clerk_Store.jsp?id="+session.getAttribute("id")%>">商店信息</a></li>
            <li class="active"><a href="<%=request.getContextPath() + "/page/jsps/Clerk_Clerk.jsp?id="+session.getAttribute("id")%>">个人信息</a></li>
          </ul>
          <ul class="nav nav-sidebar">
			<li ><a href="<%=request.getContextPath()+"/page/jsps/Clerk_Memberlist.jsp"%>">会员列表</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li ><a href="<%=request.getContextPath() + "/Login?type=logout"%>"><h5>退出</h5></a></li>
          </ul>
        </div>


<!-- class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" -->

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <div>
          <h1 class="page-header">职员信息</h1>
          </div>
            
          

<!-- class="row placeholders" -->

          <div class="row placeholders">
<!-- <div class="security-right"> -->
        <div class="sr-b" style="margin-left: auto;margin-right: auto;">
            <ul id="content">
                
                <li>
                	<div class="sb-info">
                		<p class="sbi-l">账户编号：</p>
                		<p class="sbi-m" id="showid"></p>
                	</div>
                </li>
                <li>
                	<div class="sb-info">
                		<p class="sbi-l">姓名：</p>
                		<p class="sbi-m" id="showname"></p>
                	</div>
                </li>
                <li>
                	<div class="sb-info">
                		<p class="sbi-l">性别：</p>
                		<p class="sbi-m" id="showsex"></p>
                	</div>
                </li>
                <li>
                	<div class="sb-info">
                		<p class="sbi-l">所属商店：</p>
                		<p class="sbi-m" id="showstore"></p>
                	</div>
                </li>
                
                
            </ul>
        </div>
    <!-- </div> -->
    </div>
</div>




      </div>
    </div>
</body>
</html>