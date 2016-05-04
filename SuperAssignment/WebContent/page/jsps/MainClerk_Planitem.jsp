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

    <title>Member</title>

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
        	doAjax("<%=request.getContextPath() + "/GetList"%>","type=productlist",setProductlist);
        	doAjax("<%=request.getContextPath() + "/PlanitemInf"%>","type=planitem&id=<%=request.getParameter("id")%>",setPlanitem);
        }
        
        function setProductlist(data, status){
        	var c=jQuery("#select02");
        	
        	for(var i=0;i<data.length;i++){
        		c.append('<option value="'+data[i].id+'">'+data[i].name+'</option>');
        	}
        }
        
        function setPlanitem(data, status){
                var a=jQuery("#contenttbody");
                var b=jQuery("#J_ItemList");
                //a.children().remove();
                //b.children().remove();
                var pat='<%=request.getContextPath()%>';
                
                jQuery("#showid").text(data[0].id);
                jQuery("#showproductid").text(data[0].productid);
                jQuery("#select02").val(data[0].productid);
                jQuery("#shownumber").val(data[0].number);
                jQuery("#showprice").val(data[0].price);
                
                var item;
                for(var i=0;i<data.length;i++){
                    //a.append('<div class="col-xs-6 col-sm-3 placeholder"> <img src='+pat+'/page/images/clerk1.jpg  class="img-responsive" alt="Generic placeholder thumbnail"> <h4><a href='+pat + '/page/jsps/Clerk_Sale.jsp?id='+data[i].id+'&storeid=1>'+data[i].name+'</a></h4> <span class="text-muted">Something else</span> </div>');
                	//b.append('<div class="product item-1111" ><div class="productImg-wrap"><a href="'+pat+'/page/jsps/Clerk_Sale.jsp?id='+data[i].id+'" class="productImg"><img src="'+pat+'/page/images/s2.png" /></a></div><p class="productPrice"><em><b>¥</b>'+data[i].price+'</em></p><p class="productTitle"><a href="'+pat+'/page/jsps/Clerk_Sale.jsp?id='+data[i].id+'">'+data[i].name+'</a></p><div class="productShop"><a class="productShop-name" href="'+pat+'/page/jsps/Clerk_Store.jsp?id='+data[i].storeid+'">'+data[i].store+'</a></div><p class="productPrice"><em style="font-size: 12px;">'+data[i].time+'</em></p></div>');
					//a.append('<tr><td>'+data[i].id+'</td><td>'+data[i].start+'</td><td>'+data[i].end+'</td><td><a href="'+pat+'/page/jsps/MainClerk_Store.jsp?id='+data[i].storeid+'">'+data[i].storeid+'</a></td><td><a href="'+pat+'/page/jsps/MainClerk_Store.jsp?id='+data[i].storeid+'">'+data[i].store+'</a></td><td>'+data[i].status+'</td><td><a href="'+pat+'/page/jsps/MainClerk_Planitemlist.jsp?id='+data[i].id+'">详细</a></td><td><a href="'+pat+'/page/jsps/MainClerk_Plan.jsp?id='+data[i].id+'">修改</a></td><td><a href="#">删除</a></td></tr>');
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
        		
        function changeProduct(){
        	jQuery("#showproductid").text(jQuery('#select02').val());
        }
        
        function save(){
        	var j={'type':'update','id':jQuery("#showid").text(),'productid':jQuery("#showproductid").text(),'number':jQuery("#shownumber").val(),'price':jQuery("#showprice").val()};
 			doAjax("<%=request.getContextPath() + "/PlanItemChange"%>",j,res);
        }
        
        function res(data, status){
        	alert(data[0].status);
        	location.reload();
        }
        
  
    </script>
    
    <style>
	.addright{
    	position:relative;
    	left:50px;
    }
    </style>

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
        <div class="col-sm-3 col-md-2 sidebar" style="padding-top: 50px;">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="<%=request.getContextPath() + "/page/jsps/MainClerk_Planlist.jsp"%>?start=0000-00-00&end=3333-12-12&storeid=all">制定计划</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li ><a href="<%=request.getContextPath() + "/Login?type=logout"%>"><h5>退出</h5></a></li>
          </ul>
        </div>


<!-- class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" -->

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <div>
          <h1 class="page-header">分项计划信息</h1>
          </div>
            
          

<!-- class="row placeholders" -->

          <div class="row placeholders">
<!-- <div class="security-right"> -->
        <div class="sr-b" style="margin-left: auto;margin-right: auto;">
            <ul id="contentul">
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">分项编号：</p>
                        <p class="sbi-m" id="showid"></p>
                    </div>
                </li>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">商品编号：</p>
                        <p class="sbi-m" id="showproductid"></p>
                    </div>
                </li>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">商品名称：</p>
                        <div class="sbi-m">
                            <select id="select02" style="height:25px;" onchange="changeProduct()" ></select>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">数量：</p>
                        <div class="sbi-m">
                            <input type="text" value="" id="shownumber"></input>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">单价：</p>
                        <div class="sbi-m">
                            <input type="text" value="" id="showprice"></input>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sb-info">
                            <div class="sbi-l">
                                &nbsp;
                            </div>
                            <div class="sbi-m">
                                <button class="btn" onclick="save()" id="btnconfirm" style="background-color:#428bca;color:white;">确定</button>
                            </div>
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