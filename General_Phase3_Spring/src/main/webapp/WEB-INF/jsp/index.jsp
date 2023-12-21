<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
<link rel="stylesheet"
	href="<c:url value='/resources/fontawesome/css/all.css' />">
<link rel="stylesheet"
	href="<c:url value='/resources/bootstrap/css/bootstrap.min.css' />">
<style type="text/css">
.height {
	height: 700px;
}
</style>
</head>
<body style="background: #286c5c;">
	<div class="container-fluid">
		<div class="row text-center"></div>
		<div class="row">
			<div class="col-2">
				<jsp:include page="leftmenu.jsp"></jsp:include>
			</div>
			<div class="col-10">
				<div class="row text-center text-white">
					<p class="h2">QUẢN LÝ TIỆM NET</p>
				</div>
				<div class="row text-center">
					<img alt="shop-cart" src="<c:url value='/resources/img/net2.png'/>"
						class="card-img-top height">
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	<script src="<c:url value="/resources/js/jquery-3.6.4.min.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/js/main.js" />"></script>
</body>
</html>