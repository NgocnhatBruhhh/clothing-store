<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông báo</title>
<base href="${pageContext.servletContext.contextPath}/">
<style>
/* Tổng thể trang */
body {
    font-family: Arial, sans-serif;
    background-color: #f9f9f9; /* Màu nền nhạt */
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* Tiêu đề */
h1 {
    font-size: 50px;
    color: #333; /* Màu chữ tối */
    margin-bottom: 20px;
    text-align: center;
}

/* Container chính */
.container {
    background: #fff; /* Màu nền trắng */
    border: 1px solid #ddd; /* Viền mỏng nhạt */
    border-radius: 10px;
    padding: 40px 50px;
    box-shadow: 0 6px 10px rgba(0, 0, 0, 0.1); /* Đổ bóng nhẹ */
    text-align: center;
    width: 40%; /* Chiều rộng 40% màn hình */
    max-width: 600px; /* Giới hạn tối đa */
    height: 25%; /* Chiều cao 25% màn hình */
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center; /* Đảm bảo căn giữa nội dung bên trong */
}

/* Liên kết */
a {
    display: inline-block;
    text-decoration: none; /* Xóa gạch chân */
    background-color: #79aa32; /* Màu xanh lá */
    color: #fff; /* Màu chữ trắng */
    font-size: 18px;
    font-weight: bold;
    padding: 12px 25px;
    border-radius: 8px;
    margin-top: 20px;
    transition: background-color 0.3s ease, transform 0.2s ease;
    max-width: 150px;
    text-align: center; /* Canh giữa văn bản */
}

/* Hiệu ứng liên kết */
a:hover {
    background-color: #6c982d; /* Màu đậm hơn khi hover */
    transform: scale(1.05); /* Tăng nhẹ kích thước khi hover */
}

a:active {
    background-color: #628b29; /* Màu đậm hơn khi nhấn */
    transform: scale(0.98); /* Giảm nhẹ kích thước khi nhấn */
}
</style>
</head>
<body>
	<div class="container">
		<h1>${message}</h1>
		<c:choose>
			<c:when test="${not empty idOrderResult}">
				<a href="order/orderdetail/${idOrderResult}.htm">Xem đơn hàng</a>
			</c:when>
			<c:otherwise>
				<a href="home.htm">Về trang chủ</a>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>
