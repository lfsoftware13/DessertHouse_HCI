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
	<script type="text/javascript" src='<%=request.getContextPath() + "/page/js/echarts.common.min.js"%>'></script>
	<link href='<%=request.getContextPath() + "/page/css/base.css"%>' rel="stylesheet">
	<link href='<%=request.getContextPath() + "/page/css/zclc2.css"%>' rel="stylesheet">
	<link href='<%=request.getContextPath() + "/page/css/white.css"%>' rel="stylesheet">
	<link href='<%=request.getContextPath() + "/page/css/bootstrap.css"%>' rel="stylesheet">
    

    <!-- Custom styles for this template -->
    <link href='<%=request.getContextPath() + "/page/css/dashboard.css"%>' rel="stylesheet">


    <script type="text/javascript">
        
        function init(){
        	doAjax("<%=request.getContextPath() + "/StatInf"%>","type=sex",setSex);
         	doAjax("<%=request.getContextPath() + "/StatInf"%>","type=age",setAge);
        	doAjax("<%=request.getContextPath() + "/StatInf"%>","type=consumption",setConsumption);
        	doAjax("<%=request.getContextPath() + "/StatInf"%>","type=card",setCard);
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
        
        function setSex(data,status){
        	var myChart = echarts.init(document.getElementById('statsex'));
        	myChart.setOption({
        	    series:[
        	        {
        	            name: '性别统计',
        	            type: 'pie',
        	            radius: '70%',
        	            data:data
        	        }
        	    ]
        	})
        }
        
        function setAge(data,status){
        	var myChart = echarts.init(document.getElementById('statage'));
        	myChart.setOption({
        	    series:[
        	        {
        	            name: '年龄统计',
        	            type: 'pie',
        	            radius: '70%',
        	            data:data
        	        }
        	    ]
        	})
        }
        
        function setConsumption(data,status){
        	var myChart = echarts.init(document.getElementById('statconsumption'));
        	myChart.setOption({
        	    series:[
        	        {
        	            name: '消费统计',
        	            type: 'pie',
        	            radius: '70%',
        	            data:data
        	        }
        	    ]
        	})
        }
        
        function setCard(data,status){
        	var myChart = echarts.init(document.getElementById('statcard'));
        	myChart.setOption({
        	    series:[
        	        {
        	            name: '卡有效统计',
        	            type: 'pie',
        	            radius: '70%',
        	            data:data
        	        }
        	    ]
        	})
        }
        
  
    </script>
    
    <style>
	.addright{
    	position:relative;
    	left:50px;
    }
    
    .stat{
    	width:600px;
    	height:400px;
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
            <li ><a href="<%=request.getContextPath() + "/page/jsps/Manage_Planlist.jsp"%>?start=0000-00-00&end=3333-12-12&storeid=all">制定计划</a></li>
          </ul>
          <ul class="nav nav-sidebar">
			<li class="active" ><a href="<%=request.getContextPath() + "/page/jsps/Manage_StatMember.jsp"%>">会员统计</a></li>
            <li ><a href="<%=request.getContextPath() + "/page/jsps/Manage_StatStore.jsp"%>">店铺统计</a></li>
            <li ><a href="<%=request.getContextPath() + "/page/jsps/Manage_StatProduct.jsp"%>">产品统计</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li ><a href="<%=request.getContextPath() + "/Login?type=logout"%>"><h5>退出</h5></a></li>
          </ul>
        </div>


<!-- class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" -->

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <div>
          <h1 class="page-header">性别统计</h1>
          </div>
            
          


          <div class="row placeholders">
        <div class="sr-b" style="margin-left: auto;margin-right: auto;">
            
            <div id="statsex" class="stat"></div>
            
            
            
        </div>
    	</div>
    	
    	
    	  <div>
          <h1 class="page-header">年龄统计</h1>
          </div>
            
          <div class="row placeholders">
        <div class="sr-b" style="margin-left: auto;margin-right: auto;">
            
            <div id="statage" class="stat"></div>
            
            
            
        </div>
    	</div>
    	
    	
    	
    	    	  <div>
          <h1 class="page-header">消费统计</h1>
          </div>
            
          <div class="row placeholders">
        <div class="sr-b" style="margin-left: auto;margin-right: auto;">
            
            <div id="statconsumption" class="stat"></div>
            
            
            
        </div>
    	</div>
    	
    	
    	
    	    	  <div>
          <h1 class="page-header">卡有效统计</h1>
          </div>
            
          <div class="row placeholders">
        <div class="sr-b" style="margin-left: auto;margin-right: auto;">
            
            <div id="statcard" class="stat"></div>
            
            
            
        </div>
    	</div>
    	
    	
    	
    	
</div>




      </div>
    </div>
</body>
</html>