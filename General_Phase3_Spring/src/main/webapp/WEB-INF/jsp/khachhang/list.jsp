<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer List</title>
<link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />"
	rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value="/resources/fontawesome/css/all.css" />">
</head>
<body style="background: #286c5c;" >
	<div class="row">
		<div class="col-2">
			<jsp:include page="../leftmenu.jsp"></jsp:include>
		</div>
		<div class="col">
			<div class="container">
				<div class="row">

					<p class="h3 text-white">Danh sách khách hàng</p>
				</div>
				 <form action="${pageContext.request.contextPath}/khachhang/search" class="d-flex justify-content-center" role="search">
                    <input class="form-control me-2" name="search" style="width: 300px;" type="search" placeholder="Nội dung tìm kiếm" aria-label="Search">
                    <button class="btn btn-primary" type="submit">Tìm</button>
                </form>
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">Mã khách hàng</th>
							<th scope="col">Tên khách hàng</th>
							<th scope="col">Địa chỉ</th>
							<th scope="col">Số điện thoại</th>
							<th scope="col">Email</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="kh" items="${khachHangs}">
							<tr>
								<th scope="row">${kh.id}</th>
								<td>${kh.tenKH}</td>
								<td>${kh.diaChi}</td>
								<td>${kh.soDienThoai}</td>
								<td>${kh.email}</td>
								<td><a href="javascript:void(0);"
									onclick="showConfirmation('${kh.id}')" class="btn btn-danger"
									data-bs-toggle="modal" data-bs-target="#confirmModal"> <i
										class="fa-solid fa-trash"></i></a> <a href="update/${kh.id}"
									class="btn btn-info"> <i class="fa-solid fa-pencil"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="pagination d-flex justify-content-center mb-3">
				<c:if test="${currentPage >= 1}">
					<a class="btn btn-secondary" href="list?page=${currentPage-1}">Previous</a>
				</c:if>
				<c:forEach begin="0" end="${totalPages}" var="i">
					<c:choose>
						<c:when test="${currentPage eq i}">
							<a class="active btn btn-secondary"> ${i+1} </a>
						</c:when>
						<c:otherwise>
							<a class="btn btn-secondary" href="list?page=${i}">${i+1}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:if test="${currentPage lt totalPages}">
					<a class="btn btn-secondary" href="list?page=${currentPage+1}">Next</a>
				</c:if>
			</div>
		<div class="row d-flex align-items-center justify-content-center">
				<img style="width: 800px; height: 180px" alt="shop-cart"
					src="<c:url value='/resources/img/oke.gif'/>" class="img-fluid">
			</div>
		</div>
	</div>
<div class="modal fade" id="confirmModal" tabindex="-1"
		aria-labelledby="confirmModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header py-2 px-3">
					<h5 class="modal-title text-center" id="confirmModalLabel">Confirm
						Delete</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body py-2 px-3">
					<p class="m-0">Xác nhận xóa khách hàng?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary btn-sm"
						data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-dark btn-sm"
						onclick="confirmDel()">Confirm</button>
				</div>
			</div>
		</div>
	</div>
	<script src="<c:url value="/resources/bootstrap/js/jquery-3.6.4.min.js" />"></script>
	<script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js" />"></script>
	<script>
	  function showConfirmation(id) {
		    $('#confirmModal').modal('show');
		    // Lưu ID vào biến toàn cục để sử dụng trong hàm confirmDelete()
		    window.deleteId = id;
		  }
	  
		function confirmDel() {
		    var id = window.deleteId;
		    if (id) {
		      window.location.href = "delete?id=" + id;
		    }
			$('#confirmModal').modal('hide');
		}
	</script>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>