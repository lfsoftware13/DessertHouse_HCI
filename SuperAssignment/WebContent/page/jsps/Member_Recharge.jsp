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
    		doAjax('<%=request.getContextPath() + "/MemberInf"%>',"id=<%=session.getAttribute("id")%>",setMoney);
    	}
        
		function setMoney(data, status){
                var a=$("#content");
                var pat='<%=request.getContextPath()%>';
                
                $("#showmoney").text(data[0].money);
                $("#money").val("");
                $("#card").val("");
                $("#password").val("");
            }
        
        function doAjax(url1, inf1, func1){
        	
            jQuery.ajax({type:"GET", url:url1,data:inf1, dataType:"json", jsonp:"callback", success:func1

        , error:function(){
            alert("Ajax Error.");
        }
    }
        )
        }
        
        function check(){
        	if($("#money").val()==""||$("#card").val()==""||$("#password").val()==""){
 				alert("input error");
        		return false;
        	}
        	
        	if(parseFloat($("#money").val())==NaN){
 				alert("input error");
        		return false;
        	}
        	
        	if(parseFloat($("#money").val()=="")>parseFloat($("#showmoney").text())){
        		alert("too much money");
        		return false;
        	}
        	
        	var j={'type':'recharge','id':'<%=session.getAttribute("id")%>','money':$("#money").val(),'card':$("#card").val(),'password':$("#password").val()};
        	doAjax('<%=request.getContextPath() + "/MemberChange"%>',j,res);
        	return true;
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
            <li class="active"><a href="<%=request.getContextPath() + "/page/jsps/Member_Recharge.jsp?id="+session.getAttribute("id")%>">账户充值</a></li>
            <li ><a href="<%=request.getContextPath() + "/page/jsps/Member_Exchange.jsp?id="+session.getAttribute("id")%>">积分兑换</a></li>
            <li ><a href="<%=request.getContextPath() + "/page/jsps/Member_Consumptionlist.jsp?id="+session.getAttribute("id")%>">消费记录</a></li>
            <li ><a href="<%=request.getContextPath() + "/page/jsps/Member_Paymentlist.jsp?id="+session.getAttribute("id")%>">缴费记录</a></li>
          </ul>
          <ul class="nav nav-sidebar">
			<li ><a href="<%=request.getContextPath() + "/page/jsps/Member_Productlist.jsp?storeid=all&time=all"%>">购买产品</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li ><a href="<%=request.getContextPath() + "/Login?type=logout"%>"><h5>退出</h5></a></li>
          </ul>
        </div>


<!-- class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" -->

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <div>
          <h1 class="page-header">充值</h1>
          </div>
            
          

<!-- class="row placeholders" -->

          <div class="row placeholders">
<!-- <div class="security-right"> -->
        <div class="sr-b" style="margin-left: auto;margin-right: auto;">
            
            <ul id="content">
            	<li>
                    <div class="sb-info">
                        <p class="sbi-l">账户余额：</p>
                        <p class="sbi-m" id="showmoney"></p>
                    </div>
                </li>
				<li>
                    <div class="sb-info">
                        <p class="sbi-l">充值金额：</p>
                        <div class="sbi-m">
                            <input name="money" type="text" value="" id="money"></input>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">银行卡号：</p>
                        <div class="sbi-m">
                            <input name="card" type="text" value="" id="card"></input>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">支付密码：</p>
                        <div class="sbi-m">
                            <input name="password" type="password" value="" id="password"></input>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sb-info">
                            <div class="sbi-l">
                                <p>&nbsp;</p>
                            </div>
                            <div class="sbi-m">
                                <button name="btnsave" class="btn" value="recharge" id="btnconfirm" onclick="check()">确定</button>
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