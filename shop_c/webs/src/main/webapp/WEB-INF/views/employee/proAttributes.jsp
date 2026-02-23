<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html style="font-size: 16px;">

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="utf-8">
	<meta name="keywords" content="Product 1 Title, Product 2 Title, Product 3 Title">
	<meta name="description" content="">
	<title>Attributes</title>
	<link rel="stylesheet" href="css/page.css" media="screen">

</head>

<body class="u-body u-xl-mode" data-style="shopping-cart-template-1" data-posts=""
	data-global-section-properties="{&quot;code&quot;:&quot;CART&quot;,&quot;colorings&quot;:{&quot;light&quot;:[&quot;clean&quot;,&quot;clean&quot;],&quot;colored&quot;:[&quot;clean&quot;,&quot;clean&quot;,&quot;clean&quot;],&quot;dark&quot;:[&quot;clean&quot;,&quot;clean&quot;,&quot;clean&quot;]},&quot;isPreset&quot;:true}"
	data-source="fix" data-lang="en"
	data-page-sections-style="[{&quot;name&quot;:&quot;shopping-cart-1&quot;,&quot;margin&quot;:&quot;both&quot;,&quot;repeat&quot;:false}]"
	data-page-coloring-types="{&quot;light&quot;:[&quot;clean&quot;,&quot;clean&quot;],&quot;colored&quot;:[&quot;clean&quot;,&quot;clean&quot;,&quot;clean&quot;],&quot;dark&quot;:[&quot;clean&quot;,&quot;clean&quot;,&quot;clean&quot;]}"
	data-page-category="&quot;Cart&quot;">

	<jsp:include page="/WEB-INF/views/layout/eheader.jsp" />




	<section id="class1" class="class1 u-clearfix u-block-90d4-1" custom-posts-hash="[T,[T,T],[[[I,T],[I,T],[I,T]],[],[],[]]]"
		data-section-properties="{&quot;margin&quot;:&quot;both&quot;,&quot;stretch&quot;:true}" data-id="90d4"
		data-style="shopping-cart-1" id="sec-dd88">

		<div class="notmargin u-clearfix u-sheet u-block-90d4-2" style="width: 65%!important">

			<h2
				class=" gioHang u-align-center-lg u-align-center-md u-align-center-sm u-align-center-xs u-custom-font u-font-ubuntu u-text u-text-default u-text-1">
				Loại sản phẩm</h2>

			<div class="u-cart u-expanded-width u-layout-grid u-block-90d4-6">
				<div class="u-cart-products-table u-table u-table-responsive u-block-90d4-7">
					<table class="u-table-entity u-block-90d4-12">
						<colgroup>
							<col width="50%">
							<col width="50%">

						</colgroup>
						<thead class="u-custom-color-1 u-table-header u-block-90d4-13">
							<tr style="height: 33px;">
								<th class="u-border-3 u-border-grey-15 u-table-cell u-block-90d4-14"
									style="text-align: center">Tên
								</th>
								<th class="center u-border-3 u-border-grey-15 u-table-cell u-block-90d4-12">
									Thao tác
								</th>


							</tr>
						</thead>
						<tbody class="u-align-left u-table-alt-grey-5 u-table-body u-block-90d4-18">

							<!--Sản phẩm nè-->
							<!--  
								<c:if test="${not empty types}">
            						<c:forEach var="type" items="${types}">
										<tr id="" style="height: 60px;" class="cartProduct">
		
	
											<td id=""
												class="center u-border-1 u-border-grey-15 u-table-cell u-block-90d4-45">
												<input type="text" value="${type.name }" name="" class="inputtable">
											</td>
											<td id=""
												class="center u-border-1 u-border-grey-15 u-table-cell u-block-90d4-47">
												<button class ="save" >Cập nhật</button>
												<button class ="del" >Xóa</button>
											</td>
											
										</tr>
									 </c:forEach>
        						</c:if> -->
							<c:if test="${not empty types}">
								<c:forEach var="type" items="${types}">
									<form method="post" action="emprodattribute.htm">
										<input type="hidden" name="id" value="${type.id}">
										<input type="hidden" name="type" value="category">

										<tr style="height: 60px;" class="cartProduct">
											<td class="center">
												<input type="text" name="name" value="${type.name}" class="inputtable">
											</td>
											<td class="center">
												<button onclick="handleButtonClick(event)" type="submit" name="action" value="update" class="save">Cập nhật</button>
												<button onclick="handleButtonClick(event)" type="submit" name="action" value="delete" class="del">Xóa</button>
											</td>
										</tr>
									</form>
								</c:forEach>
							</c:if>
							<!--  
        						<tr id="" style="height: 60px;" class="cartProduct">
	

									<td id=""
										class="center u-border-1 u-border-grey-15 u-table-cell u-block-90d4-45">
										<input type="text" value="" name="" placeholder="Nhập tên" class="inputtable">
									</td>
									<td id=""
										class="center u-border-1 u-border-grey-15 u-table-cell u-block-90d4-47">
										<button class ="save" >Thêm</button>

									</td>
																		
								</tr>
								-->
							<!-- Thêm mới -->
							<form method="post" action="emprodattribute.htm">
								<input type="hidden" name="type" value="category">

								<tr style="height: 60px;" class="cartProduct">
									<td class="center">
										<input type="text" name="name" value="" placeholder="Nhập tên"
											class="inputtable">
									</td>
									<td class="center">
										<button onclick="handleButtonClick(event)" name="action" value="add" class="save">Thêm</button>
									</td>
								</tr>
							</form>
						</tbody>
					</table>
				</div>

			</div>

	</section>

	<section id ="class2" class="class2 u-clearfix u-block-90d4-1" custom-posts-hash="[T,[T,T],[[[I,T],[I,T],[I,T]],[],[],[]]]"
		data-section-properties="{&quot;margin&quot;:&quot;both&quot;,&quot;stretch&quot;:true}" data-id="90d4"
		data-style="shopping-cart-1" id="sec-dd88">

		<div class="notmargin u-clearfix u-sheet u-block-90d4-2" style="width: 65%!important">

			<h2
				class=" gioHang u-align-center-lg u-align-center-md u-align-center-sm u-align-center-xs u-custom-font u-font-ubuntu u-text u-text-default u-text-1">
				Chất liệu sản phẩm</h2>

			<div class="u-cart u-expanded-width u-layout-grid u-block-90d4-6">
				<div class="u-cart-products-table u-table u-table-responsive u-block-90d4-7">
					<table class="u-table-entity u-block-90d4-12">
						<colgroup>
							<col width="50%">
							<col width="50%">

						</colgroup>
						<thead class="u-custom-color-1 u-table-header u-block-90d4-13">
							<tr style="height: 33px;">
								<th class="u-border-3 u-border-grey-15 u-table-cell u-block-90d4-14"
									style="text-align: center">Tên
								</th>
								<th class="center u-border-3 u-border-grey-15 u-table-cell u-block-90d4-12">
									Thao tác
								</th>


							</tr>
						</thead>
						<tbody class="u-align-left u-table-alt-grey-5 u-table-body u-block-90d4-18">

							<!--Sản phẩm nè-->
							<!--
								<c:if test="${not empty materials}">
            						<c:forEach var="material" items="${materials}">
										<tr id="" style="height: 60px;" class="cartProduct">
		
	
											<td id=""
												class="center u-border-1 u-border-grey-15 u-table-cell u-block-90d4-45">
												<input type="text" value="${material.name }" name="" class="inputtable">
											</td>
											<td id=""
												class="center u-border-1 u-border-grey-15 u-table-cell u-block-90d4-47">
												<button class ="save" >Cập nhật</button>
												<button class ="del" >Xóa</button>
											</td>
											
										</tr>
									 </c:forEach>
        						</c:if>
        						<tr id="" style="height: 60px;" class="cartProduct">
	

									<td id=""
										class="center u-border-1 u-border-grey-15 u-table-cell u-block-90d4-45">
										<input type="text" value="" name="" placeholder="Nhập tên" class="inputtable">
									</td>
									<td id=""
										class="center u-border-1 u-border-grey-15 u-table-cell u-block-90d4-47">
										<button class ="save" >Thêm</button>

									</td>
									
								</tr>
								-->
							<c:if test="${not empty materials}">
								<c:forEach var="material" items="${materials}">
									<form method="post" action="emprodattribute.htm">
										<input type="hidden" name="id" value="${material.id}">
										<input type="hidden" name="type" value="material">

										<tr style="height: 60px;" class="cartProduct">
											<td class="center u-border-1 u-border-grey-15 u-table-cell">
												<input type="text" name="name" value="${material.name}"
													class="inputtable">
											</td>
											<td class="center u-border-1 u-border-grey-15 u-table-cell">
												<button onclick="handleButtonClick(event)" type="submit" name="action" value="update" class="save">Cập nhật</button>
												<button onclick="handleButtonClick(event)" type="submit" name="action" value="delete" class="del">Xóa</button>
											</td>
										</tr>
									</form>
								</c:forEach>
							</c:if>

							<!-- Thêm mới -->
							<form method="post" action="emprodattribute.htm">
								<input type="hidden" name="type" value="material">

								<tr style="height: 60px;" class="cartProduct">
									<td class="center u-border-1 u-border-grey-15 u-table-cell">
										<input type="text" name="name" value="" placeholder="Nhập tên"
											class="inputtable">
									</td>
									<td class="center u-border-1 u-border-grey-15 u-table-cell">
										<button onclick="handleButtonClick(event)" type="submit" name="action" value="add" class="add">Thêm</button>
									</td>
								</tr>
							</form>

						</tbody>
					</table>
				</div>



			</div>


	</section>

	<section id="class3" class="class3 u-clearfix u-block-90d4-1" custom-posts-hash="[T,[T,T],[[[I,T],[I,T],[I,T]],[],[],[]]]"
		data-section-properties="{&quot;margin&quot;:&quot;both&quot;,&quot;stretch&quot;:true}" data-id="90d4"
		data-style="shopping-cart-1" id="sec-dd88">

		<div class="notmargin u-clearfix u-sheet u-block-90d4-2" style="width: 65%!important">

			<h2
				class=" gioHang u-align-center-lg u-align-center-md u-align-center-sm u-align-center-xs u-custom-font u-font-ubuntu u-text u-text-default u-text-1">
				Nguồn gốc xuất xứ</h2>

			<div class="u-cart u-expanded-width u-layout-grid u-block-90d4-6">
				<div class="u-cart-products-table u-table u-table-responsive u-block-90d4-7">
					<table class="u-table-entity u-block-90d4-12">
						<colgroup>
							<col width="50%">
							<col width="50%">

						</colgroup>
						<thead class="u-custom-color-1 u-table-header u-block-90d4-13">
							<tr style="height: 33px;">
								<th class="u-border-3 u-border-grey-15 u-table-cell u-block-90d4-14"
									style="text-align: center">Tên
								</th>
								<th class="center u-border-3 u-border-grey-15 u-table-cell u-block-90d4-12">
									Thao tác
								</th>


							</tr>
						</thead>
						<tbody class="u-align-left u-table-alt-grey-5 u-table-body u-block-90d4-18">

							<!--Sản phẩm nè
								<c:if test="${not empty origins}">
            						<c:forEach var="origin" items="${origins}">
										<tr id="" style="height: 60px;" class="cartProduct">
		
	
											<td id=""
												class="center u-border-1 u-border-grey-15 u-table-cell u-block-90d4-45">
												<input type="text" value="${origin.name }" name="" class="inputtable">
											</td>
											<td id=""
												class="center u-border-1 u-border-grey-15 u-table-cell u-block-90d4-47">
												<button class ="save" >Cập nhật</button>
												<button class ="del" >Xóa</button>
											</td>
											
										</tr>
									 </c:forEach>
        						</c:if>
									
									<tr id="" style="height: 60px;" class="cartProduct">
	

									<td id=""
										class="center u-border-1 u-border-grey-15 u-table-cell u-block-90d4-45">
										<input type="text" value="" name="" placeholder="Nhập tên" class="inputtable">
									</td>
									<td id=""
										class="center u-border-1 u-border-grey-15 u-table-cell u-block-90d4-47">
										<button class ="save" >Thêm</button>

									</td>
									
								</tr> -->
							<c:if test="${not empty origins}">
								<c:forEach var="origin" items="${origins}">
									<form method="post" action="emprodattribute.htm">
										<input type="hidden" name="id" value="${origin.id}">
										<input type="hidden" name="type" value="origin">

										<tr style="height: 60px;" class="cartProduct">
											<td class="center u-border-1 u-border-grey-15 u-table-cell">
												<input type="text" name="name" value="${origin.name}"
													class="inputtable">
											</td>
											<td class="center u-border-1 u-border-grey-15 u-table-cell">
												<button onclick="handleButtonClick(event)" type="submit" name="action" value="update" class="save">Cập nhật</button>
												<button onclick="handleButtonClick(event)" type="submit" name="action" value="delete" class="del">Xóa</button>
											</td>
										</tr>
									</form>
								</c:forEach>
							</c:if>

							<!-- Thêm mới -->
							<form method="post" action="emprodattribute.htm">
								<input type="hidden" name="type" value="origin">

								<tr style="height: 60px;" class="cartProduct">
									<td class="center u-border-1 u-border-grey-15 u-table-cell">
										<input type="text" name="name" value="" placeholder="Nhập tên"
											class="inputtable">
									</td>
									<td class="center u-border-1 u-border-grey-15 u-table-cell">
										<button onclick="handleButtonClick(event)" type="submit" name="action" value="add" class="add">Thêm</button>
									</td>
								</tr>
							</form>

						</tbody>
					</table>
				</div>


			</div>

	</section>


	<section id="class4" class=" u-clearfix u-block-90d4-1" custom-posts-hash="[T,[T,T],[[[I,T],[I,T],[I,T]],[],[],[]]]"
		data-section-properties="{&quot;margin&quot;:&quot;both&quot;,&quot;stretch&quot;:true}" data-id="90d4"
		data-style="shopping-cart-1" id="sec-dd88">

		<div class="notmargin u-clearfix u-sheet u-block-90d4-2" style="width: 65%!important">

			<h2
				class=" gioHang u-align-center-lg u-align-center-md u-align-center-sm u-align-center-xs u-custom-font u-font-ubuntu u-text u-text-default u-text-1">
				Thương hiệu</h2>

			<div class="u-cart u-expanded-width u-layout-grid u-block-90d4-6">
				<div class="u-cart-products-table u-table u-table-responsive u-block-90d4-7">
					<table class="u-table-entity u-block-90d4-12">
						<colgroup>
							<col width="50%">
							<col width="50%">

						</colgroup>
						<thead class="u-custom-color-1 u-table-header u-block-90d4-13">
							<tr style="height: 33px;">
								<th class="u-border-3 u-border-grey-15 u-table-cell u-block-90d4-14"
									style="text-align: center">Tên
								</th>
								<th class="center u-border-3 u-border-grey-15 u-table-cell u-block-90d4-12">
									Thao tác
								</th>


							</tr>
						</thead>
						<tbody class="u-align-left u-table-alt-grey-5 u-table-body u-block-90d4-18">

							<!--Sản phẩm nè
								<c:if test="${not empty brands}">
            						<c:forEach var="brand" items="${brands}">
										<tr id="" style="height: 60px;" class="cartProduct">
		
	
											<td id=""
												class="center u-border-1 u-border-grey-15 u-table-cell u-block-90d4-45">
												<input type="text" value="${brand.name }" name="" class="inputtable">
											</td>
											<td id=""
												class="center u-border-1 u-border-grey-15 u-table-cell u-block-90d4-47">
												<button class ="save" >Cập nhật</button>
												<button class ="del" >Xóa</button>
											</td>
											
										</tr>
									 </c:forEach>
        						</c:if>
									
									<tr id="" style="height: 60px;" class="cartProduct">
	

									<td id=""
										class="center u-border-1 u-border-grey-15 u-table-cell u-block-90d4-45">
										<input type="text" value="" name="" placeholder="Nhập tên" class="inputtable">
									</td>
									<td id=""
										class="center u-border-1 u-border-grey-15 u-table-cell u-block-90d4-47">
										<button class ="save" >Thêm</button>

									</td>
									
								</tr> -->
							<c:if test="${not empty brands}">
								<c:forEach var="brand" items="${brands}">
									<form method="post" action="emprodattribute.htm">
										<input type="hidden" name="id" value="${brand.id}">
										<input type="hidden" name="type" value="brand">

										<tr style="height: 60px;" class="cartProduct">
											<td class="center u-border-1 u-border-grey-15 u-table-cell">
												<input type="text" name="name" value="${brand.name}" class="inputtable">
											</td>
											<td class="center u-border-1 u-border-grey-15 u-table-cell">
												<button onclick="handleButtonClick(event)" type="submit" name="action" value="update" class="save">Cập nhật</button>
												<button onclick="handleButtonClick(event)" type="submit" name="action" value="delete" class="del">Xóa</button>
											</td>
										</tr>
									</form>
								</c:forEach>
							</c:if>

							<!-- Thêm mới thương hiệu -->
							<form method="post" action="emprodattribute.htm">
								<input type="hidden" name="type" value="brand">

								<tr style="height: 60px;" class="cartProduct">
									<td class="center u-border-1 u-border-grey-15 u-table-cell">
										<input type="text" name="name" value="" placeholder="Nhập tên"
											class="inputtable">
									</td>
									<td class="center u-border-1 u-border-grey-15 u-table-cell">
										<button onclick="handleButtonClick(event)" type="submit" name="action" value="add" class="add">Thêm</button>
									</td>
								</tr>
							</form>

						</tbody>
					</table>
				</div>

			</div>


	</section>






	<style>
	
	.add{
		background: #42b72a;
		padding: 6px 20px;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		color: #fff;
		font-size: 14px;
	}
	
	.del{
		background: red;
		margin-left: 5px;
		padding: 6px 20px;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		color: #fff;
		font-size: 14px;
	}
	
	.save{
		margin-right: 5px;
		background: #1877f2;
		padding: 6px 20px;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		color: #fff;
		font-size: 14px;
	}
	
	.add:hover{
		opacity: 0.7;
	}
	
	.del:hover{
		opacity: 0.7;
	}
	
	.save:hover{
		opacity: 0.7;
	}
	
		#class1 td{
			border: 1px solid #ccc;
		}
		
		button:hover {
			cursor: pointer;
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

		.u-cart {
			min-height: 200px !important;
		}

		.gioHang {
			font-size: 20px !important;
			font-weight: 700 !important;
			margin-top: 24px !important;
			text-decoration: underline;
			margin: 0 auto;
		}

		.inputtable {
			text-align: center;
			width: 100%;
			height: 100%;
			border: none;
			background: none;
		}

		.u-cart.u-expanded-width.u-layout-grid.u-block-90d4-6 {
			padding: 45px;
			padding-top: 0;
			margin: 0;
		}
	</style>

	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	<script src="js/cart.js"></script>

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
	<script>
	// Định nghĩa hàm xử lý sự kiện
	  function handleButtonClick(event) {
	            // Hiển thị hộp thoại xác nhận
	            const isConfirmed = confirm("Bạn có chắc chắn thực hiện?");
	            
	            if (!isConfirmed) {
	                // Ngăn hành động mặc định (nếu có)
	                event.preventDefault();
	                
	            } 
	        }
	</script>
</body>

</html>