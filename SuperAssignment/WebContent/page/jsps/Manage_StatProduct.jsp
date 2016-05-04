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
//            var myDate=new Date();
//            var temp=myDate.getMonth()+1;
//            var c;
//            if(temp<10){
//            	temp='0'+temp;
//            }
//            c=myDate.getFullYear()+"-"+temp;
//            $("#datelist").val(c);
			
			initStat();
			
        	var d=jQuery("#datelist");
            var myDate=new Date();
            var temp=myDate.getMonth()+1;
            if(temp<10){
            	temp='0'+temp;
            }
            var str=myDate.getFullYear()+"-"+temp;
            d.val(str);

        	$("#datelist").Zebra_DatePicker({format:'Y-m',onClose:refresh});
        	
        	refresh();
        	//doAjax("<%=request.getContextPath() + "/GetList"%>","type=store",setStorelist);
        	//doAjax("<%=request.getContextPath() + "/PlanitemInf"%>","type=planitem&id=<%=request.getParameter("id")%>",setPlanitem);
        }
        
        function initStat(){
        	var myChart = echarts.init(document.getElementById('statnumber'));
        	// 显示标题，图例和空的坐标轴
        	myChart.setOption({
        	    title: {
        	        text: '产品统计'
        	    },
        	    tooltip: {},
        	    legend: {
        	        data:['预定数量','销售数量']
        	    },
        	    xAxis: {
        	        data: []
        	    },
        	    yAxis: {},
        	    series: [{
        	        name: '预定数量',
        	        type: 'bar',
        	        data: []
        	    },{
        	        name: '销售数量',
        	        type: 'bar',
        	        data: []
        	    }]
        	});
        	
        }
        
        function refresh(){
        	var j={'type':'product','time':$("#datelist").val()};
            doAjax("<%=request.getContextPath() + "/StatInf"%>",j,setStat);
        }
        
        
        function setStat(data,status){
        	var myChart = echarts.init(document.getElementById('statnumber'));
        	
        	var name=[];
        	var number=[];
        	var pre=[];
        	var total=[];
        	
        	for(var i=0;i<data.length;i++){
        		name.push(data[i].name);
        		number.push(data[i].number);
        		pre.push(data[i].pre);
        		total.push(data[i].total);
        	}
        	
        	myChart.setOption({
        	    title: {
        	        text: '销量统计'
        	    },
        	    tooltip: {},
        	    legend: {
        	        data:['预定数量','销售数量']
        	    },
        	    xAxis: {
        	        data: name
        	    },
        	    yAxis: {},
        	    series: [{
        	        name: '预定数量',
        	        type: 'bar',
        	        data: pre
        	    },{
        	        name: '销售数量',
        	        type: 'bar',
        	        data: number
        	    }]
        	});
        	
        	
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
	.addright{
    	position:relative;
    	left:50px;
    }
    .stat{
    	width:600px;
    	height:400px;
    }
    </style>
    
    <link href='<%=request.getContextPath() + "/page/css/bootstrap1.css"%>' rel="stylesheet">

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
			<li ><a href="<%=request.getContextPath() + "/page/jsps/Manage_StatMember.jsp"%>">会员统计</a></li>
            <li ><a href="<%=request.getContextPath() + "/page/jsps/Manage_StatStore.jsp"%>">店铺统计</a></li>
            <li class="active"><a href="<%=request.getContextPath() + "/page/jsps/Manage_StatProduct.jsp"%>">产品统计</a></li>          
            </ul>
            <ul class="nav nav-sidebar">
            <li ><a href="<%=request.getContextPath() + "/Login?type=logout"%>"><h5>退出</h5></a></li>
          </ul>
        </div>


<!-- class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" -->

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <div>
          <h1 class="page-header">销量统计</h1>
          </div>


            <div class="rowElem noborder" >
        	<label style="margin-left:20px;font-size:15px;">选择日期：</label>
        	<input id="datelist" name="member.birth" type="text" value="" size="14" readonly onchange="refresh()" >
			</div>
          

<!-- class="row placeholders" -->

          <div class="row placeholders">
<!-- <div class="security-right"> -->
        <div class="sr-b" style="margin-left: auto;margin-right: auto;">
            
            <div id="statnumber" class="stat"></div>

        </div>
    <!-- </div> -->
    </div>
    




      </div>
    </div>
    
        <script type="text/javascript" src="<%=request.getContextPath() + "/page/js/zebra_datepicker.js"%>"></script>
        <script type="text/javascript" src="<%=request.getContextPath() + "/page/js/core.js"%>"></script>
    
</body>
</html>