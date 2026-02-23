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
<title>Đơn hàng</title>
<link rel="stylesheet" href="css/page.css" media="screen">
</head>

<body class="u-body u-xl-mode" data-style="shopping-cart-template-1"
	data-posts=""
	data-global-section-properties="{&quot;code&quot;:&quot;CART&quot;,&quot;colorings&quot;:{&quot;light&quot;:[&quot;clean&quot;,&quot;clean&quot;],&quot;colored&quot;:[&quot;clean&quot;,&quot;clean&quot;,&quot;clean&quot;],&quot;dark&quot;:[&quot;clean&quot;,&quot;clean&quot;,&quot;clean&quot;]},&quot;isPreset&quot;:true}"
	data-source="fix" data-lang="en"
	data-page-sections-style="[{&quot;name&quot;:&quot;shopping-cart-1&quot;,&quot;margin&quot;:&quot;both&quot;,&quot;repeat&quot;:false}]"
	data-page-coloring-types="{&quot;light&quot;:[&quot;clean&quot;,&quot;clean&quot;],&quot;colored&quot;:[&quot;clean&quot;,&quot;clean&quot;,&quot;clean&quot;],&quot;dark&quot;:[&quot;clean&quot;,&quot;clean&quot;,&quot;clean&quot;]}"
	data-page-category="&quot;Cart&quot;">

	<jsp:include page="/WEB-INF/views/layout/header.jsp" />

	<section class="u-clearfix u-block-90d4-1"
		custom-posts-hash="[T,[T,T],[[[I,T],[I,T],[I,T]],[],[],[]]]"
		data-section-properties="{&quot;margin&quot;:&quot;both&quot;,&quot;stretch&quot;:true}"
		data-id="90d4" data-style="shopping-cart-1" id="sec-dd88">

		<div class="u-clearfix u-sheet u-block-90d4-2">

			<div class="u-cart-button-container">
				<a href="home.htm" style="position: absolute; margin-left: 45px"
					class="u-active-none u-btn u-button-style u-cart-continue-shopping u-hover-none u-none u-text-body-color u-block-90d4-58"><span
					class="u-icon u-block-90d4-59"><svg
							xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1"
							xml:space="preserve" class="u-svg-content"
							viewBox="0 0 443.52 443.52" x="0px" y="0px" data-color="#000000"
							style="width: 1em; height: 1em">
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
					Đơn hàng</h2>

				<div class="custom-dropdown u-align-center-xs">
					<select name="options" id="custom-dropdown-menu">
						<option value="0">Lọc trạng thái</option>
						<option value="1">Chưa thanh toán</option>
						<option value="2">Chờ lấy hàng</option>
						<option value="3">Đang giao hàng</option>
						<option value="4">Đã hoàn thành</option>
						<option value="5">Đã hủy</option>
					</select>
				</div>
			</div>

			<div class="custom-search-container">
			    <label>Mã đơn hàng:</label> 
			    <input id="idorder-search-input" class="custom-search-input" type="text" name="idordersearch" value="" placeholder="Nhập mã đơn hàng">
			    			
				<div class="date-range">
					<label for="fromDate">Từ: </label> <input type="date" id="fromDate"
						name="fromDate" class="custom-date-input" /> <label for="toDate">Đến:
					</label> <input type="date" id="toDate" name="toDate"
						class="custom-date-input" />
					<button type="button" id="clear-date" class="clear-date-button">Hủy</button>
				</div>
			</div>

			<div class="u-cart u-expanded-width u-layout-grid u-block-90d4-6">
				<div
					class="u-cart-products-table u-table u-table-responsive u-block-90d4-7">
					<table class="u-table-entity u-block-90d4-12">
						<colgroup>
							<col width="15%">
							<col width="20%">
							<col width="15%">
							<col width="15%">
							<col width="15%">
							<col width="20%">
						</colgroup>
						<thead class="u-custom-color-1 u-table-header u-block-90d4-13">
							<tr style="height: 33px;">
								<th
									class="center u-border-3 u-border-grey-15 u-table-cell u-block-90d4-14">Mã
									đơn hàng</th>
								<th
									class="center u-border-3 u-border-grey-15 u-table-cell u-block-90d4-12">Ngày
									tạo</th>
								<th
									class="center u-border-3 u-border-grey-15 u-table-cell u-block-90d4-15">Tổng
									số lượng</th>
								<th
									class="center u-border-3 u-border-grey-15 u-table-cell u-block-90d4-16">Tổng
									tiền</th>
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

							<!--Sản phẩm nè-->
							<c:forEach var="order" items="${orders}">
								<tr id="order${order.id}" style="height: 100px;">
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
														href="order/orderdetail/${order.order.id}.htm">${order.order.id}</a>
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
													<fmt:formatDate value="${order.order.createTime}"
														pattern="dd/MM/yyyy HH:mm:ss" />
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
													${order.totalQuantity}</div>
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
													<fmt:formatNumber value="${order.order.total}"
														type="number" groupingUsed="true" />
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
													${order.order.orderStatus.statusName}</div>
											</div>
										</div>
									</td>
									<%-- <td class="center u-border-1 u-border-grey-15 u-table-cell u-block-90d4-50">
										<div
											class="center  u-cart-product-subtotal u-product-control u-product-price u-block-90d4-51">
											<div class="u-price-wrapper">
												<div class="u-old-price"
													style="text-decoration: line-through !important;"></div>
												<div class="u-price" style="font-weight: 400;">${detail.status}</div>
											</div>
										</div>
										</td> --%>
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
														href="order/orderdetail/${order.order.id}.htm">Xem chi
														tiết</a>
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
					<div class="u-cart-block u-indent-30"></div>

				</div>
				<style>
/* Container chính để bao bọc các input */
.custom-search-container {
	margin: 0px 0px 10px 47px;
	display: flex;
	flex-wrap: wrap;
	align-items: center;
	gap: 10px;
	justify-content: flex-start;
}

/* Input tìm kiếm */
.custom-search-input {
	padding: 8px 12px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 4px;
	width: 100%;
	max-width: 250px; /* Giới hạn chiều rộng của input */
	box-sizing: border-box;
}

/* Phần chứa các input date */
.date-range {
	margin: 0px 0px 0px 50px;
	display: flex;
	gap: 10px;
	align-items: center;
}

/* Input ngày */
.custom-date-input {
	width: 40%;
	padding: 8px 10px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

/* Các nhãn */
label {
	font-size: 14px;
	margin-right: 5px;
}

/* Nút hủy */
.clear-date-button {
	padding: 8px 12px;
	font-size: 14px;
	background-color: #f44336; /* Màu đỏ */
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.clear-date-button:hover {
	background-color: #d32f2f; /* Màu đỏ đậm hơn khi hover */
}

.custom-dropdown #custom-dropdown-menu {
	margin: 20px 47px 0px 0px;
	font-size: inherit;
	padding: 5px;
	border: 2px solid #333333;
	border-radius: 5px;
	background-color: #fff;
	color: #333;
	cursor: pointer;
	outline: none;
}

.custom-dropdown #custom-dropdown-menu:focus {
	border-color: #0056b3;
	box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
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
<script src="js/orderDetail.js"></script>
</html>