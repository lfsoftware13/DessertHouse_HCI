<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="homework.model.Address" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>收货地址</title>

<link
	href="http://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/public.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/topnav.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/logoline.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/personalcenter.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/address.css" rel="stylesheet">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>

</head>
<body>
<div class="lt_container">
	<%@ include file="topnav.jsp" %>
	<%@ include file="logoline.jsp" %>

	<div class="bottom_part">
		
		<%@ include file="pc_leftnav.jsp" %>
		
		<div class="pc_right_part">
			<div class="settings">
				<div><a class="new_address"><i class="fa fa-plus-circle fa-lg"></i>&nbsp新增收货地址</a></div>
				<table class="tbl_settings">
					<tr>
						<td class="title">所在地区</td>
						<td>
							<select name="area_county" id="">
								<option value="cn">中国大陆</option>
							</select>
							<select name="area_province" runat="server" id="province" onchange="selectprovince(this);"></select>
							<select name="area_city" id="city"></select>
						</td>
					</tr>
					<tr>
						<td class="title">详细地址</td>
						<td>
							<textarea id="detailedAddress" rows="3" cols="60" placeholder = "详细地址"></textarea>
						</td>
					</tr>
					<tr>
						<td class="title">邮政编码</td>
						<td>
							<input type="text" id="txt_zipcode" placeholder="默认为000000">
						</td>
					</tr>
					<tr>
						<td class="title">收货人姓名</td>
						<td>
							<input type="text" id="txt_name" placeholder="不超过25个字">
						</td>
					</tr>
					<tr>
						<td class="title">联系方式</td>
						<td>
							<select name="contact_zone" id="txt_contact_zone">
								<option value="cn">中国大陆+86</option>
							</select>
							<input type="text" id="txt_contact" placeholder="手机或电话号码">
						</td>
					</tr>
				</table>
				<div class="setting_line">
					<input type="hidden" id="addressId" value="">
					<input type="checkbox" id="set_default">设置为默认收货地址
					<div class="div_btn" id="btn_save_address">保存</div>
				</div>
			</div>
			
			<div class="addresslist">
				<div class = "add_title">
								<span>已有地址</span>
							</div>
				<table class="tbl_address">
					<tr class="tbl_head">
						<td>收货人</td>
						<td>所在区域</td>
						<td>详细地址</td>
						<td>邮编</td>
						<td>联系方式</td>
						<td>操作</td>
					</tr>
					<%
					List<Address> addressList = (List<Address>)session.getAttribute("addressList");
					if(addressList != null){
					for(int i=0; i<addressList.size(); i++){
					Address address = addressList.get(i);
					%>
					<tr class="addressline">

						<td><%= address.getName() %></td>
						<td><%= address.getProv() + address.getCity() %></td>
						<td style = "width:270px"><%= address.getDetails() %></td>
						<td><%= address.getZip() %></td>
						<td style = "width:130px;"><%= address.getPhone() %></td>

						<td><a class="deleteline">
						
						<i class="fa fa-trash-o fa-lg"></i>
					</a></td>
						<td style="display: none;" class="addressId"><%= address.getId() %></td>
					</tr>
					<%
					}
					}%>
				</table>
			</div>
			<div class="emptyr"><br><br><br></div>
		</div>
	</div>
</div>

<script>
$(".pc_leftnav li:eq(1)").addClass("selected");
$(".pc_leftnav li:eq(1)").find("a").addClass("selected");

$("a.new_address").click(function(){
	$("#province").val("北京市");
	$("#province").trigger("change");
	$("#city").val("北京");
	$("#detailedAddress").val("");
	$("#txt_zipcode").val("");
	$("#txt_name").val("");
	$("#txt_contact").val("");
	$("#addressId").val("");
	$("#set_default").prop("checked", false);
});

