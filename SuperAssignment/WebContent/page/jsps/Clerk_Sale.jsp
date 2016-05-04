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
        $(document).ready(function (){
            $.ajax({type:"GET", url:'<%=request.getContextPath() + "/ProductInf"%>',data:'type=sale&id=<%=request.getParameter("id")%>&storeid=1', dataType:"json", jsonp:"callback", success:function(data, status){
                var a=$("#contentul");
                var pat='<%=request.getContextPath()%>';
                
                //a.append('<li><div class="sb-info"><p class="sbi-l">产品编号</p><p class="sbi-m">'+data[0].id+'</p></div></li><li><div class="sb-info"><p class="sbi-l">产品名称：</p><p class="sbi-m">'+data[0].name+'</p></div></li><li><div class="sb-info"><p class="sbi-l">单价：</p><p class="sbi-m" id="price">'+data[0].price+'</p></div></li><li><div class="sb-info"><p class="sbi-l">数量：</p><div class="sbi-m"><input type="text" id="number" value="0" onchange="calTotal()"></input></div></div></li><li><div class="sb-info"><p class="sbi-l">总价：</p><div class="sbi-m"><input type="text" id="total" value="0" readonly="true"></input></div></div></li><li><div class="sb-info"><p class="sbi-l">付款方式</p><div class="sbi-m"><select id="select01" style="height:25px;" onchange="showCard()"><option selected>会员卡</option><option>现金</option></select></div></div></li><li id="cardli"><div class="sb-info"><p class="sbi-l">卡号</p><div class="sbi-m"><input type="text" id="card" value=""></input></div></div></li><li><div class="sb-info"><div class="sbi-l"><button class="btn" onclick="">确定</button></div><div class="sbi-m"><button class="btn" onclick="">取消</button></div></div></li>');
                $("#showproductid").text(data[0].productid);
                $("#showproduct").text(data[0].product);
                $("#showprice").text(data[0].price);
                $("#productimg").attr("src",pat+"/page/images/"+data[0].image);
                $("#select01").val("会员卡");
                
            }

        , error:function(){
            alert("error");
        }
    }
        )

        });
        
        function doAjax(url1, inf1, func1){
        	
            jQuery.ajax({type:"GET", url:url1,data:inf1, dataType:"json", jsonp:"callback", success:func1

        , error:function(){
            alert("Ajax Error.");
        }
    }
        )
        }
        
        function calTotal(){
        	var f=document.getElementById("select01").value;
        	if(f=="现金"){
        		var a=parseFloat(document.getElementById("showprice").innerHTML);
        	}else{
        		var a=parseFloat(document.getElementById("showdiscountprice").innerHTML);
        	}
            var b=parseInt($("#shownumber").val());

            if(a<0){
            	document.getElementById("showprice").innerHTML=0;
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
        function showCard(){
            var a=document.getElementById("select01").value;
            if(a=="现金"){
            	$("#cardli").hide();
            	$("#memberli").hide();
            	$("#discountpriceli").hide();
            }else{
                $("#cardli").show();
                $("#memberli").show();
            	$("#discountpriceli").show();
            }
            calTotal();
        }
        function checkaccount(){
        	
        	if($("#showcard").val()==""){
        		alert("卡号不能为空.");
        		return false;
        	}
        	
        	var j={'id':$("#showcard").val()};
        	doAjax('<%=request.getContextPath() + "/MemberInf"%>',j,setMember);
        }
        
        function setMember(data, status){
        	if(data[0].status=="NotExist"){
        		alert("用户不存在");
        	}else{
        		$("#showmember").text(data[0].name);
        		var g=parseFloat($("#showprice").text())*parseFloat(data[0].discount);
        		$("#showdiscountprice").text(g);
        		calTotal();
        	}
        }
        
        function save(){
            var myDate=new Date();
            var temp=myDate.getMonth()+1;
            if(temp<10){
            	temp='0'+temp;
            }
            var str=myDate.getFullYear()+"-"+temp+"-"+myDate.getDate();
            
            var a=document.getElementById("select01").value;
            if(a=="现金"){
            	var p="-";
            }else{
            	var p=$("#showcard").val();
            }
            var j={'type':'reseve','stockid':'<%=request.getParameter("id")%>','memberid':p,'number':jQuery("#shownumber").val(),'time':str};
        	doAjax('<%=request.getContextPath() + "/SaleChange"%>',j,res);
        }
        
        function res(data,status){
        	alert(data[0].status);
        	location.reload();
        }


    </script>

  </head>
  <body>
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
           	 			<p class="sbi-l">单价：</p>
           	 			<p class="sbi-m" id="showprice"></p>
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
           	 			<p class="sbi-l">付款方式：</p>
           	 			<div class="sbi-m">
           	 				<select id="select01" style="height:25px;" onchange="showCard()">
           	 					<option selected>会员卡</option>
           	 					<option>现金</option>
           	 				</select>
           	 			</div>
           	 		</div>
           	 	</li>
           	 	<li id="cardli">
           	 		<div class="sb-info">
           	 			<p class="sbi-l">卡号：</p>
           	 			<div class="sbi-m">
           	 				<p>
           	 				<input type="text" id="showcard" value=""></input>
           	 				<button class="btn" onclick="checkaccount()">确定</button>
           	 				</p>
           		 		</div>
           	 		</div>
           	 	</li>
           	 	<li id="memberli">
           	 		<div class="sb-info">
           	 			<p class="sbi-l">会员名：</p>
           	 			<p class="sbi-m" id="showmember"></p>
           	 		</div>
           	 	</li>
           	 	<li id="discountpriceli">
           	 		<div class="sb-info">
           	 			<p class="sbi-l">折扣价：</p>
           	 			<p class="sbi-m" id="showdiscountprice"></p>
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