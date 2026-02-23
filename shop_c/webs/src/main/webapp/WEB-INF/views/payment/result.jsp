<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="webshop.paymentMethod.VNPayConfig"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<title>KẾT QUẢ THANH TOÁN</title>
<base href="${pageContext.servletContext.contextPath}/">
<!-- Bootstrap core CSS -->
<link href="/vnpay_jsp/assets/bootstrap.min.css" rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="/vnpay_jsp/assets/jumbotron-narrow.css" rel="stylesheet">
<script src="/vnpay_jsp/assets/jquery-1.11.3.min.js"></script>
<style>
/* Tổng thể trang */
body {
	font-family: Arial, sans-serif;
	background-color: #f9f9f9; /* Màu nền nhạt */
	margin: 0;
	padding: 0;
}

/* Header */
.header {
	text-align: center;
	margin-bottom: 30px;
}

.header h3 {
	font-size: 28px;
	color: #333333; /* Màu xanh lá nổi bật */
	margin: 0;
	font-weight: bold;
	text-transform: uppercase;
}

/* Container chính */
.container {
	background-color: #fff; /* Màu nền trắng */
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Đổ bóng nhẹ */
	padding: 40px;
	max-width: 600px;
	margin: 50px auto;
	text-align: center;
}

/* Nhãn và giá trị */
.form-group {
	display: flex;
	justify-content: space-between;
	margin-bottom: 20px;
	border-bottom: 1px solid #eee; /* Đường gạch nhẹ */
	padding-bottom: 10px;
}

.form-group label {
	font-size: 16px;
	color: #333; /* Màu chữ tối */
}

.form-group label:nth-child(2) {
	font-weight: bold;
	color: #555; /* Màu chữ nhẹ hơn */
}

/* Liên kết "Xem đơn hàng" */
a {
	display: inline-block;
	margin-top: 20px;
	text-decoration: none;
	background-color: #4CAF50; /* Màu xanh lá */
	color: white;
	font-size: 16px;
	font-weight: bold;
	padding: 10px 20px;
	border-radius: 5px;
	transition: background-color 0.3s ease, transform 0.2s ease;
}

a:hover {
	background-color: #43a047; /* Màu đậm hơn khi hover */
	transform: scale(1.05); /* Tăng nhẹ kích thước khi hover */
}

a:active {
	background-color: #388e3c; /* Màu đậm hơn khi nhấn */
	transform: scale(0.95); /* Giảm nhẹ kích thước khi nhấn */
}

/* Footer */
.footer {
	text-align: center;
	margin-top: 30px;
	font-size: 14px;
	color: #777; /* Màu chữ nhẹ */
}

.footer p {
	margin: 0;
}
</style>
</head>
<body>
	<%
	//Begin process return from VNPAY
	Map fields = new HashMap();
	for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
		String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
		String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
		if ((fieldValue != null) && (fieldValue.length() > 0)) {
			fields.put(fieldName, fieldValue);
		}
	}

	String vnp_SecureHash = request.getParameter("vnp_SecureHash");
	if (fields.containsKey("vnp_SecureHashType")) {
		fields.remove("vnp_SecureHashType");
	}
	if (fields.containsKey("vnp_SecureHash")) {
		fields.remove("vnp_SecureHash");
	}
	String signValue = VNPayConfig.hashAllFields(fields);
	%>
	<!--Begin display -->
	<div class="container">
		<div class="header clearfix">
			<h3 class="text-muted">KẾT QUẢ THANH TOÁN</h3>
		</div>
		<div class="table-responsive">
			<div class="form-group">
				<label>Mã giao dịch thanh toán:</label> <label><%=request.getParameter("vnp_TxnRef")%></label>
			</div>
			<div class="form-group">
				<label>Số tiền:</label> <label> <%
 // Lấy giá trị vnp_Amount từ request và chia cho 100
 String vnpAmount = request.getParameter("vnp_Amount");
 long amount = 0;

 // Kiểm tra xem vnpAmount có hợp lệ không
 if (vnpAmount != null && !vnpAmount.isEmpty()) {
 	// Chuyển giá trị sang kiểu long và chia cho 100
 	amount = Math.round(Long.parseLong(vnpAmount) / 100.0);
 }

 // Định dạng số tiền theo kiểu Việt Nam
 java.text.NumberFormat formatter = java.text.NumberFormat.getInstance(java.util.Locale.getDefault());
 String formattedAmount = formatter.format(amount) + " ₫";

 // Hiển thị số tiền sau khi định dạng
 out.print(formattedAmount);
 %>
				</label>

			</div>
			<div class="form-group">
				<label>Mô tả giao dịch:</label> <label><%=request.getParameter("vnp_OrderInfo")%></label>
			</div>
			<div class="form-group">
				<label>Mã lỗi thanh toán:</label> <label><%=request.getParameter("vnp_ResponseCode")%></label>
			</div>
			<div class="form-group">
				<label>Mã giao dịch tại CTT VNPAY-QR:</label> <label><%=request.getParameter("vnp_TransactionNo")%></label>
			</div>
			<div class="form-group">
				<label>Mã ngân hàng thanh toán:</label> <label><%=request.getParameter("vnp_BankCode")%></label>
			</div>
			<div class="form-group">
				<label>Thời gian thanh toán:</label> <label><%=request.getParameter("vnp_PayDate")%></label>
			</div>
			<div class="form-group">
				<label>Tình trạng giao dịch:</label>
				<%
				if (signValue.equals(vnp_SecureHash)) {
					if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
						out.print("<label style='color: #4CAF50;'> Thành công");
					} else {
						out.print("<label style='color: red;'> Không thành công");
					}

				} else {
					out.print("invalid signature");
				}
				%></label>
			</div>
			<c:choose>
				<c:when test="${not empty newOrderId}">
					<a href="order/orderdetail/${newOrderId}.htm">Xem đơn hàng</a>
				</c:when>
			</c:choose>
		</div>
		<p>&nbsp;</p>
		<footer class="footer">
			<p>&copy; VNPAY 2020</p>
		</footer>
	</div>
</body>
</html>