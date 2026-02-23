<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html style="font-size: 16px;">

<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<meta name="keywords"
	content="Product 1 Title, Product 2 Title, Product 3 Title">
<meta name="description" content="">
<title>Chi tiết đơn hàng</title>
<base href="${pageContext.servletContext.contextPath}/">
<link rel="stylesheet" href="css/page.css" media="screen">
</head>
<body class="u-body u-xl-mode" data-style="shopping-cart-template-1"
	data-posts=""
	data-global-section-properties="{&quot;code&quot;:&quot;CART&quot;,&quot;colorings&quot;:{&quot;light&quot;:[&quot;clean&quot;,&quot;clean&quot;],&quot;colored&quot;:[&quot;clean&quot;,&quot;clean&quot;,&quot;clean&quot;],&quot;dark&quot;:[&quot;clean&quot;,&quot;clean&quot;,&quot;clean&quot;]},&quot;isPreset&quot;:true}"
	data-source="fix" data-lang="en"
	data-page-sections-style="[{&quot;name&quot;:&quot;shopping-cart-1&quot;,&quot;margin&quot;:&quot;both&quot;,&quot;repeat&quot;:false}]"
	data-page-coloring-types="{&quot;light&quot;:[&quot;clean&quot;,&quot;clean&quot;],&quot;colored&quot;:[&quot;clean&quot;,&quot;clean&quot;,&quot;clean&quot;],&quot;dark&quot;:[&quot;clean&quot;,&quot;clean&quot;,&quot;clean&quot;]}"
	data-page-category="&quot;Cart&quot;">

	<jsp:include page="/WEB-INF/views/layout/eheader.jsp" />

	<section class="u-clearfix u-block-90d4-1"
		custom-posts-hash="[T,[T,T],[[[I,T],[I,T],[I,T]],[],[],[]]]"
		data-section-properties="{&quot;margin&quot;:&quot;both&quot;,&quot;stretch&quot;:true}"
		data-id="90d4" data-style="shopping-cart-1" id="sec-dd88">

		<div class="u-clearfix u-sheet u-block-90d4-2">

			<div class="u-cart-button-container">
				<a href="emorder.htm"
					class="u-active-none u-btn u-button-style u-cart-continue-shopping u-hover-none u-none u-text-body-color u-block-90d4-58"><span
					class="u-icon u-block-90d4-59"><svg
							xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1"
							xml:space="preserve" class="u-svg-content"
							viewBox="0 0 443.52 443.52" x="0px" y="0px" data-color="#000000"
							style="width: 1em; height: 1em;">
                                <g>
                                <g>
                                <path
								d="M143.492,221.863L336.226,29.129c6.663-6.664,6.663-17.468,0-24.132c-6.665-6.662-17.468-6.662-24.132,0l-204.8,204.8    c-6.662,6.664-6.662,17.468,0,24.132l204.8,204.8c6.78,6.548,17.584,6.36,24.132-0.42c6.387-6.614,6.387-17.099,0-23.712    L143.492,221.863z">
                                </path>
                                </g>
                                </g>
                                </svg></span>&nbsp;Quay lại </a>

				<h2
					class=" gioHang u-align-center-lg u-align-center-md u-align-center-sm u-align-center-xs u-custom-font u-font-ubuntu u-text u-text-default u-text-1">
					Chi tiết đơn hàng</h2>
			</div>
			<c:set var="y" value="false" scope="page" />

			<div class="u-cart u-expanded-width u-layout-grid u-block-90d4-6">
				<div
					class="u-cart-products-table u-table u-table-responsive u-block-90d4-7">
					<div class="order-info">
						<p class="left">
							<strong>Mã đơn hàng: </strong>${order.id}</p>
						<p class="center">
							<strong>Ngày tạo: </strong>
							<fmt:formatDate value="${order.createTime}"
								pattern="dd/MM/yyyy HH:mm:ss" />
						</p>
						<p class="right">
							<strong>Ngày cập nhật: </strong>
							<fmt:formatDate value="${order.updateTime}"
								pattern="dd/MM/yyyy HH:mm:ss" />
						</p>
					</div>
					<div class="order-info">
						<p class="left">
							<strong>Hình thức thanh toán: </strong>${order.paymentMethod.name}
						</p>
						<p class="right">
							<strong>Trạng thái: </strong> <span
								style="
						            <c:choose>
						                <c:when test="${order.orderStatus.id == 1 || order.orderStatus.id == 5}">
						                    color: red;
						                    <c:if test="${order.orderStatus.id == 5}">
						                    <c:set var="y" value="true" scope="page" /></c:if>
						                </c:when>
						                <c:when test="${order.orderStatus.id == 4}">
						                    color: green;
						                </c:when>
						                <c:otherwise>
						                    color: blue;
						                </c:otherwise>
						            </c:choose>
						        ">
								${order.orderStatus.statusName} </span>
						</p>
					</div>
					<div class="order-info">
						<p class="left">
							<strong>Địa chỉ: </strong>${order.address}</p>
						<p class="right">
							<c:choose>
								<c:when test="${y && order.reason.id > 5}">
									<strong>Lý do hủy đơn từ người bán: </strong>${order.reason.name}
								</c:when>
								<c:when test="${y && order.reason.id <= 6}">
									<strong>Lý do hủy đơn từ khách hàng: </strong>${order.reason.name}
								</c:when>
							</c:choose>
						</p>
					</div>
					<table class="u-table-entity u-block-90d4-12">
						<colgroup>
							<col width="35%">
							<col width="8%">
							<col width="10%">
							<col width="10%">
							<col width="12.5%">
							<col width="15.5%">
							<col width="10%">
						</colgroup>
						<thead class="u-custom-color-1 u-table-header u-block-90d4-13">
							<tr style="height: 33px;">
								<th
									class="u-border-3 u-border-grey-15 u-table-cell u-block-90d4-14">Sản
									phẩm</th>
								<th
									class="center u-border-3 u-border-grey-15 u-table-cell u-block-90d4-12">Kích
									cỡ</th>
								<th
									class="center u-border-3 u-border-grey-15 u-table-cell u-block-90d4-15">Số
									lượng</th>
								<th
									class="center u-border-3 u-border-grey-15 u-table-cell u-block-90d4-16">Đơn
									giá</th>
								<th
									class="center u-border-3 u-border-grey-15 u-table-cell u-block-90d4-17">Tổng
									giá</th>
								<th
									class="center u-border-3 u-border-grey-15 u-table-cell u-block-90d4-16">Trạng
									thái</th>
								<th
									class="center u-border-3 u-border-grey-15 u-table-cell u-block-90d4-17">Thao
									tác</th>
							</tr>
						</thead>
						<tbody
							class="u-align-left u-table-alt-grey-5 u-table-body u-block-90d4-18">

							<c:set var="x" value="true" scope="page" />
							<!--Sản phẩm nè-->
							<c:forEach var="orderDetail" items="${orderDetails}">
								<tr style="height: 100px;">
									<td
										class="products-cart u-border-1 u-border-grey-15 u-table-cell u-block-90d4-41">
										<img
										class="u-cart-product-image u-image u-image-round u-preserve-proportions u-product-control u-radius-17 u-block-90d4-43"
										src="images/products/${orderDetail.product.image}"
										data-image-width="859" data-image-height="1908">
										<h2
											class="u-cart-product-title u-product-control u-text u-block-90d4-44">
											<a class="u-product-title-link"
												href="productinfo.htm?proid=${orderDetail.product.id}">${orderDetail.product.name}</a>
										</h2>
									</td>
									<td
										class="center u-border-1 u-border-grey-15 u-table-cell u-block-90d4-45">
										<div
											class="center u-cart-product-price u-product-control u-product-price u-block-90d4-46">
											<div class="u-price-wrapper">
												<div class="u-old-price"
													style="text-decoration: line-through !important;"></div>
												<div class="u-price"
													style="font-weight: 700; font-size: 1rem;">${orderDetail.productDetail.size.id}</div>
											</div>
										</div>
									</td>
									<td
										class="center u-border-1 u-border-grey-15 u-table-cell u-block-90d4-45">
										<div
											class="center u-cart-product-price u-product-control u-product-price u-block-90d4-46">
											<div class="u-price-wrapper">
												<div class="u-old-price"
													style="text-decoration: line-through !important;"></div>
												<div class="u-price"
													style="font-weight: 700; font-size: 1rem;">${orderDetail.orderDetail.quantity}</div>
											</div>
										</div>
									</td>
									<td
										class="center u-border-1 u-border-grey-15 u-table-cell u-block-90d4-45">
										<div
											class="center u-cart-product-price u-product-control u-product-price u-block-90d4-46">
											<div class="u-price-wrapper">
												<div class="u-old-price"
													style="text-decoration: line-through !important;"></div>
												<div class="u-price"
													style="font-weight: 700; font-size: 1rem;">
													<fmt:formatNumber
														value="${orderDetail.orderDetail.unitPrice}" type="number"
														groupingUsed="true" />
													₫
												</div>
											</div>
										</div>
									</td>
									<td
										class="center u-border-1 u-border-grey-15 u-table-cell u-block-90d4-45">
										<div
											class="center u-cart-product-price u-product-control u-product-price u-block-90d4-46">
											<div class="u-price-wrapper">
												<div class="u-old-price"
													style="text-decoration: line-through !important;"></div>
												<div class="u-price"
													style="font-weight: 700; font-size: 1rem;">
													<fmt:formatNumber
														value="${orderDetail.orderDetail.unitPrice * orderDetail.orderDetail.quantity}"
														type="number" groupingUsed="true" />
													₫
												</div>
											</div>
										</div>
									</td>
									<td
										class="center u-border-1 u-border-grey-15 u-table-cell u-block-90d4-50">
										<div
											class="center  u-cart-product-subtotal u-product-control u-product-price u-block-90d4-51">
											<div class="u-price-wrapper">
												<div class="u-old-price"
													style="text-decoration: line-through !important;"></div>
												<div class="u-price"
													style="font-weight: 700; font-size: 1rem;">
													<c:choose>
														<c:when
															test="${orderDetail.orderDetail.quantity <= orderDetail.productDetail.quantity}">
															Vẫn còn hàng
														</c:when>
														<c:otherwise>
															Không đủ hàng
            												<c:set var="x" value="false" scope="page" />
														</c:otherwise>
													</c:choose>
												</div>
											</div>
										</div>
									</td>
									<td
										class="center u-border-1 u-border-grey-15 u-table-cell u-block-90d4-45">
										<div
											class="center u-cart-product-price u-product-control u-product-price u-block-90d4-46">
											<div class="u-price-wrapper">
												<div class="u-old-price"
													style="text-decoration: line-through !important;"></div>
												<div class="u-price"
													style="font-weight: 700; font-size: 1rem;">
													<a class="u-product-title-link"
														href="productinfo.htm?proid=${orderDetail.product.id}">Xem
														chi tiết</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>

						</tbody>

					</table>
				</div>
				<div class="u-cart-blocks-container">
					<div class="u-cart-block u-indent-30">
						<div class="order-info">
							<p class="left">
								<strong>Tổng tiền sản phẩm: </strong>
								<fmt:formatNumber value="${order.productFee}" type="number"
									groupingUsed="true" />
								₫
							</p>
						</div>
						<div class="order-info">
							<p class="left">
								<strong>Phí giao hàng: </strong>
								<fmt:formatNumber value="${order.shipFee}" type="number"
									groupingUsed="true" />
								₫
							</p>
						</div>
						<div class="order-info">
							<p class="left">
								<strong>Thành tiền: </strong>
								<fmt:formatNumber value="${order.total}" type="number"
									groupingUsed="true" />
								₫
							</p>
						</div>
						<div class="order-info">
							<p class="left">
								<strong>Ghi chú: </strong>
								<c:choose>
									<c:when
										test="${not empty order.description || order.description != ''}">
								${order.description}
									</c:when>
									<c:otherwise>
									Không có.
									</c:otherwise>
								</c:choose>
							</p>
						</div>
						<c:choose>
							<c:when test="${order.orderStatus.id == 1}">
								<div style="display: ruby;">
									<button
										class="u-btn u-btn-round u-button-style u-radius u-btn-1"
										style="background-color: red;"
										onclick="openCancelModal(${order.id})">Hủy đơn</button>
								</div>
							</c:when>
							<c:when
								test="${(order.orderStatus.id == 4 || order.orderStatus.id == 5) && x}">

							</c:when>
							<c:when test="${order.orderStatus.id == 2}">
								<div style="display: ruby;">
									<c:if
										test="${order.paymentStatus == 1 || order.paymentMethod.id == 1}">
										<a href="emorder/status/${order.id}.htm?status=3"
											class="u-btn u-btn-round u-button-style u-radius u-btn-1">Xác
											nhận giao hàng</a>
									</c:if>
									<button
										class="u-btn u-btn-round u-button-style u-radius u-btn-1"
										style="background-color: red;"
										onclick="openCancelModal(${order.id})">Hủy đơn</button>
								</div>
							</c:when>
							<c:otherwise>
								<div style="display: ruby;">
									<a href="emorder/status/${order.id}.htm?status=4"
										class="u-btn u-btn-round u-button-style u-radius u-btn-1">Xác
										nhận giao hàng thành công</a>
								</div>
							</c:otherwise>
						</c:choose>

						<!-- Modal for Cancellation Reason -->
						<div id="cancelModal" class="modal" style="display: none;">
							<div class="modal-content">
								<h3>Chọn lý do hủy</h3>
								<div class="reasons-container">
									<ul id="cancelReasons">
										<c:forEach var="cancelReason" items="${cancelReasons}">
											<c:if test="${cancelReason.id > 5}">
												<li><input type="radio" name="reason"
													value="${cancelReason.id}" id="reason${cancelReason.id}">
													<label for="reason${cancelReason.id}">${cancelReason.name}</label>
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</div>
								<div class="modal-actions">
									<button onclick="confirmCancel()" class="confirm-btn">Xác
										nhận</button>
									<button onclick="closeCancelModal()" class="cancel-btn">Hủy</button>
								</div>
							</div>
						</div>
					</div>

					<div class="u-cart-block u-indent-30">
						<div id="idCustomer" class="order-info">
							<p class="left">
								<strong>Mã khách hàng: </strong>${order.customer.id}
							</p>
						</div>
						<div class="order-info">
							<p class="left">
								<strong>Tên khách hàng: </strong>${order.customer.name}
							</p>
						</div>
						<div class="order-info">
							<p class="left">
								<strong>Mail khách hàng: </strong>${order.customer.account.email}
							</p>
						</div>
						<div class="order-info">
							<p class="left">
								<strong>Số điện thoại: </strong>${order.customer.phone}
							</p>
						</div>
					</div>

				</div>
			</div>
		</div>
		<script src="js/employee/orderDetail.js"></script>
		<style>