$(".tbl_address").on("click", "a.deleteline", function(){
	var row = $(this).parent().parent();
	var id = row.find("td.addressId").html();
	alert(id);
	$.ajax({
		type: "post",
		url: "../AddressServlet?action=delete&addressId=" + id,
		success: function(){
			row.remove();
		}
	});
});
</script>

<script src="<%= request.getContextPath() %>/js/city.js"></script>
<script>
	$("#btn_save_address").click(function(){
		var addressId = $("#addressId").val();
		var province = $("#province option:selected").text();
		var city = $("#city option:selected").text();
		var detailedAddr = $("#detailedAddress").val();
		var zipcode = $("#txt_zipcode").val();
		var name = $("#txt_name").val();
		var phone = $("#txt_contact").val();
		var isDefault = $("#set_default").prop("checked");
		var address = new Address(addressId, province, city, detailedAddr, zipcode, name, phone, isDefault);
		var action = "add";
		if(addressId != ""){
			action = "modify";
			address.id = $("#addressId").val();
		}
		$.ajax({
			type: "post",
			url: "../AddressServlet?action=" + action,
			data: address,
			success: function(msg){
				if(msg != "fail"){
					if(action == "add"){
						address.id = msg;
						addAddressLine(address);
						$("#addressId").val(msg);
					}else if(action == "modify"){
						modifyAddressLine(address);
					}
				}else{
					alert("fail");
				}
			}
		});
	});
	
	function Address(id, province, city, detailedAddr, zipcode, name, phone, isDefault){
		this.id = id;
		this.province = province;
		this.city = city;
		this.detailedAddr = detailedAddr;
		this.zipcode = zipcode;
		this.name = name;
		this.phone = phone;
		this.isDefault = isDefault;
	}
	
	function addAddressLine(address){
		var html_row = "<tr class='addressline'>"
		html_row += "<td>" + address.name + "</td>";
		html_row += "<td>" + address.province + address.city + "</td>";
		html_row += "<td>" + address.detailedAddr + "</td>";
		html_row += "<td>" + address.zipcode + "</td>";
		html_row += "<td>" + address.phone + "</td>";
		html_row += "<td><a class='deleteline'>删除</a></td>";
		html_row += "<td style='display: none;'>" + address.id + "</td>";
		html_row += "</tr>";
		$(".tbl_address").append(html_row);
	}
	
	function modifyAddressLine(address){
		var addressId = $("#addressId").val();
		$(".tbl_address tr:gt(0)").each(function(){
			var id = $(this).find("td.addressId").html();
			if(id == addressId){
				$(this).find("td:eq(0)").html($("#txt_name").val());
				$(this).find("td:eq(1)").html($("#province option:selected").text() + $("#city option:selected").text());
				$(this).find("td:eq(2)").html($("#detailedAddress").val());
				$(this).find("td:eq(3)").html($("#txt_zipcode").val());
				$(this).find("td:eq(4)").html($("#txt_contact").val());
			}
		});
	}
	
	<%
	if(addressList.size() > 0){
		Address address = null;
		if(addressList.size() > 0){
			for(int i=0; i<addressList.size(); i++){
				if(addressList.get(i).getIsDefault() == 1){
					address = addressList.get(i);
					break;
				}
			}
		}
		if(address == null){
			address = addressList.get(0);
		}
	%>
		defaultAddress("<%= address.getProv() %>", "<%= address.getCity() %>", "<%= address.getDetails() %>", "<%= address.getZip() %>", "<%= address.getName() %>", "<%= address.getPhone() %>", "<%= address.getId() %>");
	<%
	}
	%>
	
	function defaultAddress(prov, city, details, zip, name, phone, id){
		$("#province").val(prov);
		$("#province").trigger("change");
		$("#city").val(city);
		$("#detailedAddress").val(details);
		$("#txt_zipcode").val(zip);
		$("#txt_name").val(name);
		$("#txt_contact").val(phone);
		$("#addressId").val(id);
		$("#set_default").prop("checked", true);
	}
</script>
	
</body>
</html>