<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Information</title>
<link
	href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />"
	rel="stylesheet">
</head>
<body style="background: #286c5c;">
	<div class="row">
		<div class="col-2">
			<jsp:include page="./leftmenu.jsp"></jsp:include>
		</div>
		<div class="col">
			<div class="container">
				<div class="row">
					<p class="h3 text-white text-center mb-5">Chi Tiết Sử Dụng</p>
				</div>
				<form action="#" class="d-flex justify-content-center d-none"
					role="search">
					<input class="form-control me-2" name="search"
						style="width: 300px;" type="search"
						placeholder="Nội dung tìm kiếm" aria-label="Search">
					<button class="btn btn-primary" type="submit">Tìm</button>
				</form>
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">Mã khách hàng</th>
							<th scope="col">Tên khách hàng</th>
							<th scope="col">Mã máy</th>
							<th scope="col">Vị trí</th>
							<th scope="col">Trạng thái</th>
							<th scope="col">Ngày bắt đầu sử dụng máy</th>
							<th scope="col">Giờ bắt đầu sử dụng máy</th>
							<th scope="col">Thời gian sử dụng máy</th>
							<th scope="col">Mã dịch vụ</th>
							<th scope="col">Ngày sử dụng dịch vụ</th>
							<th scope="col">Giờ sử dụng dịch vụ</th>
							<th scope="col">Số lượng</th>
							<th scope="col">Tổng tiền</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="info" items="${infoList}" varStatus="status">
							<c:if test="${status.index == 0}">
								<tr>
									<th>${info.maKhachHang}</th>
									<td>${info.tenKhachHang}</td>
									<td>${info.maMay}</td>
									<td>${info.viTri}</td>
									<td>${info.trangThai}</td>
									<td>${info.ngayBatDauSuDungMay}</td>
									<td>${info.gioBatDauSuDungMay}</td>
									<td>${info.thoiGianSuDung}</td>
									<td>${info.maDichVu}</td>
									<td>${info.ngaySuDungDichVu}</td>
									<td>${info.gioSuDungDichVu}</td>
									<td>${info.soLuong}</td>
									<td>${info.tongTien}</td>
								</tr>
							</c:if>
							<c:if test="${status.index > 0}">
								<tr>
									<th>${info.maKhachHang == infoList[status.index - 1].maKhachHang ? '' : info.maKhachHang}</th>
									<td>${info.tenKhachHang}</td>
									<td>${info.maMay == infoList[status.index - 1].maMay ? '' : info.maMay}</td>
									<td>${info.viTri}</td>
									<td>${info.trangThai}</td>
									<td>${info.ngayBatDauSuDungMay}</td>
									<td>${info.gioBatDauSuDungMay}</td>
									<td>${info.thoiGianSuDung}</td>
									<td>${info.maDichVu == infoList[status.index - 1].maDichVu ? '' : info.maDichVu}</td>
									<td>${info.ngaySuDungDichVu}</td>
									<td>${info.gioSuDungDichVu}</td>
									<td>${info.soLuong}</td>
									<td>${info.tongTien}</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="pagination d-flex justify-content-center mb-3">
				<c:if test="${currentPage >= 1}">
					<a class="btn btn-secondary" href="show?page=${currentPage-1}">Previous</a>
				</c:if>
				<c:forEach begin="0" end="${totalPages}" var="i">
					<c:choose>
						<c:when test="${currentPage eq i}">
							<a class="active btn btn-secondary"> ${i+1} </a>
						</c:when>
						<c:otherwise>
							<a class="btn btn-secondary" href="show?page=${i}">${i+1}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${currentPage lt totalPages}">
					<a class="btn btn-secondary" href="show?page=${currentPage+1}">Next</a>
				</c:if>
			</div>
			<div class="row d-flex align-items-center justify-content-center">
				<img style="width: 800px; height: 180px" alt="shop-cart"
					src="<c:url value='/resources/img/oke.gif'/>" class="img-fluid">
			</div>
		</div>
	</div>
	<script src="<c:url value="/resources/js/jquery-3.6.4.min.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
	<jsp:include page="./footer.jsp"></jsp:include>
</body>
</html>