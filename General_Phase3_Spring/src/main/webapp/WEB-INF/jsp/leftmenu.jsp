<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<c:url value='/resources/fontawesome/css/all.css' />">
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap.min.css' />">
<script src="<c:url value="/resources/js/jquery-3.6.4.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<script src="<c:url value="/resources/js/main.js" />"></script>
<style type="text/css">
.text-left{
	text-align: start;
}
</style>
</head>
<body>

	<div class="row ">
		<div class="col-sm-12 font-weight-bold border-bottom py-3 text-white">
			<a class="btn btn-white" href="${pageContext.request.contextPath}/home/index">
				<i class="fa-solid fa-gauge fa-xs mr-2"></i>Menu Tiệm Net
			</a>
		</div>
		<div class="col-sm-12 dropdown px-0">
			<button
				class="btn dropdown-toggle text-left text-white border-bottom font-weight-bold w-100 py-3"
				type="button" id="khDropdown" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false">
				<i class="fa-solid fa-user-secret fa-xs"></i> Quản lý khách hàng
			</button>
			<div id="khMenu" >
				<a
					class="btn dropdown-item text-left text-white  font-weight-bold border-bottom py-3"
					href="${pageContext.request.contextPath}/khachhang/list"> <i
					class="fa-solid fa-list fa-xs"></i> Danh sách khách hàng
				</a> <a
					class="btn dropdown-item text-left text-white  font-weight-bold border-bottom py-3"
					href="${pageContext.request.contextPath}/khachhang/add"> <i
					class="fa-sharp fa-solid fa-plus fa-xs"></i> Thêm mới khách hàng
				</a>
			</div>
		</div>
		<div class="col-sm-12 dropdown px-0">
			<button
				class="btn dropdown-toggle text-left text-white border-bottom font-weight-bold w-100 py-3"
				type="button" id="mayTinhDropdown" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false">
				<i class="fa-solid fa-laptop-code fa-xs"></i> Quản lý máy tính
			</button>
			<div id="mayTinhMenu" >
				<a
					class="btn dropdown-item text-left text-white  font-weight-bold border-bottom py-3"
					href="${pageContext.request.contextPath}/may/list"> <i
					class="fa-solid fa-list fa-xs"></i> Danh sách máy tính
				</a> <a
					class="btn dropdown-item text-left text-white  font-weight-bold border-bottom py-3"
					href="${pageContext.request.contextPath}/may/add"> <i
					class="fa-sharp fa-solid fa-plus fa-xs"></i> Thêm mới máy tính
				</a>
			</div>
		</div>
		<div class="col-sm-12 dropdown px-0">
			<button
				class="btn dropdown-toggle text-left text-white  border-bottom font-weight-bold w-100 py-3"
				type="button" id="dichVuDropdown" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false">
				<i class="fa-sharp fa-solid fa-bell-concierge fa-xs"></i> Quản lý
				dịch vụ
			</button>
			<div id="dichVuMenu" >
				<a
					class="btn dropdown-item text-left  text-white font-weight-bold border-bottom py-3"
					href="${pageContext.request.contextPath}/dichvu/list"> <i class="fa-solid fa-list fa-xs"></i> Danh sách dịch
					vụ
				</a> <a
					class="btn dropdown-item text-left text-white  font-weight-bold border-bottom py-3"
					href="${pageContext.request.contextPath}/dichvu/add"> <i class="fa-sharp fa-solid fa-plus fa-xs"></i> Thêm
					mới dịch vụ
				</a>
			</div>
		</div>
		<div class="col-sm-12 px-0">
			<a
				class="btn text-left text-white  font-weight-bold border-bottom w-100 py-3"
				href="${pageContext.request.contextPath}/sudungmay/save"> <i class="fa-solid fa-list fa-xs"></i> Đăng ký sử dụng
				máy tính
			</a> <a
				class="btn text-left text-white  font-weight-bold border-bottom w-100 py-3"
				href="${pageContext.request.contextPath}/sudungdichvu/save"> <i class="fa-solid fa-file-circle-plus fa-xs"></i>
				Đăng ký sử dụng dịch vụ
			</a> <a
				class="btn text-left text-white  font-weight-bold border-bottom w-100 py-3"
				href="${pageContext.request.contextPath}/sudungdichvu/show"> <i class="fa-solid fa-circle-info fa-xs"></i> Chi tiết
				sử dụng
			</a>
		</div>
	</div>
</body>
</html>