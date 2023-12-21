<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">
<head>
<title>New Dịch Vụ</title>
<link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />"
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
					action="${pageContext.request.contextPath}/sudungmay/saveMay" 
					method="POST" modelAttribute="suDungMayForm">
					<div class="h3 text-center text-white">Đăng ký sử dụng máy
						tính</div>
					<div class="form-group">
						<label for="" class="form-label text-white">Mã Khách Hàng</label>
						<form:select path="idKH" class="form-select">
							<form:option value="" disabled="true" selected="true">Chọn ID
								khách hàng</form:option>
							<c:forEach var="idkh" items="${listIDKH}" varStatus="status">
								<form:option value="${idkh}"></form:option>
							</c:forEach>
						</form:select>
						<form:errors id="helpId" class="text-danger" path="idKH"></form:errors>
						<span class="text-danger" id="erroridKH"></span>
					</div>
					<div class="form-group">
						<label for="" class="form-label text-white">Mã Máy</label>
						<form:select path="idMay" class="form-select">
							<form:option value="" disabled="true" selected="true">Chọn ID
								máy</form:option>
							<c:forEach var="idMay" items="${listIDMay}" varStatus="status">
								<form:option value="${idMay}"></form:option>
							</c:forEach>
						</form:select>
						<form:errors id="helpId" class="text-danger" path="idMay"></form:errors>
						<span class="text-danger" id="erroridMay"></span>
					</div>
					<div class="form-group text-danger">
					${message}
					</div>
					<div class="form-group">
						<form:label path="ngayBDSD" class="form-label text-white">Ngày Bắt Đầu Sử Dụng</form:label>
						<form:input type="date" name="" id="" class="form-control"
							placeholder="" aria-describedby="helpId" path="ngayBDSD" />
						<form:errors id="helpId" class="text-danger"
							path="ngayBDSD"></form:errors>
							<span class="text-danger" id="errorngayBDSD"></span>
					</div>
					<div class="form-group">
						<form:label path="gioBDSD" class="form-label text-white">Giờ Bắt Đầu Sử Dụng</form:label>
						<form:input type="time" name="" id="" class="form-control"
							placeholder="" aria-describedby="helpId" path="gioBDSD" />
						<form:errors id="helpId" class="text-danger"
							path="gioBDSD"></form:errors>
							<span class="text-danger" id="errorgioBDSD"></span>
					</div>
					<div class="form-group">
						<form:label path="thoiGianSD" class="form-label text-white">Thời Gian Sử Dụng</form:label>
						<form:input type="text" name="" id="" class="form-control"
							placeholder="" aria-describedby="helpId" path="thoiGianSD" />
						<form:errors id="helpId" class="text-danger" path="thoiGianSD"></form:errors>
						<span class="text-danger" id="errorthoiGianSD"></span>
					</div>
					<button value="Add New" type="submit" class="btn btn-primary mt-2">Add
						New</button>
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
		var result = true;
		var idKH = $("#idKH").val();
		if(!idKH) {
			result = false;
			$("#erroridKH").html("Không được để trống, phải chọn 1 giá trị");
		}
		var idMay = $("#idMay").val();
		if(!idMay) {
			result = false;
			$("#erroridMay").html("Không được để trống, phải chọn 1 giá trị");
		}
		var ngayBDSD = $("#ngayBDSD").val();
		if(!ngayBDSD) {
			result = false;
			$("#errorngayBDSD").html("Không được để trống, phải chọn 1 giá trị");
		}
		var gioBDSD = $("#gioBDSD").val();
		if(!gioBDSD) {
			result = false;
			$("#errorgioBDSD").html("Không được để trống, phải chọn 1 giá trị")
		}
		var thoiGianSD = $("#thoiGianSD").val();
		if(!thoiGianSD || !/^[1-9]\d*(\.\d+)?$/.test(thoiGianSD)) {
			result = false;
			$("#errorthoiGianSD").html("Thời gian sử dụng phải lơn hơn 0");
		}
		return result;
	}
	
	
	</script>
</body>

</html>