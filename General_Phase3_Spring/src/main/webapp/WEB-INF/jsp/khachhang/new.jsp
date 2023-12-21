<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Customer</title>
<link href="<c:url value='/resources/bootstrap/css/bootstrap.min.css' />"
	rel="stylesheet">
</head>
<body style="background: #286c5c;">
	<div class="row">
		<div class="col-2">
			<jsp:include page="../leftmenu.jsp"></jsp:include>
		</div>
		<div class="col">
			<div class="container font-weight-bold">
				<form:form
					action="${pageContext.request.contextPath}/khachhang/save" onsubmit="return checkSubmit()"
					method="POST" modelAttribute="khachHangForm">
					<div class="h3 text-center text-white">Tạo mới khách hàng</div>

					<div class="form-group text-white">
						<form:label path="id">Mã khách hàng</form:label>
						<form:input path="id" type="text" class="form-control"
							placeholder="Nhập tên khách hàng" />
						<form:errors path="id" class="text-danger"></form:errors>
						<span class="text-danger" id="errorid"></span>
					</div>
					<div class="form-group text-white">
						<form:label path="tenKH">Tên khách hàng</form:label>
						<form:input path="tenKH" type="text" class="form-control"
							placeholder="Nhập tên khách hàng" />
						<form:errors path="tenKH" class="text-danger"></form:errors>
						<span class="text-danger" id="errortenKH"></span>
					</div>
					<div class="form-group text-white">
						<form:label path="diaChi">Địa chỉ</form:label>
						<form:input path="diaChi" type="text" class="form-control"
							placeholder="Nhập dịa chỉ" />
						<form:errors path="diaChi" class="text-danger"></form:errors>
						<span class="text-danger" id="errordiaChi"></span>
					</div>
					<div class="form-group text-white">
						<form:label path="soDienThoai">Số điện thoại</form:label>
						<form:input path="soDienThoai" type="text" class="form-control"
							placeholder="Nhập số điện thoại" />
						<form:errors path="soDienThoai" class="text-danger"></form:errors>
						<span class="text-danger" id="errorsoDienThoai"></span>
					</div>
					<div class="form-group text-white">
						<form:label path="email">Email</form:label>
						<form:input path="email" type="email" class="form-control"
							placeholder="Nhập email" />
						<form:errors path="email" class="text-danger"></form:errors>
						<span class="text-danger" id="erroremail"></span>
					</div>
					<button type="submit" class="btn btn-primary mt-2">Add New</button>
				</form:form>
			</div>
			<div class="row d-flex align-items-center justify-content-center">
				<img style="width: 800px; height: 180px" alt="shop-cart"
					src="<c:url value='/resources/img/oke.gif'/>" class="img-fluid">
			</div>
			<div class="row d-flex align-items-center justify-content-center">
				<img style="width: 800px; height: 180px" alt="shop-cart"
					src="<c:url value='/resources/img/oke.gif'/>" class="img-fluid">
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	<script src="<c:url value='/resources/bootstrap/js/jquery-3.6.4.min.js' />"></script>
	<script src="<c:url value='/resources/bootstrap/js/bootstrap.min.js' />"></script>
	<script >
	
	function checkSubmit() {
		
		$("#errorid").html("");
		$("#errortenKH").html("");
		$("#errordiaChi").html("");
		$("#errorsoDienThoai").html("");
		$("#erroremail").html("");
		
		var resultCheck = true;
		var id = $("#id").val();
		if(!id || !/^(KH)[0-9]{5}$/.test(id)) {
			resultCheck = false;
			$("#errorid").html("Mã khách hàng phải bắt đầu bằng KH và có 5 số");
		}
		var tenKH = $("#tenKH").val();
		if(!tenKH) {
			resultCheck = false;
			$("#errortenKH").html("Tên khách hàng không được để trống");
		}
		var diaChi = $("#diaChi").val();
		if(!diaChi) {
			resultCheck = false;
			$("#errordiaChi").html("Địa chỉ không được để trống");
		}
		var soDienThoai = $("#soDienThoai").val();
		if(!soDienThoai || !/^(0|\\(84\\)\\+)(90|91)\\d{7}$/.test(soDienThoai) {
			resultCheck = false;
			$("#errorsoDienThoai").html("Số điện thoại phải bắt đầu bằng 090 hoặc 091")
		}
		var email = $("#email").val();
		if(!email || !/\\w+@fpt\\.com/.test(email)) {
			resultCheck = false;
			$("#erroremail").html("Email phải có @fpt.com");
		}
		return resultCheck;
	}
	</script>
</body>
</html>