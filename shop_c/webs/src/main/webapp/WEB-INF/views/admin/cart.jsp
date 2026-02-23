<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html style="font-size: 16px;">

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="utf-8">
	<meta name="keywords" content="Product 1 Title, Product 2 Title, Product 3 Title">
	<meta name="description" content="">
	<title>Giỏ hàng</title>
	<link rel="stylesheet" href="css/page.css" media="screen">

</head>

<body class="u-body u-xl-mode" data-style="shopping-cart-template-1" data-posts=""
	data-global-section-properties="{&quot;code&quot;:&quot;CART&quot;,&quot;colorings&quot;:{&quot;light&quot;:[&quot;clean&quot;,&quot;clean&quot;],&quot;colored&quot;:[&quot;clean&quot;,&quot;clean&quot;,&quot;clean&quot;],&quot;dark&quot;:[&quot;clean&quot;,&quot;clean&quot;,&quot;clean&quot;]},&quot;isPreset&quot;:true}"
	data-source="fix" data-lang="en"
	data-page-sections-style="[{&quot;name&quot;:&quot;shopping-cart-1&quot;,&quot;margin&quot;:&quot;both&quot;,&quot;repeat&quot;:false}]"
	data-page-coloring-types="{&quot;light&quot;:[&quot;clean&quot;,&quot;clean&quot;],&quot;colored&quot;:[&quot;clean&quot;,&quot;clean&quot;,&quot;clean&quot;],&quot;dark&quot;:[&quot;clean&quot;,&quot;clean&quot;,&quot;clean&quot;]}"
	data-page-category="&quot;Cart&quot;">

	<jsp:include page="/WEB-INF/views/layout/header.jsp" />

	<section class="u-clearfix u-block-90d4-1" custom-posts-hash="[T,[T,T],[[[I,T],[I,T],[I,T]],[],[],[]]]"
		data-section-properties="{&quot;margin&quot;:&quot;both&quot;,&quot;stretch&quot;:true}" data-id="90d4"
		data-style="shopping-cart-1" id="sec-dd88">

		<c:if test="${empty cartDetails}">
			<jsp:include page="/WEB-INF/views/user/nocart.jsp" />
			<style>
				section {
					min-height: 80vh;
					background: #fff;
				}

				.notmargin {
					margin: 0 !important;
				}
			</style>
		</c:if>


		<div class="notmargin u-clearfix u-sheet u-block-90d4-2">

			<c:if test="${not empty cartDetails}">
				<h2
					class=" gioHang u-align-center-lg u-align-center-md u-align-center-sm u-align-center-xs u-custom-font u-font-ubuntu u-text u-text-default u-text-1">
					Giỏ hàng</h2>
			</c:if>




			<c:if test="${not empty cartDetails}">
				<div class="u-cart u-expanded-width u-layout-grid u-block-90d4-6">
					<div class="u-cart-products-table u-table u-table-responsive u-block-90d4-7">
						<table class="u-table-entity u-block-90d4-12">
							<colgroup>
								<col width="40%">
								<col width="10%">
								<col width="17.5%">
								<col width="10%">
								<col width="17.5%">
								<col width="5%">
							</colgroup>
							<thead class="u-custom-color-1 u-table-header u-block-90d4-13">
								<tr style="height: 33px;">
									<th class="u-border-3 u-border-grey-15 u-table-cell u-block-90d4-14">Sản
										phẩm</th>
									<th class="center u-border-3 u-border-grey-15 u-table-cell u-block-90d4-12">
										Size
									</th>
									<th class="center u-border-3 u-border-grey-15 u-table-cell u-block-90d4-15">
										Giá
									</th>
									<th class="center u-border-3 u-border-grey-15 u-table-cell u-block-90d4-16">
										Số
										lượng</th>
									<th class="center u-border-3 u-border-grey-15 u-table-cell u-block-90d4-17">
										Số
										tiền</th>

								</tr>
							</thead>
							<tbody class="u-align-left u-table-alt-grey-5 u-table-body u-block-90d4-18">

								<!--Sản phẩm nè-->
								<c:forEach var="detail" items="${cartDetails}">
									<tr id="${detail.cartid}" style="height: 100px;" class="cartProduct">
										<td id="image${detail.cartid}"
											class="products-cart u-border-1 u-border-grey-15 u-table-cell u-block-90d4-41">
											<span class="u-cart-remove-item u-icon u-icon-rectangle u-block-90d4-42">
												<input id="checkbox${detail.cartid}" type="checkbox" class="u-checkbox">
											</span> <img
												class="u-cart-product-image u-image u-image-round u-preserve-proportions u-product-control u-radius-17 u-block-90d4-43"
												src="images/products/${detail.image}" data-image-width="859"
												data-image-height="1908">
											<h2 class="u-cart-product-title u-product-control u-text u-block-90d4-44">
												<a class="u-product-title-link"
													href="productinfo.htm?proid=${detail.productId}">${detail.name}</a>
											</h2>
										</td>
										<td id="size${detail.cartid}"
											class="center u-border-1 u-border-grey-15 u-table-cell u-block-90d4-45">
											<div
												class="center u-cart-product-price u-product-control u-product-price u-block-90d4-46">
												<div class="u-price-wrapper">
													<div class="u-old-price"
														style="text-decoration: line-through !important;"></div>
													<div class="u-price" style="font-weight: 700; font-size: 1rem;">
														${detail.size}</div>
												</div>
											</div>
										</td>
										<td id="price${detail.cartid}"
											class="center u-border-1 u-border-grey-15 u-table-cell u-block-90d4-45">
											<div
												class="center u-cart-product-price u-product-control u-product-price u-block-90d4-46">
												<div class="u-price-wrapper">
													<div class="u-old-price"
														style="text-decoration: line-through !important;"></div>
													<div class="u-price" style="font-weight: 700; font-size: 1rem;"
														data-price="${detail.price}">${detail.price}</div>
												</div>
											</div>
										</td>
										<td id="quantity${detail.cartid}"
											class="center u-border-1 u-border-grey-15 u-table-cell u-block-90d4-47">
											<div
												class="center u-cart-product-quantity u-product-control u-product-quantity u-block-90d4-48">
												<div class="u-hidden u-quantity-label">Quantity</div>
												<div class="u-border-2 u-border-grey-25 u-quantity-input u-radius"
													style="--radius: 12px; font-weight: 600; width: 150px;"
													data-max-quantity="${detail.maxQuantity}">
													<a class="minus u-button-style u-quantity-button"
														onclick="changeCartQuantity(this, 'minus', ${detail.maxQuantity})">
														<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
															<path d="m 4 8 h 8" fill="none" stroke="currentColor"
																stroke-width="1" fill-rule="evenodd"></path>
														</svg>
													</a> <input class="u-input u-block-90d4-49 quantity-input"
														type="text" value="${detail.quantity}" pattern="[0-9]+" min="1"
														data-quantity onchange="updateTotal(this)">
													<a class="plus u-button-style u-quantity-button"
														onclick="changeCartQuantity(this, 'plus', ${detail.maxQuantity})">
														<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
															<path d="m 4 8 h 8 M 8 4 v 8" fill="none"
																stroke="currentColor" stroke-width="1"
																fill-rule="evenodd"></path>
														</svg>
													</a>
												</div>
											</div>
										</td>
										<td id="total${detail.cartid}"
											class="center u-border-1 u-border-grey-15 u-table-cell u-block-90d4-50">
											<div
												class="center u-cart-product-subtotal u-product-control u-product-price u-block-90d4-51">
												<div class="u-price-wrapper">
													<div class="u-old-price"
														style="text-decoration: line-through !important;"></div>
													<div class="u-price" style="font-weight: 400;" data-total>
														${detail.total}</div>
												</div>
											</div>
										</td>
										<td id="delete${detail.cartid}"
											class="center u-border-1 u-border-grey-15 u-table-cell u-block-90d4-50">
											<a class="center delete" onclick="deleteCart(${detail.cartid})">
												<span
													class="center u-cart-remove-item u-icon u-icon-rectangle u-block-90d4-42">
													<svg xmlns="http://www.w3.org/2000/svg"
														xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1"
														xml:space="preserve" class="u-svg-content" fill="black"
														viewBox="0 0 52 52" x="0px" y="0px" data-color="#000000"
														style="width: 1em; height: 1em;">
														<g>
															<path d="M26,0C11.664,0,0,11.663,0,26s11.664,26,26,26s26-11.663,26-26S40.336,0,26,0z M26,50C12.767,50,2,39.233,2,26
                                                      S12.767,2,26,2s24,10.767,24,24S39.233,50,26,50z"></path>
															<path
																d="M35.707,16.293c-0.391-0.391-1.023-0.391-1.414,0L26,24.586l-8.293-8.293c-0.391-0.391-1.023-0.391-1.414,0
                                                      s-0.391,1.023,0,1.414L24.586,26l-8.293,8.293c-0.391,0.391-0.391,1.023,0,1.414C16.488,35.902,16.744,36,17,36
                                                      s0.512-0.098,0.707-0.293L26,27.414l8.293,8.293C34.488,35.902,34.744,36,35,36s0.512-0.098,0.707-0.293
                                                      c0.391-0.391,0.391-1.023,0-1.414L27.414,26l8.293-8.293C36.098,17.316,36.098,16.684,35.707,16.293z">
															</path>
														</g>
													</svg>
												</span>
											</a>
										</td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="u-cart-button-container">
						<a href="home.htm"
							class="u-active-none u-btn u-button-style u-cart-continue-shopping u-hover-none u-none u-text-body-color u-block-90d4-58"><span
								class="u-icon u-block-90d4-59"><svg xmlns="http://www.w3.org/2000/svg"
									xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" xml:space="preserve"
									class="u-svg-content" viewBox="0 0 443.52 443.52" x="0px" y="0px"
									data-color="#000000" style="width: 1em; height: 1em;">
									<g>
										<g>
											<path
												d="M143.492,221.863L336.226,29.129c6.663-6.664,6.663-17.468,0-24.132c-6.665-6.662-17.468-6.662-24.132,0l-204.8,204.8    c-6.662,6.664-6.662,17.468,0,24.132l204.8,204.8c6.78,6.548,17.584,6.36,24.132-0.42c6.387-6.614,6.387-17.099,0-23.712    L143.492,221.863z">
											</path>
										</g>
									</g>
								</svg></span>&nbsp;Quay lại </a> <a href="#"
							class="u-btn u-btn-round u-button-style u-cart-update u-grey-5 u-radius-50 u-block-90d4-60">Cập
							nhật giỏ hàng</a>
					</div>
					<div class="u-cart-blocks-container">
						<div class="u-cart-block u-indent-30"></div>
						<div class="u-cart-block u-cart-totals-block u-indent-30">
							<div class="u-cart-block-container u-clearfix">
								<h5 class="u-cart-block-header u-text u-block-90d4-69">Đơn
									hàng</h5>
								<div class="u-align-right u-cart-block-content u-text u-block-90d4-70">
									<div class="u-cart-totals-table u-table u-table-responsive u-block-90d4-71">
										<table class="u-table-entity u-block-90d4-75">
											<colgroup>
												<col width="50%">
												<col width="50%">
											</colgroup>

											<tbody class="u-align-right u-grey-5 u-table-body u-block-90d4-80">
												<tr style="height: 46px;">
													<td
														class="u-align-left u-border-1 u-border-grey-15 u-first-column u-table-cell u-block-90d4-81">
														Tổng cộng</td>
													<td id="totalPrice"
														class="u-border-1 u-border-grey-15 u-table-cell u-block-90d4-82">
														0
														VNĐ</td>
												</tr>
										</table>
									</div>
									<a id="confirmBtn" style="margin-top: 20px;"
										class="u-btn u-btn-round u-button-style u-cart-checkout-btn u-radius-50 u-block-90d4-89">
										Xác nhận </a>

								</div>
							</div>
						</div>
					</div>
			</c:if>
			<style>
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
			@media (min-width : 1200px) {
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
			@media (max-width : 1199px) and (min-width: 992px) {
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
			@media (max-width : 991px) and (min-width: 768px) {
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
			@media (max-width : 767px) and (min-width: 576px) {
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
			@media (max-width : 575px) {
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
	<script src="js/cart.js"></script>
</body>

</html>