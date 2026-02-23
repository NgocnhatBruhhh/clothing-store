<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html style="font-size: 16px;" lang="vi">

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="utf-8">
	<meta name="keywords" content="">
	<meta name="description" content="">
	<title>Thông tin sản phẩm</title>
	<link rel="stylesheet" href="css/page.css" media="screen">
	<link rel="stylesheet" href="css/product.css" media="screen">
	<meta name="generator" content="Nicepage 7.0.3, nicepage.com">

	<link id="u-theme-google-font" rel="stylesheet"
		href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">



	<script type="application/ld+json">{
            "@context": "http://schema.org",
            "@type": "Organization",
            "name": "",
            "logo": "images/pngwing.com.png"
            }</script>
	<meta name="theme-color" content="#478ac9">
	<meta property="og:title" content="Contact">
	<meta property="og:type" content="website">
	<meta data-intl-tel-input-cdn-path="intlTelInput/">
</head>

<body data-home-page="Home.html" data-home-page-title="Home" data-path-to-root="./" data-include-products="true"
	class="u-body u-overlap u-overlap-contrast u-xl-mode" data-lang="en">

	<jsp:include page="/WEB-INF/views/layout/eheader.jsp" />

	<section class="u-clearfix u-grey-5 u-block-60d2-1" custom-posts-hash="[]" data-style="blank"
		data-section-properties="{&quot;margin&quot;:&quot;none&quot;,&quot;stretch&quot;:true}" id="sec-84cf"
		data-id="60d2" style="">
		<div class="u-clearfix u-sheet u-block-60d2-2" style="min-height: 674px">
			<p class="u-text u-text-palette-1-base u-block-control u-block-60d2-17"
				style="margin-top: 94px; margin-right: 80px; margin-bottom: 0" data-block="11" data-block-type="Text">
				​<span class="u-file-icon u-icon u-block-control u-block-60d2-18"
					style="font-size: 2.1112em; margin-left: 80px; margin-right: 11px; vertical-align: -1px"
					data-block="12" data-block-type="Icon"><img src="/10bc3df0da2a6a/7078310.png" alt=""
						data-original-src="" data-color=""></span>Thông tin sản phẩm​​
			</p>
			<div class="custom-expanded data-layout-selected u-clearfix u-layout-wrap u-block-control u-block-60d2-3"
				style="width: 980px; margin-top: 12px; margin-left: auto; margin-right: auto; margin-bottom: 60px"
				data-layout-wrap-id="1" data-block="13" data-block-type="Layout">
				<div class="u-layout">
					<div class="u-layout-row">
						<div class="u-container-style u-image u-image-round u-layout-cell u-radius u-size-22 u-block-control ui-draggable ui-droppable u-block-60d2-4"
							data-image-width="1280" data-image-height="1280"
							style="min-height: 400px; background-image: url('images/products/${product.image }'); background-position: 50% 50%; --top-left-radius: 10px; --bottom-left-radius: 10px"
							data-cell-id="1" data-column-id="1" data-block="14">
							<div class="u-container-layout u-block-60d2-5"
								style="padding-top: 0; padding-bottom: 0; padding-left: 0; padding-right: 0"
								data-container-layout-dom="1"></div>
						</div>
						<div class="u-container-style u-layout-cell u-radius u-shape-round u-size-38 u-white u-block-control ui-draggable ui-droppable u-block-60d2-6"
							style="min-height: 470px; --top-right-radius: 20px; --bottom-right-radius: 20px"
							data-cell-id="2" data-column-id="2" data-block="15" data-block-type="Cell">
							<div class="u-container-layout u-block-60d2-7"
								style="box-shadow: 0px 0px 8px 0px rgba(var(--grey-50-r), var(--grey-50-g), var(--grey-50-b), 1); padding-top: 12.5939px; padding-bottom: 12.5939px; padding-left: 0px; padding-right: 0px"
								data-container-layout-dom="2" data-block-type="">
								<h3 class="u-text u-block-control u-block-60d2-8"
									style="font-weight: 700; font-size: 1.75rem; margin-top: 0.0012px; margin-left: 29.828px; margin-right: 29.828px; margin-bottom: 0px"
									data-block="16" data-block-type="Text">
									​<span class="u-file-icon u-icon u-block-control u-block-60d2-21"
										style="font-size: 2.0715em; margin-right: 3px; vertical-align: -11px"
										data-block="17" data-block-type="Icon"><img src="/6f0e356639810/9752776.png"
											alt="" data-original-src="/6f0e356639810/9752776.png"
											data-color=""></span>&nbsp;${product.name }
								</h3>
								<!-- Price Display -->
								<div style="display: flex;">
									<h4 id="price" class="u-text u-text-custom-color-5 u-block-control u-block-60d2-9"
										style="font-weight: 700; font-size: 1.875rem; margin-top: 0.4063px; margin-right: 109.672px; margin-bottom: 0px; margin-left: 30.9922px;"
										data-block="18" data-block-type="Text">
										${productDetail[0].price}</h4>
									<h4 class="u-text u-text-custom-color-5 u-block-control u-block-60d2-9"
										style="font-weight: 700; font-size: 1.875rem; margin-top: 0.4063px; margin-right: 109.672px; margin-bottom: 0px; margin-left: -105px;"
										data-block="18" data-block-type="Text">&nbsp;VNĐ</h4>
								</div>

								<ul style="margin-left: 60px;">
									<li>Loại: ${product.type.name}</li>
									<li>Nguồn gốc: ${product.origin.name }</li>
									<li>Thương hiệu: ${product.brand.name }</li>
									<li>Chất liệu: ${product.material.name }</li>


								</ul>
								<div style="display: inline-flex;">
									<p class="u-text u-text-default u-block-control u-block-60d2-22"
										data-editor-additional-class="1eae0d1f-824a-ed94-64d3-1494d6edd128"
										style="font-weight: 700; margin-top: 10.2424px; margin-right: auto; transform: translateY(-7px); margin-right: 4px; margin-bottom: 0px; margin-left: 42px"
										data-block="23" data-block-type="Text">&nbsp;Số
										lượng:&nbsp;</p>
									<div class="u-border-2 u-border-grey-25 u-quantity-input u-radius"
										style="--radius: 12px; font-weight: 600; width: 150px;">
										<a class="minus u-button-style u-quantity-button"
											onclick="changeQuantity('minus')"> <svg xmlns="http://www.w3.org/2000/svg"
												viewBox="0 0 16 16">
												<path d="m 4 8 h 8" fill="none" stroke="currentColor" stroke-width="1"
													fill-rule="evenodd"></path>
											</svg>
										</a> <input id="quantityInput" class="u-input u-block-90d4-49" type="text"
											value="1" pattern="[0-9]+" min="1"> <a
											class="plus u-button-style u-quantity-button"
											onclick="changeQuantity('plus')"> <svg xmlns="http://www.w3.org/2000/svg"
												viewBox="0 0 16 16">
												<path d="m 4 8 h 8 M 8 4 v 8" fill="none" stroke="currentColor"
													stroke-width="1" fill-rule="evenodd"></path>
											</svg>
										</a>
									</div>
								</div>

								<div style="display: block">
									<div style="display: inline-flex">

										<p class="u-text u-text-default u-block-control u-block-60d2-23"
											style="font-weight: 700; margin-top: 12.4064px; margin-right: auto; margin-bottom: 0px; margin-left: 44px"
											data-block="24" data-block-type="Text">&nbsp;Size:&nbsp;</p>

										<!-- Size buttons -->
										<c:forEach var="pd" items="${productDetail}">
											<button id="${pd.id}" class="sizebutton"
												onclick="selectSize(this, '${pd.size.id}', '${pd.price}', '${pd.quantity}')">
												${pd.size.id}</button>
										</c:forEach>
									</div>

									<style>
										.sizebutton {
											height: 30px;
											width: 60px;
											border-radius: 10px;
											text-align: center;
											border: 1px solid #ccc;
											transform: translateY(12px);
											margin-left: 4px;
											background: #478ac9;
											color: white;
											font-weight: 600;
											font-size: 14px;
										}

										.sizebutton.selected {
											background-color: #4CAF50;
											/* Màu nền cho nút đã chọn */
											color: white;
											/* Màu chữ cho nút đã chọn */
										}

										.sizebutton.selected {
											background-color: #4CAF50;
											/* Màu nền cho nút đã chọn */
											color: white;
											/* Màu chữ cho nút đã chọn */
										}

										.sizebutton:hover {
											opacity: 0.7;
											cursor: pointer;
										}

										.u-quantity-button {
											cursor: pointer;
										}

										.u-quantity-input input {
											text-align: center;
											width: 60px;
											/* Đã thay đổi kích thước chiều rộng */
											padding: 5px;
											font-size: 1rem;
											border: 1px solid #ccc;
											border-radius: 5px;
										}

										.u-quantity-input a {
											padding: 5px;
										}

										.u-quantity-input {
											display: flex;
											justify-content: space-between;
											align-items: center;
										}

										.u-quantity-input input:focus {
											outline: none;
										}
									</style>

								</div>

								<a href="updateprod.htm?productId=${product.id }"
									class="u-btn u-btn-round u-button-style u-radius u-block" class="u-border-none u-btn u-btn-round u-button-style u-palette-4-dark-1 u-radius u-block-control u-block-60d2-15"
									style="background-image: none; --radius: 20px; box-shadow: 0px 0px 8px 0px rgba(var(--grey-50-r), var(--grey-50-g), var(--grey-50-b), 1); margin-top: 15.4064px; margin-right: auto; margin-bottom: 0px; margin-left: 31px; padding-top: 0px; padding-right: 20px; padding-bottom: 0px; padding-left: 19px"
									data-block="25" data-block-type="Button" onclick="addToCart()">
									<span class="u-file-icon u-icon u-block-control u-block-60d2-19"
										style="font-size: 2.3126em; margin-right: 8px; vertical-align: -7px"
										data-block="26" data-block-type="Icon"> <img src="/b9e86569af7a8/3594363.png"
											alt="" data-original-src="/b9e86569af7a8/3594363.png" data-color="">
									</span> Sửa thông tin sản phẩm
								</a><a href="emaddproductdetail.htm?productid=${product.id }"
									class="u-btn u-btn-round u-button-style u-radius u-block-control u-block-60d2-16"
									style="--radius: 20px; box-shadow: 0px 0px 8px 0px rgba(var(--grey-50-r), var(--grey-50-g), var(--grey-50-b), 1); margin-top: -59px; margin-right: 150px; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-bottom: 0px; padding-left: 30px; padding-right: 30px"
									data-block="27">​<span
										class="u-file-icon u-icon u-opacity u-opacity-95 u-block-control u-block-60d2-20"
										style="font-size: 2.3126em; margin-right: 5px; vertical-align: -7px"
										data-block="28"><img src="/90a6a37694106/825575.png" alt=""
											data-original-src="/90a6a37694106/825575.png" data-color=""></span>&nbsp;Sửa giá theo size​
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
		// Định nghĩa hàm xử lý sự kiện
		  function handleButtonClick(event) {
		            // Hiển thị hộp thoại xác nhận
		            const isConfirmed = confirm("Bạn có chắc chắn cập nhật?");
		            
		            if (!isConfirmed) {
		                // Ngăn hành động mặc định (nếu có)
		                event.preventDefault();
		                
		            } 
		        }
		</script>
		<style>
		        button{
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2)!important;
			overflow:hidden;
		}
		
		.u-btn{
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2)!important;
			overflow:hidden;
		}
		
		
			.u-layout{
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2)!important;
		}
		</style>
		<style data-mode="XL" data-visited="true">
			@media (max-width : 0px) {
				.u-block-60d2-2 {
					min-height: 674px
				}

				.u-block-60d2-17 {
					margin-top: 94px;
					margin-left: 80px;
					margin-right: 80px;
					margin-bottom: 0
				}

				.u-block-60d2-18 {
					font-size: 2.1112em;
					margin-right: 11px;
					vertical-align: -1px
				}

				.u-block-60d2-3 {
					width: 980px;
					margin-top: 12px;
					margin-left: auto;
					margin-right: auto;
					margin-bottom: 60px
				}

				.u-block-60d2-4 {
					min-height: 400px;
					background-image: url("/1c2063d670eb9f/len.jpg");
					background-position: 50% 50%;
					--top-left-radius: 10px;
					--bottom-left-radius: 10px
				}

				.u-block-60d2-5 {
					padding-top: 0;
					padding-bottom: 0;
					padding-left: 0;
					padding-right: 0
				}

				.u-block-60d2-6 {
					min-height: 470px;
					--top-right-radius: 20px;
					--bottom-right-radius: 20px
				}

				.u-block-60d2-7 {
					box-shadow: 0px 0px 8px 0px rgba(var(--grey-50-r), var(--grey-50-g),
							var(--grey-50-b), 1);
					padding-top: 12.5939px;
					padding-bottom: 12.5939px;
					padding-left: 0px;
					padding-right: 0px
				}

				.u-block-60d2-8 {
					font-weight: 700;
					font-size: 1.75rem;
					margin-top: 0.0012px;
					margin-left: 29.828px;
					margin-right: 29.828px;
					margin-bottom: 0px
				}

				.u-block-60d2-21 {
					font-size: 2.0715em;
					margin-right: 3px;
					vertical-align: -11px
				}

				.u-block-60d2-9 {
					font-weight: 700;
					font-size: 1.875rem;
					margin-top: 0.4063px;
					margin-right: 109.672px;
					margin-bottom: 0px;
					margin-left: 30.9922px
				}

				.u-block-60d2-26 {
					margin-top: 1.258px;
					margin-right: 15px;
					margin-bottom: 0px;
					margin-left: 45px
				}

				.u-block-60d2-11 {
					margin-top: 0.8439px;
					margin-right: 17.1876px;
					margin-bottom: 0px;
					margin-left: 42.4766px
				}

				.u-block-60d2-13 {
					margin-top: 0.422px;
					margin-right: 14.664px;
					margin-bottom: 0px;
					margin-left: 45px
				}

				.u-block-60d2-24 {
					margin-top: -1.0001px;
					margin-right: 14.664px;
					margin-bottom: 0px;
					margin-left: 45px
				}

				.u-block-60d2-22 {
					font-weight: 700;
					margin-top: 10.2424px;
					margin-right: auto;
					margin-bottom: 0px;
					margin-left: 42px
				}

				.u-block-60d2-23 {
					font-weight: 700;
					margin-top: 12.4064px;
					margin-right: auto;
					margin-bottom: 0px;
					margin-left: 44px
				}

				.u-block-60d2-15 {
					background-image: none;
					--radius: 20px;
					box-shadow: 0px 0px 8px 0px rgba(var(--grey-50-r), var(--grey-50-g),
							var(--grey-50-b), 1);
					margin-top: 15.4064px;
					margin-right: auto;
					margin-bottom: 0px;
					margin-left: 31px;
					padding-top: 0px;
					padding-right: 20px;
					padding-bottom: 0px;
					padding-left: 19px
				}

				.u-block-60d2-19 {
					font-size: 2.3126em;
					margin-right: 8px;
					vertical-align: -7px
				}

				.u-block-60d2-16 {
					--radius: 20px;
					box-shadow: 0px 0px 8px 0px rgba(var(--grey-50-r), var(--grey-50-g),
							var(--grey-50-b), 1);
					margin-top: -59px;
					margin-right: 164px;
					margin-bottom: 0px;
					margin-left: auto;
					padding-top: 0px;
					padding-bottom: 0px;
					padding-left: 30px;
					padding-right: 30px
				}

				.u-block-60d2-20 {
					font-size: 2.3126em;
					margin-right: 5px;
					vertical-align: -7px
				}
			}
		</style>
		<style data-mode="LG">
			@media (max-width : 0px) {
				.u-block-60d2-2 {
					min-height: 655px
				}

				.u-block-60d2-17 {
					margin-top: 94px;
					margin-left: 0px;
					margin-right: 0px;
					margin-bottom: 0
				}

				.u-block-60d2-18 {
					font-size: 2.1112em;
					margin-right: 11px;
					vertical-align: -1px
				}

				.u-block-60d2-3 {
					position: relative;
					width: 940px;
					margin-top: 12px;
					margin-bottom: 60px;
					margin-left: auto;
					margin-right: auto
				}

				.u-block-60d2-4 {
					background-image: url("/1c2063d670eb9f/len.jpg");
					background-position: 50% 50%;
					--radius: 10px;
					--top-left-radius: 10px;
					--bottom-left-radius: 10px;
					min-height: 384px
				}

				.u-block-60d2-5 {
					padding-top: 0;
					padding-bottom: 0;
					padding-left: 0;
					padding-right: 0
				}

				.u-block-60d2-6 {
					--radius: 20px;
					--top-right-radius: 20px;
					--bottom-right-radius: 20px;
					min-height: 451px
				}

				.u-block-60d2-7 {
					padding-top: 12.5939px;
					padding-bottom: 12.5939px;
					padding-left: 0px;
					padding-right: 0px;
					box-shadow: 0px 0px 8px 0px rgba(var(--grey-50-r), var(--grey-50-g),
							var(--grey-50-b), 1)
				}

				.u-block-60d2-8 {
					font-weight: 700;
					font-size: 1.75rem;
					margin-top: 0.0012px;
					margin-left: 17px;
					margin-right: 17px;
					margin-bottom: 0px
				}

				.u-block-60d2-21 {
					font-size: 2.0715em;
					margin-right: 3px;
					vertical-align: -11px
				}

				.u-block-60d2-9 {
					font-weight: 700;
					font-size: 1.875rem;
					margin-top: 0.4063px;
					margin-right: 86px;
					margin-bottom: 0px;
					margin-left: 18px
				}

				.u-block-60d2-26 {
					margin-top: -40.6016px;
					margin-right: 2px;
					margin-bottom: 0px;
					margin-left: 32px
				}

				.u-block-60d2-11 {
					margin-top: 41.8594px;
					margin-right: 5px;
					margin-bottom: 0px;
					margin-left: 30px
				}

				.u-block-60d2-13 {
					margin-top: 0.422px;
					margin-right: 5px;
					margin-bottom: 0px;
					margin-left: 32px
				}

				.u-block-60d2-24 {
					margin-top: -62.0079px;
					margin-left: 32px;
					margin-right: 2px;
					margin-bottom: 0px
				}

				.u-block-60d2-22 {
					font-weight: 700;
					margin-top: -1.5625px;
					margin-right: auto;
					margin-bottom: 0px;
					margin-left: 42px
				}

				.u-block-60d2-23 {
					font-weight: 700;
					margin-top: 25px;
					margin-right: auto;
					margin-bottom: 0px;
					margin-left: 44px
				}

				.u-block-60d2-15 {
					background-image: none;
					--radius: 20px;
					margin-top: 31px;
					margin-right: auto;
					margin-bottom: 0px;
					margin-left: 6px;
					padding-top: 0px;
					padding-right: 20px;
					padding-bottom: 0px;
					padding-left: 19px;
					box-shadow: 0px 0px 8px 0px rgba(var(--grey-50-r), var(--grey-50-g),
							var(--grey-50-b), 1)
				}

				.u-block-60d2-19 {
					font-size: 2.3126em;
					margin-right: 8px;
					vertical-align: -7px
				}

				.u-block-60d2-16 {
					--radius: 20px;
					box-shadow: 0px 0px 8px 0px rgba(var(--grey-50-r), var(--grey-50-g),
							var(--grey-50-b), 1);
					margin-top: -59px;
					margin-right: 139px;
					margin-bottom: 0px;
					margin-left: auto;
					padding-top: 0px;
					padding-bottom: 0px;
					padding-left: 30px;
					padding-right: 30px
				}

				.u-block-60d2-20 {
					font-size: 2.3126em;
					margin-right: 5px;
					vertical-align: -7px
				}
			}
		</style>
		<style data-mode="MD">
			@media (max-width : 0px) {
				.u-block-60d2-2 {
					min-height: 498px
				}

				.u-block-60d2-17 {
					margin-top: 94px;
					margin-left: 0px;
					margin-right: 0px;
					margin-bottom: 0
				}

				.u-block-60d2-18 {
					font-size: 2.1112em;
					margin-right: 11px;
					vertical-align: -1px
				}

				.u-block-60d2-3 {
					position: relative;
					width: 720px;
					margin-top: 12px;
					margin-bottom: 60px;
					margin-left: auto;
					margin-right: auto
				}

				.u-block-60d2-4 {
					background-image: url("/1c2063d670eb9f/len.jpg");
					background-position: 50% 50%;
					--radius: 10px;
					--top-left-radius: 10px;
					--bottom-left-radius: 10px;
					min-height: 294px
				}

				.u-block-60d2-5 {
					padding-top: 0px;
					padding-bottom: 0px;
					padding-left: 0px;
					padding-right: 0px
				}

				.u-block-60d2-6 {
					--radius: 20px;
					--top-right-radius: 20px;
					--bottom-right-radius: 20px;
					min-height: 100px
				}

				.u-block-60d2-7 {
					padding-top: 12.5939px;
					padding-bottom: 12.5939px;
					padding-left: 0px;
					padding-right: 0px;
					box-shadow: 0px 0px 8px 0px rgba(var(--grey-50-r), var(--grey-50-g),
							var(--grey-50-b), 1)
				}

				.u-block-60d2-8 {
					font-weight: 700;
					font-size: 1.75rem;
					margin-top: 0.0012px;
					margin-left: 0px;
					margin-right: 0px;
					margin-bottom: 0px
				}

				.u-block-60d2-21 {
					font-size: 2.0715em;
					margin-right: 3px;
					vertical-align: -11px
				}

				.u-block-60d2-9 {
					font-weight: 700;
					font-size: 1.875rem;
					margin-top: 0.4063px;
					margin-left: 0px;
					margin-right: 0px;
					margin-bottom: 0px
				}

				.u-block-60d2-26 {
					margin-top: -68.6016px;
					margin-left: 0px;
					margin-right: 0px;
					margin-bottom: 0px
				}

				.u-block-60d2-11 {
					margin-top: 69.8594px;
					margin-left: 0px;
					margin-right: 0px;
					margin-bottom: 0px
				}

				.u-block-60d2-13 {
					margin-top: 0.422px;
					margin-left: 0px;
					margin-right: 0px;
					margin-bottom: 0px
				}

				.u-block-60d2-24 {
					margin-top: -90.0157px;
					margin-left: 0px;
					margin-right: 0px;
					margin-bottom: 0px
				}

				.u-block-60d2-22 {
					font-weight: 700;
					margin-top: -1.5625px;
					margin-right: auto;
					margin-bottom: 0px;
					margin-left: 42px
				}

				.u-block-60d2-23 {
					font-weight: 700;
					margin-top: 25px;
					margin-right: auto;
					margin-bottom: 0px;
					margin-left: 44px
				}

				.u-block-60d2-15 {
					background-image: none;
					--radius: 20px;
					margin-top: 31px;
					margin-right: auto;
					margin-bottom: 0px;
					margin-left: 0px;
					padding-top: 0px;
					padding-right: 20px;
					padding-bottom: 0px;
					padding-left: 19px;
					box-shadow: 0px 0px 8px 0px rgba(var(--grey-50-r), var(--grey-50-g),
							var(--grey-50-b), 1)
				}

				.u-block-60d2-19 {
					font-size: 2.3126em;
					margin-right: 8px;
					vertical-align: -7px
				}

				.u-block-60d2-16 {
					--radius: 20px;
					box-shadow: 0px 0px 8px 0px rgba(var(--grey-50-r), var(--grey-50-g),
							var(--grey-50-b), 1);
					margin-top: -59px;
					margin-right: 0px;
					margin-bottom: 0px;
					margin-left: auto;
					padding-top: 0px;
					padding-bottom: 0px;
					padding-left: 30px;
					padding-right: 30px
				}

				.u-block-60d2-20 {
					font-size: 2.3126em;
					margin-right: 5px;
					vertical-align: -7px
				}
			}
		</style>
		<style data-mode="SM">
			@media (max-width : 0px) {
				.u-block-60d2-2 {
					min-height: 905px
				}

				.u-block-60d2-17 {
					margin-top: 94px;
					margin-left: 0px;
					margin-right: 0px;
					margin-bottom: 0
				}

				.u-block-60d2-18 {
					font-size: 2.1112em;
					margin-right: 11px;
					vertical-align: -1px
				}

				.u-block-60d2-3 {
					position: relative;
					width: 540px;
					margin-top: 12px;
					margin-bottom: 60px;
					margin-left: auto;
					margin-right: auto
				}

				.u-block-60d2-4 {
					background-image: url("/1c2063d670eb9f/len.jpg");
					background-position: 50% 50%;
					--radius: 10px;
					--top-left-radius: 10px;
					--bottom-left-radius: 10px;
					min-height: 601px
				}

				.u-block-60d2-5 {
					padding-top: 0px;
					padding-bottom: 0px;
					padding-left: 0px;
					padding-right: 0px
				}

				.u-block-60d2-6 {
					--radius: 20px;
					--top-right-radius: 20px;
					--bottom-right-radius: 20px;
					min-height: 100px
				}

				.u-block-60d2-7 {
					padding-top: 12.5939px;
					padding-bottom: 12.5939px;
					padding-left: 0px;
					padding-right: 0px;
					box-shadow: 0px 0px 8px 0px rgba(var(--grey-50-r), var(--grey-50-g),
							var(--grey-50-b), 1)
				}

				.u-block-60d2-8 {
					font-weight: 700;
					font-size: 1.75rem;
					margin-top: 0.0012px;
					margin-left: 0px;
					margin-right: 0px;
					margin-bottom: 0px
				}

				.u-block-60d2-21 {
					font-size: 2.0715em;
					margin-right: 3px;
					vertical-align: -11px
				}

				.u-block-60d2-9 {
					font-weight: 700;
					font-size: 1.875rem;
					margin-top: 0.4063px;
					margin-left: 0px;
					margin-right: 0px;
					margin-bottom: 0px
				}

				.u-block-60d2-26 {
					margin-top: -50.1251px;
					margin-left: 0px;
					margin-right: 0px;
					margin-bottom: 0px
				}

				.u-block-60d2-11 {
					margin-top: 54.4454px;
					margin-left: 0px;
					margin-right: 0px;
					margin-bottom: 0px
				}

				.u-block-60d2-13 {
					margin-top: 0.422px;
					margin-left: 0px;
					margin-right: 0px;
					margin-bottom: 0px
				}

				.u-block-60d2-24 {
					margin-top: -65.4219px;
					margin-left: 0px;
					margin-right: 0px;
					margin-bottom: 0px
				}

				.u-block-60d2-22 {
					font-weight: 700;
					margin-top: 4.9063px;
					margin-right: auto;
					margin-bottom: 0px;
					margin-left: 42px
				}

				.u-block-60d2-23 {
					font-weight: 700;
					margin-top: 25px;
					margin-right: auto;
					margin-bottom: 0px;
					margin-left: 44px
				}

				.u-block-60d2-15 {
					background-image: none;
					--radius: 20px;
					box-shadow: 0px 0px 8px 0px rgba(var(--grey-50-r), var(--grey-50-g),
							var(--grey-50-b), 1);
					margin-top: 34px;
					margin-right: auto;
					margin-bottom: 0px;
					margin-left: 0px;
					padding-top: 0px;
					padding-right: 20px;
					padding-bottom: 0px;
					padding-left: 19px
				}

				.u-block-60d2-19 {
					font-size: 2.3126em;
					margin-right: 8px;
					vertical-align: -7px
				}

				.u-block-60d2-16 {
					--radius: 20px;
					box-shadow: 0px 0px 8px 0px rgba(var(--grey-50-r), var(--grey-50-g),
							var(--grey-50-b), 1);
					margin-top: -59px;
					margin-right: 0px;
					margin-bottom: 0px;
					margin-left: auto;
					padding-top: 0px;
					padding-bottom: 0px;
					padding-left: 30px;
					padding-right: 30px
				}

				.u-block-60d2-20 {
					font-size: 2.3126em;
					margin-right: 5px;
					vertical-align: -7px
				}
			}
		</style>
		<style data-mode="XS">
			@media (max-width : 0px) {
				.u-block-60d2-2 {
					min-height: 682px
				}

				.u-block-60d2-17 {
					margin-top: 94px;
					margin-left: 0px;
					margin-right: 0px;
					margin-bottom: 0
				}

				.u-block-60d2-18 {
					font-size: 2.1112em;
					margin-right: 11px;
					vertical-align: -1px
				}

				.u-block-60d2-3 {
					position: relative;
					width: 340px;
					margin-top: 12px;
					margin-bottom: 60px;
					margin-left: auto;
					margin-right: auto
				}

				.u-block-60d2-4 {
					background-image: url("/1c2063d670eb9f/len.jpg");
					background-position: 50% 50%;
					--radius: 10px;
					--top-left-radius: 10px;
					--bottom-left-radius: 10px;
					min-height: 378px
				}

				.u-block-60d2-5 {
					padding-top: 0px;
					padding-bottom: 0px;
					padding-left: 0px;
					padding-right: 0px
				}

				.u-block-60d2-6 {
					--radius: 20px;
					--top-right-radius: 20px;
					--bottom-right-radius: 20px;
					min-height: 100px
				}

				.u-block-60d2-7 {
					padding-top: 12.5939px;
					padding-bottom: 12.5939px;
					padding-left: 0px;
					padding-right: 0px;
					box-shadow: 0px 0px 8px 0px rgba(var(--grey-50-r), var(--grey-50-g),
							var(--grey-50-b), 1)
				}

				.u-block-60d2-8 {
					font-weight: 700;
					font-size: 1.5rem;
					margin-top: 0.0012px;
					margin-left: 0px;
					margin-right: 0px;
					margin-bottom: 0px
				}

				.u-block-60d2-21 {
					font-size: 2.0715em;
					margin-right: 3px;
					vertical-align: -11px
				}

				.u-block-60d2-9 {
					font-weight: 700;
					font-size: 1.875rem;
					margin-top: 0.4063px;
					margin-left: 0px;
					margin-right: 0px;
					margin-bottom: 0px
				}

				.u-block-60d2-26 {
					margin-top: -75.1251px;
					margin-left: 0px;
					margin-right: 0px;
					margin-bottom: 0px
				}

				.u-block-60d2-11 {
					margin-top: 79.4453px;
					margin-left: 0px;
					margin-right: 0px;
					margin-bottom: 0px
				}

				.u-block-60d2-13 {
					margin-top: 0.422px;
					margin-left: 0px;
					margin-right: 0px;
					margin-bottom: 0px
				}

				.u-block-60d2-24 {
					margin-top: -90.422px;
					margin-left: 0px;
					margin-right: 0px;
					margin-bottom: 0px
				}

				.u-block-60d2-22 {
					font-weight: 700;
					margin-top: 4.9063px;
					margin-right: auto;
					margin-bottom: 0px;
					margin-left: 42px
				}

				.u-block-60d2-23 {
					font-weight: 700;
					margin-top: 25px;
					margin-right: auto;
					margin-bottom: 0px;
					margin-left: 44px
				}

				.u-block-60d2-15 {
					background-image: none;
					--radius: 20px;
					box-shadow: 0px 0px 8px 0px rgba(var(--grey-50-r), var(--grey-50-g),
							var(--grey-50-b), 1);
					margin-top: 34px;
					margin-right: auto;
					margin-bottom: 0px;
					margin-left: 0px;
					padding-top: 0px;
					padding-right: 20px;
					padding-bottom: 0px;
					padding-left: 19px
				}

				.u-block-60d2-19 {
					font-size: 2.3126em;
					margin-right: 8px;
					vertical-align: -7px
				}

				.u-block-60d2-16 {
					--radius: 20px;
					box-shadow: 0px 0px 8px 0px rgba(var(--grey-50-r), var(--grey-50-g),
							var(--grey-50-b), 1);
					margin-top: -59px;
					margin-right: 0px;
					margin-bottom: 0px;
					margin-left: auto;
					padding-top: 0px;
					padding-bottom: 0px;
					padding-left: 30px;
					padding-right: 30px
				}

				.u-block-60d2-20 {
					font-size: 2.3126em;
					margin-right: 5px;
					vertical-align: -7px
				}
			}
		</style>
	</section>

	<style>
		.u-dialog-section-4 .u-dialog-1 {
			width: 570px;
			min-height: 578px;
			height: auto;
			box-shadow: 0px 0px 8px 0px rgba(0, 0, 0, 0.2);
			margin: 60px auto;
		}

		.u-dialog-section-4 .u-container-layout-1 {
			padding: 34px 35px;
		}

		.u-dialog-section-4 .u-text-1 {
			font-weight: 700;
			margin: 0 165px 0 0;
		}

		.u-dialog-section-4 .u-products-1 {
			margin-top: 30px;
			margin-bottom: 0;
		}

		.u-dialog-section-4 .u-repeater-1 {
			grid-template-columns: 100%;
			min-height: 206px;
			grid-gap: 10px;
		}

		.u-dialog-section-4 .u-container-layout-2 {
			padding: 0 0 30px;
		}

		.u-dialog-section-4 .u-text-2 {
			background-image: none;
			margin: 0;
		}

		.u-dialog-section-4 .u-text-3 {
			font-size: 0.875rem;
			margin: 20px 0 0;
		}

		.u-dialog-section-4 .u-product-quantity-1 {
			width: 125px;
			margin: 30px auto 0 0;
		}

		.u-dialog-section-4 .u-product-price-1 {
			margin: -34px 0 0 auto;
		}

		.u-dialog-section-4 .u-payment-services-1 {
			min-height: 250px;
			min-width: 50px;
			margin: 0;
		}

		.u-dialog-section-4 .u-container-layout-3 {
			padding: 20px 0 0;
		}

		.u-dialog-section-4 .u-container-layout-4 {
			padding: 20px 0 0;
		}

		.u-dialog-section-4 .u-btn-1 {
			width: 100%;
			margin: 0 auto;
		}

		.u-dialog-section-4 .u-icon-1 {
			width: 20px;
			height: 20px;
			left: auto;
			top: 36px;
			position: absolute;
			right: 35px;
			padding: 0;
		}

		@media (max-width : 1199px) {
			.u-dialog-section-4 .u-text-1 {
				margin-right: 165px;
			}

			.u-dialog-section-4 .u-payment-services-1 {
				margin-right: initial;
				margin-left: initial;
			}
		}

		@media (max-width : 991px) {
			.u-dialog-section-4 .u-container-layout-1 {
				padding: 30px;
			}

			.u-dialog-section-4 .u-container-layout-3 {
				padding-bottom: 0;
				padding-left: 0;
				padding-right: 0;
			}

			.u-dialog-section-4 .u-container-layout-4 {
				padding-bottom: 0;
				padding-left: 0;
				padding-right: 0;
			}

			.u-dialog-section-4 .u-icon-1 {
				top: 32px;
				right: 30px;
			}
		}

		@media (max-width : 767px) {
			.u-dialog-section-4 .u-dialog-1 {
				width: 540px;
			}
		}

		@media (max-width : 575px) {
			.u-dialog-section-4 .u-dialog-1 {
				width: 340px;
			}

			.u-dialog-section-4 .u-container-layout-1 {
				padding-left: 20px;
				padding-right: 20px;
			}

			.u-dialog-section-4 .u-text-1 {
				margin-right: 5px;
			}

			.u-dialog-section-4 .u-icon-1 {
				right: 20px;
			}
		}
	</style>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="js/main.js"></script>
</body>

</html>