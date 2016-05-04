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

    <title>Sale</title>

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
    		doAjax('<%=request.getContextPath() + "/ProductInf"%>','type=sale&id=<%=request.getParameter("id")%>&storeid=1&time=all',setSaleInf);
    		//doAjax("<%=request.getContextPath() + "/MemberInf"%>","id=<%=session.getAttribute("id")%>",setMemInf);
    	}
    	
    	function setMemInf(data, status){
    		var a=parseFloat($("#showprice").text())*data[0].discount;
    		$("#showdiscountprice").text(a);
    	}
    
    
		function setSaleInf(data, status){
                var a=$("#contentul");
                var pat='<%=request.getContextPath()%>';
                
                $("#showproductid").text(data[0].productid);
                $("#showproduct").text(data[0].product);
                $("#showstoreid").text(data[0].storeid);
                $("#showstore").text(data[0].store);
                $("#showtime").text('<%=request.getParameter("time")%>');
                $("#showprice").text(data[0].price);
                //$("#showdiscountprice").text(data[0].discountprice);
                $("#shownumber").val(0);
                $("#showtotal").val(0);
                
                doAjax("<%=request.getContextPath() + "/MemberInf"%>","id=<%=session.getAttribute("id")%>",setMemInf);
                
            }
        
        
        
        function doAjax(url1, inf1, func1){
        	
            jQuery.ajax({type:"GET", url:url1,data:inf1, dataType:"json", jsonp:"callback", success:func1

        , error:function(){
            alert("Ajax Error.");
        }
    }
        )
        }
        
        
        
        function calTotal(){
            var a=parseFloat(document.getElementById("showdiscountprice").innerHTML);
            var b=parseInt($("#shownumber").val());

            if(a<0){
                document.getElementById("showdiscountprice").innerHTML=0;
                a=0;
            }
            if(b<0){
                document.getElementById("shownumber").value=0;
                b=0;
            }

            if(isNaN(a)||isNaN(b)){
                document.getElementById("showtotal").value=0;
            }else{
               document.getElementById("showtotal").value=a*b; 
            }
        }
        
        function save(){
        	var j={'type':'reseve','stockid':'<%=request.getParameter("id")%>','memberid':'<%=session.getAttribute("id")%>','number':jQuery("#shownumber").val(),'time':'<%=request.getParameter("time")%>'};
        	doAjax('<%=request.getContextPath() + "/SaleChange"%>',j,res);
        }
        
        function res(data,status){
        	alert(data[0].status);
        	location.reload();
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
          <h1 class="page-header">Sale</h1>
          </div>
          
          
          <div>
          <div style="float:left;">
          	<img src="<%=request.getContextPath()%>/page/images/s2.png" style="height:500px;width:425px;"/>
          </div>

          <div class="row placeholders" id="content" style="float:left">
			<div class="sr-b" style="margin-left: auto;margin-right: auto;">
            	<ul id="contentul">
            		<li>
            			<div class="sb-info">
            				<p class="sbi-l">产品编号：</p>
            				<p class="sbi-m" id="showproductid"></p>
            			</div>
            		</li>
            		<li>
            			<div class="sb-info">
            				<p class="sbi-l">产品名称：</p>
            				<p class="sbi-m" id="showproduct"></p>
            			</div>
            		</li>
            		<li>
            			<div class="sb-info">
            				<p class="sbi-l">商店编号：</p>
            				<p class="sbi-m" id="showstoreid"></p>
            			</div>
            		</li>
            		<li>
            			<div class="sb-info">
            				<p class="sbi-l">商店名称：</p>
            				<p class="sbi-m" id="showstore"></p>
            			</div>
            		</li>
            		<li>
            			<div class="sb-info">
            				<p class="sbi-l">日期：</p>
            				<p class="sbi-m" id="showtime"></p>
            			</div>
            		</li>
            		<li>
            			<div class="sb-info">
            				<p class="sbi-l">单价：</p>
            				<p class="sbi-m" id="showprice"></p>
            			</div>
            		</li>
            		<li>
            			<div class="sb-info">
            				<p class="sbi-l">折扣价：</p>
            				<p class="sbi-m" id="showdiscountprice"></p>
            			</div>
            		</li>
            		<li>
            			<div class="sb-info">
            				<p class="sbi-l">数量：</p>
            				<div class="sbi-m">
            					<input type="text" id="shownumber" value="0" onchange="calTotal()"></input>
            				</div>
            			</div>
            		</li>
            		<li>
            			<div class="sb-info">
            				<p class="sbi-l">总价：</p>
            				<div class="sbi-m">
            					<input type="text" id="showtotal" value="0" readonly></input>
            				</div>
            			</div>
            		</li>
            		<li>
            			<div class="sb-info">
           	 				<div class="sbi-l">
           	 					&nbsp;
           	 				</div>
           	 				<div class="sbi-m">
           	 					<button class="btn" id="showconfirm" onclick="save()">确定</button>
           	 				</div>
           	 			</div>
           	 		</li>
            	
            	
            	</ul>
            </div>
          </div>
          
          </div>
          
        </div>
      </div>
    </div>

    
    </body>
    </html>