/* Modal container */
.modal {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.6);
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 1000;
}

/* Modal content box */
.modal-content {
	background: #ffffff;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
	text-align: center;
	width: 90%;
	max-width: 500px;
	animation: fadeIn 0.3s ease-in-out;
}

/* Reasons container styling */
.reasons-container {
	margin: 20px 0;
	max-height: 200px;
	overflow-y: auto;
	padding-right: 10px;
}

.reasons-container ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.reasons-container li {
	display: flex;
	align-items: center;
	margin: 10px 0;
}

.reasons-container input[type="radio"] {
	margin-right: 10px;
}

/* Modal action buttons */
.modal-actions {
	margin-top: 20px;
}

.confirm-btn, .cancel-btn {
	padding: 10px 20px;
	border: none;
	border-radius: 8px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.confirm-btn {
	background-color: #28a745;
	color: #ffffff;
}

.confirm-btn:hover {
	background-color: #218838;
}

.cancel-btn {
	background-color: #dc3545;
	color: #ffffff;
	margin-left: 10px;
}

.cancel-btn:hover {
	background-color: #c82333;
}

/* Smooth fade-in animation */
@
keyframes fadeIn {from { opacity:0;
	transform: scale(0.9);
}

to {
	opacity: 1;
	transform: scale(1);
}

}
.order-info {
	display: flex; /* Kích hoạt Flexbox */
	justify-content: space-between;
	/* Đẩy các phần tử sang trái, giữa và phải */
	align-items: center; /* Căn chỉnh các phần tử theo chiều dọc */
	padding: 10px; /* Thêm khoảng cách nếu cần */
}

.order-info p {
	margin: 0; /* Xóa margin mặc định của thẻ <p> */
}

.left {
	text-align: left; /* Đảm bảo nội dung căn trái */
	flex: 1; /* Chiếm không gian nếu cần */
}

.center {
	text-align: center; /* Đảm bảo nội dung căn giữa */
	flex: 1; /* Chiếm không gian nếu cần */
}

.right {
	text-align: right; /* Đảm bảo nội dung căn phải */
	flex: 1; /* Chiếm không gian nếu cần */
}

.u-cart {
	min-height: 60vh !important;
}

.u-button-style.u-quantity-button {
	cursor: pointer;
}

.center.delete {
	color: black !important;
	cursor: pointer;
}

.center.delete:hover {
	color: red;
	cursor: pointer;
}

.center.delete svg:hover {
	fill: red;
	cursor: pointer;
}

.center.delete span {
	margin: 0 auto;
}

.u-align-center.u-border-1.u-border-palette-5-light-2 {
	margin: 4px 2px;
	border-radius: 8px;
}

.u-border-3.u-border-grey-15.u-table-cell {
	font-size: 14px;
}

.u-align-center.u-product-control.u-text {
	display: block;
	margin: 0 !important;
	margin-top: 15px !important;
	width: 100%;
}

.center {
	text-align: center;
	margin: 0 auto;
}

.u-product-title-link {
	font-size: 17px !important;
	display: block !important;
	margin-left: 4px;
	width: 100px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	align-items: center;
	display: flex;
	flex-grow: 1;
}

.products-cart {
	display: flex;
}

.products-cart span {
	display: flex !important;
}

.products-cart h2 {
	width: 100px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	align-items: center;
	display: flex;
	flex-grow: 1;
}

.u-align-center.u-border-1.u-border-palette-5-light-2:hover {
	transform: translateY(-4px);
	box-shadow: 0px 0px 8px 0px rgba(160, 160, 160, 2);
}

.u-cart-product-image.u-image.u-image-round {
	height: 80px;
	width: 80px;
}

body {
	background-color: #eee !important;
}

.u-clearfix.u-sheet.u-block-90d4-2 {
	margin-top: 40px;
	margin-bottom: 40px;
	border-radius: 10px !important;
	overflow: hidden;
	background: #fff;
	min-height: 0 !important;
	-webkit-box-shadow: 10px 10px 5px 0px #cccccc;
	-moz-box-shadow: 10px 10px 5px 0px #cccccc;
	box-shadow: 10px 10px 5px 0px #cccccc;
}

.u-cart-remove-item {
	cursor: pointer;
	color: red;
}

.gioHang {
	font-size: 20px !important;
	font-weight: 700 !important;
	margin-top: 24px !important;
	text-decoration: underline;
	margin: 0 auto;
}

.u-cart.u-expanded-width.u-layout-grid.u-block-90d4-6 {
	padding: 45px;
	padding-top: 0;
	margin: 0;
}
</style>
		</div>
		</div>
		<style data-mode="XL" data-visited="true">
@media ( min-width : 1200px) {
	.u-block-90d4-2 {
		min-height: 100vh;
	}
	.u-block-90d4-6 {
		width: 1140px;
		min-height: 375px;
		margin-top: 38px;
		margin-left: 0;
		margin-right: 0;
		margin-bottom: 60px;
	}
	.u-block-90d4-13 {
		background-image: none;
		font-weight: 700;
	}
	.u-block-90d4-14 {
		border-style: double;
	}
	.u-block-90d4-15 {
		border-style: double;
	}
	.u-block-90d4-16 {
		border-style: double;
	}
	.u-block-90d4-17 {
		border-style: double;
	}
	.u-block-90d4-20 {
		font-size: 1.5em;
		margin-right: 10px;
		padding-top: 3px;
		padding-bottom: 3px;
		padding-left: 3px;
		padding-right: 3px;
	}
	.u-block-90d4-22 {
		font-size: 1.125rem;
	}
	.u-block-90d4-90 {
		background-image: none;
		padding-top: 0;
		padding-bottom: 0;
		padding-left: 0;
		padding-right: 0;
	}
	.u-block-90d4-26 {
		width: 100px;
	}
	.u-block-90d4-31 {
		font-size: 1.5em;
		margin-right: 10px;
	}
	.u-block-90d4-32 {
		width: 100px;
		height: 100px;
	}
	.u-block-90d4-33 {
		font-size: 1.125rem;
	}
	.u-block-90d4-37 {
		width: 100px;
	}
	.u-block-90d4-42 {
		font-size: 1.5em;
		margin-right: 10px;
		padding-top: 3px;
		padding-bottom: 3px;
		padding-left: 3px;
		padding-right: 3px;
	}
	.u-block-90d4-43 {
		width: 100px;
		height: 100px;
	}
	.u-block-90d4-44 {
		font-size: 1.125rem;
	}
	.u-block-90d4-48 {
		width: 100px;
	}
	.u-block-90d4-58 {
		padding-top: 10px;
		padding-bottom: 10px;
		padding-left: 14px;
		padding-right: 14px;
	}
	.u-block-90d4-60 {
		font-size: 0.875rem;
		text-transform: uppercase;
		letter-spacing: 1px;
	}
	.u-block-90d4-68 {
		text-transform: uppercase;
		font-size: 0.875rem;
		font-weight: 700;
		letter-spacing: 1px;
	}
	.u-block-90d4-80 {
		background-image: none;
	}
	.u-block-90d4-81 {
		font-weight: 700;
	}
	.u-block-90d4-83 {
		font-weight: 700;
	}
	.u-block-90d4-84 {
		font-weight: 700;
	}
	.u-block-90d4-89 {
		margin-top: 20px;
		letter-spacing: 1px;
		font-size: 0.875rem;
		font-weight: 700;
		text-transform: uppercase;
	}
}
</style>
		<style data-mode="LG">
@media ( max-width : 1199px) and (min-width: 992px) {
	.u-block-90d4-2 {
		min-height: 100vh;
	}
	.u-block-90d4-6 {
		min-height: 375px;
		margin-top: 102px;
		margin-bottom: 60px;
	}
	.u-block-90d4-13 {
		background-image: none;
		font-weight: 700;
	}
	.u-block-90d4-14 {
		border-style: double;
	}
	.u-block-90d4-15 {
		border-style: double;
	}
	.u-block-90d4-16 {
		border-style: double;
	}
	.u-block-90d4-17 {
		border-style: double;
	}
	.u-block-90d4-20 {
		font-size: 1.5em;
		margin-right: 10px;
		padding-top: 3px;
		padding-bottom: 3px;
		padding-left: 3px;
		padding-right: 3px;
	}
	.u-block-90d4-22 {
		font-size: 1.125rem;
	}
	.u-block-90d4-90 {
		background-image: none;
		padding-top: 0;
		padding-bottom: 0;
		padding-left: 0;
		padding-right: 0;
	}
	.u-block-90d4-26 {
		width: 100px;
	}
	.u-block-90d4-31 {
		font-size: 1.5em;
		margin-right: 10px;
	}
	.u-block-90d4-32 {
		width: 100px;
		height: 100px;
	}
	.u-block-90d4-33 {
		font-size: 1.125rem;
	}
	.u-block-90d4-37 {
		width: 100px;
	}
	.u-block-90d4-42 {
		font-size: 1.5em;
		margin-right: 10px;
		padding-top: 3px;
		padding-bottom: 3px;
		padding-left: 3px;
		padding-right: 3px;
	}
	.u-block-90d4-43 {
		width: 100px;
		height: 100px;
	}
	.u-block-90d4-44 {
		font-size: 1.125rem;
	}
	.u-block-90d4-48 {
		width: 100px;
	}
	.u-block-90d4-58 {
		padding-top: 10px;
		padding-right: 14px;
		padding-bottom: 10px;
		padding-left: 14px;
	}
	.u-block-90d4-60 {
		font-size: 0.875rem;
		text-transform: uppercase;
		letter-spacing: 1px;
	}
	.u-block-90d4-68 {
		text-transform: uppercase;
		font-size: 0.875rem;
		font-weight: 700;
		letter-spacing: 1px;
	}
	.u-block-90d4-80 {
		background-image: none;
	}
	.u-block-90d4-81 {
		font-weight: 700;
	}
	.u-block-90d4-83 {
		font-weight: 700;
	}
	.u-block-90d4-84 {
		font-weight: 700;
	}
	.u-block-90d4-89 {
		margin-top: 20px;
		letter-spacing: 1px;
		font-size: 0.875rem;
		font-weight: 700;
		text-transform: uppercase;
	}
}
</style>
		<style data-mode="MD">
@media ( max-width : 991px) and (min-width: 768px) {
	.u-block-90d4-2 {
		min-height: 100vh;
	}
	.u-block-90d4-6 {
		min-height: 375px;
		margin-top: 102px;
		margin-bottom: 60px;
	}
	.u-block-90d4-13 {
		background-image: none;
		font-weight: 700;
	}
	.u-block-90d4-14 {
		border-style: double;
	}
	.u-block-90d4-15 {
		border-style: double;
	}
	.u-block-90d4-16 {
		border-style: double;
	}
	.u-block-90d4-17 {
		border-style: double;
	}
	.u-block-90d4-20 {
		font-size: 1.5em;
		margin-right: 10px;
		padding-top: 3px;
		padding-bottom: 3px;
		padding-left: 3px;
		padding-right: 3px;
	}
	.u-block-90d4-22 {
		font-size: 1.125rem;
	}
	.u-block-90d4-90 {
		background-image: none;
		padding-top: 0;
		padding-bottom: 0;
		padding-left: 0;
		padding-right: 0;
	}
	.u-block-90d4-26 {
		width: 100px;
	}
	.u-block-90d4-31 {
		font-size: 1.5em;
		margin-right: 10px;
	}
	.u-block-90d4-32 {
		width: 100px;
		height: 100px;
	}
	.u-block-90d4-33 {
		font-size: 1.125rem;
	}
	.u-block-90d4-37 {
		width: 100px;
	}
	.u-block-90d4-42 {
		font-size: 1.5em;
		margin-right: 10px;
		padding-top: 3px;
		padding-bottom: 3px;
		padding-left: 3px;
		padding-right: 3px;
	}
	.u-block-90d4-43 {
		width: 100px;
		height: 100px;
	}
	.u-block-90d4-44 {
		font-size: 1.125rem;
	}
	.u-block-90d4-48 {
		width: 100px;
	}
	.u-block-90d4-58 {
		padding-top: 10px;
		padding-right: 14px;
		padding-bottom: 10px;
		padding-left: 14px;
	}
	.u-block-90d4-60 {
		font-size: 0.875rem;
		text-transform: uppercase;
		letter-spacing: 1px;
	}
	.u-block-90d4-68 {
		text-transform: uppercase;
		font-size: 0.875rem;
		font-weight: 700;
		letter-spacing: 1px;
	}
	.u-block-90d4-80 {
		background-image: none;
	}
	.u-block-90d4-81 {
		font-weight: 700;
	}
	.u-block-90d4-83 {
		font-weight: 700;
	}
	.u-block-90d4-84 {
		font-weight: 700;
	}
	.u-block-90d4-89 {
		margin-top: 20px;
		letter-spacing: 1px;
		font-size: 0.875rem;
		font-weight: 700;
		text-transform: uppercase;
	}
}
</style>
		<style data-mode="SM">
@media ( max-width : 767px) and (min-width: 576px) {
	.u-block-90d4-2 {
		min-height: 100vh;
	}
	.u-block-90d4-6 {
		min-height: 375px;
		margin-top: -278px;
		margin-bottom: -299px;
	}
	.u-block-90d4-13 {
		background-image: none;
		font-weight: 700;
	}
	.u-block-90d4-14 {
		border-style: double;
	}
	.u-block-90d4-15 {
		border-style: double;
	}
	.u-block-90d4-16 {
		border-style: double;
	}
	.u-block-90d4-17 {
		border-style: double;
	}
	.u-block-90d4-20 {
		font-size: 1.5em;
		margin-right: 10px;
		padding-top: 3px;
		padding-bottom: 3px;
		padding-left: 3px;
		padding-right: 3px;
	}
	.u-block-90d4-22 {
		font-size: 1.125rem;
	}
	.u-block-90d4-90 {
		background-image: none;
		padding-top: 0;
		padding-bottom: 0;
		padding-left: 0;
		padding-right: 0;
	}
	.u-block-90d4-26 {
		width: 100px;
	}
	.u-block-90d4-31 {
		font-size: 1.5em;
		margin-right: 10px;
	}
	.u-block-90d4-32 {
		width: 100px;
		height: 100px;
	}
	.u-block-90d4-33 {
		font-size: 1.125rem;
	}
	.u-block-90d4-37 {
		width: 100px;
	}
	.u-block-90d4-42 {
		font-size: 1.5em;
		margin-right: 10px;
		padding-top: 3px;
		padding-bottom: 3px;
		padding-left: 3px;
		padding-right: 3px;
	}
	.u-block-90d4-43 {
		width: 100px;
		height: 100px;
	}
	.u-block-90d4-44 {
		font-size: 1.125rem;
	}
	.u-block-90d4-48 {
		width: 100px;
	}
	.u-block-90d4-58 {
		padding-top: 10px;
		padding-right: 14px;
		padding-bottom: 10px;
		padding-left: 14px;
	}
	.u-block-90d4-60 {
		font-size: 0.875rem;
		text-transform: uppercase;
		letter-spacing: 1px;
	}
	.u-block-90d4-68 {
		text-transform: uppercase;
		font-size: 0.875rem;
		font-weight: 700;
		letter-spacing: 1px;
	}
	.u-block-90d4-80 {
		background-image: none;
	}
	.u-block-90d4-81 {
		font-weight: 700;
	}
	.u-block-90d4-83 {
		font-weight: 700;
	}
	.u-block-90d4-84 {
		font-weight: 700;
	}
	.u-block-90d4-89 {
		margin-top: 20px;
		letter-spacing: 1px;
		font-size: 0.875rem;
		font-weight: 700;
		text-transform: uppercase;
	}
}
</style>
		<style data-mode="XS">
@media ( max-width : 575px) {
	.u-block-90d4-2 {
		min-height: 100vh;
	}
	.u-block-90d4-6 {
		min-height: 375px;
		margin-top: -461px;
		margin-bottom: -483px;
	}
	.u-block-90d4-13 {
		background-image: none;
		font-weight: 700;
	}
	.u-block-90d4-14 {
		border-style: double;
	}
	.u-block-90d4-15 {
		border-style: double;
	}
	.u-block-90d4-16 {
		border-style: double;
	}
	.u-block-90d4-17 {
		border-style: double;
	}
	.u-block-90d4-20 {
		font-size: 1.5em;
		margin-right: 10px;
		padding-top: 3px;
		padding-bottom: 3px;
		padding-left: 3px;
		padding-right: 3px;
	}
	.u-block-90d4-22 {
		font-size: 1.125rem;
	}
	.u-block-90d4-90 {
		background-image: none;
		padding-top: 0;
		padding-bottom: 0;
		padding-left: 0;
		padding-right: 0;
	}
	.u-block-90d4-26 {
		width: 100px;
	}
	.u-block-90d4-31 {
		font-size: 1.5em;
		margin-right: 10px;
	}
	.u-block-90d4-32 {
		width: 100px;
		height: 100px;
	}
	.u-block-90d4-33 {
		font-size: 1.125rem;
	}
	.u-block-90d4-37 {
		width: 100px;
	}
	.u-block-90d4-42 {
		font-size: 1.5em;
		margin-right: 10px;
		padding-top: 3px;
		padding-bottom: 3px;
		padding-left: 3px;
		padding-right: 3px;
	}
	.u-block-90d4-43 {
		width: 100px;
		height: 100px;
	}
	.u-block-90d4-44 {
		font-size: 1.125rem;
	}
	.u-block-90d4-48 {
		width: 100px;
	}
	.u-block-90d4-58 {
		padding-top: 10px;
		padding-right: 14px;
		padding-bottom: 10px;
		padding-left: 14px;
	}
	.u-block-90d4-60 {
		font-size: 0.875rem;
		text-transform: uppercase;
		letter-spacing: 1px;
	}
	.u-block-90d4-68 {
		text-transform: uppercase;
		font-size: 0.875rem;
		font-weight: 700;
		letter-spacing: 1px;
	}
	.u-block-90d4-80 {
		background-image: none;
	}
	.u-block-90d4-81 {
		font-weight: 700;
	}
	.u-block-90d4-83 {
		font-weight: 700;
	}
	.u-block-90d4-84 {
		font-weight: 700;
	}
	.u-block-90d4-89 {
		margin-top: 20px;
		letter-spacing: 1px;
		font-size: 0.875rem;
		font-weight: 700;
		text-transform: uppercase;
	}
}
</style>
	</section>

	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />

</body>

</html>