<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Kết quả thanh toán ZaloPay</title>
<base href="${pageContext.servletContext.contextPath}/">
<style>
/* style.css */
body {
	font-family: 'Arial', sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center; /* Căn giữa theo chiều ngang */
	align-items: center; /* Căn giữa theo chiều dọc */
	min-height: 100vh;
	/* Chiều cao của body bằng 100% chiều cao của viewport */
}

.container {
	width: 80%;
	max-width: 800px;
	margin: 20px;
	padding: 40px;
	background-color: #fff;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	text-align: center; /* Căn giữa các phần tử bên trong */
}

h1 {
	color: #333;
	font-size: 24px;
	margin-bottom: 20px;
}

.result {
	margin-top: 20px;
	padding: 20px;
	background-color: #f9f9f9;
	border-radius: 10px;
}

.success, .error {
	padding: 20px;
	border-radius: 8px;
	font-size: 16px;
}

.success {
	background-color: #d4edda;
	border: 1px solid #c3e6cb;
	color: #155724;
}

.error {
	background-color: #f8d7da;
	border: 1px solid #f5c6cb;
	color: #721c24;
}

p {
	margin: 10px 0;
}

strong {
	font-weight: 600;
}

a.btn {
	display: inline-block;
	margin-top: 30px;
	padding: 12px 24px;
	background-color: #007bff;
	color: white;
	text-decoration: none;
	border-radius: 30px;
	font-size: 16px;
	text-align: center;
	transition: background-color 0.3s ease;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

a.btn:hover {
	background-color: #0056b3;
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
}

a.btn:active {
	background-color: #003f8e;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Kết quả thanh toán</h1>
		<div class="result">
			<c:if test="${not empty message}">
				<h2>${message}</h2>
				<c:if test="${message == 'Thanh toán thành công!'}">
					<div class="success">
						<p>
							<strong>Mã giao dịch:</strong> ${appTransId}
						</p>
						<p>
							<strong>Số tiền:</strong>
							<fmt:formatNumber value="${amount}" type="number"
								groupingUsed="true" />
							₫
						</p>
						<p>
							<strong>Mã ngân hàng:</strong> ${bankCode}
						</p>
						<%-- <p>
							<strong>Giảm giá:</strong> ${discountAmount} VND
						</p> --%>
					</div>
				</c:if>
				<c:if test="${message == 'Thanh toán thất bại!'}">
					<div class="error">
						<p>${error}</p>
					</div>
				</c:if>
			</c:if>
		</div>
		<a href="order/orderdetail/${newOrderId}.htm" class="btn">Xem đơn
			hàng</a>
	</div>
</body>
</html>