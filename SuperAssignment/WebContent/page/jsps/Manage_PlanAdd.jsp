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

	<link href='<%=request.getContextPath() + "/page/css/base.css"%>' rel="stylesheet">
	<link href='<%=request.getContextPath() + "/page/css/zclc2.css"%>' rel="stylesheet">
	<link href='<%=request.getContextPath() + "/page/css/white.css"%>' rel="stylesheet">

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
        	doAjax("<%=request.getContextPath() + "/GetList"%>","type=store",setStorelist);
        	//doAjax("<%=request.getContextPath() + "/GetList"%>","type=plan&id=<%=request.getParameter("id")%>",setPlan);
        }
        
        function setStorelist(data, status){
        	var c=jQuery("#select02");
        	//c.children.remove();
        	for(var i=0;i<data.length;i++){
        		c.append('<option value="'+data[i].id+'">'+data[i].name+'</option>');
        	}
        	if(jQuery("#select02 option").size()>0){
        		jQuery("#showstoreid").text(jQuery("#select02 option:first").val());
        	}
        }
        
        function setPlan(data, status){
                var a=jQuery("#contenttbody");
                var b=jQuery("#J_ItemList");
                //a.children().remove();
                //b.children().remove();
                var pat='<%=request.getContextPath()%>';
                
                var d=jQuery("#datelist");
                
                //jQuery("#showid").text(data[0].id);
                jQuery("#showstart").val(data[0].start);
                jQuery("#showend").val(data[0].end);
                jQuery("#showstoreid").text(data[0].storeid);
                jQuery("#select02").val(data[0].storeid);
                //jQuery("#showstatus").text(data[0].status);
                
                
                
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
        		
        function changeStore(){
        	jQuery("#showstoreid").text(jQuery('#select02').val());
        }
        
        function save(){
        	var a=jQuery("#showstart").val();
        	var b=jQuery("#showend").val();
        	var j={'type':'add','start':a,'end':b,'storeid':jQuery("#showstoreid").text()};
			doAjax("<%=request.getContextPath() + "/PlanChange"%>",j,res);
        }
        
        function res(data,status){
        	alert(data[0].status);
        	location.reload();
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
            <li class="active"><a href="<%=request.getContextPath() + "/page/jsps/Manage_Planlist.jsp"%>?start=0000-00-00&end=3333-12-12&storeid=all">制定计划</a></li>
          </ul>
          <ul class="nav nav-sidebar">
			<li ><a href="<%=request.getContextPath() + "/page/jsps/Manage_StatMember.jsp"%>">会员统计</a></li>
            <li ><a href="<%=request.getContextPath() + "/page/jsps/Manage_StatStore.jsp"%>">店铺统计</a></li>
            <li ><a href="<%=request.getContextPath() + "/page/jsps/Manage_StatProduct.jsp"%>">产品统计</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li ><a href="<%=request.getContextPath() + "/Login?type=logout"%>"><h5>退出</h5></a></li>
          </ul>
        </div>


        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <div>
          <h1 class="page-header">添加计划</h1>
          </div>
          
          
 <!--             <div class="rowElem noborder" >
            <button class="btn" onclick="add()" style="margin-left:20px;background-color:#428bca;color:white;">添加计划</button>
        	<label style="margin-left: 20px;">选择商店:</label>
        	<select id="selectstore"  onchange="" style="width: 100px;margin-left: 20px;">
        	</select>
        	<label style="margin-left:20px">选择日期：</label>
        	<input id="datelist" name="member.birth" type="text" value="" size="14" readonly onclick="showcalendar(event,this);" onfocus="showcalendar(event, this);if(this.value=='0000-00-00')this.value=''">
			</div>
       -->   
          

          <div class="row placeholders" id="content">
          	<div class="sr-b" style="margin-left: auto;margin-right: auto;">
          		
          		<ul>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">起始时间：</p>
                        <div class="sbi-m">
                            <input id="showstart" name="member.birth" type="text" value="" size="14" readonly onclick="showcalendar(event,this);" onfocus="showcalendar(event, this);if(this.value=='0000-00-00')this.value=''" />
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">结束时间：</p>
                        <div class="sbi-m">
                            <input id="showend" name="member.birth" type="text" value="" size="14" readonly onclick="showcalendar(event,this);" onfocus="showcalendar(event, this);if(this.value=='0000-00-00')this.value=''" />
                        </div>
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
                        <div class="sbi-m">
                            <select id="select02" style="height:25px;" onchange="changeStore()" ></select>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sb-info">
                            <div class="sbi-l">
                                &nbsp;
                            </div>
                            <div class="sbi-m">
                                <button class="btn" id="btnconfirm" onclick="save()">确定</button>
                            </div>
                    </div>
                </li>
            </ul>
          		
          		
          		
          	</div>
          </div>
        </div>
      </div>
    </div>

    
    </body>
    </html>