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

    <title>Plan List</title>



    <!-- Bootstrap core CSS -->
	<script type="text/javascript" src='<%=request.getContextPath() + "/page/js/jquery.js"%>'></script>
	<script type="text/javascript" src='<%=request.getContextPath() + "/page/js/json2.js"%>'></script>

    <style>
        .thcenter{
            text-align: center;
            height:50px;
        }
        td,th{
            height:50px;
        }

    </style>



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
        	doAjax("<%=request.getContextPath() + "/GetList"%>","type=plan&storeid=all&time=all",setPlanlist);
        	doAjax("<%=request.getContextPath() + "/GetList"%>","type=store",setStorelist);
        }
        
        function setStorelist(data, status){
        	var c=jQuery("#selectstore");
        	c.children().remove();
        	c.append('<option value="all">all</option>');
        	for(var i=0;i<data.length;i++){
        		c.append('<option value="'+data[i].id+'">'+data[i].name+'</option>');
        	}
        }
        
        function setPlanlist(data, status){
                var a=jQuery("#contenttbody");
                var b=jQuery("#J_ItemList");
                a.children().remove();
                var pat='<%=request.getContextPath()%>';
                
                var d=jQuery("#datelist");
                
                
                
                var item;
                for(var i=0;i<data.length;i++){
                	if(data[i].status=="已通过"){
    					a.append('<tr><td>'+data[i].id+'</td><td>'+data[i].start+'</td><td>'+data[i].end+'</td><td><a href="'+pat+'/page/jsps/MainClerk_Store.jsp?id='+data[i].storeid+'">'+data[i].storeid+'</a></td><td><a href="'+pat+'/page/jsps/MainClerk_Store.jsp?id='+data[i].storeid+'">'+data[i].store+'</a></td><td>'+data[i].status+'</td><td><a href="'+pat+'/page/jsps/MainClerk_Planitemlist.jsp?id='+data[i].id+'">详细</a></td><td><a>-</a></td><td><a name="'+data[i].id+'">-</a></td></tr>');
                	}else{
    					a.append('<tr><td>'+data[i].id+'</td><td>'+data[i].start+'</td><td>'+data[i].end+'</td><td><a href="'+pat+'/page/jsps/MainClerk_Store.jsp?id='+data[i].storeid+'">'+data[i].storeid+'</a></td><td><a href="'+pat+'/page/jsps/MainClerk_Store.jsp?id='+data[i].storeid+'">'+data[i].store+'</a></td><td>'+data[i].status+'</td><td><a href="'+pat+'/page/jsps/MainClerk_Planitemlist.jsp?id='+data[i].id+'">详细</a></td><td><a href="'+pat+'/page/jsps/MainClerk_Plan.jsp?id='+data[i].id+'">修改</a></td><td><a onclick="btndelete(this.name)" name="'+data[i].id+'">删除</a></td></tr>');
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
        
        function btndelete(a){
        	var j={'type':'delete','id':a};
        	doAjax('<%=request.getContextPath() + "/PlanChange"%>',j,res);
        }
        
        function res(data, status){
        	alert(data[0].status);
        	location.reload();
        }
        
        function refresh(){
        	var a=jQuery("#selectstore").val();
        	var b=jQuery("#datelist").val();
        	if(a==""){
        		a="all";
        	}
        	if(b==""){
        		b="all";
        	}
        	var j={'type':'plan','storeid':a,'time':b};
        	doAjax("<%=request.getContextPath() + "/GetList"%>",j,setPlanlist);
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
            <li class="active"><a href="<%=request.getContextPath() + "/page/jsps/MainClerk_Planlist.jsp"%>?start=0000-00-00&end=3333-12-12&storeid=all">制定计划</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li ><a href="<%=request.getContextPath() + "/Login?type=logout"%>"><h5>退出</h5></a></li>
          </ul>
        </div>


        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <div>
          <h1 class="page-header">计划列表</h1>
          </div>
          
          
            <div class="rowElem noborder" >
            <a href="<%=request.getContextPath()%>/page/jsps/MainClerk_PlanAdd.jsp"><button class="btn" onclick="<%=request.getContextPath()%>/page/jsps/MainClerk_PlanAdd.jsp" style="margin-left:20px;background-color:#428bca;color:white;">添加计划</button></a>
        	<label style="margin-left: 20px;">选择商店:</label>
        	<select id="selectstore"  onchange="refresh()" style="width: 100px;margin-left: 20px;">
        	</select>
        	<label style="margin-left:20px">选择日期：</label>
        	<input id="datelist" onchange="refresh()" name="member.birth" type="text" value="" size="14" readonly onclick="showcalendar(event,this);" onfocus="showcalendar(event, this);if(this.value=='0000-00-00')this.value=''">
			</div>
          
          

          <div class="row placeholders" id="content">
          	<div class="sr-b" style="margin-left: auto;margin-right: auto;">
          		
          		
<table class="table table-striped" style="width:100%;">
                <thead>
                    <tr>
                        <th class="thcenter" >计划编号</th>
                        <th class="thcenter" >起始时间</th>
                        <th class="thcenter" >结束时间</th>
                        <th class="thcenter" >商店编号</th>
                        <th class="thcenter" >商店名称</th>
                        <th class="thcenter" >计划状态</th>
                        <th class="thcenter" >详细</th>
                        <th class="thcenter" >修改</th>
                        <th class="thcenter" >删除</th>
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