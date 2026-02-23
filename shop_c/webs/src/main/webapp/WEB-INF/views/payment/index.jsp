<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thanh toán</title>
<base href="${pageContext.servletContext.contextPath}/">
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
	color: #333;
}

.container {
	max-width: 800px;
	margin: 50px auto;
	padding: 30px;
	background-color: #ffffff;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
}

h1 {
	text-align: center;
	color: #000;
	margin-bottom: 20px;
	font-size: 24px;
	font-weight: bold;
}

a {
	text-decoration: none;
	color: #000;
	font-size: 14px;
	margin-bottom: 20px;
	display: inline-block;
}

a:hover {
	color: #555;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	margin-bottom: 10px;
	font-weight: bold;
	color: #000;
}

.form-group input, .form-group select {
	width: 100%; /* Đảm bảo tất cả thẻ đều có cùng chiều rộng */
	max-width: 100%; /* Giới hạn chiều rộng để cân đối */
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 14px;
	background-color: #ffffff;
	color: #000;
	box-sizing: border-box;
	/* Đảm bảo padding không làm thay đổi chiều rộng */
}

.form-group input:focus, .form-group select:focus {
	outline: none;
	border-color: #000;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

.form-group input[type="submit"] {
	background-color: #333333;
	color: #ffffff;
	border: none;
	cursor: pointer;
	padding: 12px 20px;
	font-size: 16px;
	font-weight: bold;
	text-transform: uppercase;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

.form-group input[type="submit"]:hover {
	background-color: #7ac339;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	background-color: #ffffff;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
	overflow: hidden;
}

table thead {
	background-color: #333333;
	color: #ffffff;
}

table, th, td {
	border: none;
}

th, td {
	padding: 12px;
	text-align: left;
}

th {
	text-transform: uppercase;
	font-weight: bold;
	font-size: 14px;
}

td {
	font-size: 14px;
	color: #333;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

tr:last-child td {
	font-weight: bold;
}

tr td img {
	max-width: 50px;
	border-radius: 5px;
	margin-right: 10px;
	vertical-align: middle;
}
</style>
</head>
<body>
	<div class="container">
		<a href="cart.htm">Quay lại</a>
		<h1>Thanh toán</h1>
		<div>
			<table id="${idOrder}">
				<thead>
					<tr>
						<th>Tên sản phẩm</th>
						<th>Kích cỡ</th>
						<th>Số lượng</th>
						<th>Giá</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="selectProduct" items="${selectProducts}">
						<tr id="product${selectProduct.cartid}">
							<td><img src="images/products/${selectProduct.image}"
								style="width: 50px;"> ${selectProduct.name}</td>
							<td>${selectProduct.size}</td>
							<td>${selectProduct.quantity}</td>
							<td><fmt:formatNumber value="${selectProduct.price * selectProduct.quantity}" type="number" groupingUsed="true" />&nbsp;₫</td>
						</tr>
						<c:set var="totalAmount"
							value="${totalAmount + (selectProduct.price * selectProduct.quantity)}" />
					</c:forEach>
					<tr>
						<td></td>
						<td></td>
						<td>Tổng cộng:</td>
						<td><fmt:formatNumber value="${totalAmount}" type="number" groupingUsed="true" />&nbsp;₫</td>
					</tr>
					<!-- Add more products as needed -->
				</tbody>
			</table>
		</div>
		<br>
		<div>
			<form action="" method="">
				<div class="form-group">
					<label for="name">Tên</label> <input type="text" id="name"
						value="${customer.name}" name="name" required>
				</div>
				<div class="form-group">
					<label for="phone">Số điện thoại</label> <input type="tel"
						value="${customer.phone}" id="phone" name="phone" required>
				</div>
				<div class="form-group">
					<label for="address">Địa chỉ</label> <input type="text" value=""
						id="address" name="address" required>
				</div>
				<div class="form-group">
					<label for="address">Ghi chú</label> <input type="text" id="note"
						name="note">
				</div>
				<div class="form-group">
					<label for="payment">Phương thức thanh toán</label> <select
						id="payment" name="paymentMethod" required>
						<c:forEach var="paymentMethod" items="${paymentMethods}">
							<option value="${paymentMethod.id}">${paymentMethod.name}</option>
						</c:forEach>
					</select>
				</div>
				<!-- Add hidden input to send totalAmount -->
				<input type="hidden" name="totalAmount" value="${totalAmount}">
				<div class="form-group">
					<input type="submit" value="Đặt hàng">
				</div>
			</form>
		</div>
	</div>
</body>
<script src="js/payment.js"></script>
</html>