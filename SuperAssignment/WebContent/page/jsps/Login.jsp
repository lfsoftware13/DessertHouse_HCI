<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<title>Login</title>

	<!-- Bootstrap -->
	<script type="text/javascript" src="<%=request.getContextPath() + "/page/js/jquery.js"%>"></script>
	<script type="text/javascript" src='<%=request.getContextPath() + "/page/js/json2.js"%>'></script>
	<link href="<%=request.getContextPath() + "/page/css/bootstrap.min.css"%>" rel="stylesheet">


	<script type="text/javascript">
		$(document).ready(function(){
			$("#error").hide();
		});
		function check(){
			if($("#account").val()==""||$("#password").val()==""){
				$("#error").show();
				return false;
			}
			return true;
		}
		function gotoRegister(){
			window.location.href="<%=request.getContextPath() + "/page/jsps/Register.jsp"%>";
		}
	</script>

		<style type="text/css">
		.btn{
			background-color: #337ab7;
			color:white;
			padding:10px,16px;
			width:100%;
			height:50px;
			margin: center;
			font-size: 18px;
		}
		#main{
			margin-left: auto;
			margin-right: auto;
			width:30%;
			margin-top: 150px;
			padding:5px 30px 30px 30px;
			background-color: white;
			border-radius: 20px;
		}

	</style>

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
  </head>
  <body style="background-image:url(<%=request.getContextPath() + "/page/images/login.jpg"%>)">

  	<div id="main" >
  	  <h2 >Log in</h2>
  		<form role="form" action=<%=request.getContextPath() + "/Login"%> onsubmit="return check()">
  			<div class="form-group">
  				<p id="error" class="help-block" style="color:red;">Please check your account and password again.</p>
  			</div>
  			
  			<div class="form-group">
  				<label for="account">account</label>
  				<input type="text" class="form-control" name="account" id="account" placeholder="Please enter your name"></input>
  			</div>
  			<div class="form-group">
  				<label for="password">password</label>
  				<input type="password" class="form-control" name="password" id="password" placeholder="Please enter your password"></input>
  			</div>
  			<button class="btn btn-default" type="submit" style="width:45%;margin-right: 8%">Submit</button>
  			<button class="btn btn-default" type="button" style="width:45%;" onclick="gotoRegister()">Register</button>
  			<a></a>
  		</form>


  	</div>
  </body>
  </html>