<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Dich Vu</title>
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
				<form:form action="${pageContext.request.contextPath}/dichvu/update"
					method="POST" modelAttribute="dichVuForm">
					<div class="h3 text-center text-white">Tạo mới dịch vụ</div>

					<div class="form-group text-white">
						<form:label path="id">Mã dịch vụ</form:label>
						<form:input path="id" class="form-control" readonly="${true}"
							placeholder="Nhập tên tên dịch vụ" />
							
						<form:errors class="text-danger" path="id"></form:errors>
					</div>
					<div class="form-group text-white">
						<form:label path="tenDV">Tên dịch vụ</form:label>
						<form:input path="tenDV" class="form-control"
							placeholder="Nhập tên tên dịch vụ" />
						<form:errors class="text-danger" path="tenDV"></form:errors>
					</div>
					<div class="form-group text-white">
						<form:label path="donViTinh">Đơn vị tính</form:label>
						<form:input path="donViTinh" type="text" class="form-control"
							placeholder="Nhập đơn vị tính" />
						<form:errors class="text-danger" path="donViTinh"></form:errors>
					</div>
					<div class="form-group text-white">
						<form:label path="donGia">Đơn giá</form:label>
						<form:input path="donGia" type="text" class="form-control"
							placeholder="Nhập đơn giá" />
						<form:errors class="text-danger" path="donGia"></form:errors>
					</div>

					<button type="submit" class="btn btn-primary mt-3">Update</button>
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
</body>
</html>