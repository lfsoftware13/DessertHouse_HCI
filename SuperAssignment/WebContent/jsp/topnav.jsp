<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%if(session.getAttribute("user") == null){%>
<div class="topnav">
	<div>
		<!--向左对齐-->
		<font class="topnav-text topnav-left title">LingTu.Com</font>
		
		<span class = "topnav-text" style="margin-left:950px;color:white;">[</span>
		<a class="topnav-text" id="a_login">登录</a>
		<span class = "topnav-text" style = "color:white;">&nbsp|&nbsp</span>
		 
		<a class="topnav-text " id="a_regist">注册</a>
		<span class = "topnav-text" style = "color:white;">]</span>
	</div>
</div>
<%}else{%>
<div class="topnav">
	<div>
		<!--向左对齐-->
		<font class="topnav-text topnav-left title">LingTu.Com</font>
		<!--向右对齐-->
		<a class="topnav-text topnav-right user" href="../LogoutServlet"> 
			<i class = "fa fa-user fa-lg"></i>
			注销
		</a>
		<a class="topnav-text topnav-right user" href="../PersonalCenterServlet"> 
			<i class = "fa fa-user fa-lg"></i>
			&nbspUser1
		</a>
	</div>
</div>
<%}%>


<div class="modal fade" id="login_regist" tabindex="-1" role="dialog" aria-hidden="true" style="margin-top:150px;">
	<div class="modal-dialog modal-nm" style="width: 300px;">
		<div class="modal-content">
			<div>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: 8px; margin-right: 10px;"><span aria-hidden="true">&times;</span></button>
				<ul id="myTab" class="nav nav-tabs">
   					<li class="active"><a href="#login" data-toggle="tab">登录</a></li>
   					<li><a href="#regist" data-toggle="tab">注册</a></li>
				</ul>
			</div>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active" id="login">
					<div class="modal-body">
						<form id="form_login" class="form-horizontal" method="post" action="../LoginServlet">
							<div class="form-group">
               					<div class="col-sm-10" style="margin-left: 5%; width:90%;">
                   					<input type="text" class="form-control" name="id" placeholder="请输入用户名" />
               					</div>
               				</div>
               				<div class="form-group">
               					<div class="col-sm-10" style="margin-left: 5%; width:90%;">
                   					<input type="password" class="form-control" name="password" placeholder="请输入密码"/>
               					</div>
               				</div>
           				</form>
					</div>
					<div class="my-modal-footer">
						<span></span>
						<button class="btn btn-default" id="btn_login" style = "margin-left:200px;">登录</button>
					</div>
				</div>
				<div class="tab-pane fade" id="regist">
					<div class="modal-body">
						<form id="form_regist" class="form-horizontal" method="post" action="../RegistServlet">
							<div class="form-group">
			               		<div class="col-sm-10" style="margin-left: 5%; width:90%;">
			                   		<input type="text" class="form-control" name="id" placeholder="请输入用户名" />
			               		</div>
			               	</div>
			               	<div class="form-group">
		                 		<div class="col-sm-10" style="margin-left: 5%; width:90%;">
		                    		<input type="password" class="form-control" name="password" placeholder="请输入密码"/>
		                  		</div>
		                	</div>
		                	<div class="form-group">
			               		<div class="col-sm-10" style="margin-left: 5%; width:90%;">
		                    		<input type="password" class="form-control" name="password2" placeholder="请确认密码"/>
		                  		</div>
		                	</div>
			           	</form>
					</div>
					<div class="my-modal-footer">
						<span></span>
						<button class="btn btn-default" id="btn_regist">注册</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script>
$("#a_login").click(function(){
	$("#myTab li:eq(1)").removeClass("active");
	$("#myTab li:eq(0)").addClass("active");
	$("#regist").removeClass("active");
	$("#regist").removeClass("in");
	$("#login").addClass("active");
	$("#login").addClass("in");
	$("#login_regist").modal("show");
});
$("#a_regist").click(function(){
	$("#myTab li:eq(0)").removeClass("active");
	$("#myTab li:eq(1)").addClass("active");
	$("#login").removeClass("active");
	$("#login").removeClass("in");
	$("#regist").addClass("active");
	$("#regist").addClass("in");
	$("#login_regist").modal("show");
});

$("#btn_login").click(function(){
	var username = $("#form_login input[name='id']").val();
	var password = $("#form_login input[name='password']").val();
	if(username == ""){
		$("#login .my-modal-footer").find("span").html("请输入用户名");
	}else if(password == ""){
		$("#login .my-modal-footer").find("span").html("请输入密码");
	}else{
		$("#form_login").submit();
	}
});

$("#btn_regist").click(function(){
	var username = $("#form_regist input[name='id']").val();
	var password = $("#form_regist input[name='password']").val();
	var password2 = $("#form_regist input[name='password2']").val();
	if(username == ""){
		$("#regist .my-modal-footer").find("span").html("请输入用户名");
	}else if(password == ""){
		$("#regist .my-modal-footer").find("span").html("请输入密码");
	}else if(password2 == ""){
		$("#regist .my-modal-footer").find("span").html("请再次输入密码");
	}else if(password != password2){
		$("#regist .my-modal-footer").find("span").html("两次密码不一致");
	}else{
		$("#form_regist").submit();
	}
});
</script>