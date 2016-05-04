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
	<link href='<%=request.getContextPath() + "/page/css/bootstrap.css"%>' rel="stylesheet">
    

    <!-- Custom styles for this template -->
    <link href='<%=request.getContextPath() + "/page/css/dashboard.css"%>' rel="stylesheet">


    <script type="text/javascript">
    
    	function init(){
    		doAjax('<%=request.getContextPath() + "/PaymentInf"%>',"type=consumption&id=<%=session.getAttribute("id")%>",setCon);	
    	}
    	
		function setCon(data, status){
                var a=$("#contenttbody");
                var pat='<%=request.getContextPath()%>';
                
                var item;
                for(var i=0;i<data.length;i++){
                	if(data[i].status=="预定"){
                        a.append('<tr><td>'+data[i].id+'</td><td><a href="'+pat+'/page/jsps/Member_Myinf.jsp?id='+data[i].memberid+'">'+data[i].memberid+'</a></td><td><a href="'+pat+'/page/jsps/Member_Myinf.jsp?id='+data[i].memberid+'">'+data[i].member+'</a></td><td>'+data[i].storeid+'</td><td>'+data[i].store+'</td><td>'+data[i].productid+'</td><td>'+data[i].product+'</td><td>'+data[i].price+'</td><td>'+data[i].discountprice+'</td><td>'+data[i].number+'</td><td>'+data[i].total+'</td><td>'+data[i].status+'<br /><a onclick="unsub(this.name)" name="'+data[i].id+'">退订</a></td><td>'+data[i].time+'</td></tr>');	
                	}else{
                        a.append('<tr><td>'+data[i].id+'</td><td><a href="'+pat+'/page/jsps/Member_Myinf.jsp?id='+data[i].memberid+'">'+data[i].memberid+'</a></td><td><a href="'+pat+'/page/jsps/Member_Myinf.jsp?id='+data[i].memberid+'">'+data[i].member+'</a></td><td>'+data[i].storeid+'</td><td>'+data[i].store+'</td><td>'+data[i].productid+'</td><td>'+data[i].product+'</td><td>'+data[i].price+'</td><td>'+data[i].discountprice+'</td><td>'+data[i].number+'</td><td>'+data[i].total+'</td><td>'+data[i].status+'</td><td>'+data[i].time+'</td></tr>');
                	}
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
        
        function unsub(a){
        	var j={'type':'returned','id':a};
        	doAjax('<%=request.getContextPath() + "/SaleChange"%>',j,res);
        }
        
        function res(data, status){
        	alert(data[0].status);
        	location.reload();
        }


    </script>
    
    <style>
        .thcenter{
            text-align: center;
            height:50px;
        }
        td,th{
            height:50px;
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
            <li ><a href="<%=request.getContextPath() + "/page/jsps/Member_Myinf.jsp"%>">个人信息</a></li>
            <li ><a href="<%=request.getContextPath() + "/page/jsps/Member_Password.jsp?id="+session.getAttribute("id")%>">修改密码</a></li>
            <li ><a href="<%=request.getContextPath() + "/page/jsps/Member_Recharge.jsp?id="+session.getAttribute("id")%>">账户充值</a></li>
            <li ><a href="<%=request.getContextPath() + "/page/jsps/Member_Exchange.jsp?id="+session.getAttribute("id")%>">积分兑换</a></li>
            <li class="active"><a href="<%=request.getContextPath() + "/page/jsps/Member_Consumptionlist.jsp?id="+session.getAttribute("id")%>">消费记录</a></li>
            <li ><a href="<%=request.getContextPath() + "/page/jsps/Member_Paymentlist.jsp?id="+session.getAttribute("id")%>">缴费记录</a></li>
          </ul>
          <ul class="nav nav-sidebar">
			<li ><a href="<%=request.getContextPath() + "/page/jsps/Member_Productlist.jsp?storeid=all&time=all"%>">购买产品</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li ><a href="<%=request.getContextPath() + "/Login?type=logout"%>"><h5>退出</h5></a></li>
          </ul>
        </div>


        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <div>
          <h1 class="page-header">消费记录</h1>
          </div>

          <div class="row placeholders" id="content">
          	<div class="sr-b" style="margin-left: auto;margin-right: auto;">
				<table class="table table-striped" style="width:100%;">
					<thead>
						<tr>
							<th class="thcenter" >编号</th>
							<th class="thcenter" >会员编号</th>
							<th class="thcenter" >姓名</th>
	                        <th class="thcenter" >商店编号</th>
    	                    <th class="thcenter" >消费商店</th>
        	                <th class="thcenter" >产品编号</th>
            	            <th class="thcenter" >产品名称</th>
                	        <th class="thcenter" >产品单价</th>
                	        <th class="thcenter" >折后单价</th>
                    	    <th class="thcenter" >产品数量</th>
                        	<th class="thcenter" >总额</th>
	                        <th class="thcenter" >账单状态</th>
    	                    <th class="thcenter" >时间</th>
        	            </tr>
            	    </thead>
            	    <tbody id="contenttbody">
            	    
            	    
            	    
            	    </tbody>
           		</table>
          	</div>
          </div>
        </div>
      </div>
    </div>

    
    </body>
    </html>