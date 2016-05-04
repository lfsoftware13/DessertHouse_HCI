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

    <title>Member List</title>

    <!-- Bootstrap core CSS -->
	<script type="text/javascript" src='<%=request.getContextPath() + "/page/js/jquery.js"%>'></script>
	<script type="text/javascript" src='<%=request.getContextPath() + "/page/js/json2.js"%>'></script>
	<link href='<%=request.getContextPath() + "/page/css/bootstrap.css"%>' rel="stylesheet">
    

    <!-- Custom styles for this template -->
    <link href='<%=request.getContextPath() + "/page/css/dashboard.css"%>' rel="stylesheet">


    <script type="text/javascript">
    
    
    	function init(){
    		doAjax('<%=request.getContextPath() + "/GetList"%>',"type=member",setMember);
    	}
    	
    	function setMember(data, status){
                var a=$("#contenttbody");
                var pat='<%=request.getContextPath()%>';
                
                var item;
                for(var i=0;i<data.length;i++){
                    //a.append('<div class="col-xs-6 col-sm-3 placeholder"> <img src='+pat+'/page/images/clerk1.jpg  class="img-responsive" alt="Generic placeholder thumbnail"> <h4><a href='+pat + '/Store?id='+data[i].id+'>'+data[i].name+'</a></h4> <span class="text-muted">Something else</span> </div>');
                    var p="0";
                    if(data[i].status==1){
                    	p="已激活";
                    }else if(data[i].status==0){
                    	p="未激活";
                    }else if(data[i].status==-1){
                    	p="已停止";
                    }
                    a.append('<tr><td>'+data[i].id+'</td><td><a href="'+pat+'/page/jsps/Clerk_Member.jsp?id='+data[i].id+'">'+data[i].name+'</a></td><td>'+p+'</td><td><a href="'+pat+'/page/jsps/Clerk_Consumptionlist.jsp?id='+data[i].id+'">查询</a></td><td><a href="'+pat+'/page/jsps/Clerk_Paymentlist.jsp?id='+data[i].id+'">查询</a></td></tr>');
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


        <div class="col-sm-3 col-md-2 sidebar" style="padding-top: 100px;">
          <ul class="nav nav-sidebar">
          	<li ><a href="<%=request.getContextPath() + "/page/jsps/Clerk_Productlist.jsp"%>">销售</a></li>
            <li ><a href="<%=request.getContextPath() + "/page/jsps/Clerk_Store.jsp?id="+session.getAttribute("id")%>">商店信息</a></li>
            <li ><a href="<%=request.getContextPath() + "/page/jsps/Clerk_Clerk.jsp?id="+session.getAttribute("id")%>">个人信息</a></li>
          </ul>
          <ul class="nav nav-sidebar">
			<li class="active"><a href="<%=request.getContextPath() + "/page/jsps/Clerk_Memberlist.jsp"%>">会员列表</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li ><a href="<%=request.getContextPath() + "/Login?type=logout"%>"><h5>退出</h5></a></li>
          </ul>
        </div>


        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <div>
          <h1 class="page-header">Member List</h1>
          </div>

          <div class="row placeholders" id="content">
            <div class="sr-b" style="margin-left: auto;margin-right: auto;">
            	
                        <table class="table table-striped" style="width:100%;">
                <thead>
                    <tr>
                        <th class="thcenter" style="width:10%;">编号</th>
                        <th class="thcenter" style="width:40%">姓名</th>
                        <th class="thcenter" style="width:10%">账户状态</th>
                        <th class="thcenter" style="width:20%">消费记录</th>
                        <th class="thcenter" style="width:20%">缴费记录</th>
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