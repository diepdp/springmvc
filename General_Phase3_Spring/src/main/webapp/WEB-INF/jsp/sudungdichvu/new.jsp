<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<title>New Dịch Vụ</title>
<link
	href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />"
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
					action="${pageContext.request.contextPath}/sudungdichvu/saveDV" 
					method="POST" modelAttribute="suDungDichVuForm">
					<div class="h3 text-center text-white">Đăng ký sử dụng dịch
						vụ</div>
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
						<label for="" class="form-label text-white">Mã Dịch Vụ</label>
						<form:select path="idDV" class="form-select">
							<form:option value="" disabled="true" selected="true">Chọn ID
								dịch vụ</form:option>
							<c:forEach var="idDv" items="${listIDDV}" varStatus="status">
								<form:option value="${idDv}"></form:option>
							</c:forEach>
						</form:select>
						<form:errors id="helpId" class="text-danger" path="idDV"></form:errors>
						<span class="text-danger" id="erroridDV"></span>
					</div>
					<div class="form-group">
						<form:label path="ngaySD" class="form-label text-white">Ngày Sử Dụng</form:label>
						<form:input type="date" name="" id="" class="form-control"
							placeholder="" aria-describedby="helpId" path="ngaySD" />
						<form:errors id="helpId" class="text-danger" path="ngaySD"></form:errors>
						<span class="text-danger" id="errorngaySD"></span>
					</div>
					<div class="form-group">
						<form:label path="gioSD" class="form-label text-white">Giờ Sử Dụng</form:label>
						<form:input type="time" name="" id="" class="form-control"
							placeholder="" aria-describedby="helpId" path="gioSD" />
						<form:errors id="helpId" class="text-danger" path="gioSD"></form:errors>
						<span class="text-danger" id="errorgioSD"></span>
					</div>
					<div class="form-group">
						<form:label path="soLuong" class="form-label text-white">Số Lượng</form:label>
						<form:input type="text" name="" id="" class="form-control"
							placeholder="" aria-describedby="helpId" path="soLuong" />
						<form:errors id="helpId" class="text-danger" path="soLuong"></form:errors>
						<span class="text-danger" id="errorsoLuong"></span>
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
	<script
		src="<c:url value="/resources/bootstrap/js/jquery-3.6.4.min.js" />"></script>
	<script
		src="<c:url value="/resources/bootstrap/js/bootstrap.min.js" />"></script>
	<script >
	function checkSubmit() {
		var resultCheck = true;
		var idKH = $("#idKH").val();
		if(!idKH) {
			resultCheck = false;
			$("#erroridKH").html("Không được để trống, phải chọn 1 giá trị");
		}
		var idDV = $("#idDV").val();
		if(!idDV) {
			resultCheck = false;
			$("#erroridDV").html("Không được để trống, phải chọn 1 giá trị");
		}
		var ngaySuDung = $("#ngaySD).val();
		if(!ngaySuDung) {
			resultCheck =false;
			$("#errorngaySD").html("Không được để trống, phải chọn 1 giá trị");
		}
		var gioSuDung = $("#gioSD").val();
		if(!gioSuDung) {
			resultCheck = false;
			$("#errorgioSD").html("Không được để trống, phải chọn 1 giá trị");
		}
		var soLuong = $("soLuong").val();
		if(!soLuong || !/^[1-9]\d*(\.\d+)?$/.test(soLuong)) {
			resultCheck = false;
			$("#errorsoLuong").html("Số lượng phải lớn hơn 0")
	s	}
		return resultCheck;
	}
	</script>
</body>
</html>