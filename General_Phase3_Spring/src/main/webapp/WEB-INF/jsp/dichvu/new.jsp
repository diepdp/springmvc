<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Dich Vu</title>
<link rel="stylesheet"
	href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />">

</head>
<body style="background: #286c5c;">
	<div class="row">
		<div class="col-2">
			<jsp:include page="../leftmenu.jsp"></jsp:include>
		</div>
		<div class="col">
			<div class="container font-weight-bold">
				<form:form action="${pageContext.request.contextPath}/dichvu/save" 
					method="POST" modelAttribute="dichVuForm">
					<div class="h3 text-center text-white">Tạo mới dịch vụ</div>

					<div class="form-group text-white">
						<form:label path="id">Mã dịch vụ</form:label>
						<form:input path="id" class="form-control"
							placeholder="Nhập tên tên dịch vụ" />
						<form:errors class="text-danger" path="id"></form:errors>
						<span class="text-danger" id="errorid"></span>
					</div>
					<div class="form-group text-white">
						<form:label path="tenDV">Tên dịch vụ</form:label>
						<form:input path="tenDV" class="form-control"
							placeholder="Nhập tên tên dịch vụ" />
						<form:errors class="text-danger" path="tenDV"></form:errors>
						<span class="text-danger" id="errortenDV"></span>
					</div>
					<div class="form-group text-white">
						<form:label path="donViTinh">Đơn vị tính</form:label>
						<form:input path="donViTinh" class="form-control"
							placeholder="Nhập đơn vị tính" />
						<form:errors class="text-danger" path="donViTinh"></form:errors>
						<span class="text-danger" id="errordonViTinh"></span>
					</div>
					<div class="form-group text-white">
						<form:label path="donGia">Đơn giá</form:label>
						<form:input path="donGia" class="form-control"
							placeholder="Nhập đơn giá" />
						<form:errors class="text-danger" path="donGia"></form:errors>
						<span class="text-danger" id="errordonGia"></span>
					</div>

					<button type="submit" class="btn btn-primary mt-3">Add New</button>
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
	<script src="<c:url value="/resources/bootstrap/js/jquery-3.6.4.min.js" />"></script>
	<script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js" />"></script>
	<script >
	function checkSubmit() {
		var resultCheck = true;
		var id = $("#id").val();
		if(!id || !/^(DV)\\d{3}$/.test(id)) {
			resultCheck = false;
			$("#errorid").html("Mã dịch vụ phải bắt đầu bằng DV và có 3 chữ số");
		}
		var tenDV = $("#tenDV").val();
		if(!tenDV) {
			resultCheck = false;
			$("#errortenDV").html("Tên dịch vụ không được để trống");
		}
		var donViTinh = $("#donViTinh").val();
		if(!donViTinh) {
			resultCheck = false;
			$("#errordonViTinh").html("Đơn vị tính không được để trống");
		}
		var donGia = $("#donGia").val();
		if(!donGia || !/^[1-9]\d*(\.\d+)?$/.test(donGia)) {
			resultCheck = false;
			$("#errordonGia").html("Đơn giá phải lớn hơn 0");
		}
		return resultCheck;
	}
	
	
	</script>
</body>
</html>