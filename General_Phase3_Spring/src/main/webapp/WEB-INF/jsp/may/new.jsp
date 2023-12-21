<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New May</title>
<link
	href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />"
	rel="stylesheet">
<script
	src="<c:url value="/resources/bootstrap/js/jquery-3.6.4.min.js" />"></script>
<script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js" />"></script>

</head>
<body style="background: #286c5c;">
	<div class="row">
		<div class="col-2">
			<jsp:include page="../leftmenu.jsp"></jsp:include>
		</div>
		<div class="col">
			<div class="container font-weight-bold">
				<form:form action="${pageContext.request.contextPath}/may/save"
					onsubmit="return checkSubmit()" method="POST"
					modelAttribute="mayForm">
					<div class="h3 text-center text-white">Tạo mới máy</div>
					<div class="form-group text-white">
						<form:label path="id">Mã máy</form:label>
						<form:input path="id" type="text" class="form-control"
							name="vitri" placeholder="Nhập vị trí" />
						<form:errors path="id" class="text-danger"></form:errors>
						<span class="text-danger" id="errorid"></span>
					</div>
					<div class="form-group text-white">
						<form:label path="viTri">Vị trí</form:label>
						<form:input path="viTri" type="text" class="form-control"
							name="vitri" placeholder="Nhập vị trí" />
						<form:errors path="viTri" class="text-danger"></form:errors>
						<span class="text-danger" id="errorviTri"></span>
					</div>
					<div class="form-group text-white">
						<form:label path="trangThai">Trạng thái</form:label>
						<form:input path="trangThai" type="text" class="form-control"
							placeholder="Nhập trạng thái" />
						<form:errors path="trangThai" class="text-danger"></form:errors>
						<span class="text-danger" id="errortrangThai"></span>
					</div>
					<form:button value="Add New" type="submit"
						class="btn btn-primary mt-2">Add New</form:button>
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
			<div class="row d-flex align-items-center justify-content-center">
				<img style="width: 800px; height: 180px" alt="shop-cart"
					src="<c:url value='/resources/img/oke.gif'/>" class="img-fluid">
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	<script
		src="<c:url value='/resources/bootstrap/js/jquery-3.6.4.min.js' />"></script>
	<script
		src="<c:url value='/resources/bootstrap/js/bootstrap.min.js' />"></script>
	<script>
		function checkSubmit() {
			var resultCheck = true;
			var id = $("#id").val();
			if (!id || !/^(M)[0-9]{4}$/.test(id)) {
				resultCheck = false;
				$("#errorid").html("Mã máy phải bắt đầu M và 4 chữ số");
			}
			var viTri = $("#viTri").val();
			if (!viTri) {
				resultCheck = false;
				$("#errorviTri").html("Vị trí không được để trống");
			}
			var trangThai = $("#trangThai").val();
			if (!trangThai) {
				resultCheck = false;
				$("#errortrangThai").html("Trạng thái không được để trống")
			}
			return resultCheck;
		}
	</script>
</body>
</html>