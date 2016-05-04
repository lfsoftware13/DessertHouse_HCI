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
    //jQuery(document).ready();
    
    function init(){
    	doAjax("<%=request.getContextPath() + "/MemberInf"%>","id=<%=session.getAttribute("id")%>",setMemInf);
    }
    
	function setMemInf(data, status){
                
            	//alert("success");
            	
            	var a=jQuery("#content");
                var pat='<%=request.getContextPath()%>';
                
                //a.append('<li><div class="sb-info"><p class="sbi-l">账户编号：</p><p class="sbi-m">'+data[0].id+'</p></div></li><li><div class="sb-info"><p class="sbi-l">账户名：</p><p class="sbi-m">'+data[0].account+'</p></div></li><li><div class="sb-info"><p class="sbi-l">姓名：</p><div class="sbi-m"><input value="'+data[0].name+'" id="inputname"></input></div></div></li><li><div class="sb-info"><p class="sbi-l">性别：</p><div class="sbi-m"><select id="select01" style="height:25px;"><option>-</option><option>男</option><option>女</option></select></div></div></li><li><div class="sb-info"><p class="sbi-l">年龄：</p><div class="sbi-m"><input value="'+data[0].age+'" id="inputage"></input></div></div></li><li><div class="sb-info"><p class="sbi-l">地址：</p><div class="sbi-m"><input value="'+data[0].address+'" id="inputaddress"></input></div></div></li><li><div class="sb-info"><p class="sbi-l">账户等级：</p><p class="sbi-m">'+data[0].level+'</p></div></li><li><div class="sb-info"><p class="sbi-l">账户积分：</p><p class="sbi-m">'+data[0].point+'</p></div></li><li><div class="sb-info"><p class="sbi-l">账户金额：</p><p class="sbi-m">'+data[0].money+'</p></div></li><li><div class="sb-info"><p class="sbi-l">账户状态：</p><p class="sbi-m">'+data[0].state+'</p></div></li><li><div class="sb-info"><p class="sbi-l">到期时间：</p><p class="sbi-m">'+data[0].time+'</p></div></li>');
                
                jQuery("#showid").text(data[0].id);
                jQuery("#showname").val(data[0].name);
                jQuery("#showage").val(data[0].age);
                jQuery("#showaddress").val(data[0].address);
                jQuery("#showpoint").text(data[0].point);
                jQuery("#showlevel").text(data[0].level);
                jQuery("#showdiscount").text(data[0].discount);
                jQuery("#showmoney").text(data[0].money);
                if(data[0].status==1){
                	jQuery("#showstate").text("已激活");
                }else if(data[0].status==0){
                	jQuery("#showstate").text("未激活");
                }else if(data[0].status==-1){
                	jQuery("#showstate").text("已停止");
                }
                //jQuery("#showstate").text(data[0].status);
                jQuery("#showtime").text(data[0].valid);
                
                var opts = document.getElementById("select01");
                
                for(var i=0;i<opts.options.length;i++){
                	if(data[0].sex==opts.options[i].value){
                		opts.options[i].selected='selected';
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
        
        function saveMemInf(){
        	var j={"id":"<%=session.getAttribute("id")%>",'name':$("#showname").val(),'address':$("#showaddress").val(),'sex':$("#select01").val(),'age':$("#showage").val(),'type':'myinf'};
        	doAjax("<%=request.getContextPath()%>/MemberChange",j,res);
        	return false;
        }
        
        function stop(){
        	var j={"id":"<%=session.getAttribute("id")%>",'type':'stop'};
        	doAjax("<%=request.getContextPath()%>/MemberChange",j,res);
        	return false;
        }
        
        function res(data,status){
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
            <li class="active"><a href="<%=request.getContextPath() + "/page/jsps/Member_Myinf.jsp"%>">个人信息</a></li>
            <li ><a href="<%=request.getContextPath() + "/page/jsps/Member_Password.jsp?id="+session.getAttribute("id")%>">修改密码</a></li>
            <li ><a href="<%=request.getContextPath() + "/page/jsps/Member_Recharge.jsp?id="+session.getAttribute("id")%>">账户充值</a></li>
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
          <h1 class="page-header">会员信息</h1>
          </div>
            
          

<!-- class="row placeholders" -->

          <div class="row placeholders">
<!-- <div class="security-right"> -->
        <div class="sr-b" style="margin-left: auto;margin-right: auto;">
        
        <input type="hidden" value="<%=session.getAttribute("id")%>" name="hiddenid"/>  
            <ul id="content">
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">账户编号：</p>
                        <p class="sbi-m" id="showid"></p>
                    </div>
                </li>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">姓名：</p>
                        <div class="sbi-m">
                            <input type="text" name="showname" id="showname"></input>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">性别：</p>
                        <div class="sbi-m">
                            <select id="select01" name="select01" style="height:25px;">
                                <option>-</option>
                                <option>男</option>
                                <option>女</option>
                            </select>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">年龄：</p>
                        <div class="sbi-m">
                            <input type="text" name="showage" id="showage"></input>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">地址：</p>
                        <div class="sbi-m">
                            <input type="text" name="showaddress" id="showaddress"></input>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">账户积分：</p>
                        <div class="sbi-m">
                        	<p>
                        		<label id="showpoint"></label>
                        		<a href="<%=request.getContextPath()%>/page/jsps/Member_Exchange.jsp" class="addright">兑换积分</a>
                        	</p>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">账户等级：</p>
                        <div class="sbi-m">
                            <span id="showlevel"></span>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">所享折扣：</p>
                        <div class="sbi-m">
                            <span id="showdiscount"></span>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">账户金额：</p>
                        <div class="sbi-m">
                        	<p>
                        		<label id="showmoney"></label>
                        		<a href="<%=request.getContextPath()%>/page/jsps/Member_Recharge.jsp" class="addright">充值</a>
                        	</p>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">账户状态：</p>
                        <div class="sbi-m">
                        	<p>
                            	<label id="showstate"></label>
                            	<a onclick="stop()" class="addright">停止账户</a>
                            </p>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">到期时间：</p>
                        <div class="sbi-m">
                            <span id="showtime"></span>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sb-info">
                            <div class="sbi-l">
                                <p>&nbsp;</p>
                            </div>
                            <div class="sbi-m">
                                <button type="submit" name="btnsave" class="btn" id="btnsave" value="myinf" onclick="saveMemInf()">保存</button>
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