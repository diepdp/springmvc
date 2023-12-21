<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Customer</title>
<link rel="stylesheet"
	href="<c:url value='/resources/bootstrap/css/bootstrap.min.css' />">
</head>
<body style="background: #286c5c;">
	<div class="row">
		<div class="col-2">
			<jsp:include page="../leftmenu.jsp"></jsp:include>
		</div>
		<div class="col">
			<div class="container font-weight-bold">
				<form:form
					action="${pageContext.request.contextPath}/khachhang/update"
					method="POST" modelAttribute="khachHangForm">
					<div class="h3 text-center text-white">Thay đổi thông tin
						khách hàng</div>

					<div class="form-group text-white">
						<form:label path="id">Mã khách hàng</form:label>
						<form:input path="id" type="text" readonly="${true}"
							class="form-control" placeholder="Nhập tên khách hàng" />
						<form:errors path="id" class="text-danger"></form:errors>
					</div>
					<div class="form-group text-white">
						<form:label path="tenKH">Tên khách hàng</form:label>
						<form:input path="tenKH" type="text" class="form-control"
							placeholder="Nhập tên khách hàng" />
						<form:errors path="tenKH" class="text-danger"></form:errors>
					</div>
					<div class="form-group text-white">
						<form:label path="diaChi">Địa chỉ</form:label>
						<form:input path="diaChi" type="text" class="form-control"
							placeholder="Nhập dịa chỉ" />
						<form:errors path="diaChi" class="text-danger"></form:errors>
					</div>
					<div class="form-group text-white">
						<form:label path="soDienThoai">Số điện thoại</form:label>
						<form:input path="soDienThoai" type="text" class="form-control"
							placeholder="Nhập số điện thoại" />
						<form:errors path="soDienThoai" class="text-danger"></form:errors>
					</div>
					<div class="form-group text-white">
						<form:label path="email">Email</form:label>
						<form:input path="email" type="email" class="form-control"
							placeholder="Nhập email" />
						<form:errors path="email" class="text-danger"></form:errors>
					</div>
					<button type="submit" class="btn btn-primary mt-2">Update</button>
				</form:form>
			</div>
			<div class="row d-flex align-items-center justify-content-center">
				<img style="width: 800px; height: 180px"
					src="<c:url value='/resources/img/oke.gif'/>" class="img-fluid">
			</div>
			<div class="row d-flex align-items-center justify-content-center">
				<img style="width: 800px; height: 180px"
					src="<c:url value='/resources/img/oke.gif'/>" class="img-fluid">
			</div>

		</div>
	</div>

	<jsp:include page="../footer.jsp"></jsp:include>
	<script src="<c:url value="/resources/bootstrap/js/jquery-3.6.4.min.js" />"></script>
	<script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js" />"></script>
</body>
</html>